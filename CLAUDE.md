# CLAUDE.md

A [Typst](https://typst.app) one-page résumé. Entries in `content/` (pure data,
one file each) are composed into résumé **variants** in `variants/` (`swe`,
`robotics`, `research`). Work here is almost always **writing** — editing bullet
content and fitting it to the page. The tooling is stable; treat it as a black
box unless you're changing `lib/` or `theme/`, in which case read
`ARCHITECTURE.md` first.

## Commands

- `just fit <variant>` — XML fit report: every line's fill ratio + page density.
- `just png <variant>` — draft PNG with the same feedback as colour highlights.
- `just build <variant>` — clean final PDF.
- `just all` — every variant's final PDF (+ ATS .txt) into `out/`.

`just` lists the rest. Every recipe passes `--font-path fonts`; a bare `typst`
call without it renders a blank page. There is no test suite — constructors
assert on missing fields, so a bad entry fails the build with a clear message.

## The writing loop

Bullets are explicit visual `line[...]`s, never wrapping prose. Each line is
fitted to exactly one row, and flagged when its natural width leaves the fit band:

- **short** (blue in the PNG) — was stretched: add words, or merge with a neighbour.
- **long** (red) — was squeezed: tighten wording, or move a clause down.
- Page: **airy** (blue section rules) = add content; **cramped** (red) = cut.

Loop: `just fit <variant>` → rewrite flagged lines in `content/**` → repeat until
nothing is flagged and it's one page. For a long tuning session, delegate to the
`resume-tuner` subagent with the variant name.

## Hard rules

- **Facts are sacred.** Organizations, titles, dates, technologies, and metrics
  stay exactly as written — only rephrase wording and where lines break.
- **Never widen the fit band** (`fit.*` in `theme/config.typ`) to make a line
  pass. It's a deliberate forcing function; fix the content.
- `content/` files carry data only — no fonts, sizes, or gaps. Every literal
  number lives in `theme/config.typ`.

## Adding content

New entry: create `content/<type>/<year>-<slug>.typ`, import from
`../../lib/lib.typ`, bind one `entry` with the matching constructor, add it to a
variant. New variant: copy one in `variants/`, swap the imports, order the
`*_section(...)` calls (each takes an optional `title:`). Full examples in
`README.md`; authoring workflow in the `/resume` skill.
