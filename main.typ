// main template that everything inherits from

#let script-size = 12pt
#let footnote-size = 10pt
#let small-size = 9pt
#let normal-size = 12pt
#let large-size = 12pt

#let me = "dogeystamp"

#let font = "Roboto"
#let heading_font = "Roboto"
#let math_font = "Fira Math"
#let mono_font = "JetBrains Mono"

#let gen_title(
  title: none,
) = {
  // Set document metadata.

  align(center, {
    text(size: large-size, weight: "black", title, font: heading_font)
  })
}

#let gen_authors(
  authors: none,
) = {
  if authors == none {
    authors = (
      (
        name: me,
      ),
    )
  }
  let names = authors.map(author => author.name)
  let author-string = if authors.len() == 2 {
    names.join(" and ")
  } else {
    names.join(", ", last: ", and ")
  }

  align(center, {
    text(size: footnote-size, author-string)
    v(25pt, weak: true)
  })
}

// this template sets up the document
// but does not do things like title, authors, etc.
#let doc_template(
  paper-size: "a4",

  // Content to wrap
  body,
) = {
  set text(size: normal-size, font: font, weight: "light")
  show link: body => text(fill: rgb("#777777"), weight: "bold", body)
  show math.equation: eq => text(font: math_font, eq)
  show heading: set text(font: heading_font, weight: "black")
  show raw.where(block: true): txt => pad(
      left: 0.5em,
      block(
        radius: 0.5em,
        stroke: luma(230),
        fill: luma(245),
        pad(
          left: 1em,
          right: 1em,
          top: 1em,
          bottom: 1em,
          txt
        )
      )
    )

  set page(
    paper: paper-size,
  )
  set heading(numbering: "1.")
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)

  // Configure paragraph properties.
  set par(justify: true)

  // Display the article's contents.
  v(29pt, weak: true)
  body
}
