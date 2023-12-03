// general document

#import "main.typ": gen_preamble, doc_template, lref

#let template(
  title: none,
  authors: none,
  suffix: none,
  prefix: none,
  body
) = {
  doc_template(
  title: title,
  {
    gen_preamble(title: title, authors: authors, suffix: suffix, prefix: prefix)
    body
  })
}
