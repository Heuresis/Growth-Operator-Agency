<div align="center">

# **GROWTH OPERATOR AGENCY**

**An autonomous agentic workspace for high-ticket creator businesses. In one folder.**

<p>
  <a href="CHANGELOG.md"><img src="https://img.shields.io/badge/version-1.0.0-09090b?style=flat-square&labelColor=09090b&color=52525b" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-09090b?style=flat-square&labelColor=09090b&color=52525b" alt="License"></a>
</p>

</div>

<br/>

<img alt="Growth Operating Agency — system diagram" src="docs/assets/system-diagram.svg" width="100%">

<br/>

> **The agent is thin. The workspace is smart. The workspace IS the product.**

An open-source encoded workspace of **41 agents and 36 skills** that runs the full operations of a high-ticket creator business — research, offer, funnel, content, nurture, sales, launch, scale.

Runtime-agnostic. Plug it into any autonomous agentic runtime — **Paperclip · Canopy · Claude Agent SDK · BusinessOS · Claude Code · Cursor · Codex · any HTTP orchestrator** — and the workspace operates as a 24/7 growth team. Agents trigger on cron, webhook, event, or human call.

You fill the context once. The agents execute. You stay in the loop only where your judgment counts.

**Every cycle, more of the work runs without you.**

No subscription. No signup. No platform to learn. A folder you own, forever.

## Try it

1. Clone:

   ```bash
   git clone https://github.com/Heuresis/Growth-Operator-Agency.git
   ```

2. Fill in `company.yaml` with your business context.

3. Call a department or invoke a skill:

   ```
   /research          → market research brief
   /build-icp         → customer profile
   /design-offer      → offer document
   /build-vsl         → video sales letter
   /plan-launch       → 5-phase launch plan
   ```

Works with any autonomous agentic runtime — **Paperclip · Canopy · Claude Agent SDK · BusinessOS · Claude Code · Cursor · Codex · Aider · ChatGPT**, or any HTTP-driven orchestrator that reads markdown.

Full setup: **[Quickstart](docs/QUICKSTART.md)** · 30 minutes.

## Runs as an autonomous agentic system

Every skill ships three adapters so the same workspace runs across every execution surface:

- `adapters/claude-code.md` — slash-command runtime (developer-driven, interactive)
- `adapters/manifest.yaml` — workspace-manifest runtime (Paperclip, Canopy, BusinessOS, Cursor, any agent-ops platform)
- `adapters/http.openapi.yaml` — REST contract (Claude Agent SDK, HTTP-driven orchestrators, serverless functions)

Wire it to a scheduler + data triggers (CRM, email, ad platforms, webhooks) and the creator's role compresses from *"produce the work"* to *"approve the work."* The same workspace operates as:

- A **slash-command session** — interactive, creator-driven
- A **scheduled agent** — cron-triggered, autonomous
- A **webhook-responsive worker** — event-triggered, reactive
- An **agent-managed pipeline** — orchestrated across specialists, long-running

Runtime-swappable. Encoding is the asset.

## Inside the workspace

**7 departments. 41 agents. 29 skills.**

- **Foundations** — research · ICP · niche · offer · brand voice
- **Marketing** — content · YouTube · short-form · X · LinkedIn · stories · paid ads · SEO · podcast
- **Nurture** — email sequences · lead magnets · community · webinars · SMS
- **Sales** — VSL · funnel · sales scripts · DM sales · call prep · proposal · CRM
- **Launch** — launch manager · post-launch analyst
- **Scale** — SOPs · team hiring · competitor intel · financial · retention · case studies
- **Partnerships** — JV webinars · affiliate · referral

Built from the playbooks of operators who've run this at scale.

## Every skill is specced

Each of the 36 capabilities ships with the same contract: required inputs, variants, gates, runtime adapters. One example:

<img alt="Skill spec card — /build-vsl" src="docs/assets/skill-spec-card.svg" width="100%">

## The map

<img alt="File tree specimen" src="docs/assets/file-tree-specimen.svg" width="100%">

Full annotated tree: [docs/FILE-TREE.md](docs/FILE-TREE.md)

## Documentation

- [Quickstart](docs/QUICKSTART.md) — setup in 30 minutes
- [Architecture](docs/ARCHITECTURE.md) — how the folder is built
- [Skill Authoring](docs/SKILL_AUTHORING.md) — write your own agents and skills

## License

MIT. Free forever.

Built by [Syed Hussain](https://heuresis.ai) at [Heuresis](https://heuresis.ai).
