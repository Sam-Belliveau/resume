# Sam Belliveau — Résumé

A [Typst](https://typst.app) résumé system. Each entry (experience, project,
publication, education) is a small data file; each résumé **variant** simply
selects the entries it wants and lays them out. Everything is tuned to fit on
exactly one page, with all spacing relative so the page always fills itself.

## Quick start

```sh
just            # list recipes
just watch swe  # live-reload the SWE draft (colour-coded fit feedback)
just all        # build every variant's final PDF into out/
```

Requires [`typst`](https://github.com/typst/typst) (0.14.x) and
[`just`](https://github.com/casey/just). The font ships in `fonts/`; every
command passes `--font-path fonts`.

## Layout

```text
theme/config.typ     One source of truth — every size, gap, colour, threshold.
lib/                 The template engine (formatting + data structures).
  schema.typ         Entry constructors + validation. No styling.
  engine.typ         The manual-line engine: line[...] and bullet(...).
  sections.typ       Renders each section type from the schema.
  resume.typ         The top-level resume(...) template.
content/             One file per entry — data only, no formatting.
  header.typ  skills.typ  education/  experience/  projects/  publications/
variants/            One file per résumé — selects entries and section order.
```

Separation is strict: `content/` files never set a font or a gap, and `lib/`
files never hard-code a number — every value comes from `theme/config.typ`.

## The line engine

Bullets are written as an explicit sequence of visual **lines** instead of prose
that auto-wraps. Each `line[...]` is rendered on exactly one row and fitted to the
column by adjusting word and letter spacing (words breathe more than letters, like
justification) — it never wraps. Authoring is a tight visual loop, especially with
LLM help: build the draft, look at the highlights, rewrite until none remain.

```typ
bullet(lead: "CaptureGraph (System Architect)",
  line[Built a DSL that serializes experimental procedures into a graph data model;],
  line[a companion iOS runtime interprets that graph to deliver state-aware AR guidance.],
)
```

In a **draft** build (the default) the text stays black and readable; a line is
flagged with a translucent highlight when it falls outside the fill band:

- **no highlight** — the line sits in the band; leave it.
- **blue highlight** — too short; it was stretched to fill. Add more to the line.
- **red highlight** — too long; it was squeezed. Rewrite it shorter.

The section rules also carry a page-level signal: red if the page is too cramped,
blue if it is too airy. A **final** build (`--input draft=false`, used by CI) is
identical in geometry but unmarked — the only difference between draft and final
is the highlights. Tune the band in `theme/config.typ` (`fit.min_fill`,
`fit.max_fill`, `fit.kern_share`).

To tune visually, render a PNG and open it: `just png swe` → `out/swe-draft.png`.
For a machine-readable version of the same feedback, `just fit swe` prints an XML
report with every line's fill ratio and the resolved size of every vertical gap —
handy for LLM-driven tuning, no image required.

## Adding content

**A new entry** — create `content/<type>/<year>-<slug>.typ` and bind one `entry`:

```typ
#import "../../lib/lib.typ": experience, bullet, line

#let entry = experience(
  organization: "...", title: "...", location: "...", dates: "...",
  bullets: (
    bullet(line[A single full line.]),
    bullet(lead: "Project", line[First line.], line[Second line.]),
  ),
)
```

Constructors (`lib/schema.typ`): `header`, `education`, `experience`, `project`,
`publication`, `skills`/`category`. They validate required fields, so a missing
field fails the build with a clear message.

**A new variant** — copy a file in `variants/`, import the entries you want, and
list the sections in the order they should appear:

```typ
#import "../lib/lib.typ": resume, experience_section, project_section
#import "../content/experience/2023-cuauv-software.typ": entry as cuauv
#show: resume.with(header: header)
#experience_section(cuauv, /* ... */)
```

Section functions take an optional `title:` (e.g. `experience_section(..., title:
"Research Experience")`).

## Editor preview

`.vscode/settings.json` points the tinymist / Typst Preview extension at `fonts/`
so the preview renders (the template turns font fallback off, so a missing font
would otherwise show a blank page). Reload the window after first opening the repo.

## CI

`.github/workflows/build.yml` builds all three variants on every push (downloadable
artifacts) and attaches the PDFs to a GitHub Release when a `v*` tag is pushed.

## Authoring with Claude

`.claude/` ships a `/resume` skill (how to add entries/variants and tune to one
page) and a `resume-tuner` subagent that renders the draft, reads the colours, and
rebalances lines automatically.
