# `skills/` — Skill packages

36 skill packages. Each is one capability that produces one specific business asset (a research brief, a VSL, a launch plan, an ICP, etc.).

Every skill folder follows the same contract:

```
skills/<slug>/
├── SKILL.md              ← the runtime-agnostic source of truth
├── variants/             ← optional — same skill, different shapes (e.g. webinar funnel vs book funnel)
├── examples/             ← worked examples for that skill
├── evidence/             ← blind-output tests proving the skill ships quality
└── adapters/
    ├── claude-code.md    ← slash-command runtime (developer/interactive)
    ├── manifest.yaml     ← workspace-manifest runtime (Paperclip, Canopy, BusinessOS, Cursor)
    └── http.openapi.yaml ← REST contract (Claude Agent SDK, HTTP orchestrators, serverless)
```

Index: [`_INDEX.md`](_INDEX.md) · Authoring guide: [`../docs/SKILL_AUTHORING.md`](../docs/SKILL_AUTHORING.md).
