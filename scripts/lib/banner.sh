#!/usr/bin/env bash
# Heuresis workspace boot banner — sourced by boot.sh and scripts/install.sh.
#
# Renders a 53-column boxed wordmark with workspace + license + runtime info.
# ANSI bold + dim render in any modern terminal (iTerm, Terminal.app, VS Code,
# Warp, Ghostty, Alacritty, Kitty). On terminals without ANSI support, the
# escape sequences degrade to literal characters but the box layout still holds.

print_banner() {
  local workspace_root workspace_name b d r value_pad

  workspace_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

  # Prefer git remote over directory name — survives renames + worktrees.
  if git -C "${workspace_root}" rev-parse --git-dir >/dev/null 2>&1; then
    local remote_url
    remote_url="$(git -C "${workspace_root}" config --get remote.origin.url 2>/dev/null || true)"
    if [ -n "${remote_url}" ]; then
      workspace_name="$(basename "${remote_url%.git}")"
    fi
  fi
  [ -z "${workspace_name:-}" ] && workspace_name="$(basename "${workspace_root}")"

  b=$'\033[1m'
  d=$'\033[2m'
  r=$'\033[0m'

  # Inner box width is 49 cols; label column is 16 cols (3 pad + label + gap).
  # Value field gets the remaining 33 cols, right-padded with spaces.
  # `wc -m` counts visual characters (UTF-8 aware), so multi-byte glyphs like
  # `·` (U+00B7) don't break the box alignment.
  value_pad() {
    local text="$1" target=33 visual_len pad_count
    visual_len=$(LC_ALL=en_US.UTF-8 printf '%s' "$text" | LC_ALL=en_US.UTF-8 wc -m | tr -d ' ')
    pad_count=$((target - visual_len))
    [ "${pad_count}" -lt 0 ] && pad_count=0
    printf '%s' "$text"
    printf '%*s' "${pad_count}" ''
  }

  printf '\n'
  printf '  ┌─────────────────────────────────────────────────┐\n'
  printf '  │                                                 │\n'
  printf '  │   %sH E U R E S I S%s                               │\n' "${b}" "${r}"
  printf '  │   %sEncode your dream company.%s                    │\n' "${d}" "${r}"
  printf '  │                                                 │\n'
  printf '  ├─────────────────────────────────────────────────┤\n'
  printf '  │                                                 │\n'
  printf '  │   %sWorkspace%s    %s│\n' "${d}" "${r}" "$(value_pad "${workspace_name}")"
  printf '  │   %sMethod%s       %s│\n' "${d}" "${r}" "$(value_pad "heuresis.ai/method")"
  printf '  │   %sRuntime%s      %s│\n' "${d}" "${r}" "$(value_pad "Claude Code · Cursor · +9 more")"
  printf '  │   %sLicense%s      %s│\n' "${d}" "${r}" "$(value_pad "MIT")"
  printf '  │                                                 │\n'
  printf '  └─────────────────────────────────────────────────┘\n\n'
}
