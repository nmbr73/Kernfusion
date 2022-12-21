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
    print("with INFILE a Scrivener '.scriv' file")
    sys.exit(10)

scrivpath = Path(sys.argv[1])


srivx = Path(scrivpath).joinpath(scrivpath.stem + '.scrivx')

with srivx.open() as f:
    xml = f.read()

pattern = re.compile(r'<BinderItem UUID="([A-F0-9\-]+)"[^<]+<Title>([^<]+)</Title>')

uuid_to_title = {}
for match in pattern.findall(xml):
    (uuid,title) = match
    assert not uuid in uuid_to_title
    uuid_to_title[uuid] = title + ' ' + f"({uuid})"




numfiles = 0
numimages = 0
numfixes = 0
numchangedfiles = 0
numsamefiles = 0
numduplicates = 0

pattern = re.compile(r'\{\\pict \{\\\*\\nisusfilename ([^\}]+)\}\\picw(\d+)\\pich(\d+)\\picwgoal(\d+)\\pichgoal(\d+)\\(png|jpeg)blip ([0-9a-f]+)\}', re.UNICODE)

map_name_to_image = {}
map_data_to_name  = {}



what_i_did = []


for contentfilepath in scrivpath.joinpath("Files","Data").rglob("*/content.rtf"):

    numfiles += 1

    content = ""
    with contentfilepath.open() as f:
        content = f.read()

    changes = {}
    log_the_actions = []

    for match in pattern.findall(content):

        numimages += 1

        (image_name,width,height,target_width,target_height,image_type,data) = match

        key = f"{image_name}.{image_type}"

        image_newname = None



        if not key in map_name_to_image:

            # der name ist noch nie aufgetreten

            if not data in map_data_to_name:
                # die daten sind noch nie aufgetreten

                # unverbrauchter name für neue daten - alles super
                map_name_to_image[key] = [1,width,height,target_width,target_height,image_type,data,contentfilepath.parent.name]
                map_data_to_name[data] = {'name' : image_name, 'file' : contentfilepath.parent.name}
                continue

            else:
                # die daten wurden schon mal gesehen - offensichtlich unter einem anderen namen
                image_newname = map_data_to_name[data]['name']
                log_the_actions.append(f"- '{image_name}' is a duplicate of {map_data_to_name[data]['name']} in '{uuid_to_title[map_data_to_name[data]['file']]}'")
                numduplicates += 1

        else:

            # der name ist schon mal aufgetreten

            item = map_name_to_image[key]

            if data == item[6]:

                # es handelt sich um dieselben daten unter dem selben namen - alles super

                numsamefiles += 1

                assert data in map_data_to_name
                assert map_data_to_name[data]['name'] == image_name

                continue

            else:

                # andere daten unter demselben namen - die müssen entsprechend umbenannt werden

                if data in map_data_to_name:
                    # es gibt bereits einen anderen namen für genau diese daten

                    log_the_actions.append(f"I: '{image_name}' already seen as {map_data_to_name[data]['name']} in '{uuid_to_title[map_data_to_name[data]['file']]}'")

                    image_newname = map_data_to_name[data]['name']
                else:

                    log_the_actions.append(f"I: name '{image_name}' already used for a different image in '{uuid_to_title[item[7]]}'")

                    item[0] += 1
                    image_newname = f"{image_name}__fix{item[0]-1}"

                    map_name_to_image[f"{image_newname}.{image_type}"] = [1,width,height,target_width,target_height,image_type,data,contentfilepath.parent.name]
                    map_data_to_name[data] = {'name' : image_newname, 'file' : contentfilepath.parent.name}

        numfixes += 1

        prefix  = r"{\pict {\*\nisusfilename "
        postfix = '}' + f"\\picw{width}\\pich{height}\\picwgoal{target_width}\\pichgoal{target_height}\\{image_type}blip "

        if f"{prefix}{image_name}{postfix}" in changes:
            assert changes[f"{prefix}{image_name}{postfix}"][1] == data
            numsamefiles += 1

            log_the_actions.append(f"A: renaming '{image_name}' to '{image_newname}' has already been done")

            continue

        log_the_actions.append(f"A: rename '{image_name}' to '{image_newname}'")

        changes[f"{prefix}{image_name}{postfix}"] = [f"{prefix}{image_newname}{postfix}",data]




    if changes:

        assert log_the_actions

        what_i_did.append(f"----------------------------------\nChanging file '{uuid_to_title[contentfilepath.parent.name]}'")
        what_i_did.append("\n".join(log_the_actions) + "\n\n")

        numchangedfiles += 1
        for oldkey, (newkey,data) in changes.items():
            content = content.replace(oldkey + data, newkey + data)

        with contentfilepath.open('w') as f:
          f.write(content)



logfile = Path("patch_filenames.txt")
with logfile.open('w') as f:
    f.write("\n".join(what_i_did))

# print(f"scanning '{scrivpath.name}', {numimages} images were found in {numfiles} files.")
# print(f"{numsamefiles} times a name occurred again because it actually was just the exact same image being reused.")
# print(f"but {numfixes} images had to be renamed to make the names unique, which led to {numchangedfiles} files being modified.")
# print(f"duplicates: {numduplicates}.")





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



