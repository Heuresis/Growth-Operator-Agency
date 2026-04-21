# The 4 Governing Principles — Shannon / Ashby / Beer / Wiener

> **Source:** Luna Signal Theory pp.9-11 · Canopy `protocol/signal-theory.md` lines 38-69
> **Status:** Load-bearing. Every skill output constrained by all 4 simultaneously. Violate any = signal fails.

## The Root Objective

**Maximize Signal-to-Noise Ratio (S/N).** All 4 principles serve this single metric.

## 1. Shannon — The Ceiling

Every channel has finite capacity: `C = B × log₂(1 + S/N)`.

**Law:** if rate R < C → arbitrarily low error rate possible. If R > C → reliable communication impossible.

**Applied to Growth OS:**
- Context window is a finite channel
- Output length has a ceiling
- Exceeding ceiling = Shannon violation = reliable understanding impossible
- A 500-line explanation when 20 lines suffice = violation

**Enforcement in skills:** every SKILL.md declares target runtime/length. Output > 2× target = reject.

## 2. Ashby — The Repertoire

*"Only variety can absorb variety."* Formally: `V(controller) ≥ V(disturbance)`.

**Requisite Variety Ratio:**
- R = V(system) / V(disturbance)
- R < 1.0 → failing
- R 1.0-3.0 → marginal
- R 3.0-10.0 → adequate
- R ≥ 10.0 → robust

**Applied to Growth OS:**
- VSL needs 5 variant templates (Pampa/Hogendoorn/Trister/Benson/Haynes) because buyer contexts have high variety
- Email sequences need 8 types because situations vary
- Funnels need 7 archetypes
- 10 Bennett short-form frameworks, 7 YouTube video types

**Enforcement:** if creator context demands a variant the system doesn't have → Ashby violation → skill blocks + flags capability gap.

## 3. Beer — The Architecture

Every viable system requires 5 recursive subsystems:
- **System 1** — Operations (produce/consume signals)
- **System 2** — Coordination (prevent signal conflicts)
- **System 3** — Control (manage flow + resources)
- **System 4** — Intelligence (scan external environment)
- **System 5** — Policy (define encoding standards + identity)

**Applied to Growth OS:**
- Foundations = System 5 (Policy — ICP + offer + positioning set identity)
- Marketing = Transmission Layer
- Nurture = System 2 (Coordination — keeps buyer stages aligned)
- Sales = Conversion Chain
- Launch = System 3 (Control)
- Scale = System 1 (Operations)
- Partnerships = cross-cutting (System 4 scan)

**Enforcement:** missing subsystems = blindspot. No Foundations (S5) = no identity. No Scale (S1) = no execution. Full architecture = viability.

See `signal-theory/vsm-mapping.md` for full mapping.

## 4. Wiener — The Feedback Loop

*Systems without feedback cannot self-correct.* Every signal must have a return path.

**Types of feedback loops:**
- **Single-loop** — did this output match intent?
- **Double-loop** — is our process producing good outputs?
- **Triple-loop** — are our assumptions still valid?

**Applied to Growth OS:**
- Every skill produces output AND expects a response (accepted / rejected / refined)
- Blind Output Test = feedback mechanism (creator + evaluators provide signal)
- Compartment updates after skill execution = loop closure
- Revenue reports feed back into offer/funnel/VSL skills

**Enforcement:** output with no response channel = broken signal. Skills without feedback mechanisms = re-design.

## The 4 Together

Each addresses a distinct dimension of viability. Individually necessary, collectively sufficient:

| Principle | Addresses | Violation mode |
|---|---|---|
| Shannon | Channel capacity | Overload — too much signal for the channel |
| Ashby | Repertoire | Variety deficit — unhandled situations |
| Beer | Architecture | Blindspot — missing subsystem |
| Wiener | Feedback | Open loop — no self-correction |

All 4 must be satisfied for a skill to ship.

## Diagnostic Use

When something underperforms, diagnose WHICH principle failed:
- Output too long / verbose → Shannon
- Doesn't match creator context → Ashby (variety deficit)
- Missing division output / blind to something → Beer
- No response / feedback → Wiener

## Sources

- Luna Signal Theory pp.9-11
- Canopy `protocol/signal-theory.md` lines 38-69
- Shannon (1948), Ashby (1956), Beer (1972), Wiener (1948)
- `spec/SIGNAL.md`

---
*v1.0 — 2026-04-19.*
