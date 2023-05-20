// general document

#import "main.typ": gen_title, gen_authors, doc_template

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
