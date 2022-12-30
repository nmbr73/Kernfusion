 #!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTNAME=`basename $0`
SUPPLEMENTS="supplements"

set -o errexit
set -o pipefail
set -o nounset

if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi

cd "$(dirname "$0")"

# ----------------------------------------------------------------------------

function mk_usage {
  echo "
Usage: $SCRIPTNAME (docs)

  docs: for MkDocs; try '$SCRIPTNAME docs help'

Nothing else implemented yet.
Run as 'TRACE=1 ./mk' to debug."
}

# ----------------------------------------------------------------------------

function mk_docs_usage {
  echo "
Usage: $SCRIPTNAME docs (clean|ceate|build|serve|deploy)

  clean:  deletes 'docs' and 'site' folders
  create: does a clean and then creates the 'docs' folder (most common)
  build:  does a create and then builds the 'site' folder
  serve:  does a create and then serves the docs on http://localhost:8000
  deploy: does a create and then deploys to gh (call from a gh Action)

Usualy you will want to have a './$SCRIPTNAME docs serve' running in one
terminal and regularly call './$SCRIPTNAME docs create' in another to
check your Wiki/ changes under http://localhost:8000"
}

# ----------------------------------------------------------------------------

function mk_docs_clean {
  rm -rf site
  rm -rf docs
}

# ----------------------------------------------------------------------------

function mk_docs_create {

  cp -rp Wiki docs
  rm -f  docs/Wiki/README.md
  rm -rf docs/.obsidian

  if [[ ! -d "$SUPPLEMENTS" ]]; then
      echo "outch"
      exit 50
  fi

  if [[ -d "venv/bin" ]]; then
    source venv/bin/activate
  fi

  python "$SUPPLEMENTS/mk_pages.py"
  python "$SUPPLEMENTS/obsidian_to_mkdocs.py"

  mv docs/.assets_wiki docs/assets_wiki

# # mkdir -p docs/stylesheets/
# # cp Tools/obsidian_to_mkdocs/docs/stylesheets/* docs/stylesheets/
}

# ----------------------------------------------------------------------------

function mk_docs {

  local ACTION="${1-}"

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

    "help" | "-h" | "--help" | "h" | "-help")
      mk_docs_usage
      ;;

    *)
      echo "unknown action '$ACTION' for command 'docs'" >&2
      echo "try '$SCRIPTNAME docs help'" >&2
      exit 11
      ;;
  esac

}

# ----------------------------------------------------------------------------

main() {

  local COMMAND="${1-}"

  case $COMMAND in

    "docs")
      mk_docs ${2-}
      ;;

    "help" | "-h" | "--help" | "h" | "-help")
      mk_usage
      ;;

    *)
      echo "unknown command '$COMMAND'" >&2
      echo "try '$SCRIPTNAME help'" >&2
      exit 10
      ;;
  esac

}


main "$@"
