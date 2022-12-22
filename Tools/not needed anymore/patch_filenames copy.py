#!/usr/bin/env python
from pathlib import Path
import sys
import re

# ./Tools/patch_filenames.py Sources/Welcome\ to\ the\ Kartaverse\ Scrivener/Welcome\ to\ the\ Kartaverse.scriv

if len(sys.argv) != 2:
    print(f"{sys.argv[0]} INFILE")
    print("with INFILE a Scrivener '.scrivx' file")
    sys.exit(10)

scrivpath = Path(sys.argv[1])


#scrivpath = Path("Sources/Welcome to the Kartaverse Scrivener.scrivx/Welcome to the Kartaverse Scrivener.scriv")


numfiles = 0
numimages = 0
numfixes = 0
numchangedfiles = 0
kaboom = 0


pattern = re.compile(r'\{\\pict \{\\\*\\nisusfilename ([^\}]+)\}\\picw(\d+)\\pich(\d+)\\picwgoal(\d+)\\pichgoal(\d+)\\(png|jpeg)blip ', re.UNICODE)

all_images = {}

for contentfilepath in scrivpath.joinpath("Files","Data").rglob("*/content.rtf"):

    numfiles += 1

    content = ""
    with contentfilepath.open() as f:
        content = f.read()

    changes = {}

    for match in pattern.findall(content):

        numimages += 1

        (image_name,width,height,target_width,target_height,image_type) = match


        key = f"{image_name}.{image_type}"
        if not key in all_images:
            all_images[key] = [0,width,height,target_width,target_height,image_type]
        item = all_images[key]

        item[0] += 1

        if item[0] < 2:
            continue

        numfixes += 1

        prefix  = r"\f1\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename "
        postfix = f"\\picw{width}\\pich{height}\\picwgoal{target_width}\\pichgoal{target_height}\\{image_type}blip "

        image_newname = f"{image_name}__DOCFIX{item[0]-1}"

        if f"{prefix}{image_name}{postfix}" in changes:
            # raise Exception(f"kaboom! image '{image_name}' in {contentfilepath.parent.name}")
            kaboom += 1
            print(f"kaboom! image '{image_name}' in {contentfilepath.parent.name}")

        changes[f"{prefix}{image_name}{postfix}"] = f"{prefix}{image_newname}{postfix}"

    if changes:
        numchangedfiles += 1
        #...

            #print(f"rename '{image_name}' (for type {image_type}) to '{image_name} SCRFIX{item[0]-1}'")
            #!!


print(f"found {numimages} images in {numfiles} files.")
print(f"{numfixes} images had to be renamed to make them unique.")
print(f"this led to {numchangedfiles} files being modified.")
print(f"and {kaboom} kabooms!")


        # scale_width = ""
        # if width * 10 != target_width:
        #     scale_width = str(round( int(target_width) /10))

        # scale_height = ""
        # if height * 10 != target_height:
        #     scale_height = str(round( int(target_height) /10))

        # scale = ""
        # if scale_width:
        #     if scale_height:
        #         scale = f"|{scale_width}x{scale_height}"
        #     else:
        #         scale = f"|{scale_width}"
        # elif scale_height:
        #     scale = f"|{width}x{scale_height}"

        # print(f"{image_name}.{image_type}{scale} .... from {width}x{height}")



# \f1\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename this is Sam Lowry with a modified name}\picw794\pich860\picwgoal7940\pichgoal8600\pngblip 89504e470d0a1a0a0000000d494844520000031a0000035c08060
# \f1\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename this is Sam Lowry with a modified name}\picw794\pich860\picwgoal1460\pichgoal1940\pngblip 89504e470d0a1a0a0000000d494844520000031a0000035c0806000000d8
# \f1\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename this is Sam Lowry with a modified name}\picw794\pich860\picwgoal1480\pichgoal2140\pngblip 89504e470d0a1a0a0000000d494844520000031a000003
# \f0\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename Tuttle or Buttle}\picw400\pich220\picwgoal8000\pichgoal4400\jpegblip ffd8ffe000104a4649460001010000
# \f0\fs24 \cf0 {\*\shppict{\pict {\*\nisusfilename Tuttle or Buttle}\picw400\pich220\picwgoal4000\pichgoal2200\jpegblip ffd8ffe000104a4649460001010000
