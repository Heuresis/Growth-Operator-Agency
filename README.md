<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/heuresis-logo-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/heuresis-logo-light.png">
  <img alt="Heuresis" src="docs/assets/heuresis-logo-light.png" width="220">
</picture>

<br/>
<br/>

<h1>Growth Operator Agency</h1>

<p><strong>Your high-ticket creator business, encoded.</strong></p>

<p>
  <a href="CHANGELOG.md"><img src="https://img.shields.io/badge/version-1.0.0-09090b?style=flat-square&labelColor=09090b&color=52525b" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-09090b?style=flat-square&labelColor=09090b&color=52525b" alt="License"></a>
  <a href="https://heuresis.ai"><img src="https://img.shields.io/badge/a-Heuresis%20workspace-b45309?style=flat-square&labelColor=09090b&color=b45309" alt="Heuresis"></a>
</p>

</div>

<br/>

https://github.com/Heuresis/Growth-Operator-Agency/releases/download/v1.0.0/canopy-growth-operator-agency.mp4

<p align="center"><em>Live on <a href="https://github.com/Miosa-osa/canopy">Canopy</a>.</em></p>

<br/>

<img alt="Growth Operator Agency workspace — VSL drafting live, agents working, signals routed" src="docs/assets/hero-workspace.png" width="100%">

<p align="center"><em>Your creator business, in one folder.</em></p>

<br/>

---

## What is this?

Think of it like this: your business has departments — research, marketing, sales, launch, scale. Each department has a head and a team. Each team follows your playbooks, your scripts, your standards.

**Growth Operator Agency is that whole org chart, written down as a folder of plain markdown files.**

Open the folder. Hand it to any AI agent — Claude, ChatGPT, Cursor, OpenClaw. The agent reads `SYSTEM.md`, learns who it is, learns your business, and starts working a department.

You stay in the loop on the calls that need your judgement. The rest runs while you sleep.

| Step | What happens |
|---|---|
| **01** | Clone the folder |
| **02** | Fill in `company.yaml` with your business — offer, ICP, voice, pricing |
| **03** | Hand the folder to any agent. It reads `SYSTEM.md`, becomes a growth operator, and starts shipping |

<br/>

---

## Without this · With this

| Without | With |
|---|---|
| You write every VSL, every email, every ad — because no one else can match your voice. | The voice is encoded. Agents draft in your patterns. You approve. |
| The closer leaves at month 8. The pipeline collapses. | Sales judgement is in `agents/sales/`. The next closer onboards in a day. |
| The VA copies last quarter's launch and the offer falls flat. | `plan-launch` reads your offer, your audience, your win patterns — and ships a launch built on the work that actually converted. |
| Quality decays the moment you stop reviewing every asset. | Every output passes the blind output test before it ships. Below 0.8 S/N, it's rejected automatically. |
| Your business stops when you stop. | Your business runs while you sleep, with receipts. |

<br/>

---

## Try it

```bash
git clone https://github.com/Heuresis/Growth-Operator-Agency.git your-workspace
cd your-workspace
./boot.sh
```

Boot prints the workspace credentials and runtime install options. Then
install into your runtime of choice:

```bash
./scripts/install.sh --tool claude-code
```

Eleven runtimes supported. See [Multi-tool integrations](#multi-tool-integrations).

Fill in `company.yaml` with your business context. Then ask for what you need:

```
/research          a market research brief
/build-icp         a customer profile
/design-offer      an offer document
/build-vsl         a video sales letter
/build-funnel      a 7-layer funnel
/ad-creative       hundreds of ad variants
/plan-launch       a launch plan
/build-sop         a team SOP
```

Full setup walkthrough: **[Quickstart](docs/QUICKSTART.md)** · 30 minutes.

<br/>

---

## How it fits together

Every Heuresis workspace is the same shape. A boot layer reads your business context, then activates the org-chart, skill outputs, methodology brain, and trigger manifest. Eleven runtime integrations ship — see [Multi-tool integrations](#multi-tool-integrations).

```text
┌──────────────────────────────────────────────────────────────┐
│                    THE ENCODED WORKSPACE                     │
│                                                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  │
│  │ SYSTEM.md │  │ ENCODING  │  │ INVARIANTS│  │  company  │  │
│  │ boot file │  │  schema   │  │   rules   │  │  context  │  │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘  │
│                                                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐  │
│  │  agents/  │  │  skills/  │  │ reference/│  │  triggers │  │
│  │ org chart │  │  outputs  │  │   brain   │  │  manifest │  │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘  │
└──────────────────────────────────────────────────────────────┘
                            │
                            ▼
        any agent runtime that reads files — 11 ship
```

<br/>

---

## What's inside the folder

```text
growth-operator-agency/
│
├── README.md            ←  the pitch
├── SYSTEM.md            ←  boot file · any AI becomes a growth operator
├── INVARIANTS.md        ←  28 sacred rules
├── ENCODING.md          ←  11-compartment schema
├── company.yaml         ←  YOUR business · fill once
│
├── agents/              ←  41 specialists · an org chart of a real company
│      growth-ceo               top orchestrator
│      7 department heads  ·  33 specialists
│
├── skills/              ←  36 capabilities · each produces one asset
│   │
│   │   FOUNDATIONS
│   ├── /research                 Market Research Brief
│   ├── /build-icp                Ideal Customer Profile
│   ├── /build-positioning        Positioning Document
│   ├── /design-offer             Offer Document
│   └── /extract-voice            Brand Voice Architecture
│   │
│   │   MARKETING
│   ├── /content-calendar         30-day content plan
│   ├── /ad-creative              Paid ad brief (8 ad types)
│   ├── /write-linkedin-post      LinkedIn post
│   ├── /write-reel               Short-form script (10 frameworks)
│   ├── /write-youtube            Long-form video (7 types)
│   ├── /write-x-thread           X thread (7 types)
│   └── /story-sequence           IG story sequence
│   │
│   │   NURTURE
│   ├── /lead-magnet              Lead magnet (9 types)
│   ├── /email-sequence           Email sequence (8 types)
│   ├── /webinar-script           Webinar / challenge (6 formats)
│   └── /post-booking-nurture     Show-rate stack
│   │
│   │   SALES
│   ├── /build-vsl                Video Sales Letter (5 variants)
│   ├── /build-funnel             Funnel Architecture (15 archetypes)
│   ├── /sales-script             Discovery → pitch → close
│   ├── /objection-library        20+ objections × reframes
│   ├── /call-prep                Pre-call brief
│   ├── /proposal                 Post-call proposal
│   ├── /application-form         Qualifying application
│   ├── /tripwire-design          $7–$97 entry offer
│   ├── /landing-page             4-page stack
│   └── /competitor-intel         Competitor teardown
│   │
│   │   LAUNCH  ·  SCALE  ·  PARTNERSHIPS
│   ├── /plan-launch  ·  /launch-report  ·  /build-sop  ·  /hiring-brief
│   ├── /retention-check  ·  /case-study  ·  /revenue-report
│   └── /jv-webinar-proposal  ·  /affiliate-program  ·  /referral-program
│
└── reference/           ←  the brain that makes skills smart
    ├── frameworks/             99 methodology docs
    ├── operators/              18 archetyped playbooks
    ├── platforms/              6 platform playbooks
    ├── swipe-file/             170+ hooks · templates · threads · testimonials
    ├── templates/              20 output templates
    ├── verticals/              11 vertical packs
    └── legal-templates/        11 starter legal docs
```

Each file is plain text. Each folder is owned by you. Nothing is locked behind an app.

<br/>

---

## Each offer ships with

- **Landing page** — multiple variants, live A/B tested
- **Video sales letter** — embedded in the landing page, scripted from your ICP and offer
- **Email sequence** — 7 emails, scheduled across LinkedIn, X, and email
- **Retargeting ads** — hundreds of creatives, tested by angle
- **Sales call script** — tuned on objection patterns captured from your calls
- **Follow-up sequence** — triggered 48 hours after every call
- **Upsell page** — shipped once the funnel proves out

Every action leaves a receipt. Every variant tracks its own conversion. Every winner gets promoted. Every paused variant tells you why.

<br/>

---

## Runs while you sleep

Wire the workspace into a runtime with **cron, webhook, and event triggers**. The agents keep working without you in the room.

- **Monday 09:00 (cron)** — retention-agent runs a health check on every active client
- **On `lead.captured` (webhook)** — ICP-match scoring fires, nurture sequence routed
- **On `launch.cart.closed` (event)** — launch-report generated within 48 hours
- **Daily 06:00 (cron)** — content-agent queues 4 LinkedIn posts, 2 short-form hooks
- **Continuous (event)** — retargeting-agent swaps creatives based on CTR

Triggers are declared in [`paperclip.manifest.yaml`](paperclip.manifest.yaml). Wire them to your scheduler and the workspace operates as a 24/7 growth team.

<br/>

---

## What you get

**7 agent-first departments. 41 agents. 36 skills.**

- **Foundations** — research · ICP · niche · offer · brand voice
- **Marketing** — content · YouTube · short-form · X · LinkedIn · stories · paid ads · SEO · podcast
- **Nurture** — email sequences · lead magnets · community · webinars · SMS
- **Sales** — VSL · funnel · sales scripts · DM sales · call prep · proposal · CRM
- **Launch** — launch manager · post-launch analyst
- **Scale** — SOPs · team hiring · competitor intel · financial · retention · case studies
- **Partnerships** — JV webinars · affiliate · referral

Each department is a full department rebuilt as agent-first — agents that carry your judgement, read signals, and make decisions.

<br/>

---

## Multi-tool integrations

The workspace is files. Files run anywhere that reads files. The Agency
ships conversion + install scripts so the same agents work across every
major agentic coding tool — no vendor lock, no rewrite.

| Tool | Install | Destination |
|---|---|---|
| **Claude Code** | `./scripts/install.sh --tool claude-code` | `~/.claude/agents/heuresis-growth-operator-agency/` |
| **GitHub Copilot** | `./scripts/install.sh --tool copilot` | `~/.github/agents/` + `~/.copilot/agents/` |
| **Antigravity (Gemini)** | `./scripts/install.sh --tool antigravity` | `~/.gemini/antigravity/skills/` |
| **Gemini CLI** | `./scripts/install.sh --tool gemini-cli` | `~/.gemini/extensions/heuresis-growth-operator-agency/` |
| **OpenCode** | `./scripts/install.sh --tool opencode` | `./.opencode/agents/` |
| **Cursor** | `./scripts/install.sh --tool cursor` | `./.cursor/rules/` |
| **Aider** | `./scripts/install.sh --tool aider` | `./CONVENTIONS.md` |
| **Windsurf** | `./scripts/install.sh --tool windsurf` | `./.windsurfrules` |
| **OpenClaw** | `./scripts/install.sh --tool openclaw` | `~/.openclaw/heuresis-growth-operator-agency/` |
| **Qwen Code** | `./scripts/install.sh --tool qwen` | `./.qwen/agents/` |
| **Kimi Code** | `./scripts/install.sh --tool kimi` | `~/.config/kimi/agents/` |

Five tools (Antigravity, Gemini CLI, OpenClaw, Cursor, Kimi) require format
conversion — the install script handles it transparently. To inspect the
converted artifacts before deploying:

```bash
./scripts/convert.sh --tool <tool-name>
ls build/<tool-name>/
```

Every tool has its own README with activation patterns, customization notes,
and uninstall steps. Full list: **[integrations/README.md](integrations/README.md)**.

Runtime-swappable. Your workspace is the asset. The runtime is replaceable.

<br/>

---

## Capabilities

What every Heuresis workspace ships with, regardless of which runtime you point at it.

| Property | What it does |
|---|---|
| **Plain-text workspace** | Every agent, skill, and framework is markdown + YAML. Read it, fork it, version it, diff it. |
| **Runtime-portable** | The same files run across every major agentic tool. Eleven integrations ship — see [Multi-tool integrations](#multi-tool-integrations). |
| **Goal ancestry** | Every skill carries the company's mission, ICP, offer, and brand voice as live context. Agents act on the *why*, not just the *what*. |
| **Encoded judgement** | Agents carry the operator's decisions, priors, and quality standards. The workspace replicates the operator's judgement, not their task list. |
| **Receipt trail** | Every cycle leaves an artefact — a brief, a draft, a score, a diagnostic. Auditable end-to-end. |
| **Compounding library** | Wins, swipe-file additions, and benchmark updates feed back into the workspace. Every cycle sharpens the next. |
| **Trigger-ready** | Cron, webhook, and event triggers declared in a manifest. Wire to any scheduler — daily kicks, post-publish audits, lead-routing — and the workspace operates while you sleep. |
| **Owned outright** | MIT-licensed. Fork it, host it, run it forever. Yours. |

<br/>

---

## Why this matters

Every founder-led creator business eventually hits the same wall: the founder IS every department.

The closer leaves at month 8 and the pipeline collapses. The VA copies last quarter's launch and the offer falls flat. The VSL is the only one that books calls because the founder is the only one who can write it — so the calendar bottlenecks on a single human.

Encoding changes the shape of the week. Your judgement — pricing logic, qualification instincts, voice, quality standards, the patterns you carry in your head — gets written into agents that run each department on your behalf. The founder stays. The judgement scales. The business compounds.

Every cycle, each department gets sharper. The gap between your firm and every competitor operating off memory widens.

This is one template in the library. More shipping, vertical by vertical. Every outcome claim we publish traces to a real deployment with a real operator. Thesis, method, and source go public on ideas. Receipts wait their turn.

<br/>

---

## Roadmap

- ✅ 41 agents · 7 departments · 36 skills shipped
- ✅ 99 framework docs · 18 operator playbooks · 11 vertical packs
- ✅ 170+ swipe-file specimens · 20 output templates · 11 legal templates
- ✅ Eleven runtime integrations: Claude Code · Copilot · Gemini · Cursor · Aider · Windsurf · OpenClaw · Qwen · Kimi · OpenCode · Antigravity
- ✅ Trigger manifest: cron · webhook · event
- ✅ Receipt trail across every skill
- ⚪ Voice-drift detection across long-form copy
- ⚪ Multi-operator org configurations
- ⚪ Per-skill benchmarks library
- ⚪ Workspace versioning · diff · rollback tooling
- ⚪ Vertical packs: B2B SaaS · agency-services · info-product · e-com
- ⚪ Heuresis Cloud — managed hosting for the workspace

<br/>

---

## Repository layout

| Folder | What it is |
|---|---|
| [`.claude/commands/`](.claude/commands/) | Claude Code slash-command shims — one `.md` per skill, wires `/skill-name` to its runtime |
| [`.github/`](.github/) | GitHub-native config: issue templates, PR template, contribution guide |
| [`agents/`](agents/) | 41 agent role definitions — CEO, 7 department heads, 33 specialists |
| [`docs/`](docs/) | User documentation: quickstart, architecture, FAQ, glossary, file tree, skill authoring guide |
| [`prompts/`](prompts/) | Domain-indexed prompt library: research, sales, content, email, ads, analytics, voice |
| [`reference/`](reference/) | Methodology library: frameworks, operator playbooks, swipe files, templates, vertical playbooks, legal templates |
| [`skills/`](skills/) | 36 skill packages — each with `SKILL.md`, variants, examples, evidence, runtime adapters |
| [`spec/`](spec/) | Workspace specifications: banned vocabulary, context thresholds, runtime contracts |
| [`workflows/`](workflows/) | Operational workflows: client onboarding, division pipelines, automations, handoffs, ops cadences |

<br/>

---

## Documentation

- [Quickstart](docs/QUICKSTART.md) — setup in 30 minutes
- [Architecture](docs/ARCHITECTURE.md) — how the folder is built
- [Skill Authoring](docs/SKILL_AUTHORING.md) — write your own agents and skills

## License

MIT. Free forever.

Built by [Syed Hussain](https://heuresis.ai) at [Heuresis](https://heuresis.ai).
