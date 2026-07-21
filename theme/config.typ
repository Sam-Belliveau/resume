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

// Geometric spacing scale: each tier is ×√2 the one below (the ISO-paper ratio),
// anchored at the body line-rhythm (tier 2 = 1.0). A constant ratio reads as equal
// perceptual steps where a linear scale would collapse the gaps between top tiers.
#let tier(n) = calc.pow(calc.sqrt(2.0), n - 2)

#let config = (
  draft: draft,
  page: (
    paper: "us-letter",
    margin: (x: 0.5in, y: 0.5in),
  ),
  font: (
    family: "Source Sans 3",
    size: 10pt,
    fallback: false,
  ),
  // Type sizes as multiples of `body` (= font.size), resolved by `fs`. Size ranks
  // the structural levels; entry titles rank up by weight, so they cost no height.
  scale: (
    name: 2.50, //   the name — dominates the page
    section: 1.10, // section headings (smallcaps + bold rank them too)
    title: 1.00, //  entry titles — set apart by weight, not size
    body: 1.00, //   reading baseline; the anchor for every other size
    detail: 1.00, // supporting text — dates, roles, locations
  ),
  weight: (
    normal: "regular",
    emphasis: "semibold",
    strong: "bold",
  ),
  // Paragraph line height. The only non-fr vertical metric, because it is a
  // property of the type, not padding between elements.
  leading: 0.4em,
  // Vertical gaps, as `tier()` weights (only ratios matter). A gap's tier is how
  // SEPARATE the two things it divides are in the document tree — proximity = grouping.
  // `leading` sits below tier 0: wrapped lines of one bullet are a single sentence.
  space: (
    page_top: 0,
    section_before: tier(5), //  section ↔ section
    section_rule: tier(0), //    heading ↔ its rule
    section_after: tier(3), //   rule → first entry
    entry_gap: tier(4), //       entry ↔ entry
    head_to_sub: tier(1), //     org ↔ role
    sub_to_bullets: tier(2), //  role → first bullet
    bullet_gap: tier(2), //      bullet ↔ bullet
    name_to_contact: tier(3), // name → contact
    page_bottom: 0,
  ),
  // Horizontal type-relative lengths (em, not fractional weights).
  indent: (
    bullet: 1.1em, // bullet marker column
    cite: 1.7em, //  hanging indent for the "[n]" marker — wider, the bracket is wider than the dot
    date: 1.0em, //  min gap reserved before a right-aligned date on a fitted line
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
  // Page fill band. `free` is the share of the usable page height the fr gaps
  // actually absorbed (measured by the gap probes — see `set-density`); below
  // `lo` the gaps are squeezed thin (cramped: cut content), above `hi` they gape
  // (airy: add content). Calibrated so a well-tuned page (~0.45–0.65) reads ok.
  density: (
    lo: 0.35,
    hi: 0.70,
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

// Emit a vertical gap by its fractional weight. Draft builds bracket the gap
// with zero-size position probes, so the fit report can state the resolved size
// of every gap (`set-density` pairs the probes up in document order).
#let gap(key) = {
  let sp = v(config.space.at(key) * 1fr)
  if not draft { return sp }
  place(context [#metadata((key: key, weight: config.space.at(key), y: here().position().y.pt())) <gap-s>])
  sp
  place(context [#metadata((y: here().position().y.pt())) <gap-e>])
}
