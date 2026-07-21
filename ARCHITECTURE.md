# Architecture

Internals of the template engine. **Read this only when changing `lib/` or
`theme/` — content and variant work doesn't need it** (see `CLAUDE.md` and
`README.md` instead). The invariants below are spread across several files and
are easy to violate.

## Data flow

One direction: **`content/` (data) → `variants/` (composition) → `resume.with`
show rule → `lib/sections.typ` (rendering)**, with `theme/config.typ` as the only
source of literal values. The separation is strict and load-bearing:

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

## Two layout invariants (theme/config.typ)

1. **The only absolute length is `font.size`.** Every text size is a multiple of it,
   resolved by `fs(key)`. Scaling `font.size` scales the whole résumé.
2. **Every vertical gap is a unitless fractional weight**, emitted by `gap(key)` as
   `v(weight * 1fr)`. Typst shares the page's free vertical space among all gaps by
   weight, so the page always fills itself and gaps stay proportional. There are no
   absolute vertical spacings anywhere — not even margins (page-relative `%`).

## The line engine (lib/engine.typ)

Each `line[...]` is fitted to exactly one row by adjusting word spacing and letter
tracking (never scaling glyphs, never wrapping). In **draft** builds a line whose
natural width leaves the fit band gets a translucent highlight; section rules carry
the same signal at page level. A **final** build (`--input draft=false`) is
pixel-identical in geometry — the *only* difference is the highlights. The fit band
(`fit.min_fill`/`max_fill`) is a deliberate forcing function — fix the content,
never widen the band to make it pass.

### Draft-only fit instrumentation (`just fit`)

Draft builds also emit zero-size, queryable metadata — the source of the XML fit
report (`just fit <variant>` → `typst query "<fit>"` → `scripts/fit-report.py`):

- `fit-line` tags every fitted line with a `<fit>` record (status, fill ratio,
  plain text, recovered by `_plain`).
- `gap()` (theme/config.typ) brackets each gap with `<gap-s>`/`<gap-e>` position
  probes. The probes must be wrapped in `place(...)`: a bare zero-size element in
  the flow attaches to the *following* block, so both probes of a pair would
  report the same post-gap position and every gap would measure 0.
- `set-density` (lib/sections.typ) pairs the probes to get each gap's actual
  resolved size — ground truth, since all `fr` gaps share one page-level
  distribution — sums them into the page-density status that colours the section
  rules, and emits the aggregate `<fit>` page record.

None of this exists in a final build, and it is all zero-size in draft — draft
and final geometry stay pixel-identical (verified by diffing renders).

## Non-obvious constraints

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
