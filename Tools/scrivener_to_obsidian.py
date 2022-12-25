#!/usr/bin/env python
from pathlib import Path
import sys

if len(sys.argv) != 2:
    print(f"{sys.argv[0]} INFILE")
    print("to split the .md")
    sys.exit(10)

infile = Path(sys.argv[1])
outdir = infile.parent

content = ""
with infile.open() as file:
    content = file.read()

infile.rename(infile.parent.joinpath(infile.stem+'.del'))

parts = content.split("\n## ")
parts[0] = f"{infile.stem}\n\n" + parts[0]
pages = []

for part in parts:

    part = part.strip()
    pos = part.find("\n")
    if pos == -1:
        raise Exception("dang!")
    title = part[:pos]
    part  = part[pos+1:]

    title = title.strip()
    part  = part.strip()

    if part.startswith(title):
        part = part[len(title):].strip()


    name = title

    if name.find("/") != -1:
        name = name.replace("/","_")
        #pages.append(f"{title}: {fname}.md")
    #else:
        #pages.append(fname+".md")

    #outfile = outdir.joinpath(fname+'.md')

    pages.append({
        'name'  : name,
        'title' : title,
        'body'  : part,
    })


if not pages:
    print("no pages!?")
    sys.exit(40)


nav = ["nav:", f"  - {pages[0]['title']} 📚: index.md"]

toc = []

for i, page in enumerate(pages):

    front_matter = []

    name  = page['name']
    title = page['title']
    body  = page['body']

    if name == "index":
        print("whhooaaa!")
        sys.exit(42)

    if name == title:
        nav.append(f"  - {name}.md")
        toc.append(f"- [[{name}]]")
    else:
        nav.append(f"  - {title}: {name}.md")
        toc.append(f"- [[{name}|{title}]]")
        front_matter.append(f"title: {title}") # for MkDocs
        front_matter.append(f"alias: {title}") # for Obsidian

    front_matter.append("author: Andrew Hazelden")

    front_matter.append("tags:")
    front_matter.append("  - Kartaverse")
    front_matter.append("  - Workflow")
    front_matter.append("  - .scrivener-export")

    # front_matter.append(f"xself: '{name}'")
    # front_matter.append(f"xhead: '{pages[0]['name']}'")
    # front_matter.append(f"xtail: '{pages[-1]['name']}'")

    # if i>0:
    #     front_matter.append(f"xprev: '{pages[i-1]['name']}'")

    # if i+1<len(pages):
    #     front_matter.append(f"xnext: '{pages[i+1]['name']}'")



    if front_matter:
        body = "---\n" + "\n".join(front_matter) + "\n---\n\n" + body

    outfile = outdir.joinpath(name+'.md')

    with outfile.open('w') as file:
        file.write(body)

nav.append("  - ...")

outfile = outdir.joinpath('.pages')
with outfile.open('w') as file:
    file.write("\n".join(nav))

outfile = outdir.joinpath('index.md')
with outfile.open('w') as file:
    file.write("""
> [!warning] Dissolve content into independent articles!
>
> In this folder you will find an export generated from a Scrivener source.
> Scrivener being an authoring software for writing book type content, the
> different files will come originally meant to be read in some linear order.
> Please help to put re-organize and re-write them into separate articles, each
> working kind of independently from the others. Remove finished files from
> the `.pages` file.

## Original Table of Contents

""")
    file.write("\n".join(toc) + "\n")
