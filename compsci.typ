// generic compsci utilities

#import "main.typ": mono_font

// did i finish this problem?
#let status(stat: "incomplete") = {
  if stat == "complete" {
    align(center, {
      text(fill: rgb("#aadd44"))[
        *Status*: Completed
      ]
    })
  } else {
    align(center, {
      text(fill: rgb("#aa4422"))[
        *Status*: Incomplete
      ]
    })
  }
}

// show associated source code
#let source_code(
  lang: "cpp",
  block: true,
  src_path: "problems/src/",
  // convert tabs to spaces
  detab: true,
  problem_id
) = {
  let raw_text = read("../" + src_path + problem_id + "." + lang)
  if detab {
    raw_text = raw_text.replace("\t", "    ")
  }

  text(font: mono_font)[
    #raw(
      raw_text,
      block: true,
      lang: lang,
    )
  ]
}
