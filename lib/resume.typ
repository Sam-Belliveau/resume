// The top-level template. A variant applies it with `#show: resume.with(...)`
// and then lists its sections; everything after the show rule arrives as `body`.

#import "../theme/config.typ": config, fs, gap
#import "sections.typ": render-header, set-density

#let resume(header: none, description: none, keywords: (), body) = {
  set document(
    title: if header != none { header.name + " — Resume" } else { "Resume" },
    // Author is part of the accessible PDF metadata (read out by assistive tech and
    // shown in document properties), so populate it from the header name.
    author: if header != none { header.name } else { () },
    // `description` (→ PDF /Subject) and `keywords` (→ /Keywords) are variant-specific
    // and set per variant; defaulting to none/() leaves them unset. `date` is left at
    // its `auto` default (build date) on purpose.
    description: description,
    keywords: keywords,
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
  // The résumé carries a three-level heading hierarchy so the tagged PDF exposes a
  // real navigable outline (H1 name → H2 sections → H3 entry titles) to ATS and
  // assistive tech. Each level is emitted as a genuine `heading` (the name in
  // `render-header`, sections in `_section`, entry titles via `_entry-title`) and
  // restyled here. Returning bare `text` drops the heading's default block spacing,
  // so every level lays out identically to the former styled-text it replaced — the
  // surrounding gaps still own all spacing.
  show heading.where(level: 1): it => text(
    size: fs("name"), weight: config.weight.strong, it.body,
  )
  show heading.where(level: 2): it => text(
    size: fs("section"), weight: config.weight.strong, smallcaps(it.body),
  )
  show heading.where(level: 3): it => text(
    weight: config.weight.strong, it.body,
  )

  // Draft builds colour the section rules by how full the page is.
  if config.draft { set-density() }

  gap("page_top")
  if header != none { render-header(header) }
  body
  gap("page_bottom")
}
