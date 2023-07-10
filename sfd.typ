// templates for online lecture notes

#import "main.typ": gen_title, gen_authors, doc_template, mono_font, lref

#let template(
  title: none,
  authors: none,
  lecture_url: none,
  body
) = {
  doc_template({
    gen_title(title: title)
    if lecture_url != none {
      v(10pt, weak: true)
      align(center, {
        text(scale(link(lecture_url)), size: 0.9em, font: mono_font)
        v(10pt, weak: true)
      })
    }
    v(15pt, weak: true)

    gen_authors(authors: authors)
    body
  })
}
