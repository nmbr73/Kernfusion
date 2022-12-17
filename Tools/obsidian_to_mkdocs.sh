
source venv/bin/activate

if [[ -d docs ]]; then
    echo "outch"
    exit 10
fi

cp -rp Wiki docs
mv docs/README.md docs/index.md
mkdocs build
