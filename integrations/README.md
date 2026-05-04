# Integrations

The workspace is files. Files run anywhere that reads files.

This directory has one folder per supported runtime. Each folder explains the
install path, the activation pattern, and any tool-specific notes.

## Supported tools

| Tool | Install command | Destination |
|---|---|---|
| [Claude Code](claude-code/README.md) | `./scripts/install.sh --tool claude-code` | `~/.claude/agents/heuresis-<workspace>/` |
| [GitHub Copilot](github-copilot/README.md) | `./scripts/install.sh --tool copilot` | `~/.github/agents/` + `~/.copilot/agents/` |
| [Antigravity (Gemini)](antigravity/README.md) | `./scripts/install.sh --tool antigravity` | `~/.gemini/antigravity/skills/` |
| [Gemini CLI](gemini-cli/README.md) | `./scripts/install.sh --tool gemini-cli` | `~/.gemini/extensions/heuresis-<workspace>/` |
| [OpenCode](opencode/README.md) | `./scripts/install.sh --tool opencode` | `./.opencode/agents/` |
| [Cursor](cursor/README.md) | `./scripts/install.sh --tool cursor` | `./.cursor/rules/` |
| [Aider](aider/README.md) | `./scripts/install.sh --tool aider` | `./CONVENTIONS.md` |
| [Windsurf](windsurf/README.md) | `./scripts/install.sh --tool windsurf` | `./.windsurfrules` |
| [OpenClaw](openclaw/README.md) | `./scripts/install.sh --tool openclaw` | `~/.openclaw/heuresis-<workspace>/` |
| [Qwen Code](qwen/README.md) | `./scripts/install.sh --tool qwen` | `./.qwen/agents/` |
| [Kimi Code](kimi/README.md) | `./scripts/install.sh --tool kimi` | `~/.config/kimi/agents/` |

## How conversion works

Most tools accept native `.md` agents — install just copies files into the
expected directory. Five tools require format conversion:

| Tool | Source `.md` becomes |
|---|---|
| Antigravity | `<agent>/SKILL.md` per skill folder |
| Gemini CLI | `<agent>/SKILL.md` + `extension.json` manifest |
| Cursor | `<agent>.mdc` rule file |
| Aider | one section in `CONVENTIONS.md` |
| Windsurf | one section in `.windsurfrules` |
| OpenClaw | `<agent>/SOUL.md` + `AGENTS.md` + `IDENTITY.md` |
| Kimi | `<agent>/agent.yaml` |

## Inspect before installing

To see the converted artifacts without installing them anywhere:

```bash
./scripts/convert.sh --tool <tool-name>
```

Output lands in `./build/<tool-name>/`. Review, then run the matching
`install.sh` to deploy.
