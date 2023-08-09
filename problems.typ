// templates for compsci problem documents outside of contests

#import "main.typ": gen_preamble, doc_template, mono_font, lref
#import "compsci.typ": source_code, status

#let template(
  title: none,
  authors: none,
  problem_url: none,
  stat: "incomplete",
  body
) = {
  doc_template({
    gen_preamble(
      title: title,
      authors: authors,
      prefix: status(stat: stat),
      suffix: {
        if (problem_url != none) {
          [#link(problem_url)]
        }
      }
    )

    body
  })
}
