// The top-level template. A variant applies it with `#show: resume.with(...)`
// and then lists its sections; everything after the show rule arrives as `body`.

#import "../theme/config.typ": config, gap
#import "sections.typ": render-header, set-density

#let resume(header: none, body) = {
  set document(
    title: if header != none { header.name + " — Resume" } else { "Resume" },
  )
  set page(paper: config.page.paper, margin: config.page.margin)
  set text(
    font: config.font.family,
    size: config.font.size,
    fill: config.color.text,
    fallback: config.font.fallback,
  )
  set par(leading: config.leading)
  show link: set text(fill: config.color.link)

  // Draft builds colour the section rules by how full the page is.
  if config.draft { set-density(body) }

  gap("page_top")
  if header != none { render-header(header) }
  body
  gap("page_bottom")
}
