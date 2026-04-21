# Reference Templates

> **Purpose:** artifact templates used as output skeletons by skills. Each skill's Output Format section references one of these.
>
> **Status:** populated on demand — templates are added here as skills prove their output format. If you need a template that isn't here, the canonical output structure lives in the skill's own `SKILL.md` body under `Output Format`.

## When to create a template here

Create a template file in this directory only when:
1. The output artifact is produced by multiple skills (shared schema)
2. The template is referenced from more than one `SKILL.md`
3. The template is stable across creator instantiations

Single-skill output templates live inside the skill's own folder at `skills/<skill>/reference/template.md`, not here.

## Related

- `../frameworks/` — methodology (not output templates)
- `../examples/` — completed example deliverables (calibration targets)
- `../../skills/<skill>/SKILL.md` — Output Format section per skill
