#!/bin/bash

SRCIVENER_EXPORT="temp/scrivener_export.md"
DEBUG="uncommment for debug mode"

# SRCIVENER_EXPORT=$1

# if [[ -z $SRCIVENER_EXPORT ]]; then
#     echo "pass path to a Scriver pandoc export as 1st arg!"
#     echo "... or just 'test'"
#     exit 10
# fi


# if [ $SRCIVENER_EXPORT == "test" ]; then

#     if [ ! -d "temp/scrivener_export.md" ]; then
#         cp -rp Data/example.export/scrivener_export.md Wiki/scrivener_export.md
#     fi

#     SRCIVENER_EXPORT="temp/scrivener_export.md"

#     # SRCIVENER_EXPORT="Wiki/_export.md/_export.md"
# fi


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

SRCIVENER_TMPPATH="temp"

# echo "SRCIVENER_EXPORT = '$SRCIVENER_EXPORT'"  # 'temp/scrivener_export.md/scrivener_export.md'
# echo "SRCIVENER_PATH   = '$SRCIVENER_PATH'"    # 'temp/scrivener_export.md'
# echo "SRCIVENER_BASE   = '$SRCIVENER_BASE'"    # 'temp'
# echo "SRCIVENER_FILE   = '$SRCIVENER_FILE'"    # 'scrivener_export.md'
# echo "SRCIVENER_BASE   = '$SRCIVENER_TMPPATH'" # 'temp'



# ----------------------------------------------------------------------------
# Write Original, AST, ... for debugging

if [[ -z $DEBUG ]]; then
  cp "$SRCIVENER_EXPORT" "$SRCIVENER_TMPPATH/_original.md"
  pandoc --from=markdown --to=native --output="$SRCIVENER_TMPPATH/_native.lua" $SRCIVENER_EXPORT
fi

# ----------------------------------------------------------------------------
# Store front matter in environment variables

pandoc --standalone --from=markdown --to plain --template=Tools/scrivener_to_obsidian/metadata.template.sh --output="$SRCIVENER_TMPPATH/_frontmatter.sh" $SRCIVENER_EXPORT
source "$SRCIVENER_TMPPATH/_frontmatter.sh"

if [[ ! -z $DEBUG ]]; then
  rm -f "$SRCIVENER_TMPPATH/_frontmatter.sh"
fi

echo "METADATA_TITLE  = '$METADATA_TITLE'"  # 'Welcome to the Kartaverse'
echo "METADATA_AUTHOR = '$METADATA_AUTHOR'" # ''



# ----------------------------------------------------------------------------
# Get first headline from the document

FIRST_HEADLINE=`pandoc --lua-filter=Tools/scrivener_to_obsidian/first_headline.filter.lua $SRCIVENER_EXPORT`

echo "FIRST_HEADLINE  = '$FIRST_HEADLINE'"  # 'Immersive Pipeline Integration Guide'

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="$METADATA_TITLE"
fi

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="Not a meaningful name at this point"
fi


# ----------------------------------------------------------------------------

OBSIDIAN_PATH="$SRCIVENER_PATH/_$FIRST_HEADLINE"
OBSIDIAN_FILE="$FIRST_HEADLINE.md"
OBSIDIAN_EXPORT="$OBSIDIAN_PATH/$OBSIDIAN_FILE"

mkdir -p "$OBSIDIAN_PATH"

IMAGE_REFERENCES=`pandoc --lua-filter=Tools/scrivener_to_obsidian/images.filter.lua $SRCIVENER_EXPORT`


if [[ ! -z $IMAGE_REFERENCES ]]; then

    #mkdir -p "$OBSIDIAN_PATH/img"

    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for file in $IMAGE_REFERENCES
    do
        # cp "$SRCIVENER_PATH/$file" "$OBSIDIAN_PATH/img/"
        cp "$SRCIVENER_PATH/$file" "$OBSIDIAN_PATH/"
    done
    IFS=$SAVEIFS
fi


# ----------------------------------------------------------------------------
# Run the (to be) Obsidian writer

pandoc \
  --wrap=none \
  --from=markdown \
  --to=Tools/scrivener_to_obsidian/obsidian.writer.lua \
  --output="$OBSIDIAN_EXPORT" $SRCIVENER_EXPORT

if [[ -z $DEBUG ]]; then
    cp "$OBSIDIAN_EXPORT" "$SRCIVENER_TMPPATH/_pandoc.md"
fi

python Tools/scrivener_to_obsidian.py "$OBSIDIAN_EXPORT"

