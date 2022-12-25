#!/usr/bin/env python
from pathlib import Path
import sys
import re

basepath = Path.cwd().joinpath('docs')

for filepath in basepath.rglob("*"):

    continue

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



# A hack for embedded YT videos - maybe I try a MkDocs+Obsidian PlugIn one day?!?
# > [!youtube] Embed: [Costa Rica](https://www.youtube.com/watch?v=LXb3EKWsInQ)
# https://youtu.be/

pattern_video = re.compile(r'>\s+\[!youtube\]\s+([A-Za-z]+:{0,1}|)\s*\[([^\]]*)\]\(https://(www.youtube.com/watch\?v=|youtu.be/)([A-Za-z0-9\-]+)\)')


pattern_resizedimage = re.compile(r'!\[\[([^\|\]]+)\|([1-9][0-9]*)\]\]')

def got_a_video(m):
    # type = m.group(1).lower()
    title = m.group(2)
    video = m.group(4)

    title = re.sub(r'\\\|','|',title)
    return f'<div style="text-align:center; font-size:smaller; "><iframe width="560" height="315" src="https://www.youtube.com/embed/{video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>{title}</iframe><br />{title}</div>'

def got_a_resizedimage(m):
    source = m.group(1)
    size = m.group(2)
    #print(f"'{source}','{size}'")
    return f'<img src="/{source}" width="{size}" />'


for filepath in basepath.rglob("*.md"):

    if filepath.is_dir():
        continue

    with filepath.open() as f:
        content = f.read()

    modified = content
    modified = re.sub(pattern_video, got_a_video, modified)
    modified = re.sub(pattern_resizedimage, got_a_resizedimage, modified)

    if content == modified:
        continue

    with filepath.open('w') as f:
        f.write(modified)


