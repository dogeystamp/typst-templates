// templates for compsci problem documents outside of contests

#import "main.typ": gen_title, gen_authors, doc_template, mono_font, lref
#import "compsci.typ": source_code, status

#let template(
  title: none,
  authors: none,
  problem_url: none,
  stat: "incomplete",
  body
) = {
  doc_template({
    gen_title(title: title)
    if problem_url != none {
      v(10pt, weak: true)
      align(center, {
        text(scale(link(problem_url)), size: 0.9em, font: mono_font)
        v(10pt, weak: true)
      })
    }
    v(10pt, weak: true)
    status(stat: stat)
    v(15pt, weak: true)

    gen_authors(authors: authors)
    body
  })
}
