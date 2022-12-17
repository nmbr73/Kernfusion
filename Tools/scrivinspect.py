#!/usr/bin/env python


# https://realpython.com/python-xml-parser/
#
# ... this article has lots of useful information on XML parsing in Python. I'm
# giving the `xmlpulldom`, `untangle`, and maybe `xml2dict` or even `lxml` a try
# here. But for the simple needs I have I assume that untangle does the job.
#

# https://github.com/ajparsons/scrivener-python
#
# ... Python implementation to access Scrivener projects. At least five years
# old. Did not look into it yet, but seems to be only in an early prototype
# phase.

# http://s.joebush3d.com/scrivener-document-progress-in-python/
#
# ... someone extracting the labels from a Scrivener document. I wanted to (maybe)
# make use of them - maybe put them into the Markdown (as a YAML front matter
# probably)

# https://github.com/drewolson/scrivener
# https://github.com/drewolson/scrivener_ecto
#
# ... not looked into it yet - no idea if we are even talking about the same
# Scrivener here :-D



xml_filename = "/Users/nmbr73/Projects/Kernfusion/Data/Kernfusion.scriv/Files/styles.xml"


# ------------

from xml.dom.pulldom import parse

if False:

     event_stream = parse(xml_filename)
     for event, node in event_stream:
          print(event, node)


# ------------

# pip install untangle
# https://untangle.readthedocs.io/en/latest/

import untangle

if True:

     with open(xml_filename) as file:
          xml_document = untangle.parse(file)

     for style in xml_document.Styles.children:
          print(f"- {style['Name']} ({style['ID']})")

