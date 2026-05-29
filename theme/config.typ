// The single source of truth. Every tunable number in the resume lives here.
//
// Two rules keep the layout honest:
//   1. The only absolute length is `font.size`; every other text size is a
//      multiple of it (resolved by `fs`), so the whole resume scales together.
//   2. Every vertical gap is a unitless fractional weight, emitted by `gap` as
//      `v(weight * 1fr)`. Typst shares the page's free vertical space among all
//      gaps by weight, so the resume always fills exactly one page and every gap
//      stays proportional to every other gap. There are no absolute vertical
//      spacings anywhere — not even the page margins, which are page-relative.

// `--input draft=false` (CI / final build) produces a clean PDF; the default
// draft build colour-codes lines that are too long or too short.
#let draft = sys.inputs.at("draft", default: "true") != "false"

#let config = (
  draft: draft,
  page: (
    paper: "us-letter",
    margin: (x: 7%, y: 6%),
  ),
  font: (
    family: "Source Sans 3",
    size: 10pt,
    fallback: false,
  ),
  // Text sizes as multiples of `font.size`.
  scale: (
    name: 2.50,
    section: 1.18,
    title: 1.00,
    body: 1.00,
    detail: 0.92,
  ),
  weight: (
    normal: "regular",
    emphasis: "semibold",
    strong: "bold",
  ),
  // Paragraph line height. The only non-fr vertical metric, because it is a
  // property of the type, not padding between elements.
  leading: 0.62em,
  // Vertical gaps as fractional weights. Only the ratios between them matter.
  // The range is kept moderate so that on a sparse page the structural gaps do
  // not balloon while the intra-entry gaps collapse — every gap stays legibly
  // proportional to every other.
  space: (
    page_top: 0,
    name_to_contact: 1.0,
    section_before: 3.0,
    section_rule: 0.6,
    section_after: 1.3,
    entry_gap: 2.4,
    head_to_sub: 1.0,
    sub_to_bullets: 1.3,
    bullet_gap: 1.0,
    page_bottom: 0,
  ),
  // Horizontal indent of the bullet marker column (horizontal, so it stays a
  // type-relative length rather than a fractional weight).
  indent: (
    bullet: 1.1em,
    // Hanging indent for the "[1]" marker on numbered publications. Wider than
    // the bullet column because the bracketed number is wider than the dot.
    cite: 1.7em,
  ),
  color: (
    text: rgb("#1a1a1a"),
    muted: rgb("#565656"),
    rule: rgb("#000000"),
    link: rgb("#1a1a1a"),
    dense: rgb("#d62828"), // draft, warm: line too long / page too cramped
    sparse: rgb("#2a6fdb"), // draft, cool: line too short / page too airy
  ),
  rule: (
    stroke: 0.6pt,
  ),
  // Per-line fit band (a deliberate forcing function — do NOT widen it just to
  // make content fit; rewrite the lines instead). Every line is fitted to one row
  // by adjusting tracking. A line whose natural width is below `min_fill` of the
  // column had to be stretched (too short → add more); above `max_fill` it had to
  // be squeezed (too long → rewrite shorter). In between renders black. Tune the
  // content until every line sits in the band.
  fit: (
    min_fill: 0.90,
    max_fill: 1.025,
    // Of the space a line must gain/lose to fill the column, this fraction is
    // taken from letter tracking and the rest from word spacing — so words
    // breathe more than letters, like proper justification.
    kern_share: 0.25,
  ),
  // Page fill band. `free` is the share of page height left for fr gaps to
  // absorb; below `lo` the page is too cramped, above `hi` it is too airy.
  density: (
    lo: 0.04,
    hi: 0.24,
  ),
  sep: (
    contact: "  |  ",
    tech: ", ",
    title_tech: "  |  ",
    bullet: "•",
  ),
)

// Resolve a scale key to an absolute text size.
#let fs(key) = config.scale.at(key) * config.font.size

// Emit a vertical gap by its fractional weight.
#let gap(key) = v(config.space.at(key) * 1fr)
