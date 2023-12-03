// templates for compsci notes

#import "main.typ": gen_preamble, doc_template, mono_font, lref
#import "compsci.typ": source_code

#let template(
  title: none,
  authors: none,
  body
) = {
  doc_template(
    title: title,
    {
      gen_preamble(
        title: title,
        authors: authors,
        prefix: [_Algorithm notes_]
      )

      body
    }
  )
}
