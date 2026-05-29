// Data structures. Each constructor validates its required fields and returns a
// plain tagged dictionary — no formatting decisions live here. The renderers in
// `sections.typ` consume the `kind` tag. Content files call these and bind the
// result to `entry`; variant files select which entries to show.

#let _need(cond, what) = assert(cond, message: "resume schema: " + what)

#let header(name: none, phone: none, email: none, linkedin: none, website: none) = {
  _need(name != none, "header needs a name")
  (kind: "header", name: name, phone: phone, email: email,
   linkedin: linkedin, website: website)
}

// School / location on the title row; degree / dates on the subtitle row.
// `gpa` (if given) and any `bullets` render as detail lines beneath.
#let education(
  school: none, location: none, degree: none, dates: none,
  gpa: none, bullets: (),
) = {
  _need(school != none, "education needs a school")
  _need(degree != none, "education needs a degree")
  _need(dates != none, "education needs dates")
  (kind: "education", school: school, location: location, degree: degree,
   dates: dates, gpa: gpa, bullets: bullets)
}

// Organization / location on the title row; title / dates on the subtitle row.
#let experience(
  organization: none, title: none, location: none, dates: none, bullets: (),
) = {
  _need(organization != none, "experience needs an organization")
  _need(title != none, "experience needs a title")
  _need(dates != none, "experience needs dates")
  _need(bullets.len() > 0, "experience needs at least one bullet")
  (kind: "experience", organization: organization, title: title,
   location: location, dates: dates, bullets: bullets)
}

// Header line is "title | tech, tech, ..." on the left, dates on the right.
// `link` (if given) turns the title into a clickable hyperlink to the repo.
#let project(title: none, tech: (), dates: none, link: none, bullets: ()) = {
  _need(title != none, "project needs a title")
  _need(bullets.len() > 0, "project needs at least one bullet")
  (kind: "project", title: title, tech: tech, dates: dates, link: link,
   bullets: bullets)
}

// A numbered citation: "[n] authors. \"title.\"" with venue-status on the right,
// then an optional "role — contribution" detail line. `authors` is content, so the
// candidate's own name can be bolded inline (e.g. `[*S. Belliveau*, A. Davis]`).
#let publication(
  title: none, status: none, authors: none, role: none, contribution: none,
) = {
  _need(title != none, "publication needs a title")
  _need(status != none, "publication needs a status")
  _need(authors != none, "publication needs authors")
  _need(role != none, "publication needs a role")
  (kind: "publication", title: title, status: status, authors: authors,
   role: role, contribution: contribution)
}

// One honour/award: bold `name`, optional italic `detail`, optional right-aligned
// `date`. Grouped by `awards(...)` like skill categories.
#let award(name, detail: none, date: none) = (
  name: name, detail: detail, date: date,
)

#let awards(..items) = {
  let xs = items.pos()
  _need(xs.len() > 0, "awards needs at least one item")
  (kind: "awards", items: xs)
}

// One labelled row of comma-separated items, e.g. category("Languages", "C", …).
#let category(label, ..items) = (label: label, items: items.pos())

#let skills(..categories) = {
  let cats = categories.pos()
  _need(cats.len() > 0, "skills needs at least one category")
  (kind: "skills", categories: cats)
}
