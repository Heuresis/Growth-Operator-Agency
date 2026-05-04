# Kimi Code

Each agent is converted to a Kimi YAML spec at
`~/.config/kimi/agents/<agent>/agent.yaml`.

## Install

```bash
./scripts/install.sh --tool kimi
```

The converter reads each `agents/<slug>.md` and emits:

```yaml
name: <frontmatter.name>
description: >
  <frontmatter.role>
system_prompt: |
  <body of the agent file>
```

## Activate

```bash
# One-shot
kimi --agent-file ~/.config/kimi/agents/foundations-head/agent.yaml

# In a project, scoped to a working dir
kimi --agent-file ~/.config/kimi/agents/foundations-head/agent.yaml \
     --work-dir /path/to/your-project \
     "draft an offer document for our ICP"
```

## Inspect before install

```bash
./scripts/convert.sh --tool kimi
cat build/kimi/foundations-head/agent.yaml
```

## Uninstall

```bash
rm -rf ~/.config/kimi/agents/<agent>
```
