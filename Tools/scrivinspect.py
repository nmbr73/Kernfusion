#!/usr/bin/env python
import untangle
from pathlib import Path
import sys




class Styles:

     def add_style(self, id, name):
          self._id2name[id] = name
          self._name2id[name] = id

     def name(self, id):
          return self._id2name.get(id)

     def names(self):
          return self._name2id.keys()

     def id(self, name):
          return self._name2id.get(name)

     def ids(self):
          return self._id2name.keys()


     def __init__(self,document):

          self._id2name = {}
          self._name2id = {}

          with open(f"{document}/Files/styles.xml") as file:
               xml = untangle.parse(file)

          for style in xml.Styles.children:
               # self.add_style(style['ID'], style['name'])
               self._id2name[style['ID']] = style['Name']
               self._name2id[style['Name']] = style['ID']


     def __str__(self):
          entries = []
          for name, id in self._name2id.items():
               entries.append(f"'{name}' = {id}")

          return ", ".join(entries)





document = "/Users/nmbr73/Projects/Kernfusion/Data/Kernfusion.scriv"
styles = Styles(document)


# print(styles)
# print("id of name 'Heading 1' is " + styles.id('Heading 1') )
# print("name of id '1F9E0BC5-2D32-4433-A8EC-FAAEA2139D61' is " + styles.name('1F9E0BC5-2D32-4433-A8EC-FAAEA2139D61') )
# print("style names are " + ', '.join(styles.names()) )
# print("style ids are " + ', '.join(styles.ids()) )


# ------



# CED2EBE9-61A8-48C9-8B54-D38683B18E14
#
#
# pandoc -s --from=rtf --to=markdown --output="content.md"  --lua-filter=../Tools/scrivinspect/styles.filter.lua content.rtf
# pandoc -s --from=rtf --to=native --output="content.native" --lua-filter=../Tools/scrivinspect/styles.filter.lua --metadata style0="HIERISDIeNULL" content.rtf

import subprocess
result = subprocess.run([
     'pandoc', '-s', '--from=rtf', '--to=markdown',
     '--lua-filter=/Users/nmbr73/Projects/Kernfusion/Tools/scrivinspect/styles.filter.lua'
     'tmp/content.rtf'], capture_output=True, text=True).stdout
print(result)
sys.exit(0)

path = Path(document).joinpath('Files','Data')
# directories = [d.name for d in path.iterdir() if d.is_dir()]
# print(directories)

for child in path.iterdir():

     if  not child.is_dir():
          continue

     print(f"DATA '{child.name}'")
     styles = []

     filepath = path.joinpath(child.name, 'content.styles')
     if filepath.is_file():
          with filepath.open() as file:
               content = file.read()
               styles = content.split(',')

     print(styles)



