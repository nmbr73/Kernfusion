#!/bin/bash

SRCIVENER_EXPORT=$1


if [[ -z $SRCIVENER_EXPORT ]]; then
    echo "pass path to a Scriver pandoc export as 1st arg!"
    echo "... or just 'test'"
    exit 10
fi


if [ $SRCIVENER_EXPORT == "test" ]; then

    if [ ! -d "Wiki/_export.md" ]; then
        cp -rp Data/example.export/_export.md Wiki/
    fi

    SRCIVENER_EXPORT="Wiki/_export.md/_export.md"
fi


SRCIVENER_PATH=`dirname $SRCIVENER_EXPORT`
SRCIVENER_FILE=`basename $SRCIVENER_EXPORT`

if [ `basename $SRCIVENER_PATH` != $SRCIVENER_FILE ]; then
    SRCIVENER_PATH="$SRCIVENER_PATH/$SRCIVENER_FILE"
    SRCIVENER_EXPORT="$SRCIVENER_PATH/$SRCIVENER_FILE"
fi

SRCIVENER_BASE=`dirname $SRCIVENER_PATH`

if [ ! -f $SRCIVENER_EXPORT ]; then
    echo "no such file '$SRCIVENER_EXPORT'"
    exit 20
fi

# echo "SRCIVENER_EXPORT = '$SRCIVENER_EXPORT'" # 'Wiki/_export.md/_export.md'
# echo "SRCIVENER_PATH   = '$SRCIVENER_PATH'"   # 'Wiki/_export.md'
# echo "SRCIVENER_BASE   = '$SRCIVENER_BASE'"   # 'Wiki'
# echo "SRCIVENER_FILE   = '$SRCIVENER_FILE'"   # '_export.md'

pandoc --standalone --from=markdown --to plain --template=Tools/scrivconv/metadata.template.sh --output="$SRCIVENER_PATH/_frontmatter.sh" $SRCIVENER_EXPORT
source $SRCIVENER_PATH/_frontmatter.sh


FIRST_HEADLINE=`pandoc --lua-filter=Tools/scrivconv/first_headline.filter.lua $SRCIVENER_EXPORT`
IMAGE_REFERENCES=`pandoc --lua-filter=Tools/scrivconv/images.filter.lua $SRCIVENER_EXPORT`


echo "METADATA_TITLE  = '$METADATA_TITLE'"  # 'Welcome to the Kartaverse'
echo "METADATA_AUTHOR = '$METADATA_AUTHOR'" # ''
echo "FIRST_HEADLINE  = '$FIRST_HEADLINE'"  # 'Immersive Pipeline Integration Guide'


pandoc --from=markdown --to=native --output="$SRCIVENER_PATH/_native.lua" $SRCIVENER_EXPORT

pandoc \
  --wrap=none \
  --from=markdown \
  --to=Tools/scrivconv/obsidian.writer.lua \
  --output="$SRCIVENER_PATH/_fixed.md" $SRCIVENER_EXPORT
