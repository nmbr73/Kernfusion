#!/usr/bin/env python
from pathlib import Path
import sys


basepath = Path.cwd().joinpath('docs')

for filepath in basepath.rglob("*"):

    # Check for directories, if they have a .pages file,
    # otherwise create one

    if not filepath.is_dir():
        continue

    if filepath.name == "img":
        continue

    if filepath.name == filepath.parent.name + ".img":
        continue

    if "_" + filepath.name == filepath.parent.name + ".img":
        continue


    pagespath = filepath.joinpath('.pages')
    if pagespath.is_file():
        continue

    indexpath = filepath.joinpath(filepath.name + ".md")
    pagescontent = f"nav:\n  - {filepath.name}.md\n  - ...\n"

    if not indexpath.is_file():
        with indexpath.open('w') as f:
            f.write( "> [!failure] Empty subpage!\n>\n> This subpage has no content associated to it! "
                f"You should definitely consider creating an `{indexpath}` file to fix it!")
        pagescontent = f"nav:\n  - {filepath.name} 💥: {filepath.name}.md\n  - ...\n"

    with pagespath.open('w') as f:
        f.write( pagescontent )
