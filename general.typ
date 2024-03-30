// general document

#import "main.typ": gen_preamble, doc_template, lref, source_code, status

#let template(
  title: none,
  authors: none,
  suffix: none,
  prefix: none,
  enable-footer: true,
  body
) = {
  doc_template(
  title: title,
  authors: authors,
  enable-footer: enable-footer,
  {
    gen_preamble(title: title, authors: authors, suffix: suffix, prefix: prefix)
    body
  })
}
