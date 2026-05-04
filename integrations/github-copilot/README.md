# GitHub Copilot

Native `.md` agents — no conversion needed.

## Install

```bash
./scripts/install.sh --tool copilot
```

Copies all agents to two locations:

- `~/.github/agents/` — workspace-aware agent registry
- `~/.copilot/agents/` — Copilot CLI agent registry

Both locations are populated so the agents work whether you're in the
GitHub web UI, Copilot Chat, or the `copilot` CLI.

## Activate

```
Use the foundations-head agent to draft an offer document for our ICP.
```

## Uninstall

```bash
rm ~/.github/agents/<agent>.md
rm ~/.copilot/agents/<agent>.md
```
