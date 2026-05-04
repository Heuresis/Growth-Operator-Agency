# Cursor

Each agent becomes a `.mdc` rule file in `./.cursor/rules/` of your project.

## Install

From your project root:

```bash
cd /path/to/your-project
/path/to/this-workspace/scripts/install.sh --tool cursor
```

For each `agents/<slug>.md`, the installer writes
`./.cursor/rules/<slug>.mdc`. Cursor auto-detects rule files in this
directory and applies them to relevant context.

## Activate

Cursor applies rules automatically when patterns match. To force a specific
agent, reference it explicitly:

```
Use the @foundations-head rules to draft an offer document for our ICP.
```

## Inspect before install

```bash
./scripts/convert.sh --tool cursor
ls build/cursor/
```

## Uninstall

```bash
rm ./.cursor/rules/<agent>.mdc
```
