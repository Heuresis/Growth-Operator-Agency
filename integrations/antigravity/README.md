# Antigravity (Gemini)

Each agent becomes a Gemini skill in `~/.gemini/antigravity/skills/`.

## Install

```bash
./scripts/install.sh --tool antigravity
```

For each agent file `agents/<slug>.md`, the installer creates:

```
~/.gemini/antigravity/skills/heuresis-<workspace>-<slug>/
└── SKILL.md
```

Antigravity discovers skills by directory name, so the `heuresis-<workspace>-`
prefix gives every agent a globally unique handle.

## Activate

In Gemini with the Antigravity extension loaded:

```
@heuresis-<workspace>-foundations-head draft an offer document for our ICP
```

## Inspect before install

```bash
./scripts/convert.sh --tool antigravity
ls build/antigravity/
```

## Uninstall

```bash
rm -rf ~/.gemini/antigravity/skills/heuresis-<workspace>-*
```
