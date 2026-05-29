# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

A [Typst](https://typst.app) résumé system (Typst 0.14.x). Shared **entries** in
`content/` are composed by per-résumé **variants** in `variants/`, all tuned to fill
exactly one page. `README.md` has the full tour and `.claude/skills/resume/SKILL.md`
the authoring workflow — read those for content work. This file is the architecture
map: the invariants below are spread across several files and are easy to violate.

## Commands

`just` lists recipes. Every invocation passes `--font-path fonts` (the family is
bundled and font fallback is **off**, so a missing font renders a blank page).

- `just watch <variant>` — live-reload draft with colour-coded fit feedback.
- `just png <variant> [ppi]` — render draft to `out/<variant>-draft.png` for visual tuning.
- `just build <variant>` — clean final PDF (`--input draft=false`, PDF/A-2b).
- `just txt <variant>` — final PDF + `pdftotext` plain-text ATS companion.
- `just all` — every variant's final PDF (+ .txt) into `out/`.
- `just font-check` — confirm Typst sees the bundled Source Sans 3.

Variants are `swe`, `robotics`, `research`. There is no test suite; the schema
constructors `assert` on missing required fields, so a bad entry fails the build
with a clear message. CI (`.github/workflows/build.yml`) builds all three on push.

## Architecture

Data flows one direction: **`content/` (data) → `variants/` (composition) →
`resume.with` show rule → `lib/sections.typ` (rendering)**, with `theme/config.typ`
as the only source of literal values. The separation is strict and load-bearing:

- `theme/config.typ` — every tunable number lives here, nowhere else. `lib/` files
  must never hard-code a value; `content/` files must never set a font or a gap.
- `lib/schema.typ` — constructors (`header`, `education`, `experience`, `project`,
  `publication`, `skills`/`category`, `award`/`awards`). They validate and return a
  plain `kind`-tagged dict; **no styling**.
- `lib/sections.typ` — owns *all* visual decisions; dispatches on the `kind` tag and
  pulls every size/gap from `config`.
- `lib/engine.typ` — the line engine (see below).
- `lib/resume.typ` — top-level `resume(...)` template, applied via `#show: resume.with(...)`.
- `lib/lib.typ` — the public API; content and variants import only from here.

### Two layout invariants (theme/config.typ)

1. **The only absolute length is `font.size`.** Every text size is a multiple of it,
   resolved by `fs(key)`. Scaling `font.size` scales the whole résumé.
2. **Every vertical gap is a unitless fractional weight**, emitted by `gap(key)` as
   `v(weight * 1fr)`. Typst shares the page's free vertical space among all gaps by
   weight, so the page always fills itself and gaps stay proportional. There are no
   absolute vertical spacings anywhere — not even margins (page-relative `%`).

### The line engine (lib/engine.typ) — the heart

Bullets are an explicit sequence of visual `line[...]`s, not auto-wrapping prose.
Each line is fitted to exactly one row by adjusting word spacing and letter tracking
(never scaling glyphs, never wrapping). In **draft** builds a line gets a translucent
highlight when its natural width leaves the fit band — blue = too short (stretched,
add words), red = too long (squeezed, rewrite shorter); section rules carry the same
signal at page level. A **final** build (`--input draft=false`) is pixel-identical in
geometry — the *only* difference is the highlights. The authoring loop is render →
read highlights → rewrite lines until all black and one page (delegate heavy tuning
to the `resume-tuner` subagent). The fit band (`fit.min_fill/max_fill`) is a
deliberate forcing function — **fix the content, never widen the band to make it pass.**

### Non-obvious constraints

- **`line` shadows Typst's built-in** within `lib.typ`'s scope (it's the bullet-line
  constructor). `sections.typ` does not import the shadow, so its section rules use
  the real `line()` element directly.
- **`gap()` must never live inside a grid cell** — its `1fr` would resolve against the
  cell, not the page, and balloon. Numbered publications emit their two rows at the
  top level and use grids only for the hanging `[n]` indent (see `render-publication`).
- **Headings are real `heading` elements** in a three-level hierarchy (restyled by
  level-aware show rules in `resume.typ`): the name is **H1** (`render-header`),
  section titles are **H2** (`_section`), and each entry's title is **H3**
  (`_entry-title`, used by the education/experience/project renderers). So the PDF
  carries a navigable logical structure tree (`just build` certifies **PDF/A-2a**,
  the accessible conformance level — validated clean by veraPDF). Decorative bits
  (the section underline `_rule()`) are wrapped in `pdf.artifact(...)` so assistive
  tech skips them. Note: bullets render as `P` (paragraphs), not a tagged list —
  Typst 0.14 exposes no manual list-tag primitive and the line engine precludes real
  `list` elements, so true `L`/`LI` tagging is the one accessibility ceiling here.
- **Awards dates are flush-right via an `h(1fr)` spacer *inside* the text line**, not
  a separate grid column — so the date stays adjacent to its award in the content
  stream and extracts in order. Award rows are separated by `entry_gap` (not
  `bullet_gap`) so `pdftotext`'s default column heuristic isolates each row and keeps
  its date attached; a tight-stacked right-aligned grid column instead gets batched
  and dumped at the document end, breaking extraction order.
- A `project` `link:` and the header links use the text colour, so they're invisible
  on the printed page — the URL just rides in the PDF annotation.

### Adding content

A new **entry**: `content/<type>/<year>-<slug>.typ`, import from `../../lib/lib.typ`,
bind one `entry` with the matching constructor, then add it to a variant. A new
**variant**: copy a `variants/*.typ`, import the entries, list `*_section(...)` calls
in display order (each takes an optional `title:`). `content/skills.typ` exports one
named skill set per variant (`swe`, `robotics`, `research`); a variant imports the
one it wants as `skills`. See `README.md` and the `/resume` skill for full examples.
