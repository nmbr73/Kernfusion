#!/bin/bash

DEBUG="uncommment for debug mode"

SRCIVENER_EXPORT=$1

if [[ -z $SRCIVENER_EXPORT ]]; then
    echo "pass path to a Scriver pandoc export as 1st arg!"

    if [ -d "Data/example.export/scrivener_example.md" ]; then
        echo "you can for example do a "
        echo "   cp -rp Data/example.export/scrivener_example.md temp/scrivener_example.md"
        echo "and then call"
        echo "   $0 temp/scrivener_example.md"
    fi

    exit 10
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

SRCIVENER_TMPPATH="temp"

if [[ ! -z $DEBUG ]]; then
    echo "SRCIVENER_EXPORT = '$SRCIVENER_EXPORT'"  # 'temp/scrivener_export.md/scrivener_export.md'
    echo "SRCIVENER_PATH   = '$SRCIVENER_PATH'"    # 'temp/scrivener_export.md'
    echo "SRCIVENER_BASE   = '$SRCIVENER_BASE'"    # 'temp'
    echo "SRCIVENER_FILE   = '$SRCIVENER_FILE'"    # 'scrivener_export.md'
    echo "SRCIVENER_BASE   = '$SRCIVENER_TMPPATH'" # 'temp'
    echo "SRCIVENER_TMPPATH= '$SRCIVENER_TMPPATH'" # 'temp'
fi

if [ ! -d $SRCIVENER_TMPPATH ]; then
    echo "make sure to call this script from the repo base dir"
    echo "and to create a 'temp' folder in there!"
    exit 30
fi

# ----------------------------------------------------------------------------
# Write Original, AST, ... for debugging

if [[ ! -z $DEBUG ]]; then
  cp "$SRCIVENER_EXPORT" "$SRCIVENER_TMPPATH/_10_original_input.md"
  pandoc --from=markdown --to=native --output="$SRCIVENER_TMPPATH/_20_native_AST.hs" $SRCIVENER_EXPORT
fi

# ----------------------------------------------------------------------------
# Store front matter in environment variables

pandoc --standalone --from=markdown --to plain --template=Tools/scrivener_to_obsidian/metadata.template.sh --output="$SRCIVENER_TMPPATH/_30_frontmatter.sh" $SRCIVENER_EXPORT
source "$SRCIVENER_TMPPATH/_30_frontmatter.sh"

if [[ -z $DEBUG ]]; then
  rm -f "$SRCIVENER_TMPPATH/_30_frontmatter.sh"
fi

if [[ ! -z $DEBUG ]]; then
    echo "METADATA_TITLE   = '$METADATA_TITLE'"  # 'Welcome to the Kartaverse'
    echo "METADATA_AUTHOR  = '$METADATA_AUTHOR'" # ''
fi


# ----------------------------------------------------------------------------
# Get first headline from the document

FIRST_HEADLINE=`pandoc --lua-filter=Tools/scrivener_to_obsidian/first_headline.filter.lua $SRCIVENER_EXPORT`

echo "FIRST_HEADLINE   = '$FIRST_HEADLINE'"  # 'Immersive Pipeline Integration Guide'

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="$METADATA_TITLE"
fi

if [[ -z $FIRST_HEADLINE ]]; then
    FIRST_HEADLINE="Not a meaningful name at this point"
fi


# ----------------------------------------------------------------------------

OBSIDIAN_PATH="$SRCIVENER_BASE/_$FIRST_HEADLINE"
OBSIDIAN_FILE="$FIRST_HEADLINE.md"
OBSIDIAN_EXPORT="$OBSIDIAN_PATH/$OBSIDIAN_FILE"

if [[ ! -z $DEBUG ]]; then
    echo "OBSIDIAN_PATH    = '$OBSIDIAN_PATH'" # ''
    echo "OBSIDIAN_FILE    = '$OBSIDIAN_FILE'" # ''
    echo "OBSIDIAN_EXPORT  = '$OBSIDIAN_EXPORT'" # ''
fi

mkdir -p "$OBSIDIAN_PATH"

IMAGE_REFERENCES=`pandoc --lua-filter=Tools/scrivener_to_obsidian/images.filter.lua $SRCIVENER_EXPORT`

if [[ ! -z $DEBUG ]]; then
    echo $IMAGE_REFERENCES > "$SRCIVENER_TMPPATH/_40_images.sh"
fi

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

if [[ ! -z $DEBUG ]]; then
    cp "$OBSIDIAN_EXPORT" "$SRCIVENER_TMPPATH/_50_pandoc_output.md"
fi

python Tools/scrivener_to_obsidian.py "$OBSIDIAN_EXPORT"

mv "$OBSIDIAN_PATH" "Wiki/"

# Now check the output in Wiki/
# test with obsidian_to_mkdocs.sh
# to then do a mkdocs serve to have a look
# and finally remove the leading underscore
# if everything is fine and should be committed
