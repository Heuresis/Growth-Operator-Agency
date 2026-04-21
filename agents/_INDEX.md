# Agents — Roster

> 41 agent persona files. Each is thin — identity + skills array + reporting chain. Business logic lives in `../skills/` and `../reference/frameworks/`; agents are personas that invoke skills.
>
> **Runtime:** all agents declare `adapter: any` — they work on any runtime that reads markdown + YAML.

## The reporting chain

```
growth-director (orchestrator)
├── foundations-lead
│   ├── researcher
│   ├── niche-architect
│   ├── icp-builder
│   ├── offer-architect
│   └── brand-voice
├── marketing-lead
│   ├── content-strategist
│   ├── youtube-producer
│   ├── short-form
│   ├── stories-producer
│   ├── twitter-writer
│   ├── linkedin-writer
│   ├── paid-ads
│   └── lead-magnet-designer (dual-report with nurture-lead)
├── nurture-lead
│   ├── email-copywriter
│   ├── webinar-producer
│   ├── show-rate-ops
│   └── post-launch-analyst (dual-report with launch-lead)
├── sales-lead
│   ├── vsl-builder (primary VSL architect, 5-variant selector)
│   ├── vsl-writer (executes variant chosen by vsl-builder)
│   ├── funnel-architect
│   ├── sales-scripter
│   ├── sales-ops
│   └── competitor-analyst
├── launch-lead
│   └── launch-manager
├── partnerships-lead
│   ├── jv-outreach
│   ├── affiliate-architect
│   └── referral-designer
└── scale-lead
    ├── sop-builder
    ├── talent-recruiter
    ├── client-success
    ├── revenue-analyst
    ├── financial-modeler
    └── case-study-producer
```

## Roster by division

### Orchestrator (1)
| Agent | Skills | Tier |
|---|---|---|
| [`growth-director`](growth-director.md) | (delegates all) | L5 — top of chain |

### Foundations (6)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`foundations-lead`](foundations-lead.md) | (orchestrates 5 foundations skills) | growth-director |
| [`researcher`](researcher.md) | `/research` | foundations-lead |
| [`niche-architect`](niche-architect.md) | `/build-positioning` | foundations-lead |
| [`icp-builder`](icp-builder.md) | `/build-icp` | foundations-lead |
| [`offer-architect`](offer-architect.md) | `/design-offer` | foundations-lead |
| [`brand-voice`](brand-voice.md) | `/extract-voice` | foundations-lead |

### Marketing (8)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`marketing-lead`](marketing-lead.md) | (orchestrates marketing skills) | growth-director |
| [`content-strategist`](content-strategist.md) | `/content-calendar` | marketing-lead |
| [`youtube-producer`](youtube-producer.md) | `/write-youtube` | marketing-lead |
| [`short-form`](short-form.md) | `/write-reel` | marketing-lead |
| [`stories-producer`](stories-producer.md) | `/story-sequence` | marketing-lead |
| [`twitter-writer`](twitter-writer.md) | `/write-x-thread` | marketing-lead |
| [`linkedin-writer`](linkedin-writer.md) | `/write-linkedin-post` | marketing-lead |
| [`paid-ads`](paid-ads.md) | `/ad-creative` | marketing-lead |

### Nurture (4)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`nurture-lead`](nurture-lead.md) | (orchestrates nurture skills) | growth-director |
| [`email-copywriter`](email-copywriter.md) | `/email-sequence`, `/post-booking-nurture` | nurture-lead |
| [`webinar-producer`](webinar-producer.md) | `/webinar-script` | nurture-lead |
| [`show-rate-ops`](show-rate-ops.md) | `/post-booking-nurture` | nurture-lead |
| [`lead-magnet-designer`](lead-magnet-designer.md) | `/lead-magnet` | marketing-lead + nurture-lead |

### Sales (6)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`sales-lead`](sales-lead.md) | (orchestrates sales skills) | growth-director |
| [`vsl-builder`](vsl-builder.md) | `/build-vsl` (architect) | sales-lead |
| [`vsl-writer`](vsl-writer.md) | `/build-vsl` (writer — executes variant) | sales-lead |
| [`funnel-architect`](funnel-architect.md) | `/build-funnel` | sales-lead |
| [`sales-scripter`](sales-scripter.md) | (sales script skills) | sales-lead |
| [`sales-ops`](sales-ops.md) | (sales operations skills) | sales-lead |
| [`competitor-analyst`](competitor-analyst.md) | `/competitor-intel` | sales-lead |

### Launch (2)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`launch-lead`](launch-lead.md) | (orchestrates launch skills) | growth-director |
| [`launch-manager`](launch-manager.md) | `/plan-launch` | launch-lead |
| [`post-launch-analyst`](post-launch-analyst.md) | `/launch-report` | launch-lead + nurture-lead |

### Partnerships (4)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`partnerships-lead`](partnerships-lead.md) | (orchestrates partnerships skills) | growth-director |
| [`jv-outreach`](jv-outreach.md) | `/jv-webinar-proposal` | partnerships-lead |
| [`affiliate-architect`](affiliate-architect.md) | `/affiliate-program` | partnerships-lead |
| [`referral-designer`](referral-designer.md) | `/referral-program` | partnerships-lead |

### Scale (6)
| Agent | Primary skill(s) | Reports to |
|---|---|---|
| [`scale-lead`](scale-lead.md) | (orchestrates scale skills) | growth-director |
| [`sop-builder`](sop-builder.md) | `/build-sop` | scale-lead |
| [`talent-recruiter`](talent-recruiter.md) | `/hiring-brief` | scale-lead |
| [`client-success`](client-success.md) | `/retention-check` | scale-lead |
| [`revenue-analyst`](revenue-analyst.md) | `/revenue-report` | scale-lead |
| [`financial-modeler`](financial-modeler.md) | (financial modeling) | scale-lead |
| [`case-study-producer`](case-study-producer.md) | `/case-study` | scale-lead |

## Frontmatter schema

Every agent file MUST have:

```yaml
---
name: "Display Name"
id: agent-slug
role: orchestrator | lead | strategist | specialist | architect | analyst
title: "Display Title"
reportsTo: parent-agent-id | null
budget: <USD per month>
color: "#hex"
emoji: "🎬"
adapter: any
signal: S=(mode, genre, type, format, structure)
tools: [read, write, search, delegate?]
skills: [skill-slug, ...]
context_tier: l0 | l1 | full
division: foundations | marketing | nurture | sales | launch | partnerships | scale | null
---
```

Body sections: Identity (Personality + Memory + Experience) → Core Mission → Critical Rules → Handoff Protocol.

## Cross-References

- `../skills/_INDEX.md` — skill catalog this roster invokes
- `../SYSTEM.md` — routing logic + boot sequence
- `../INVARIANTS.md` — the 14 sacred rules every agent inherits
- `../reference/knowledge/` — division-level shared knowledge

---
*v1.0.0 — 2026-04-21 — 41 agents (1 director + 7 division leads + 33 specialists).*

*Growth OS — a Heuresis workspace template. [heuresis.ai](https://heuresis.ai)*
