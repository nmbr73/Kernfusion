

## Convert the demo Scrivener document

Open `Data/Kernfusion.scriv` in Scrivener.
Compile for "MultiMarkdown" using "Extended Pandoc (nmbr73)" from the "Project Formats".
Save as `Wiki/Lab/inout/ScrivenerOutput.md`.

```sh
OUTDIR="Wiki/Lab/inout/ScrivenerOutput.md"
pandoc --from=markdown --to=native --output=$OUTDIR/NativeOutput.lua $OUTDIR/ScrivenerOutput.md
pandoc --from=markdown --to=Tools/obsidian.lua --output=$OUTDIR/PandocOutput.md $OUTDIR/ScrivenerOutput.md
```

## Kartaverse experiments

In Scrivener compile your document to Markdown in 'Basic Pandoc' format (or a Pandoc format derived from it).

Set the name to save to being '_export.md' within `Wiki/` as the target directory.

Run the conversion from Scrivener's Pandoc export to Obsidian Markdown:

<!--
Images Used:
```sh
pandoc --from=markdown --to=Tools/imagelist.lua Wiki/KartaExport.md/KartaExport.md --output=Wiki/KartaExport.md/KartaFix.md
```
-->

## Own ...

> [!warning] Embed: [Reactor is released - GET IT NOW!](https://www.youtube.com/watch?v=mklCsf8yOUk)

