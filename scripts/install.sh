#!/usr/bin/env bash
# Heuresis workspace installer — installs the agent roster into your chosen
# agentic-coding tool's expected location.
#
#   ./scripts/install.sh --tool <tool-name>
#
# Tools:
#   claude-code   copilot       antigravity   gemini-cli    opencode
#   cursor        aider         windsurf      openclaw      qwen          kimi
#
# Re-runnable. Each install copies (or compiles) the current agents/ directory
# into the destination — overwriting prior installs of the same workspace.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORKSPACE_NAME="$(basename "${WORKSPACE_ROOT}")"
WORKSPACE_SLUG="$(echo "${WORKSPACE_NAME}" | tr '[:upper:]' '[:lower:]')"

# shellcheck source=lib/banner.sh
source "${SCRIPT_DIR}/lib/banner.sh"

g=$'\033[32m'; y=$'\033[33m'; red=$'\033[31m'; d=$'\033[2m'; r=$'\033[0m'

usage() {
  cat <<EOF
Usage: $0 --tool <tool-name>

Tools:
  claude-code   ~/.claude/agents/heuresis-${WORKSPACE_SLUG}/        copy .md files
  copilot       ~/.github/agents/ + ~/.copilot/agents/              copy .md files
  antigravity   ~/.gemini/antigravity/skills/heuresis-*/            wrap as SKILL.md
  gemini-cli    ~/.gemini/extensions/heuresis-${WORKSPACE_SLUG}/    extension + skills
  opencode      ./.opencode/agents/        (project-scoped)         copy .md files
  cursor        ./.cursor/rules/           (project-scoped)         rename to .mdc
  aider         ./CONVENTIONS.md           (project-scoped)         compile single file
  windsurf      ./.windsurfrules           (project-scoped)         compile single file
  openclaw      ~/.openclaw/heuresis-${WORKSPACE_SLUG}/             SOUL.md per agent
  qwen          ./.qwen/agents/            (project-scoped)         copy .md files
  kimi          ~/.config/kimi/agents/                              YAML per agent

Run with --help to print this message.
EOF
}

# ── parse args ─────────────────────────────────────────────────────────────
TOOL=""
while [ $# -gt 0 ]; do
  case "$1" in
    --tool) TOOL="${2:-}"; shift 2 || true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "${red}unknown arg:${r} $1" >&2; usage; exit 1 ;;
  esac
done
[ -z "${TOOL}" ] && { usage; exit 1; }

print_banner
echo "  ${d}installing for:${r} ${TOOL}"
echo

# ── helpers ────────────────────────────────────────────────────────────────
agent_files() {
  # All .md agents in agents/, recursive, excluding indexes + readmes.
  find "${WORKSPACE_ROOT}/agents" -type f -name '*.md' \
    ! -name '_INDEX.md' \
    ! -name 'README.md' \
    | sort
}

agent_count() { agent_files | wc -l | tr -d ' '; }

# Read frontmatter value for a key (first match). Returns empty if absent.
fm_get() {
  local file="$1" key="$2"
  awk -v k="${key}" '
    BEGIN { in_fm=0 }
    /^---$/ { in_fm = !in_fm; next }
    in_fm && $0 ~ "^"k"[[:space:]]*:" {
      sub("^"k"[[:space:]]*:[[:space:]]*", "")
      gsub(/^"|"$/, "")
      print
      exit
    }
  ' "${file}"
}

# Body (everything after the closing frontmatter ---).
fm_body() {
  awk '
    BEGIN { fm_count=0; printing=0 }
    /^---$/ {
      fm_count++
      if (fm_count == 2) { printing = 1; next }
      next
    }
    printing { print }
  ' "$1"
}

# Convert .md → .yaml (Kimi format). Uses awk only; no python/yaml deps.
md_to_yaml() {
  local src="$1" out="$2"
  local name desc
  name="$(fm_get "${src}" name)"
  desc="$(fm_get "${src}" role)"
  [ -z "${name}" ] && name="$(basename "${src}" .md)"

  {
    printf 'name: %s\n' "${name}"
    # Use folded scalar (>) to keep description tidy and YAML-safe.
    printf 'description: >\n  %s\n' "${desc//$'\n'/ }"
    printf 'system_prompt: |\n'
    fm_body "${src}" | sed 's/^/  /'
  } > "${out}"
}

# OpenClaw triplet: SOUL.md (full), AGENTS.md (body), IDENTITY.md (frontmatter).
md_to_openclaw() {
  local src="$1" dest_dir="$2"
  local name role
  name="$(fm_get "${src}" name)"
  role="$(fm_get "${src}" role)"
  [ -z "${name}" ] && name="$(basename "${src}" .md)"

  mkdir -p "${dest_dir}"

  # IDENTITY.md = the frontmatter block as plain key: val.
  awk 'BEGIN{p=0} /^---$/{p++; next} p==1' "${src}" > "${dest_dir}/IDENTITY.md"

  # AGENTS.md = the body.
  fm_body "${src}" > "${dest_dir}/AGENTS.md"

  # SOUL.md = identity + body, agent's "self".
  {
    printf '# %s\n\n' "${name}"
    [ -n "${role}" ] && printf '%s\n\n' "${role}"
    fm_body "${src}"
  } > "${dest_dir}/SOUL.md"
}

# ── per-tool installers ────────────────────────────────────────────────────
case "${TOOL}" in
  claude-code)
    DEST="${HOME}/.claude/agents/heuresis-${WORKSPACE_SLUG}"
    mkdir -p "${DEST}"
    while IFS= read -r f; do
      cp "${f}" "${DEST}/$(basename "${f}")"
    done < <(agent_files)
    echo "  ${g}✓${r} copied $(agent_count) agents → ${DEST}"
    echo
    echo "  ${d}activate in Claude Code:${r}"
    echo "    Use the foundations-head agent to draft an offer."
    ;;

  copilot)
    for dest in "${HOME}/.github/agents" "${HOME}/.copilot/agents"; do
      mkdir -p "${dest}"
      while IFS= read -r f; do
        cp "${f}" "${dest}/$(basename "${f}")"
      done < <(agent_files)
      echo "  ${g}✓${r} copied $(agent_count) agents → ${dest}"
    done
    echo
    echo "  ${d}activate in GitHub Copilot:${r}"
    echo "    Use the foundations-head agent to draft an offer."
    ;;

  antigravity)
    BASE="${HOME}/.gemini/antigravity/skills"
    mkdir -p "${BASE}"
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      dest="${BASE}/heuresis-${WORKSPACE_SLUG}-${slug}"
      mkdir -p "${dest}"
      cp "${f}" "${dest}/SKILL.md"
    done < <(agent_files)
    echo "  ${g}✓${r} installed $(agent_count) skills → ${BASE}/heuresis-${WORKSPACE_SLUG}-*"
    echo
    echo "  ${d}activate in Gemini with Antigravity:${r}"
    echo "    @heuresis-${WORKSPACE_SLUG}-foundations-head draft an offer"
    ;;

  gemini-cli)
    EXT="${HOME}/.gemini/extensions/heuresis-${WORKSPACE_SLUG}"
    mkdir -p "${EXT}/skills"
    cat > "${EXT}/extension.json" <<MANIFEST
{
  "name": "heuresis-${WORKSPACE_SLUG}",
  "version": "1.0.0",
  "description": "Heuresis ${WORKSPACE_NAME} — agent team for Gemini CLI.",
  "homepage": "https://heuresis.ai"
}
MANIFEST
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      mkdir -p "${EXT}/skills/${slug}"
      cp "${f}" "${EXT}/skills/${slug}/SKILL.md"
    done < <(agent_files)
    echo "  ${g}✓${r} installed Gemini CLI extension → ${EXT}"
    echo
    echo "  ${d}activate:${r}"
    echo "    gemini --skill heuresis-${WORKSPACE_SLUG}/foundations-head"
    ;;

  opencode)
    DEST="$(pwd)/.opencode/agents"
    mkdir -p "${DEST}"
    while IFS= read -r f; do
      cp "${f}" "${DEST}/$(basename "${f}")"
    done < <(agent_files)
    echo "  ${g}✓${r} copied $(agent_count) agents → ${DEST}"
    echo
    echo "  ${d}activate in OpenCode:${r}"
    echo "    @foundations-head draft an offer"
    ;;

  cursor)
    DEST="$(pwd)/.cursor/rules"
    mkdir -p "${DEST}"
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      cp "${f}" "${DEST}/${slug}.mdc"
    done < <(agent_files)
    echo "  ${g}✓${r} installed $(agent_count) rules → ${DEST}"
    echo
    echo "  ${d}activate in Cursor:${r}"
    echo "    Use the @foundations-head rules to draft an offer."
    ;;

  aider)
    OUT="$(pwd)/CONVENTIONS.md"
    {
      printf '# %s — Heuresis workspace conventions\n\n' "${WORKSPACE_NAME}"
      printf 'Compiled agent specs. Aider reads CONVENTIONS.md automatically.\n'
      printf 'Each section below is one agent — reference by name in your session.\n\n'
      while IFS= read -r f; do
        printf '\n---\n\n'
        cat "${f}"
        printf '\n'
      done < <(agent_files)
    } > "${OUT}"
    echo "  ${g}✓${r} compiled $(agent_count) agents → ${OUT}"
    echo
    echo "  ${d}activate in Aider:${r}"
    echo "    Use the foundations-head agent to draft an offer."
    ;;

  windsurf)
    OUT="$(pwd)/.windsurfrules"
    {
      printf '# %s — Heuresis workspace rules\n\n' "${WORKSPACE_NAME}"
      while IFS= read -r f; do
        printf '\n---\n\n'
        cat "${f}"
        printf '\n'
      done < <(agent_files)
    } > "${OUT}"
    echo "  ${g}✓${r} compiled $(agent_count) agents → ${OUT}"
    echo
    echo "  ${d}activate in Windsurf Cascade:${r}"
    echo "    Use the foundations-head agent to draft an offer."
    ;;

  openclaw)
    BASE="${HOME}/.openclaw/heuresis-${WORKSPACE_SLUG}"
    mkdir -p "${BASE}"
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      md_to_openclaw "${f}" "${BASE}/${slug}"
    done < <(agent_files)
    echo "  ${g}✓${r} installed $(agent_count) workspaces → ${BASE}"
    if command -v openclaw >/dev/null 2>&1; then
      echo "  ${d}restarting openclaw gateway…${r}"
      openclaw gateway restart || true
    else
      echo "  ${y}note:${r} openclaw CLI not found — restart your gateway manually after install"
    fi
    ;;

  qwen)
    DEST="$(pwd)/.qwen/agents"
    mkdir -p "${DEST}"
    while IFS= read -r f; do
      cp "${f}" "${DEST}/$(basename "${f}")"
    done < <(agent_files)
    echo "  ${g}✓${r} copied $(agent_count) agents → ${DEST}"
    echo
    echo "  ${d}activate in Qwen Code:${r}"
    echo "    Use the foundations-head agent to draft an offer."
    echo "    Or use /agents in interactive mode."
    ;;

  kimi)
    BASE="${HOME}/.config/kimi/agents"
    mkdir -p "${BASE}"
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      mkdir -p "${BASE}/${slug}"
      md_to_yaml "${f}" "${BASE}/${slug}/agent.yaml"
    done < <(agent_files)
    echo "  ${g}✓${r} installed $(agent_count) agents → ${BASE}"
    echo
    echo "  ${d}activate in Kimi Code:${r}"
    echo "    kimi --agent-file ${BASE}/foundations-head/agent.yaml"
    ;;

  *)
    echo "${red}unknown tool:${r} ${TOOL}" >&2
    usage; exit 1 ;;
esac

echo
echo "  ${d}see:${r} integrations/${TOOL}/README.md"
echo
