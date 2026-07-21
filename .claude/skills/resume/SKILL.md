---
name: resume
description: Author and tune this Typst résumé. Use to create a new résumé variant, add or edit an experience / project / publication / education entry, or fit a résumé to exactly one page by rewriting bullet lines until the fit report clears.
---

# Authoring this résumé

This is a writing task, not an engineering one. Entries live in `content/` (one
file each, data only); variants in `variants/` pick and order them. Bullets are
explicit visual lines — each `line[...]` renders on exactly one row and never
wraps — so your job is to write lines that naturally fill their row.

```typ
bullet(lead: "Project Name", line[First full line of the bullet.], line[Second full line.])
bullet(line[A single full line.])
```

Bold lead-ins go in `lead:`, never as inline markup.

**Facts are sacred**: keep every organization, title, date, technology, and
metric exactly as written. Only rephrase wording and where the line breaks fall.

## Fit to one page — the core loop

1. `just fit <variant>` — prints an XML report: each line's `status`
   (`ok`/`short`/`long`) and fill ratio, the page `status` (`ok`/`airy`/`cramped`),
   and a `<spacing>` section with each vertical gap's resolved size in em (big
   gaps = the page has room for more content).
2. Rewrite flagged lines in `content/**`:
   - **short** (stretched to fill) → add words or pull a clause up from the next line.
   - **long** (squeezed) → tighten wording or move a clause to the next line.
   - Page **airy** → add a bullet or entry; **cramped** → cut one.
3. Repeat until nothing is flagged. `just build <variant>` makes the final PDF.

`just png <variant>` renders the same feedback visually (blue = short, red =
long) if you want to see the page. Never widen the fit band in
`theme/config.typ` to make a line pass — rewrite the line.

For heavy tuning, delegate to the `resume-tuner` subagent with the variant name.

## Add an entry

Create `content/<type>/<year>-<slug>.typ`, import from `../../lib/lib.typ`, bind
one `entry` with the matching constructor (`experience`, `project`,
`publication`, `education`, `awards`), and add it to a variant. Copy a
neighbouring file as the template — constructors assert on missing fields.

## Add a variant

Copy an existing `variants/*.typ`, change the imports to the entries you want,
and list the `*_section(...)` calls in display order (each takes an optional
`title:`, e.g. "Research Experience"). `content/skills.typ` exports one named
skill set per variant; import the one you want as `skills`.
