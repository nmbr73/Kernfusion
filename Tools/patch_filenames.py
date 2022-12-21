#!/usr/bin/env python
from pathlib import Path
import sys
import re
import binascii

# ./Tools/patch_filenames.py Sources/Welcome\ to\ the\ Kartaverse\ Scrivener/Welcome\ to\ the\ Kartaverse.scriv
#
# The `Data` folder has <1GB ... so okay to just load everything into memory to make things simple :-)
#
# Same images with different names exist, but that's only for 11 cases and therefore not worth the effort to
# automatically deduplicate them.

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
            assert changes[f"{prefix}{image_name}{postfix}"][1] == data
            numsamefiles += 1

        changes[f"{prefix}{image_name}{postfix}"] = [f"{prefix}{image_newname}{postfix}",data]

    if changes:
        numchangedfiles += 1
        for oldkey, (newkey,data) in changes.items():
            content = content.replace(oldkey + data, newkey + data)

        with contentfilepath.open('w') as f:
           f.write(content)








# scanning 'Welcome to the Kartaverse.scriv', 1200 images were found in 1028 files.
# 19 times a name occurred again because it actually was just the exact same image being reused.
# but 682 images had to be renamed to make the names unique, which led to 150 files being modified.

# scanning 'Welcome to the Kartaverse.scriv', 1200 images were found in 1028 files.
# 19 times a name occurred again because it actually was just the exact same image being reused.
# but 0 images had to be renamed to make the names unique, which led to 0 files being modified.

# cp: temp/workflows_export.md/image1.png: No such file or directory
# cp: temp/workflows_export.md/image2__DOCFIX7.png: No such file or directory
# cp: temp/workflows_export.md/image18__DOCFIX5.png: No such file or directory
# cp: temp/workflows_export.md/image17__DOCFIX3.png: No such file or directory
# cp: temp/workflows_export.md/image1__DOCFIX7.png: No such file or directory
# cp: temp/workflows_export.md/image23__DOCFIX4.png: No such file or directory
# cp: temp/workflows_export.md/image22__DOCFIX6.png: No such file or directory
# cp: temp/workflows_export.md/image35__DOCFIX6.png: No such file or directory
# cp: temp/workflows_export.md/image22__DOCFIX4.png: No such file or directory
# cp: temp/workflows_export.md/image20__DOCFIX7.png: No such file or directory
# cp: temp/workflows_export.md/image5__DOCFIX10.png: No such file or directory
# cp: temp/workflows_export.md/image1__DOCFIX3.png: No such file or directory
# cp: temp/workflows_export.md/image6__DOCFIX6.png: No such file or directory


print(f"scanning '{scrivpath.name}', {numimages} images were found in {numfiles} files.")
print(f"{numsamefiles} times a name occurred again because it actually was just the exact same image being reused.")
print(f"but {numfixes} images had to be renamed to make the names unique, which led to {numchangedfiles} files being modified.")

