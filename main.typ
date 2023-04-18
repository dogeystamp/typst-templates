// main template that everything inherits from

#let script-size = 12pt
#let footnote-size = 10pt
#let small-size = 9pt
#let normal-size = 12pt
#let large-size = 12pt

#let me = "dogeystamp"

#let font = "Roboto"
#let heading_font = "JetBrains Mono"
#let math_font = "Fira Math"
#let mono_font = "JetBrains Mono"

#let gen_title(
  title: none,
) = {
  // Set document metadata.

  align(center, {
    text(size: large-size, weight: 700, title, font: heading_font)
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
  set text(size: normal-size, font: font, weight: "regular")
  show math.equation: set text(font: math_font)
  show heading: set text(font: heading_font)

  set page(
    paper: paper-size,
  )
  set heading(numbering: "1.")
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)
  show link: set text()

  show math.equation: set block(below: 8pt, above: 9pt)
  show math.equation: set text(weight: 400)

  show figure: it => {
    show: pad.with(x: 23pt)
    set align(center)

    v(12.5pt, weak: true)

    // Display the figure's body.
    it.body

    // Display the figure's caption.
    if it.has("caption") {
      // Gap defaults to 17pt.
      v(if it.has("gap") { it.gap } else { 17pt }, weak: true)
      smallcaps[Figure]
      if it.numbering != none {
        [ #counter(figure).display(it.numbering)]
      }
      [. ]
      it.caption
    }

    v(15pt, weak: true)
  }

  // Configure paragraph properties.
  set par(first-line-indent: 1.2em, justify: true, leading: 0.8em)
  show par: set block(spacing: 2em)

  // Display the article's contents.
  v(29pt, weak: true)
  body
}
