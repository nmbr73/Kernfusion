#!/bin/bash
INPUT=$1
TITLE=`pandoc --lua-filter=first_headline.lua $INPUT`
pandoc -s --to=html --metadata title="$TITLE" $INPUT
