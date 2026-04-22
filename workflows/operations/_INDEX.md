# Operations — Agency-Layer Index

> **Purpose:** team + process SOPs for running the Growth Optimal System as an operating agency (team-level, not per-client-operation).
>
> **Scope note:** this `workflows/operations/` directory is the team-ops surface that every instantiation of the template inherits — the SOPs, cadences, and tool configurations a Heuresis-run operation uses to execute. It is distinct from the per-creator delivery instance that spins up downstream.

## Layout

```
workflows/operations/
├── cadences/           # Recurring meeting rhythm
│   ├── daily.md
│   ├── weekly.md
│   ├── monthly.md
│   └── quarterly.md
├── finance/            # Revenue tracking + dashboard templates
│   └── tracker-schema.md
├── project-management/ # Tool-specific PM SOPs
│   └── clickup.md
├── tool-sops/          # Per-tool operating SOPs
│   ├── ghl.md          # GoHighLevel
│   ├── loom.md         # Loom
│   ├── notion.md       # Notion
│   └── slack.md        # Slack
├── team-leadership.md
├── team-collaboration.md
├── hiring-roles.md
├── mode-of-operations.md
├── daily-dashboard.md
├── crisis-management.md
└── competitive-intel-ops.md
```

## When to use what

| Situation | File |
|---|---|
| Setting up team meeting rhythm | `cadences/` |
| Spinning up a new creator operation | `mode-of-operations.md` → `cadences/weekly.md` |
| Hiring for the agency team | `hiring-roles.md` + `../skills/hiring-brief/SKILL.md` |
| Financial reporting cadence | `finance/tracker-schema.md` + `../skills/revenue-report/SKILL.md` |
| Team SOP for Notion / Slack / GHL / Loom | `tool-sops/<tool>.md` |
| Crisis / incident | `crisis-management.md` |
| Competitive monitoring as an agency | `competitive-intel-ops.md` + `../skills/competitor-intel/SKILL.md` |

## Relationship to skills

Operations files are the **team-level SOPs**; skills are the **per-deliverable methodology**. Example:
- `workflows/operations/cadences/weekly.md` tells the team to run a weekly launch review.
- `skills/launch-report/SKILL.md` tells the agent what an individual launch report looks like.
- Agent running skill → output → team reviews output at weekly cadence.

## Cross-References

- `../SYSTEM.md` — workspace identity
- `../workflows/client-onboarding/` — per-operation onboarding workflow (distinct from team-ops)
- `../skills/_INDEX.md` — skill catalog
- `../agents/_INDEX.md` — agent roster (team members)

---
*Agency-layer ops — forks with every operation.*
