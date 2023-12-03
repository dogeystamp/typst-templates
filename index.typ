// templates for online lecture notes

#import "main.typ": gen_preamble, doc_template, lref

#let template(
  title: none,
  authors: none,
  subtitle: [Index of resources],
  body
) = {
  doc_template(title: title, {
    gen_preamble(
      title: title,
      authors: authors,
      prefix: [_#{subtitle}_],
    )
    body
  })
}
