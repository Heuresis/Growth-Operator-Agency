# Qwen Code

Native `.md` SubAgents installed project-scoped to `./.qwen/agents/`.

## Install (project-scoped)

```bash
cd /path/to/your-project
/path/to/this-workspace/scripts/install.sh --tool qwen
```

## Install (global)

For every Qwen Code project to see the agents:

```bash
mkdir -p ~/.qwen/agents
cp /path/to/this-workspace/agents/*.md ~/.qwen/agents/
```

## Activate

Two ways inside Qwen Code:

```
# By name:
Use the foundations-head agent to draft an offer document for our ICP.

# Via SubAgents menu (interactive mode):
/agents
```

Qwen also auto-delegates based on task context — referencing an agent by
name is a hint, not a hard requirement.

## Uninstall

```bash
rm -rf ./.qwen/agents
# or, for global:
rm -rf ~/.qwen/agents
```
