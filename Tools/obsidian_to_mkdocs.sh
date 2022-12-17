#!/bin/bash


# https://github.com/Jackiexiao/mkdocs-roamlinks-plugin

# source venv/bin/activate

# if [[ -d docs ]]; then
#     echo "outch"
#     exit 10
# fi

rm -rf docs
cp -rp Wiki docs
mv docs/README.md docs/index.md
python Tools/obsidian_to_mkdocs.py

#mkdocs build
#mkdocs serve

