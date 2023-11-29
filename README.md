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

## Installation

Install dependencies:

- `ttf-liberation`

Set up `docs/` as a git repo.

    mkdir docs
    cd docs
    git init

Add `templates/` as a submodule.
    
    git submodule add https://github.com/dogeystamp/typst-templates templates

Set the environment variable `TYPST_ROOT` to `docs/` in `.bashrc`, `.profile` or equivalent.
Otherwise, templates won't be able to render due to security policy.

    .profile
    --------

    export TYPST_ROOT="$HOME/docs"

Create a settings file in `docs/`:

    templates/gensettings.sh settings.yml

## Example usage

Example usage (this is test.typ in the above tree:)

```typ
#import "/templates/problems.typ": template, source_code, status
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

Some settings are available in `main.typ`.

## Screenshots

![preview](https://raw.githubusercontent.com/dogeystamp/typst-templates/master/preview.jpg)

Note that the font size is optimized for viewing the document fit to width on half a monitor.
