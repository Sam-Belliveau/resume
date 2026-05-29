---
name: resume
description: Author and tune this Typst résumé. Use to create a new résumé variant, add or edit an experience / project / publication / education entry, or fit a résumé to exactly one page by rewriting bullet lines until the draft's colour-coded fit feedback clears.
---

# Authoring this résumé

This repo builds several one-page résumé **variants** from shared **entries**.
Read `README.md` for the full layout; the essentials:

- `theme/config.typ` — the only place with literal numbers (sizes, gaps, colours,
  the fit thresholds). Never hard-code a value elsewhere; change it here.
- `content/<type>/<year>-<slug>.typ` — one entry per file, data only.
- `variants/<name>.typ` — selects which entries appear and in what order.

## The line model

Bullets are written as explicit visual lines, not wrapping prose. Each `line[...]`
is fitted to one row by adjusting tracking and **never wraps**. Write bullets with
the `bullet` / `line` primitives, and put a bold lead-in in `lead:`, never as inline
markup:

```typ
bullet(lead: "Project Name", line[First full line of the bullet.], line[Second full line.])
bullet(line[A single full line.])
```

Facts are sacred: keep every organization, title, date, technology, and metric.
Only rephrase wording and where the line breaks fall.

## Add an entry

Create `content/<type>/<year>-<slug>.typ`, import from `../../lib/lib.typ`, and bind
one `entry` using the matching constructor (`experience`, `project`, `publication`,
`education`, or for the header/skills the singletons). Then add it to whichever
variant should show it.

## Add a variant

Copy an existing `variants/*.typ`, change the imports to the entries you want, and
list the `*_section(...)` calls in display order. `*_section` takes an optional
`title:` to rename a section (e.g. "Research Experience").

## Fit to one page — the visual loop

This is the core workflow. The page auto-fills via fractional spacing, so the job is
making every bullet line sit in the fill band.

1. Render a draft PNG: `just png <variant>` → `out/<variant>-draft.png`.
2. Read the PNG. The text is black; a line is flagged with a translucent
   highlight (see `theme/config.typ` for exact colours):
   - **no highlight** — good, leave it.
   - **blue highlight** — too short, it was stretched to fill → add words / merge a clause up.
   - **red highlight** — too long, it was squeezed → rewrite shorter / split across lines.
   - section **rules** blue = page too airy (add content); red = too cramped (cut).
3. Edit the offending lines in `content/**` and re-render. Repeat until every line is
   black and the resume is one page.
4. Final check: `just build <variant>` is the clean (all-black) PDF that ships.

Do **not** widen the fit band in `theme/config.typ` to make content pass — the band
is a deliberate forcing function; rewrite the lines instead.

For heavy tuning, delegate the loop to the `resume-tuner` subagent with the variant
name; it runs render→read→rewrite autonomously and reports back.
