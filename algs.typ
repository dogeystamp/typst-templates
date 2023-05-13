// templates for compsci notes

#import "main.typ": gen_title, gen_authors, doc_template, mono_font
#import "compsci.typ": source_code

#let template(
  title: none,
  authors: none,
  body
) = {
  doc_template({
    gen_title(title: title)
    v(15pt, weak: true)

    gen_authors(authors: authors)
    body
  })
}
