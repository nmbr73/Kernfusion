

## Scrivener to Obsidian

```sh

# setup
cd Kernfusion
mkdir -p temp
source venv/bin/activate

BRANCH="$(whoami)_export"
git switch main
git pull
git branch $BRANCH
git switch $BRANCH
git push origin branch


# In Scrivener compile some document.
# Forman should me a paddoc markdown
# format - but you must make sure that
# "layouts assigned for section types"
# or whatsoever (did not really get this)
# preserve headlines and text. Save for
# example es temp/scrivener_export.md



# process for obsidian
./Tools/scrivener_to_obsidian.sh temp/scrivener_example.md


# You can now review and edit the output
# in Obsidian. But make sure to not run
# scrivener_to_obsidian.sh for the same
# export again because this will delete
# all your changes!


# process for mkdoks
./Tools/obsidian_to_mkdocs.sh

# review on http://localhost:8000/
mkdocs serve



# If everything looks good remove the
# trailing slash from the folder that
# had been created in 'Wiki/'. Now you
# can push your newly generated articles
# to the remote:

git add .
git commit -m 'Scrivener export added'
git push
```





## Own ...

> [!warning] Embed: [Reactor is released - GET IT NOW!](https://www.youtube.com/watch?v=mklCsf8yOUk)

