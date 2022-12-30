#!/bin/bash
$--
$-- # Pandoc template to extract some metadata (i.e. from the YAML front matter of a markdown file).
$-- #
$-- #
$-- # pandoc --standalone --from=markdown --to plain --template=metadata.template.sh --output="<OUTPUT>" <INPUT>
$-- # ... OUTPUT should then be a bash script that you can source in your script.
$--
$-- # https://pandoc.org/MANUAL.html#metadata-blocks
$-- # https://pandoc.org/MANUAL.html#metadata-variables

$if(title)$
# Title is: $title$
$else$
# No title specfied
$endif$
export METADATA_TITLE="$title$"

$if(author)$
# Authors are:
$for(author)$
# - $author$
$endfor$
export METADATA_AUTHOR="$for(author)$$author$$sep$, $endfor$"
$else$
# No author specfied
export METADATA_AUTHOR=""
$endif$
