// Formatting. Turns schema dictionaries into laid-out content, pulling every
// size and gap from `config`. This file owns all visual decisions; it never
// invents a number of its own.

#import "../theme/config.typ": config, fs, gap
#import "engine.typ": render-bullet

// Section rules carry the page-density signal in draft builds: `resume` measures
// the page and stores red (too cramped) / amber (too airy) / black (good) here.
#let rule-color = state("resume-rule-color", config.color.rule)

#let set-density(body) = layout(region => {
  let needed = measure(body, width: region.width).height
  let free = (region.height - needed) / region.height
  let col = if free < config.density.lo { config.color.dense } else if (
    free > config.density.hi
  ) { config.color.sparse } else { config.color.rule }
  rule-color.update(col)
})

// --- small typographic helpers -------------------------------------------------

#let _name(body) = text(weight: config.weight.strong, body)
#let _loc(body) = text(size: fs("detail"), fill: config.color.muted, body)
#let _role(body) = text(size: fs("detail"), style: "italic", body)
#let _date(body) = text(
  size: fs("detail"), style: "italic", fill: config.color.muted, body,
)

#let _row(left-body, right-body) = grid(
  columns: (1fr, auto), align: (left, right), left-body, right-body,
)

#let _rule() = context line(
  length: 100%, stroke: config.rule.stroke + rule-color.get(),
)

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
  _row(_name(e.school), _loc(e.location))
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
  _row(_name(e.organization), _loc(e.location))
  gap("head_to_sub")
  _row(_role(e.title), _date(e.dates))
  gap("sub_to_bullets")
  _bullets(e.bullets)
}

#let render-project(p) = {
  let heading = _name(p.title)
  if p.tech.len() > 0 {
    heading += config.sep.title_tech + _role(p.tech.join(config.sep.tech))
  }
  _row(heading, if p.dates != none { _date(p.dates) })
  gap("sub_to_bullets")
  _bullets(p.bullets)
}

#let render-publication(p) = {
  _row(_name(p.title), _date(p.status))
  gap("head_to_sub")
  _role(p.authors)
  gap("head_to_sub")
  text(size: fs("detail"))[
    #_name[Contribution:] #p.role#if p.contribution != none [. #p.contribution]
  ]
}

#let render-skills(s) = for (i, c) in s.categories.enumerate() {
  if i > 0 { gap("bullet_gap") }
  [#_name[#c.label: ]#c.items.join(config.sep.tech)]
}

// --- section assembly ----------------------------------------------------------

#let _section(title, body) = {
  gap("section_before")
  text(size: fs("section"), weight: config.weight.strong, smallcaps(title))
  gap("section_rule")
  _rule()
  gap("section_after")
  body
}

#let _entries(items, render) = for (i, it) in items.enumerate() {
  if i > 0 { gap("entry_gap") }
  render(it)
}

#let education_section(title: "Education", ..e) = _section(title, _entries(e.pos(), render-education))
#let experience_section(title: "Experience", ..e) = _section(title, _entries(e.pos(), render-experience))
#let project_section(title: "Projects", ..e) = _section(title, _entries(e.pos(), render-project))
#let publication_section(title: "Publications", ..e) = _section(title, _entries(e.pos(), render-publication))
#let skills_section(s, title: "Skills") = _section(title, render-skills(s))

// --- header --------------------------------------------------------------------

#let _link-text(url) = url.replace("https://", "").replace("http://", "").replace("www.", "")

#let render-header(h) = {
  set align(center)
  text(size: fs("name"), weight: config.weight.strong, h.name)
  gap("name_to_contact")
  let parts = ()
  if h.phone != none { parts.push(h.phone) }
  if h.email != none { parts.push(link("mailto:" + h.email, h.email)) }
  if h.linkedin != none { parts.push(link(h.linkedin, _link-text(h.linkedin))) }
  if h.website != none { parts.push(link(h.website, _link-text(h.website))) }
  text(size: fs("detail"), parts.join(config.sep.contact))
}
