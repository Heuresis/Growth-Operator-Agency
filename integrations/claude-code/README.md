# Claude Code

Native `.md` agents — no conversion needed.

## Install

```bash
./scripts/install.sh --tool claude-code
```

Installs all agents to `~/.claude/agents/heuresis-<workspace>/`. The
workspace prefix keeps multiple Heuresis workspaces from colliding.

## Activate

In any Claude Code session:

```
Use the foundations-head agent to draft an offer document for our ICP.
```

Claude Code reads agent files from `~/.claude/agents/` and resolves
agents by frontmatter `name` or filename slug.

## Reinstall after edits

The install script overwrites prior versions. Edit any agent in this repo,
then re-run install to pick up changes.

## Uninstall

```bash
rm -rf ~/.claude/agents/heuresis-<workspace>
```
