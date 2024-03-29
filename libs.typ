#import "/templates/main.typ": settings, font

#import "@preview/metro:0.1.0": units, prefixes, num
#import units: *
#import prefixes: *

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
