#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTNAME=`basename $0`



function mk_docs_clean {
  rm -rf site
  rm -rf docs
}



function mk_docs_create {

  rm -rf docs
  cp -rp Wiki docs
  rm -f  docs/Wiki/README.md
  rm -rf docs/.obsidian

  python Tools/mk_pages.py
  python Tools/obsidian_to_mkdocs.py

  mv docs/.assets_wiki docs/assets_wiki

# # mkdir -p docs/stylesheets/
# # cp Tools/obsidian_to_mkdocs/docs/stylesheets/* docs/stylesheets/
}



function mk_docs {
  ACTION=$1

  case $ACTION in

    "clean")
      mk_docs_clean
      ;;

    "create")
      mk_docs_clean
      mk_docs_create
      ;;

    "build")
      mk_docs_clean
      mk_docs_create
      mkdocs build
      ;;

    "serve")
      mk_docs_clean
      mk_docs_create
      mkdocs serve
      ;;

    "deploy")
      mk_docs_clean
      mk_docs_create
      mkdocs gh-deploy --force
      ;;

    "help" | "-h" | "--help")
      echo "$SCRIPTNAME docs (clean|ceate|build|serve|deploy|help)"
      echo ""
      echo "  clean:  deletes 'docs' and 'site' folders"
      echo "  create: does a clean and then creates the 'docs' folder (most common)"
      echo "  build:  does a create and then builds the 'site' folder"
      echo "  serve:  does a create and then serves the docs on http://localhost:8000"
      echo "  deploy: does a create and then deploys to gh (call from a gh Action)"
      echo ""
      echo "Usualy you will want to have a './$SCRIPTNAME docs serve' running in one"
      echo "terminal and regularly call './$SCRIPTNAME docs create' in another to"
      echo "check your Wiki/ changes under http://localhost:8000"
      ;;

    *)
      echo "unknown action '$ACTION'"
      echo "try '$SCRIPTNAME docs help'"
      exit 11
      ;;
  esac

}



(
  cd $SCRIPTPATH

  if [[ ! -d "Tools" ]]; then
      echo "outch"
      exit 50
  fi

  if [[ -d "venv/bin" ]]; then
    source venv/bin/activate
    # python3 -m pip -V
  fi

  COMMAND=$1

  case $COMMAND in

    "docs")
      mk_docs $2
      ;;

    "help" | "-h" | "--help")
      echo "$SCRIPTNAME (docs|help)"
      echo ""
      echo "  docs: for MkDocs; try '$SCRIPTNAME docs help'"
      echo ""
      echo "Nothing else implemented yet."
      ;;

    *)
      echo "unknown command '$COMMAND'"
      echo "try '$SCRIPTNAME help'"
      exit 10
      ;;
  esac
)
