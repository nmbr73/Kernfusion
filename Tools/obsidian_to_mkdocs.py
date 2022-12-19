#!/usr/bin/env python
from pathlib import Path
import sys


basepath = Path.cwd().joinpath('docs')

for filepath in basepath.rglob("*"):

    if not filepath.is_dir():
        continue

    pagespath = filepath.joinpath('.pages')
    if pagespath.is_file():
        continue

    pagescontent = ["nav:"]

    pagescontent.append("  - ...")

    if pagescontent:
        pagescontent.append("")
        with pagespath.open('w') as f:
            f.write("\n".join(pagescontent))


