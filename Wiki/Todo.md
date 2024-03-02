This is more kind of nmbr73's personal notes and to-do list. Maybe better to organize them as Github issues or something similar.

### Potential Sources

There's a lot of material we could start with and which is available. But ==it must be checked what of it may be used under which conditions!== Then each option needs to be examined, if and how an initial import can be done - but most of it will probably require some scripting and/or lots of manual effort. Anyways, feel free to extend this list with interesting sources you know of:

- Andrew Hazelden has written hundreds of pages of documentation that he shared with the community
- Roger Magnusson's Fusion Class Browser could deliver lots of API definitions
- rne1223 has structured a lot of information for his [fuse-snippets](https://github.com/rne1223/fuse-snippets)
- [VFxPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page) contains a lot of (still valid) information that could serve as a basis
- There are many threads in the WSL forum that are written and structured in the format of an article or  documentation - and others that would deserve it to get rewritten as a more digestible article
- The BMD ASCII files in the developers examples could be a good start to extend and experiment

#### Status

**Scrivener exports:**

- [x] [[Immersive Pipeline Integration Guide]]
- [x] [[KartaVision]]
- [x] [[Vonk Ultra]]
- [x] [[Krokodove|Krokodove Essentials]]
- [x] [[Workflows|Kartaverse Workflows]]

**WSL-Posts worth it (and allowed) to be copied:**

- [x] [Running Scripts From Fusion Expression Fields](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=43229#p43229) --> [[Running Scripts From Fusion Expression Fields]]


### Tasks

I'm currently investigating
- how to import the different sources into Obsidian,
- how to make the vault well prepared for MkDocs,
- how to structure the MkDocs so that it is well suited for a (Media)Wiki.

- [x] Import all the Scrivener document (no reformatting, only get everything in here to be able to get things going). Status: done so far; "only" the pipeline guide left to be exported into the Wiki (seems to be done already?!? see [[Immersive Pipeline Integration Guide]]).
- [ ] Find a soluton for 'index.md' file. The 'Folder/Folder.md' files should act as such.
- [ ] Find a better rendering for the navigation - `awesome-pages` is nice, but does not really work for this wiki. I want to see only the items of the current subpage (files and folder), with the main article (index, aka 'Folder/Folder.md') on top and the subfolders not expanding, but lading to the navigation of that subfolder.
- [ ] Checkout if there is a way to integrate some breadcrump navigation with MkDoc in general or Material for MkDocs in particular.
- [ ] The `roamlinks` have an error: they substitute URLs in code blocks with Markdown link markup, which then is - being within a code block - shown as Markdown markup and not as a link (see for example [[Running Scripts From Fusion Expression Fields]]).
- [x] Checkout the different export options of [Scrivener](https://www.literatureandlatte.com/scrivener/overview) (used by Andrew; `brew install --cask scrivener`)
- [x] Allow for an easy local run of what currently the GitHub Action does; to allow everyone to test the scripts and the MkDocs output. Guess running a simple Docker container would be the best option for this.
- [x] Write a script to split a large .md file into single files on the basis of top-level headlines; this would allow to generate an index / toc file that lists each file in the correct order
- [x] Should think about what I use and how to map it to a MediaWiki afterwards; e.g. folders could serve as categories and the index.md files as description of the respective category. Folder == Subpages; Tags == Categories.
- [ ] <del>Write a script to make the Obsidian files better suited for MkDocs: Convert file names in URL friendly names whilst maintaining the links in the MarkDown; Add the original filename as a top level heading in each file; rename the foldername.md to an index.md whilst maintaining the links; etc.</del>
- [ ] Some time ago I played with the Fusion Class Browser to make it export some MarkDown files; have not yet got far with that solution, but still I believe its better to make the code create a clean export instead of cleaning it up afterwards; idk, however, first I have to find my old code on my hard disk
- [ ] Would be good to have some custom MarkDown extensions; i.e. having API descriptions integrated in a format that could be scanned for reuse it for intellisense and such would be great; trying to cleanly embed YouTube videos could be an experiment to start with ... first these must be implemented for Obsidian (see maybe [obsidian-simple-embeds](https://github.com/samwarnick/obsidian-simple-embeds) and in particular [obsidian-thumbnails](https://github.com/Meikul/obsidian-thumbnails) to play with it), and then maybe a MkDocs extension is needed to render it (or a quick and dirty script that patches the .md before it gets processed by MkDocs - not clean, but would work for other tools too).
