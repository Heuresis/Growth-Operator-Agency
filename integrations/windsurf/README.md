# Windsurf

All agents are compiled into a single `.windsurfrules` file in your
project root. Cascade reads it on every conversation.

## Install

From your project root:

```bash
cd /path/to/your-project
/path/to/this-workspace/scripts/install.sh --tool windsurf
```

Writes `./.windsurfrules` with every agent inlined and separated by
`---` rules.

## Activate

Reference an agent by name in Windsurf Cascade:

```
Use the foundations-head agent to draft an offer document for our ICP.
```

## Inspect before install

```bash
./scripts/convert.sh --tool windsurf
head -50 build/windsurf/.windsurfrules
```

## Uninstall

```bash
rm ./.windsurfrules
```

## Notes

If your project already has a `.windsurfrules`, the installer overwrites
it. Back up first, or merge sections by hand.
