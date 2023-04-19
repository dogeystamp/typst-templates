# typst templates

Personal templates for [Typst](https://github.com/typst/typst), a neat markdown-like typsetting system.

I have the following directory structure for these:

```
docs/
├── problems
│   ├── src
│   │   └── test.cpp
│   ├── test.pdf
│   └── test.typ
└── templates
    └── ...
```

Example usage (this is test.typ in the above tree:)

```typ
#import "../templates/problems.typ": template, source_code, status
#show: template.with(
  title: "CCC '22 J1 - Cupcake Party",
  problem_url: "https://dmoj.ca/problem/cc22j1",
  stat: "incomplete",
)

= Thought process

#lorem(20)

== Important things

#lorem(50)

#source_code("test")
```

Need fonts:
- Fira Math
- JetBrains Mono
- Roboto

Some settings are available in `main.typ`.
