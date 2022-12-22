#!/bin/bash

echo "copy some stuff and such ..."

if [[ ! -d Wiki ]]; then
    echo "outch"
    exit 10
fi


rm -rf site
rm -rf docs
cp -rp Wiki docs
mkdir -p docs/stylesheets/
cp Tools/obsidian_to_mkdocs/docs/stylesheets/* docs/stylesheets/

python Tools/obsidian_to_mkdocs.py


ACTION=$1

case $ACTION in

  serve)
    mkdocs serve
    ;;

  build)
    mkdocs build
    ;;

  deploy)
    # call 'deploy' in a github action
    echo "deploy to github pages"
    mkdocs gh-deploy --force
    ;;

  *)
    # echo "unknown"
    ;;
esac


echo "obsidian_to_mkdocs done"
