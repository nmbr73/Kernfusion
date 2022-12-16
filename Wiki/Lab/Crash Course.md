You'll find tons of excellent and thorough documentation on the different formats and tools ... and you can spent hours on each to find out what functionalities it provides. Intention of this section is not to rewrite the user manuals and enthusiasts' blog posts, but to hopefully give a good idea what you could use the different tools for and if they are worth a closer look - here with as much information as needed at as little text to read as possible.

## Pandoc

Pandoc is a tool for transforming documents from one format to another, e.g. from Word to HTML. Install on macOS e.g. via `brew install pandoc`.

**Example:**
```sh
# Convert from Mardown to a Word document
pandoc document.md -o document.doc
```

It comes with 'readers' for the different input formats that parse the respective format into an abstract syntax tree (short: AST). The AST is pandoc's internal representation of a document's content. On the other end the 'writers' implement the conversion from the AST into the different output formats. Additionally there is the option to provide 'filters' that manipulate the AST after it has been read by a reader and before it gets processed by a writer.

The AST format is described by the [Text-Pandoc-Definition](https://hackage.haskell.org/package/pandoc-types-1.22.2.1/docs/Text-Pandoc-Definition.html).

Filtering can be described in JSON or implemented in miscellaneous script languages: see [filters](https://pandoc.org/filters.html). But preferably Pandoc's integrated Lua interpreter can be used to realize [Pandoc Lua Filters](https://pandoc.org/lua-filters.html).

This simple concept allows for lots of conversions from many document formats into many others: If a format is not supported yet, you can implement a reader; if there is new format, just create implement a writer and you can convert all supported input formats into that format; a filter once cerated can be applied to all the input formats for all the output formats.

## Markdown

Markdown is a simple, human readable text markup language. It allows for basic text formatting like headlines, sections, code block, links, bullet list, etc. to be done in a text editor. This makes it not only easy to learn, but also simple to parse and process.

**Example:**
```md
# A headline

Normal text with an *emphasized* word and
a [link](https://www.steakunderwater.com/).
```

There are various flavors of Markdown (e.g. [CommonMark](https://commonmark.org), or [GiHub Flavored Markdown](https://github.github.com/gfm/)) with different features out in the wild.

## MultiMarkDown

[MultiMarkdown](https://fletcherpenney.net/multimarkdown/) is an extension (aka flavor) of Markdown adding support for features often needed for documentation purposes, such as math formulas, image attributes, definition lists, etc.

There is a [multimarkdown](https://fletcher.github.io/MultiMarkdown-6/) tool (`brew install multimarkdown`) that can be used to convert multimarkdown files into some other output formats (but probably pandoc is the better choice in this regard).

Scriviner includes MultiMarkdown support.

Pandoc allows for MultiMarkdown import and export by specifying the format being `markdown_mmd`.

## YAML front matter

YAML is a format for structured data. A YAML front matter is a section at the beginning of a (i.e. MarkDown) file used to provide additional information (meta data) in YAML format.

**Example:**
```md
---
aliases:
- Front Matter Demo
tags: [example, yaml]
---

Here comes the normal **MarkDown** document.
```

Obsidian allows the use of [YAML front matter](https://help.obsidian.md/Advanced+topics/YAML+front+matter) for tags and aliases. Scrivener does also output some minimal front matter like title, author, and such.