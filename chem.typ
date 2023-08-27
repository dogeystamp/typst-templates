// chemistry notes

#import "main.typ": gen_preamble, doc_template, lref


#let aq = [$("aq")$]
#let liq = [$("l")$]
#let gaz = [$("g")$]
#let sol = [$("s")$]

#let chem = (body) => {
  math.equation(block: true, math.upright(body))
}


#let template(
  title: none,
  authors: none,
  suffix: none,
  prefix: none,
  body
) = {
  // chemical state indicators (use these as subscripts)
  doc_template({
    gen_preamble(title: title, authors: authors, suffix: suffix, prefix: prefix)
    body
  })
}
