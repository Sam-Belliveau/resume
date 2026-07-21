// Formatting. Turns schema dictionaries into laid-out content, pulling every
// size and gap from `config`. This file owns all visual decisions; it never
// invents a number of its own.

#import "../theme/config.typ": config, fs, gap
#import "engine.typ": render-bullet, fit-line

// Section rules carry the page-density signal in draft builds: `resume` stores
// red (too cramped) / blue (too airy) / black (good) here.
#let rule-color = state("resume-rule-color", config.color.rule)

// Page density, from ground truth: every `gap()` brackets itself with position
// probes (see config.typ), so summing the probe pairs gives exactly how much of
// the page the fr gaps absorbed. That drives the rule colour and a queryable
// page record for `just fit`, including each gap kind's resolved size.
#let set-density() = layout(region => {
  let sizes = query(<gap-s>).zip(query(<gap-e>)).map(((s, e)) => (
    key: s.value.key,
    weight: s.value.weight,
    pt: calc.max(e.value.y - s.value.y, 0.0),
  ))
  let free = sizes.map(g => g.pt).sum(default: 0.0) / region.height.pt()
  let status = if free < config.density.lo { "cramped" } else if (
    free > config.density.hi
  ) { "airy" } else { "ok" }
  rule-color.update((
    cramped: config.color.dense, airy: config.color.sparse, ok: config.color.rule,
  ).at(status))
  let kinds = (:)
  for g in sizes {
    let k = kinds.at(g.key, default: (weight: g.weight, count: 0, total: 0.0))
    kinds.insert(g.key, (weight: g.weight, count: k.count + 1, total: k.total + g.pt))
  }
  [#metadata((
    kind: "page",
    status: status,
    free: calc.round(free, digits: 3),
    band: (config.density.lo, config.density.hi),
    line_band: (config.fit.min_fill, config.fit.max_fill),
    font_size: config.font.size.pt(),
    gaps: kinds,
  )) <fit>]
})

// --- small typographic helpers -------------------------------------------------

#let _name(body) = text(weight: config.weight.strong, body)
// An entry's title (school / organization / project) as a real level-3 heading, so
// it becomes an H3 node under its section's H2 in the tagged structure tree. The
// `show heading.where(level: 3)` rule in resume.typ restyles it to look exactly like
// `_name` (bold, inline), so the layout is unchanged. `outlined: false` keeps it out
// of the PDF bookmark outline (matching sections); only the structure tree gains it.
#let _entry-title(body) = heading(level: 3, outlined: false)[#body]
#let _loc(body) = text(size: fs("detail"), fill: config.color.muted, body)
#let _role(body) = text(size: fs("detail"), style: "italic", body)
#let _date(body) = text(
  size: fs("detail"), style: "italic", fill: config.color.muted, body,
)

#let _row(left-body, right-body) = grid(
  columns: (1fr, auto), align: (left, right), left-body, right-body,
)

// The section underline is purely decorative, so mark it a PDF artifact: it is then
// excluded from the logical structure tree and assistive tech skips it instead of
// announcing a stray rule between the heading and its content.
#let _rule() = pdf.artifact(context line(
  length: 100%, stroke: config.rule.stroke + rule-color.get(),
))

// Render a list of bullets with proportional gaps between them.
#let _bullets(items) = for (i, b) in items.enumerate() {
  if i > 0 { gap("bullet_gap") }
  render-bullet(b)
}

// A marked line that is not fit-checked — for short fixed facts like GPA.
#let _plain-line(body) = grid(
  columns: (config.indent.bullet, 1fr),
  align: top + left,
  text(fill: config.color.muted)[#config.sep.bullet],
  body,
)

// --- per-entry renderers -------------------------------------------------------

#let render-education(e) = {
  _row(_entry-title(e.school), _loc(e.location))
  gap("head_to_sub")
  _row(_role(e.degree), _date(e.dates))
  if e.gpa != none or e.bullets.len() > 0 { gap("sub_to_bullets") }
  if e.gpa != none { _plain-line[#_name[GPA:] #e.gpa] }
  if e.bullets.len() > 0 {
    if e.gpa != none { gap("bullet_gap") }
    _bullets(e.bullets)
  }
}

#let render-experience(e) = {
  _row(_entry-title(e.organization), _loc(e.location))
  gap("head_to_sub")
  _row(_role(e.title), _date(e.dates))
  gap("sub_to_bullets")
  _bullets(e.bullets)
}

#let render-project(p) = {
  // A `link` makes the title clickable; since the link colour equals the text
  // colour, the printed page is unchanged — the URL just rides in the annotation.
  let title = if p.link != none { link(p.link, p.title) } else { p.title }
  let head = _entry-title(title)
  if p.tech.len() > 0 {
    head += config.sep.title_tech + _role(p.tech.join(config.sep.tech))
  }
  _row(head, if p.dates != none { _date(p.dates) })
  gap("sub_to_bullets")
  _bullets(p.bullets)
}

// A numbered citation with a hanging indent under the "[n]" marker:
//   [1] Authors. "Title."                              Venue — Status
//       Role — contribution.
// `authors` is content with the candidate's name bolded inline; the title is
// smart-quoted; status is right-aligned like every other date in the resume.
//
// The two lines are emitted at the TOP LEVEL (separated by a normal `gap`, which is
// a page-distributed `v(1fr)`); each line is a `cite, 1fr` grid only for the hanging
// indent. A `gap` must never live inside a grid cell — there its fr is resolved
// against the cell, not the page, and balloons to swallow the layout.
#let _cite-row(marker, body) = grid(
  columns: (config.indent.cite, 1fr), align: top + left, marker, body,
)
#let render-publication(p, n) = {
  // Fixed text the author can't pad to fill the column, so both rows fit shrink-only
  // (`expand: false`): squeezed to one row if long, left natural if short, never
  // stretched, and never auto-wrapped.
  let status = _date(p.status)
  _cite-row(
    text(size: fs("detail"))[#("[" + str(n) + "]")],
    // Fit the authors/title to the column minus the right-aligned status (plus a
    // reserved gap); `h(1fr)` then pushes the status flush right.
    layout(cell => {
      let head = text(size: fs("detail"))[#p.authors. "#p.title."]
      let reserve = measure(status).width + measure(box(width: config.indent.date)).width
      fit-line(head, cell.width - reserve, expand: false)
      h(1fr)
      status
    }),
  )
  if p.role != none or p.contribution != none {
    gap("head_to_sub")
    let detail = text(size: fs("detail"), fill: config.color.muted)[#p.role#if p.contribution != none [ — #p.contribution]]
    _cite-row([], layout(cell => fit-line(detail, cell.width, expand: false)))
  }
}

#let render-skills(s) = for (i, c) in s.categories.enumerate() {
  if i > 0 { gap("bullet_gap") }
  [#_name[#c.label: ]#c.items.join(config.sep.tech)]
}

// One honour per line: bold name — italic detail, date flush right. The date is
// pushed right with an `h(1fr)` spacer INSIDE the same text line rather than placed
// in a separate grid column — so it reads flush-right on the page yet stays adjacent
// to its award in the content stream, and `pdftotext` extracts it in order (a
// right-aligned grid column gets batched and dumped at the document end instead).
#let render-awards(a) = for (i, it) in a.items.enumerate() {
  if i > 0 { gap("entry_gap") }
  let row = _name(it.name)
  if it.detail != none { row += [ — #_role(it.detail)] }
  if it.date != none { row += [#h(1fr)#_date(it.date)] }
  block(width: 100%, row)
}

// --- section assembly ----------------------------------------------------------

#let _section(title, body) = {
  gap("section_before")
  // A real `heading` (not styled `text`) so the tagged PDF carries a logical
  // structure tree — sections are H2, under the H1 name and above each entry's H3.
  // The `show heading.where(level: 2)` rule in resume.typ restyles it to the section
  // look (smallcaps, section size, bold); the surrounding gaps own all spacing so it
  // stays thin.
  heading(level: 2, outlined: false)[#title]
  gap("section_rule")
  _rule()
  gap("section_after")
  body
}

#let _entries(items, render) = for (i, it) in items.enumerate() {
  if i > 0 { gap("entry_gap") }
  render(it)
}

// Like `_entries`, but hands each renderer its 1-based index (for "[n]" citations).
#let _numbered-entries(items, render) = for (i, it) in items.enumerate() {
  if i > 0 { gap("entry_gap") }
  render(it, i + 1)
}

#let education_section(title: "Education", ..e) = _section(title, _entries(e.pos(), render-education))
#let experience_section(title: "Experience", ..e) = _section(title, _entries(e.pos(), render-experience))
#let project_section(title: "Projects", ..e) = _section(title, _entries(e.pos(), render-project))
#let publication_section(title: "Publications", ..e) = _section(title, _numbered-entries(e.pos(), render-publication))
#let skills_section(s, title: "Skills") = _section(title, render-skills(s))
#let awards_section(a, title: "Honors & Awards") = _section(title, render-awards(a))

// --- header --------------------------------------------------------------------

#let _link-text(url) = url.replace("https://", "").replace("http://", "").replace("www.", "")

#let render-header(h) = {
  set align(center)
  // The name is the document's H1 — the root of the heading outline. The
  // `show heading.where(level: 1)` rule in resume.typ restyles it to the former
  // name look (name size, bold), so the centred header is visually unchanged.
  heading(level: 1, outlined: false)[#h.name]
  gap("name_to_contact")
  let parts = ()
  if h.phone != none { parts.push(h.phone) }
  if h.email != none { parts.push(link("mailto:" + h.email, h.email)) }
  if h.linkedin != none { parts.push(link(h.linkedin, _link-text(h.linkedin))) }
  if h.website != none { parts.push(link(h.website, _link-text(h.website))) }
  text(size: fs("detail"), parts.join(config.sep.contact))
}
