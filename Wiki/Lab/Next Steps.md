
Currenly just my personal to-do list:

- [x] Checkout the different export options of [Scrivener](https://www.literatureandlatte.com/scrivener/overview) (used by Andrew; `brew install --cask scrivener`)
- [ ] Allow for an easy local run of what currently the GitHub Action does; to allow everyone to test the scripts and the MkDocs output. Guess running a simple Docker container would be the best option for this.
- [ ] <del>Write a script to split a large .md file into single files on the basis of top-level headlines; this would allow to generate an index / toc file that lists each file in the correct order</del>
- [ ] Write a script to make the Obsidian files better suited for MkDocs: Convert file names in URL friendly names whilst maintaining the links in the MarkDown; Add the original filename as a top level heading in each file; rename the foldername.md to an index.md whilst maintaining the links; etc.
- [ ] Some time ago I played with the Fusion Class Browser to make it export some MarkDown files; have not yet got far with that solution, but still I believe its better to make the code create a clean export instead of cleaning it up afterwards; idk, however, first I have to find my old code on my hard disk
- [ ] Would be good to have some custom MarkDown extensions; i.e. having API descriptions integrated in a format that could be scanned for reuse it for intellisense and such would be great; trying to cleanly embed YouTube videos could be an experiment to start with ... first these must be implemented for Obsidian (see maybe [obsidian-simple-embeds](https://github.com/samwarnick/obsidian-simple-embeds) and in particular [obsidian-thumbnails](https://github.com/Meikul/obsidian-thumbnails) to play with it), and then maybe a MkDocs extension is needed to render it (or a quick and dirty script that patches the .md before it gets processed by MkDocs - not clean, but would work for other tools too).
- [ ] Should think about what I use and how to map it to a MediaWiki afterwards; e.g. folders could serve as categories and the index.md files as description of the respective category.


<!--
Okay, [MultiMarkdown](https://en.wikipedia.org/wiki/MultiMarkdown) still seems to be the best option. With and `.opml` (Titles only) I can restore the articles' order - format is simple and straight forward. Have to check what exacly happens


https://www.youtube.com/watch?v=yTMo9WkOphE
und hier ist was erklärt, das helfen könnte

https://www.youtube.com/watch?v=xisfLmWGXqA und vielleicht hier

https://medium.com/@TKalippke/all-you-have-to-do-is-type-yourself-494a2c0b2fd6

mit docker verbasteln - als beispiel
https://hub.docker.com/r/silentstorm/pandoc-mkdocs/

-->

