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



# ----------------------------------------------------------------------------
# Write AST

# pandoc --from=markdown --to=native --output="$SRCIVENER_PATH/_native.lua" $SRCIVENER_EXPORT



# ----------------------------------------------------------------------------
# Store frtont matter in environment variables

pandoc --standalone --from=markdown --to plain --template=Tools/scrivconv/metadata.template.sh --output="$SRCIVENER_PATH/_frontmatter.sh" $SRCIVENER_EXPORT
source $SRCIVENER_PATH/_frontmatter.sh
rm -f $SRCIVENER_PATH/_frontmatter.sh

echo "METADATA_TITLE  = '$METADATA_TITLE'"  # 'Welcome to the Kartaverse'
echo "METADATA_AUTHOR = '$METADATA_AUTHOR'" # ''



# ----------------------------------------------------------------------------
# Get first headline from the document

FIRST_HEADLINE=`pandoc --lua-filter=Tools/scrivconv/first_headline.filter.lua $SRCIVENER_EXPORT`

echo "FIRST_HEADLINE  = '$FIRST_HEADLINE'"  # 'Immersive Pipeline Integration Guide'

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="$METADATA_TITLE"
fi

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="Not a meaningful name at this point"
fi


# ----------------------------------------------------------------------------

OBSIDIAN_PATH="$SRCIVENER_PATH/$FIRST_HEADLINE"
OBSIDIAN_FILE="$FIRST_HEADLINE.md"
OBSIDIAN_EXPORT="$OBSIDIAN_PATH/$OBSIDIAN_FILE"

mkdir -p "$OBSIDIAN_PATH"

IMAGE_REFERENCES=`pandoc --lua-filter=Tools/scrivconv/images.filter.lua $SRCIVENER_EXPORT`


if [[ ! -z $IMAGE_REFERENCES ]]; then

    mkdir -p "$OBSIDIAN_PATH/img"

    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for file in $IMAGE_REFERENCES
    do
        cp "$SRCIVENER_PATH/$file" "$OBSIDIAN_PATH/img/"
    done
    IFS=$SAVEIFS
fi


# ----------------------------------------------------------------------------
# Run the (to be) Obsidian writer

pandoc \
  --wrap=none \
  --from=markdown \
  --to=Tools/scrivconv/obsidian.writer.lua \
  --output="$OBSIDIAN_EXPORT" $SRCIVENER_EXPORT

