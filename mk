 #!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTNAME=`basename $0`
SUPPLEMENTS="supplements"
VAULTNAME="Wiki"

set -o errexit
set -o pipefail
set -o nounset

if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi

cd "$(dirname "$0")"

# ----------------------------------------------------------------------------

function mk_docs_clean {
  rm -rf site
  rm -rf docs
}

# ----------------------------------------------------------------------------

function mk_docs_create {

  cp -rp "$VAULTNAME" docs
  rm -f  "docs/$VAULTNAME/README.md"
  rm -rf docs/.obsidian

  cp -rp Fusion docs/Kernfusion

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
      echo ""
      echo "Usage: $SCRIPTNAME docs (clean|ceate|build|serve|deploy)"
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
      echo "unknown action '$ACTION' for command 'docs'" >&2
      echo "try '$SCRIPTNAME docs help'" >&2
      exit 11
      ;;
  esac

}

# ----------------------------------------------------------------------------

function make_sure_obsidian_is_running {
  if ! pgrep Obsidian >/dev/null ; then
    open -a 'Obsidian'
    sleep 1
  fi
}

function mk_edit {

  local PAGE="${1-}"

  case $PAGE in

    "")
      make_sure_obsidian_is_running
      open "obsidian://open?vault=$VAULTNAME"
      ;;

    "help" | "-h" | "--help" | "h" | "-help")
      echo ""
      echo "Usage: $SCRIPTNAME edit [page]"
      echo ""
      echo "Open Obsidian to edit the Wiki."
      echo ""
      echo "Example:"
      echo ""
      echo "  ./$SCRIPTNAME edit 'pixar tractor deployment'"
      ;;

    *)
      make_sure_obsidian_is_running
      local URLENC=`printf "%s" "$PAGE" | xxd -p | tr -d \\n | sed 's/../%&/g'`
      open "obsidian://open?vault=$VAULTNAME&file=$URLENC"
      ;;
  esac
}

main() {

  local COMMAND="${1-}"

  case $COMMAND in

    "docs")
      mk_docs "${2-}"
      ;;

    "edit")
      mk_edit "${2-}"
      ;;

    "help" | "-h" | "--help" | "h" | "-help")
      echo ""
      echo "Usage: $SCRIPTNAME (docs|edit)"
      echo ""
      echo "  docs: for MkDocs; try '$SCRIPTNAME docs help'"
      echo "  edit: to edit markdown file; try '$SCRIPTNAME edit help'"
      echo ""
      echo "Nothing else implemented yet."
      echo "Try '$SCRIPTNAME (docs|edit) help' for command specific details."
      echo "Run as 'TRACE=1 ./mk' to debug."
      ;;

    *)
      echo "unknown command '$COMMAND'" >&2
      echo "try '$SCRIPTNAME help'" >&2
      exit 10
      ;;
  esac

}


main "$@"
