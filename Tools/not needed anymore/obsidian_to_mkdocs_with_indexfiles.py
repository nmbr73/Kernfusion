#!/usr/bin/env python
from pathlib import Path
import sys


basepath = Path.cwd().joinpath('docs')

for filepath in basepath.rglob("*"):

    # Check for directories, if they have a .pages file,
    # otherwise create one

    if not filepath.is_dir():
        continue

    pagespath = filepath.joinpath('.pages')
    if pagespath.is_file():
        continue




    if filepath.joinpath(filepath.joinpath(filepath.name + ".md")).is_file():
        pagescontent.append(f"  - {filepath.name}.md")

    with pagespath.open('w') as f:
        f.write( f"nav:\n  - {filepath.name}\n  - ...\n" )




    indexpath = filepath.joinpath('README.md')
    if not indexpath.is_file():
        indexpath = filepath.joinpath('index.md')
        if not indexpath.is_file():
            indexpath = filepath.joinpath(filepath.name,".md")
            if not indexpath.is_file():
                indexpath = filepath.joinpath('index.md')
                with indexpath.open('w') as f:
                    f.write( "This category has no description yet. "
                        f"You may want create a `{filepath.relative_to(basepath).joinpath('README.md')}` "
                        "file to add a (very short) description.")

    category="::".join(filepath.relative_to(basepath).parts)

    pagescontent = ["nav:", f"  - {category} 📚: {indexpath.name}" ]

    # an 'example/example.md' should come before the others ('...') !!
    if filepath.joinpath(filepath.joinpath(filepath.name + ".md")).is_file():
        pagescontent.append(f"  - {filepath.name}.md")

    # all the rest and a newline
    pagescontent.append("  - ...\n")

    with pagespath.open('w') as f:
        print(f"write '{pagespath}'")
        f.write( "\n".join(pagescontent) )


