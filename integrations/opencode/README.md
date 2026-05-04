# OpenCode

Native `.md` agents installed project-scoped to `./.opencode/agents/`.

## Install (project-scoped)

From your project root, run the installer:

```bash
cd /path/to/your-project
/path/to/this-workspace/scripts/install.sh --tool opencode
```

## Install (global)

If you want the agents available across every OpenCode project:

```bash
mkdir -p ~/.config/opencode/agents
cp /path/to/this-workspace/agents/*.md ~/.config/opencode/agents/
```

## Activate

```
@foundations-head draft an offer document for our ICP
```

## Uninstall

```bash
rm -rf ./.opencode/agents
# or, for global:
rm -rf ~/.config/opencode/agents
```
