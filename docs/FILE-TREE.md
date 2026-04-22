# Growth Operating Agency — File Tree

> The map. Every line answers *"what is this FOR me?"*

```
growth-operating/
│
├── README.md            → the pitch: what this system builds for you, week by week
├── SYSTEM.md            → the brain boot file — makes any AI into a growth operator on read
├── INVARIANTS.md        → 28 sacred rules every AI must follow (14 NEVERs + 14 ALWAYSes)
├── ENCODING.md          → the 11-part schema that captures your business in one file
├── company.yaml         → YOUR business (ICP, offer, voice). Fill this once; 36 skills read from it.
│
├── agents/              ── 41 AI specialists organized like a real company
│   ├── growth-ceo           → top orchestrator. Every request routes through here.
│   ├── foundations-head     → owns research / ICP / positioning / offer / brand voice
│   ├── marketing-head       → owns content / ads / organic distribution
│   ├── nurture-head         → owns email / webinar / lead magnet
│   ├── sales-head           → owns VSL / funnel / sales scripts / landing pages
│   ├── launch-head          → owns launches + post-launch analysis
│   ├── scale-head           → owns SOPs / hiring / retention / case studies
│   ├── partnerships-head    → owns JV / affiliate / influencer
│   └── [33 specialists]     → ICP builder, offer architect, VSL writer, closer, etc.
│
├── skills/              ── 36 capabilities. Each produces ONE specific business asset.
│   │
│   │  FOUNDATIONS — figure out who you're selling to and what
│   ├── /research            → Market Research Brief (9 sections, Go/No-Go recommendation)
│   ├── /build-icp           → 13-section Ideal Customer Profile
│   ├── /build-positioning   → Positioning Document (category, mechanism, big idea, narrative)
│   ├── /design-offer        → Offer Document (value stack, bonuses, guarantee, 3:1 LTV:CAC)
│   ├── /extract-voice       → Brand Voice Architecture (phrases to use + phrases to avoid)
│   │
│   │  MARKETING — show up on every channel that matters
│   ├── /content-calendar    → 30-day content plan (4-pillar ratio across platforms)
│   ├── /ad-creative         → Paid-ad brief (8 ad types × multiple variants)
│   ├── /write-linkedin-post → offer-promoting LinkedIn post (PIER / Hook-Loop-CTA)
│   ├── /write-reel          → short-form script (10 frameworks)
│   ├── /write-youtube       → long-form video script (7 video types incl. hidden-pitch VSSL)
│   ├── /write-x-thread      → X thread (7 thread types)
│   ├── /story-sequence      → 7-day Instagram Story sequence
│   │
│   │  NURTURE — turn cold viewers into warm buyers
│   ├── /lead-magnet         → Lead magnet design + copy (9 types)
│   ├── /email-sequence      → Email sequence (8 types incl. launch + re-engage + post-purchase)
│   ├── /webinar-script      → Webinar or challenge script (6 formats incl. workshop)
│   ├── /post-booking-nurture → Show-rate stack (confirmation page + email + SMS + phone triage)
│   │
│   │  SALES — close without chasing
│   ├── /build-vsl           → Full VSL Script (5 framework variants, all 8 required beliefs)
│   ├── /build-funnel        → Funnel Architecture (15 archetypes)
│   ├── /sales-script        → 8-stage discovery → pitch → close script
│   ├── /objection-library   → 20+ objections × 3-layer reframes × proof × escalation
│   ├── /call-prep           → 15-min routine producing a 1-page pre-call brief
│   ├── /proposal            → 1-page post-call proposal ($3K–$50K engagements)
│   ├── /application-form    → qualifying application (3 archetypes) with DQ logic
│   ├── /tripwire-design     → $7–$97 entry offer (7 archetypes + ascension math)
│   ├── /landing-page        → 4-page stack (opt-in / offer / thank-you / checkout, 4 variants each)
│   ├── /competitor-intel    → competitor teardown + positioning-gap analysis
│   │
│   │  LAUNCH — time-boxed revenue bursts
│   ├── /plan-launch         → Launch plan (5 types × 5-phase SOP)
│   └── /launch-report       → Post-launch analysis + recommendations for next cycle
│
│   │  SCALE — build the team and retain the base
│   ├── /build-sop           → Team SOP (14 role variants)
│   ├── /hiring-brief        → Hiring brief + scorecard (8 roles)
│   ├── /retention-check     → Client health score + churn flags before they fire
│   ├── /case-study          → Testimonial → case-study conversion
│   └── /revenue-report      → P&L + forecasting + unit economics
│
│   │  PARTNERSHIPS — grow via other people's audiences
│   ├── /jv-webinar-proposal → JV webinar partnership pitch
│   ├── /affiliate-program   → Affiliate program design
│   └── /referral-program    → Referral program design
│
├── reference/           ── the brain that makes all 36 skills smart
│   ├── frameworks/          → 99+ methodology docs (psychology, persuasion, economics primitives)
│   ├── operators/           → 18 archetyped operator playbooks (the moat — no names)
│   ├── platforms/           → 6 platform playbooks (LinkedIn / IG / TikTok / X / Meta ads / YouTube)
│   ├── swipe-file/          → 170+ hooks · 20+ LinkedIn posts · 15+ threads · case studies · testimonials
│   ├── templates/           → 20 instantiable document templates (ICP / offer / VSL / sales page / etc.)
│   ├── verticals/           → 11 vertical packs (fitness / B2B / ecom / health / mindset / career / etc.)
│   ├── legal-templates/     → 11 starter legal docs (privacy / TOS / client / NDA / contractor / etc.)
│   ├── playbooks/           → worked case-studies at scale
│   ├── examples/            → golden outputs (calibration targets for quality)
│   ├── knowledge/           → department-level shared knowledge
│   └── canonical/           → canonical specs + theory (signal, quality, blind-output-test, agent bible)
│
├── workflows/           ── how work moves across the org
│   ├── divisions/           → 7 pipeline FSMs (foundations → marketing → … → partnerships)
│   ├── operations/          → team cadences (daily / weekly / monthly / quarterly), tool SOPs
│   ├── automations/         → CRM triggers (lead-to-CRM / booking-to-show / churn detection)
│   ├── client-onboarding/   → Week-1 + 90-day onboarding SOPs
│   ├── delivery/            → 4-week fulfillment SOP
│   ├── handoffs/            → skill-to-skill + quality-revision handoff protocols
│   └── execution-templates/ → daily standup, weekly review, QBR, post-mortem, RFC, runbook, launch debrief
│
├── prompts/             ── 11 AI prompt libraries for fast iteration
│   ├── research-prompts       → ICP / VOC / competitor / market-sizing / objection mining
│   ├── offer-prompts          → offer variants · pricing · guarantee · bonus brainstorm
│   ├── vsl-prompts            → hooks · mechanism naming · stack slide · close variants
│   ├── ad-creative-prompts    → hook grid · angles · headlines · UGC briefs · compliance check
│   ├── email-prompts          → subject lines · cold email · launches · deliverability audit
│   ├── content-prompts        → LinkedIn · X · reel · YouTube · carousel · newsletter
│   ├── sales-prompts          → objection reframe · call prep · proposal · close-rate diagnostic
│   ├── analytics-prompts      → metric read · funnel bottleneck · cohort LTV · churn diagnostic
│   ├── content-repurposing    → long-form → short-form · podcast → threads · blog → emails
│   └── brand-voice-prompts    → tone calibration · phrase mining · in-voice rewrite
│
├── spec/                ── the quality gates (why outputs don't turn into slop)
│   ├── BANNED-VOCABULARY.md     → 100+ banned corporate-speak words; enforced at ship time
│   ├── CONTEXT-THRESHOLDS.md    → minimum company.yaml completeness per skill type
│   └── RUNTIMES.md              → adapter contracts per runtime (Claude Code / Cursor / HTTP / etc.)
│
└── docs/                ── guides for humans
    ├── QUICKSTART.md        → 30-min setup; clone, fill company.yaml, run /research
    ├── ARCHITECTURE.md      → how the system fits together (identity, skills, agents, invariants)
    ├── SKILL_AUTHORING.md   → how to add a new skill
    ├── GLOSSARY.md          → every term in one place
    ├── FAQ.md               → runtime / privacy / instantiation / quality gates
    ├── PROVENANCE.md        → what it rests on + credits
    └── FILE-TREE.md         → this file
```

---

## What a normie notices in 30 seconds

1. **`skills/` is 36 buttons.** Each one makes a real business document. No fluff.
2. **`agents/` is an org chart.** A CEO, 7 department heads, 33 specialists — like hiring a company.
3. **`company.yaml`** — you fill it in once, the whole system gets smarter about YOUR business.
4. **`prompts/`** — 11 copy-pasteable AI prompt packs if you want to move faster without the full skills.
5. **`reference/`** — 170+ hooks, 20+ templates, 11 legal docs, 11 vertical packs. The stuff most businesses pay $10K+ for, encoded.
6. **`workflows/`** — how the business actually RUNS (daily standups, QBRs, onboarding, automations).

The mental shift: this isn't a document folder. It's **a high-ticket coaching business compressed into a repo**. Plug a runtime in, fill `company.yaml`, and the 36 buttons produce work.

---

*Growth Operating Agency — a Heuresis workspace template. [heuresis.ai](https://heuresis.ai)*
