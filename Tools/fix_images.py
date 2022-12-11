#!/usr/bin/python

# Script to replace all the "![](https://lh5.googleusercontent.com/JtMT...)" occurrences in a
# MarkDown file created from Google docs
#
#
# Open the docs.google document in Safari
# Mark all and copy
# Paste into Obsidian
#
# cd into the folder that contains the markdown file
# call this script with the markdown file to process as parameter
#
# a folder with the filename and an '.img' suffix is created
# all the images referenced in the markdown are downloaded to that folder
# references to these images in the markdown file are changed accordingly
# the original markdown file is saved with a '.bak' suffix
#
# Example:
# cd /Users/nmbr73/Projects/Kernfusion/
# Tools/fix_images.py Wiki/Andrew/Pipeline\ Guide.md


import sys
import os
import re
from urllib.request import urlopen
from urllib.request import urlretrieve
import cgi
from pathlib import Path


filenames_seen = {}
urls_seen = {}

def filename_for_url(url: str) -> str:

    print(f"get filename for '{url}'")

    remotefile = urlopen(url)
    disposition = remotefile.info()['Content-Disposition']
    value, params = cgi.parse_header(disposition)
    filename: str = params["filename"]

    if not filename:
        raise RuntimeError("can't get remote filename")

    if filename in filenames_seen:
        filenames_seen[filename] += 1

        fn = Path(filename)
        filename = f"{fn.stem}_{filenames_seen[filename]}{fn.suffix}"
    else:
        filenames_seen[filename] = 0

    return filename



def add_url_for_download(imgdir: Path, url: str) -> str:
    """
    Add the URL as an image file to be downloaded.

    Returns:
        The link to that file in MarkDown format
    """

    filename: str = None

    if url in urls_seen:
        filename = urls_seen[url]
        print(f"file {filename} already seen")
    else:
        filename = filename_for_url(url)
        urls_seen[url] = filename

    imglink = imgdir.name + '/' + filename

    return f"![[{imglink}]]"



def fix_images_in_content(content: str) -> str:

    lastpos = 0
    blocks = []

    for match in re.finditer(r'\!\[\]\((https://[^\.]+\.googleusercontent\.com/[^\)]+)\)', content):
        url = content[match.start()+4:match.end()-1]
        blocks.append(content[lastpos:match.start()])
        blocks.append(add_url_for_download(imgdir,url))
        lastpos = match.end()

    blocks.append(content[lastpos:])

    return "".join(blocks)



# -----
# get `infile` from command line:

if len(sys.argv) != 2:
    print(f"{sys.argv[0]} INFILE")
    print("to eliminate google-docs images from markdown file")
    sys.exit(10)

infile = sys.argv[1]



# -----
# build and check all the paths (tempfile, infile, backup, imgdir)

tempfile = Path(infile+'.tmp')
infile = Path(infile)
backup = Path(infile.parent).joinpath(infile.stem+".bak.md")

if (infile.exists() is not True) or infile.is_dir() or infile.suffix != '.md':
    print(f"no such markdown file '{infile}'")
    sys.exit(20)

if backup.exists() or tempfile.exists():
    print(f"backup '{backup}' (and/or temp file) already exists")
    sys.exit(20)

imgdir = Path(infile.parent).joinpath(infile.stem+".img")


# -----
# read content from infile:

content = None
with infile.open() as file:
    content = file.read()

if not content:
    print(f"failed to read {infile}")
    sys.exit(20)



# -----
# fix content and download images:

content = fix_images_in_content(content)

os.mkdir(imgdir)

for url, filename in urls_seen.items():
    imgfile = imgdir.joinpath(filename)
    print(f"Download '{imgfile}'")
    urlretrieve(url, imgfile)



# -----
# create backup and write content:

with tempfile.open('w') as file:
    tempfile.write_text(content)

outfile = infile
infile.rename(backup)
tempfile.rename(outfile)

