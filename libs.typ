#import "/templates/main.typ": settings, font

#import "@preview/unify:0.5.0": num, qty, unit
// percentage error quantity
// (because both unify and metro currently can't parse percentages)
#let pq(nb, un, pe) = {
  return $(num(nb) plus.minus qty(pe, "%")) unit(un)$
}

// chemistry
#import "@preview/whalogen:0.3.0": ce

// this used to be an alias to styled tablex
#let tablef = table.with(
  align: center + horizon,
  stroke: (x: none, y: 0.1em),
  inset: (y: 0.75em)
)

#let appendices(body) = {
  // https://github.com/typst/typst/issues/806

  pagebreak()
  counter(heading).update(0)
  counter("appendices").update(1)

  text(size: 18pt, weight: "black", "Appendices", font: font )
  v(8pt)
  line(length: 100%, stroke: 1pt + rgb("#555555"))
  v(5%, weak: true)

  set heading(numbering: (..nums) => {
    let vals = nums.pos()
    let value = "ABCDEFGHIJ".at(vals.at(0) - 1)
    if vals.len() == 1 {
      if settings.lang == "fr" {
          return "Appendice " + value + ":"
        } else if settings.lang == "en" {
          return "Appendix " + value + ":"
        }
    } else {
      return value + "." + nums.pos().slice(1).map(str).join(".")
    }
  })

  set heading(supplement: "Appendice") if settings.lang == "fr"
  set heading(supplement: "Appendix") if settings.lang == "en"

  body
}

#let numbered_eq = (body) => {
  set math.equation(numbering: "(1)")
  body
}

// theorems, definitions, example environments
#import "@preview/ctheorems:1.1.3": *
// use `#show: thmrules` at the beginning of documents

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em, bottom: 1em), stroke: 1pt + black)

#let example = thmbox("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")
