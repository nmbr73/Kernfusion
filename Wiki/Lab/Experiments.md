

# Convert the demo Scrivener document

Open `Data/Kernfusion.scriv` in Scrivener.
Compile for "MultiMarkdown" using "Extended Pandoc (nmbr73)" from the "Project Formats".
Save as `Wiki/Lab/inout/ScrivenerOutput.md`.

```sh
OUTDIR="Wiki/Lab/inout/ScrivenerOutput.md"
pandoc --from=markdown --to=native --output=$OUTDIR/NativeOutput.lua $OUTDIR/ScrivenerOutput.md
pandoc --from=markdown --to=Tools/obsidian.lua --output=$OUTDIR/PandocOutput.md $OUTDIR/ScrivenerOutput.md
```

# Kartaverse experiments

Images Used:
```sh
pandoc --from=markdown --to=Tools/imagelist.lua Wiki/KartaExport.md/KartaExport.md --output=Wiki/KartaExport.md/KartaFix.md
```

