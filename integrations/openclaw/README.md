# OpenClaw

Each agent becomes an OpenClaw workspace in `~/.openclaw/`. An OpenClaw
workspace is a directory containing three files: `SOUL.md`, `AGENTS.md`,
and `IDENTITY.md`.

## Install

```bash
./scripts/install.sh --tool openclaw
```

Produces:

```
~/.openclaw/heuresis-<workspace>/
├── <agent-1>/
│   ├── SOUL.md       (full agent: identity preamble + body)
│   ├── AGENTS.md     (body only — operating instructions)
│   └── IDENTITY.md   (frontmatter only — name, role, tools, signals)
├── <agent-2>/
└── …
```

If the `openclaw` CLI is on your PATH, the installer runs
`openclaw gateway restart` automatically so the new workspaces are
registered. Otherwise, restart your gateway by hand.

## Activate

After install + restart:

```bash
openclaw run heuresis-<workspace>/foundations-head "draft an offer for our ICP"
```

## Inspect before install

```bash
./scripts/convert.sh --tool openclaw
tree build/openclaw/ | head -20
```

## Uninstall

```bash
rm -rf ~/.openclaw/heuresis-<workspace>
openclaw gateway restart
```
