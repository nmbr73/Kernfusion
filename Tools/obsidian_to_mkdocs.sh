#!/bin/bash



source venv/bin/activate

if [[ ! -d Wiki ]]; then
    echo "outch"
    exit 10
fi

# source venv/bin/activate

rm -rf site
rm -rf docs
cp -rp Wiki docs

python Tools/obsidian_to_mkdocs.py

mkdir -p docs/stylesheets/
cp Tools/obsidian_to_mkdocs/docs/stylesheets/* docs/stylesheets/


ACTION=$1

case $ACTION in

  serve)
    mkdocs serve
    ;;

  build)
    mkdocs build
    ;;

  deploy)
    mkdocs gh-deploy --force
    ;;

  *)
    # echo "unknown"
    ;;
esac
