#!/usr/bin/env python
from pathlib import Path
import sys

# Currently it's just a hack

# rename 'WebGL to DCTL/WebGL to DCTL.md' to 'WebGL to DCTL/index.md'
# replace '[[WebGL to DCTL]]' with '[[WebGL to DCTL/index.md|WebGL to DCTL]]'
# replace '[[WebGL to DCTL|...]]' with '[[WebGL to DCTL/index.md|...]]'



basepath = Path.cwd().joinpath('docs')
print(f"path={basepath}")

files = []

replace = {}

for filepath in basepath.rglob("*.md"):

    if filepath.is_dir():
        print(f"{filepath} is a directory!")
        continue

    if filepath.parent == basepath:
        continue

    if filepath.stem == filepath.parent.name:
        filepath.rename( filepath.parent.joinpath('index.md') )
        replace[filepath.stem] = filepath.parent.relative_to(basepath)





for filepath in basepath.rglob("*.md"):

    if filepath.is_dir():
        continue

    content = None
    with filepath.open() as file:
        content = file.read()

    if not content:
        print(f"{filepath} is empty?!?")
        continue

    modified = content

    for match, path in replace.items():
        modified = modified \
            .replace(f"[[{match}|",f"[[{match}/index.md|") \
            .replace(f"[[{match}]]",f"[[{match}/index.md|{match}]]")

    if filepath.name == "index.md" and filepath.parent != basepath:

        front_matter = ''
        page_body = modified

        if modified.startswith("---\n"):
            end = modified.find("\n---\n",4)


            if end != -1:
                end += len("\n---\n")
                front_matter = modified[0:end]
                page_body = modified[end:]

        modified = front_matter + f"\n# {filepath.parent.name}\n\n" + page_body


    if content != modified:
        with filepath.open('w') as file:
            file.write(modified)

