# Aider

All agents are compiled into a single `CONVENTIONS.md` file that Aider
reads automatically when present in the project root.

## Install

From your project root:

```bash
cd /path/to/your-project
/path/to/this-workspace/scripts/install.sh --tool aider
```

Compiles every `agents/<slug>.md` into a single `./CONVENTIONS.md` with
agents separated by `---` rules. Aider picks up `CONVENTIONS.md`
automatically — no further configuration needed.

## Activate

Reference an agent by name in your Aider session:

```
Use the foundations-head agent to draft an offer document for our ICP.
```

## Inspect before install

```bash
./scripts/convert.sh --tool aider
cat build/aider/CONVENTIONS.md | head -50
```

## Uninstall

```bash
rm ./CONVENTIONS.md
```

## Notes

If your project already has a `CONVENTIONS.md`, the installer overwrites
it. Back up first, or merge sections by hand.
