// main template that everything inherits from

#let script-size = 9pt
#let footnote-size = 8pt
#let small-size = 8pt
#let normal-size = 9pt
#let large-size = 9pt

#let font = "IBM Plex Sans"
#let heading_font = "IBM Plex Sans"
#let mono_font = "DejaVu Sans Mono"

#let settings = yaml("/settings.yml")

// reference based on TYPST_ROOT
// use paths like "/problems/problem.pdf"
// which will translate to "/home/user/docs/problems/problem.pdf"
#let lref(
  // whether or not to prepend 'pdfref://' to the link. as long as the handler
  // is installed, it allows specifying the page number linked to
  // see https://github.com/dogeystamp/pyinstantref for details
  pdfref: false,
  url,
  text
) = {
  let realUrl = settings.prefix + url;
  if (pdfref) {
    realUrl = "pdfref://" + realUrl
  }
  return link(realUrl, text)
}

#let gen_title(
  title: none,
) = {
  // Set document metadata.
  text(size: 20pt, weight: "black", title, font: heading_font)
}

#let gen_authors(
  authors: none,
) = {
  if authors == none {
    authors = (
      (
        name: settings.me,
      ),
    )
  }
  let names = authors.map(author => author.name)
  let author-string = if authors.len() == 2 {
    names.join(" and ")
  } else {
    names.join(", ", last: ", and ")
  }

  text(author-string)
}

#let gen_preamble(
  title: none,
  authors: none,
  prefix: none,
  suffix: none,
) = {
  pad(left: -2%, {
      gen_title(title: title)
      v(13pt, weak: true)
      pad(left: 1.5pt, prefix)
      align(right,
        rect(
          width: 50%,
          stroke: none,
          {
            [
              #{gen_authors(authors: authors)}

            ]
            suffix
        })
      )
      v(10pt)
    line(length: 100%, stroke: 1pt + rgb("#555555"))
  })
  v(5%, weak: true)
}

// this template sets up the document
// but does not do things like title, authors, etc.
#let doc_template(
  paper-size: "us-letter",

  // Content to wrap
  body,
) = {
  set text(size: normal-size, font: font, weight: "regular")
  show link: body => text(fill: rgb("#777777"), weight: "bold", body)
  show math.equation: eq => eq
  show figure: fig => {
    show: pad.with(x: 1em)
    set image(width: 50%)
    set align(center)
    v(1em)
    fig.body
    if fig.has("caption") {
      v(1em, weak: true)
      [Figure ]
      if fig.numbering != none {
        [#counter(figure).display(fig.numbering)]
      }
      [. ]
      fig.caption
    }
  }
  set table(inset: 10pt, stroke: 0.5pt + black)
  show heading: set text(font: heading_font, weight: "black")
  set heading(numbering: "1.")
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
    margin: (top: 8%, rest: 10%),
  )
  set list(indent: 5pt, body-indent: 5pt)
  set enum(indent: 5pt, body-indent: 5pt)

  // Configure paragraph properties.
  set par(justify: true)

  // Display the article's contents.
  v(29pt, weak: true)
  body
}
