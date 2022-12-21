#!/usr/bin/env python
from pathlib import Path
import sys
import re
import binascii

# ./Tools/patch_filenames.py Sources/Welcome\ to\ the\ Kartaverse\ Scrivener/Welcome\ to\ the\ Kartaverse.scriv

if len(sys.argv) != 2:
    print(f"{sys.argv[0]} INFILE")
    print("with INFILE a Scrivener '.scrivx' file")
    sys.exit(10)

scrivpath = Path(sys.argv[1])


numfiles = 0
numimages = 0
numfixes = 0
numchangedfiles = 0
numsamefiles = 0
kaboom = 0


pattern = re.compile(r'\{\\pict \{\\\*\\nisusfilename ([^\}]+)\}\\picw(\d+)\\pich(\d+)\\picwgoal(\d+)\\pichgoal(\d+)\\(png|jpeg)blip ([0-9a-f]+)\}', re.UNICODE)

all_images = {}

for contentfilepath in scrivpath.joinpath("Files","Data").rglob("*/content.rtf"):

    numfiles += 1

    content = ""
    with contentfilepath.open() as f:
        content = f.read()

    changes = {}

    for match in pattern.findall(content):

        numimages += 1

        (image_name,width,height,target_width,target_height,image_type,data) = match


        key = f"{image_name}.{image_type}"
        if not key in all_images:
            all_images[key] = [1,width,height,target_width,target_height,image_type,data]
            continue

        item = all_images[key]

        if data == item[6]:
            numsamefiles += 1
            continue

        item[0] += 1

        numfixes += 1

        prefix  = r"{\pict {\*\nisusfilename "
        postfix = '}' + f"\\picw{width}\\pich{height}\\picwgoal{target_width}\\pichgoal{target_height}\\{image_type}blip "

        image_newname = f"{image_name}__DOCFIX{item[0]-1}"

        if f"{prefix}{image_name}{postfix}" in changes:
            if changes[f"{prefix}{image_name}{postfix}"][1] != data:
                print(f"kaboom!!!")
                print(f"  image '{image_name}.{image_type}' in {contentfilepath.parent.name}")
                print(f"  found '{prefix}{image_name}{postfix}' twice!?!")
                with open(f"{image_name}_a.{image_type}","wb") as f:
                    f.write(binascii.unhexlify(data))
                with open(f"{image_name}_b.{image_type}","wb") as f:
                    f.write(binascii.unhexlify(item[6]))
            else:
                numsamefiles += 1

        changes[f"{prefix}{image_name}{postfix}"] = [f"{prefix}{image_newname}{postfix}",data]

    if changes:
        numchangedfiles += 1
        for key, value in changes.items():
            content = content.replace(key,value[0])

        with contentfilepath.open('w') as f:
           f.write(content)

# scanning 'Welcome to the Kartaverse.scriv', 1200 images were found in 1028 files.
# 19 times a name occurred again because it actually was just the exact same image being reused.
# but 682 images had to be renamed to make the names unique, which led to 150 files being modified.

# scanning 'Welcome to the Kartaverse.scriv', 1200 images were found in 1028 files.
# 19 times a name occurred again because it actually was just the exact same image being reused.
# but 0 images had to be renamed to make the names unique, which led to 0 files being modified.


print(f"scanning '{scrivpath.name}', {numimages} images were found in {numfiles} files.")
print(f"{numsamefiles} times a name occurred again because it actually was just the exact same image being reused.")
print(f"but {numfixes} images had to be renamed to make the names unique, which led to {numchangedfiles} files being modified.")


if kaboom:
    print(f"and we had {kaboom} kabooms!!!!!!!")

