// The manual-line engine — the heart of this template.
//
// Bullets are written as an explicit sequence of visual lines instead of a blob
// of prose that auto-wraps. Each `line[...]` is rendered on exactly ONE row and
// scaled horizontally to fill the column — squeezed if it runs long, stretched
// if it runs short — so a line never wraps. In draft builds the line is coloured
// red when it had to be squeezed (rewrite it shorter) or blue when it had to be
// stretched past `min_fill` (add more), guiding the author to rewrite every line
// until they all sit naturally full and the bullet looks uniform.

#import "../theme/config.typ": config

// A single visual line. Inert on its own — `bullet` lays a sequence of them out.
// `expand: false` fits the line shrink-only (squeeze if long, never stretch if
// short) — for fixed text the author can't pad, e.g. a publication title.
#let line(body, expand: true) = (kind: "line", body: body, expand: expand)

// A bullet: an optional bold lead-in plus the ordered lines that follow it.
#let bullet(lead: none, ..lines) = (
  kind: "bullet",
  lead: lead,
  lines: lines.pos(),
)

#let _lead(lead) = if lead == none { none } else {
  text(weight: config.weight.emphasis)[#lead: ]
}

// Recover a line's plain text from its content tree, so the fit report can
// identify each line without rendering an image.
#let _plain(it) = {
  if type(it) == str { it } else if type(it) != content { repr(it) } else {
    let f = it.fields()
    if "text" in f { f.text } else if "children" in f {
      let s = f.children.map(_plain).join("")
      if s == none { "" } else { s }
    } else if "child" in f { _plain(f.child) } else if "body" in f {
      _plain(f.body)
    } else if it.func() == linebreak { " " } else if it.func() == smartquote {
      if f.at("double", default: true) { "\"" } else { "'" }
    } else if repr(it.func()) == "space" { " " } else { "" }
  }
}

// Fit the line to the column by adjusting word spacing and letter tracking
// rather than scaling the glyphs — the shapes stay intact, like microtype. Width
// is linear in both, so we measure the natural width and the per-point slope of
// each (how many letter gaps and word spaces there are), then split the deficit:
// `kern_share` goes to letter tracking, the rest to word spacing, so words
// breathe more than letters. A line with no spaces puts everything into tracking.
#let fit-line(body, avail, expand: true) = {
  let natural = measure(body).width
  let gaps = (measure(text(tracking: 1pt, body)).width - natural) / 1pt
  let spaces = (measure(text(spacing: 100% + 1pt, body)).width - natural) / 1pt
  // `expand: false` only squeezes overlong lines, never stretches short ones.
  let deficit = avail - 0.5pt - natural
  if not expand { deficit = calc.min(deficit, 0pt) }

  let kern = if spaces > 0 { config.fit.kern_share } else { 1.0 }
  let tracking = if gaps > 0 { deficit * kern / gaps } else { 0pt }
  let spacing = if spaces > 0 { deficit * (1.0 - kern) / spaces } else { 0pt }

  let fitted = text(tracking: tracking, spacing: 100% + spacing, body)
  if not config.draft { return fitted }

  // Draft-only fit signal. "long" = squeezed (rewrite shorter); "short" =
  // stretched past `min_fill` (add more) — a non-expanding line is meant to be
  // short, so only "long" fires for it. The same status drives the translucent
  // highlight (a background that never shifts the text, so draft and final
  // geometry match to the pixel) and a queryable <fit> record for `just fit`.
  let status = if natural > avail * config.fit.max_fill { "long" } else if (
    expand and natural < avail * config.fit.min_fill
  ) { "short" } else { "ok" }
  [#metadata((
    kind: "line",
    status: status,
    fill: calc.round(natural / avail, digits: 3),
    text: _plain(body),
  )) <fit>]
  let flag = (long: config.color.dense, short: config.color.sparse).at(status, default: none)
  if flag == none { fitted } else {
    highlight(fill: flag.transparentize(60%), extent: 0pt, fitted)
  }
}

#let render-bullet(b) = grid(
  columns: (config.indent.bullet, 1fr),
  align: top + left,
  text(fill: config.color.muted)[#config.sep.bullet],
  // `layout` hands us the content column's width so each line fills it exactly.
  layout(cell => {
    let last = b.lines.len() - 1
    for (i, ln) in b.lines.enumerate() {
      let body = if i == 0 { _lead(b.lead) + ln.body } else { ln.body }
      fit-line(body, cell.width, expand: ln.expand)
      if i != last { linebreak() }
    }
  }),
)
