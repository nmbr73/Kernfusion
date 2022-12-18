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


    fname = title

    if fname.find("/") != -1:
        fname = fname.replace("/","_")
        pages.append(f"{title}: {fname}.md")
    else:
        pages.append(fname+".md")

    outfile = outdir.joinpath(fname+'.md')

    with outfile.open('w') as file:
        file.write(part)

nav = "nav:\n  - ...\n  - " + "\n  - ".join(pages) + "\n"

outfile = outdir.joinpath('.pages')
with outfile.open('w') as file:
    file.write(nav)


