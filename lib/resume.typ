// The top-level template. A variant applies it with `#show: resume.with(...)`
// and then lists its sections; everything after the show rule arrives as `body`.

#import "../theme/config.typ": config, fs, gap
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
    lang: "en", // tag the document language for accessibility / clean extraction
  )
  set par(leading: config.leading)
  show link: set text(fill: config.color.link)
  // Section titles are emitted as real headings (see _section); restyle them to the
  // section look here. Returning bare `text` drops the heading's default block
  // spacing, so the layout is identical to the former styled-text titles while the
  // tagged PDF gains a proper H1 structure tree.
  show heading: it => text(
    size: fs("section"), weight: config.weight.strong, smallcaps(it.body),
  )

  // Draft builds colour the section rules by how full the page is.
  if config.draft { set-density(body) }

  gap("page_top")
  if header != none { render-header(header) }
  body
  gap("page_bottom")
}
