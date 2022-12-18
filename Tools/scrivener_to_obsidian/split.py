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
        'title' : title,
        'name'  : name,
        'body'  : part,
    })


nav = ["nav:", "  - ..."]

for i, page in enumerate(pages):

    front_matter = []

    name = page['name']
    title = page['title']
    body = page['body']


    if name == title:
        nav.append(f"  - {name}.md")
    else:
        nav.append(f"  - {title}: {name}.md")
        front_matter.append(f"title: {title}") # for MkDocs
        front_matter.append(f"alias: {title}") # for Obsidian

    front_matter.append("tags: [export, export-scrivener, revise]")

    if i>0:
        front_matter.append(f"prev: {pages[i-1]['name']}")

    if i+1<len(pages):
        front_matter.append(f"next: {pages[i+1]['name']}")

    if front_matter:
        body = "---\n" + "\n".join(front_matter) + "\n---\n\n" + body

    outfile = outdir.joinpath(name+'.md')

    with outfile.open('w') as file:
        file.write(body)

outfile = outdir.joinpath('.pages')
with outfile.open('w') as file:
    file.write("\n".join(nav))


