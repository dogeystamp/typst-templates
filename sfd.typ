// templates for online lecture notes

#import "main.typ": gen_preamble, doc_template, mono_font, lref

#let template(
  title: none,
  authors: none,
  lecture_url: none,
  class: [Lecture notes],
  body
) = {
  doc_template({
    gen_preamble(
      title: title,
      authors: authors,
      prefix: [_#{class}_],
      suffix: link(lecture_url)
    )
    body
  })
}
