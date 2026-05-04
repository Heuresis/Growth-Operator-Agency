#!/usr/bin/env bash
# Heuresis workspace converter — produces tool-specific artifacts under
# ./build/<tool>/ for inspection without installing them anywhere.
#
#   ./scripts/convert.sh --tool <tool-name>
#
# Useful for:
#   - reviewing the converted output before install
#   - committing build artifacts to a downstream repo
#   - debugging conversion logic
#
# Tools:  same list as scripts/install.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORKSPACE_NAME="$(basename "${WORKSPACE_ROOT}")"
WORKSPACE_SLUG="$(echo "${WORKSPACE_NAME}" | tr '[:upper:]' '[:lower:]')"

# shellcheck source=lib/banner.sh
source "${SCRIPT_DIR}/lib/banner.sh"

g=$'\033[32m'; red=$'\033[31m'; d=$'\033[2m'; r=$'\033[0m'

usage() {
  cat <<EOF
Usage: $0 --tool <tool-name>

Produces converted artifacts in: ${WORKSPACE_ROOT}/build/<tool>/

Tools:
  claude-code   copilot       antigravity   gemini-cli    opencode
  cursor        aider         windsurf      openclaw      qwen          kimi

After convert, run scripts/install.sh --tool <tool-name> to deploy.
EOF
}

TOOL=""
while [ $# -gt 0 ]; do
  case "$1" in
    --tool) TOOL="${2:-}"; shift 2 || true ;;
    -h|--help) usage; exit 0 ;;
    *) echo "${red}unknown arg:${r} $1" >&2; usage; exit 1 ;;
  esac
done
[ -z "${TOOL}" ] && { usage; exit 1; }

# Reuse the install script's helpers via sourcing only the helper section.
# Simpler: re-implement the small ones we need locally.
agent_files() {
  find "${WORKSPACE_ROOT}/agents" -type f -name '*.md' \
    ! -name '_INDEX.md' \
    ! -name 'README.md' \
    | sort
}

fm_get() {
  awk -v k="$2" '
    BEGIN { in_fm=0 }
    /^---$/ { in_fm = !in_fm; next }
    in_fm && $0 ~ "^"k"[[:space:]]*:" {
      sub("^"k"[[:space:]]*:[[:space:]]*", "")
      gsub(/^"|"$/, "")
      print
      exit
    }
  ' "$1"
}

fm_body() {
  awk '
    BEGIN { fm_count=0; printing=0 }
    /^---$/ { fm_count++; if (fm_count == 2) { printing = 1; next } ; next }
    printing { print }
  ' "$1"
}

print_banner
echo "  ${d}converting for:${r} ${TOOL}"
echo

BUILD="${WORKSPACE_ROOT}/build/${TOOL}"
rm -rf "${BUILD}"
mkdir -p "${BUILD}"

case "${TOOL}" in
  claude-code|copilot|opencode|qwen)
    while IFS= read -r f; do cp "${f}" "${BUILD}/$(basename "${f}")"; done < <(agent_files)
    ;;
  antigravity|gemini-cli)
    [ "${TOOL}" = "gemini-cli" ] && cat > "${BUILD}/extension.json" <<MANIFEST
{
  "name": "heuresis-${WORKSPACE_SLUG}",
  "version": "1.0.0",
  "description": "Heuresis ${WORKSPACE_NAME} — agent team for Gemini CLI.",
  "homepage": "https://heuresis.ai"
}
MANIFEST
    SKILLS_DIR="${BUILD}"
    [ "${TOOL}" = "gemini-cli" ] && SKILLS_DIR="${BUILD}/skills"
    mkdir -p "${SKILLS_DIR}"
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      mkdir -p "${SKILLS_DIR}/${slug}"
      cp "${f}" "${SKILLS_DIR}/${slug}/SKILL.md"
    done < <(agent_files)
    ;;
  cursor)
    while IFS= read -r f; do
      cp "${f}" "${BUILD}/$(basename "${f}" .md).mdc"
    done < <(agent_files)
    ;;
  aider)
    {
      printf '# %s — Heuresis workspace conventions\n\n' "${WORKSPACE_NAME}"
      while IFS= read -r f; do
        printf '\n---\n\n'; cat "${f}"; printf '\n'
      done < <(agent_files)
    } > "${BUILD}/CONVENTIONS.md"
    ;;
  windsurf)
    {
      printf '# %s — Heuresis workspace rules\n\n' "${WORKSPACE_NAME}"
      while IFS= read -r f; do
        printf '\n---\n\n'; cat "${f}"; printf '\n'
      done < <(agent_files)
    } > "${BUILD}/.windsurfrules"
    ;;
  openclaw)
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      dest="${BUILD}/${slug}"
      mkdir -p "${dest}"
      awk 'BEGIN{p=0} /^---$/{p++; next} p==1' "${f}" > "${dest}/IDENTITY.md"
      fm_body "${f}" > "${dest}/AGENTS.md"
      name="$(fm_get "${f}" name)"; role="$(fm_get "${f}" role)"
      [ -z "${name}" ] && name="${slug}"
      {
        printf '# %s\n\n' "${name}"
        [ -n "${role}" ] && printf '%s\n\n' "${role}"
        fm_body "${f}"
      } > "${dest}/SOUL.md"
    done < <(agent_files)
    ;;
  kimi)
    while IFS= read -r f; do
      slug="$(basename "${f}" .md)"
      mkdir -p "${BUILD}/${slug}"
      out="${BUILD}/${slug}/agent.yaml"
      name="$(fm_get "${f}" name)"; desc="$(fm_get "${f}" role)"
      [ -z "${name}" ] && name="${slug}"
      {
        printf 'name: %s\n' "${name}"
        printf 'description: >\n  %s\n' "${desc//$'\n'/ }"
        printf 'system_prompt: |\n'
        fm_body "${f}" | sed 's/^/  /'
      } > "${out}"
    done < <(agent_files)
    ;;
  *)
    echo "${red}unknown tool:${r} ${TOOL}" >&2
    usage; exit 1 ;;
esac

count=$(find "${BUILD}" -type f | wc -l | tr -d ' ')
echo "  ${g}✓${r} produced ${count} files → ${BUILD}"
echo
echo "  ${d}install with:${r} ./scripts/install.sh --tool ${TOOL}"
echo
