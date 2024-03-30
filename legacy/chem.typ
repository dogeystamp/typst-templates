// chemistry notes

#import "../main.typ": gen_preamble, doc_template, lref


// chemical state indicators (use these as subscripts)
#let aq = [$("aq")$]
#let liq = [$("l")$]
#let gaz = [$("g")$]
#let sol = [$("s")$]

#let chem = (block: false, body) => {
  math.equation(block: block, math.upright(body))
}


#let template(
  title: none,
  authors: none,
  suffix: none,
  prefix: none,
  body
) = {
  doc_template(title: title, {
    gen_preamble(title: title, authors: authors, suffix: suffix, prefix: prefix)
    body
  })
}
