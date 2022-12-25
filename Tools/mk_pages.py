#!/usr/bin/env python
from pathlib import Path
import sys
import re

basepath = Path.cwd().joinpath('docs')


pages = {}

for filepath in basepath.rglob("*.md"):

    if filepath.is_dir():
        continue

    name = filepath.stem
    title = name
    link = filepath.parent.joinpath(filepath.stem).relative_to(basepath)


    with filepath.open() as f:
        for i, line in enumerate(f):

            if i == 0 and line != "---\n":
                break

            if i > 0 and line == "---\n":
                break

            if line.startswith("title:"):
                title = line[6:].strip(" \t\r\n\"'")
                break

    if not title in pages:
        pages[title] =[]

    pages[title].append(link)

content = []
current = ""
for title in sorted(pages.keys(), key=str.casefold):

    if title[0].upper() != current:
        current = title[0].upper()
        content.append(f'\n=== "{current}"')

    for page in pages[title]:
        content.append(f"    [{title}]({page}.md)")


target = basepath.joinpath("Pages.md")

with target.open('w') as out:
    out.write("---\ntitle: Pages\nhide:\n  - navigation\n  - toc\n---\n")
    out.write("\n".join(content))
