# Gemini CLI

The workspace installs as a Gemini CLI extension. One extension contains
one skill per agent plus a manifest.

## Install

```bash
./scripts/install.sh --tool gemini-cli
```

Produces:

```
~/.gemini/extensions/heuresis-<workspace>/
├── extension.json
└── skills/
    ├── <agent-1>/SKILL.md
    ├── <agent-2>/SKILL.md
    └── …
```

`extension.json` declares the extension name (`heuresis-<workspace>`),
version, and homepage. Each `SKILL.md` is the original agent file.

## Activate

```bash
gemini --skill heuresis-<workspace>/foundations-head
```

Or inside an interactive Gemini session, reference the skill by handle.

## Inspect before install

```bash
./scripts/convert.sh --tool gemini-cli
ls build/gemini-cli/
```

## Uninstall

```bash
rm -rf ~/.gemini/extensions/heuresis-<workspace>
```
