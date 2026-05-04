#!/usr/bin/env bash
# Heuresis workspace boot script.
#
# Run this once after cloning to confirm everything is in place and to see
# the workspace's credentials. Safe to re-run.
#
#   ./boot.sh
#
# After booting, install agents into your tool of choice:
#
#   ./scripts/install.sh --tool claude-code
#
# See ./integrations/README.md for the full tool list.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/scripts/lib/banner.sh"

print_banner

d=$'\033[2m'; r=$'\033[0m'

cat <<EOF
  ${d}Next steps${r}

  1. Fill in company.yaml with your business context.
  2. Pick your runtime: ./scripts/install.sh --tool <name>
  3. Open the workspace in that tool and start asking for outputs.

  ${d}Tools supported${r}

  claude-code · copilot · antigravity · gemini-cli · opencode
  cursor · aider · windsurf · openclaw · qwen · kimi

  ${d}See:${r} ./integrations/README.md

EOF
