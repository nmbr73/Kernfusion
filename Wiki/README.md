Everything VFx and such.

> [!hint] Status
> **Current status** is: Not much in here yet, but already a total mess.
> **Long term goal** is: To shred it all in favor of a better solution.

The following text is nonsense I guess - a good oportunity for someone who has a clue about the subject and can write in English: please go ahead and replace it!

# Motivation

Finding a "how to do this simple thing" all to often seems to be like searching the [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page) mirror, reading not only multiple articles the information is distributed on, but also the discussion pages, to then jump into some threads on the [wesuckless](https://www.steakunderwater.com/wesuckless/) and [bmd](https://forum.blackmagicdesign.com) forums to finally try a google search to maybe complement the whole picture by some (excellent but sometimes ancient) blog posts.

As done with VFxPedia, suggested by nmbr73, picked up by LearnNowFX, and supported by Andrew Hazelden: A MediaWiki is probably best suited to gather and maintain such information to evolve it into a living documentation. We truly are a long way from that,  but you have to start somewhere.

# Vision

Simply put, the idea is to build a *Wiki of ConFusion* to become *the next gen VFxPedia*; to revive the approach of building up a community driven knowledge base around VFx in general and the BMD tooling in particular. And yes, I know that this is impossible, totally ridiculous and absolutely insane, but ... I don't care.

> [!quote]
>
> The day before something is a breakthrough, it’s a crazy idea.
> -- Peter Diamandis

# Approach

Most probably some 'critical mass' in terms of useful content is needed to attract people to use the information and to be willing to put own efforts in updating and complementing it.

Therefore the attempt is to first collect some existing documentation and rearrange it to be used as a foundation for a future Wiki.

# Tools

The [Kernfusion](https://github.com/nmbr73/Kernfusion) repository is here to compile, sort, structure and reformat content from different sources. Besides some tooling and experiments, the [Wiki/](https://github.com/nmbr73/Kernfusion/tree/main/Wiki) folder is the place where things are happening.

This folder is an [Obsidian](https://obsidian.md) vault, which - for the time being - seems to be well suited for the purpose: Obsidian is free and easy to use, and behind the scenes it is file based with all content in MarkDown format. MarkDown files, in turn, can be easily managed, read, converted and allow for collaborating and versioning via Git. Currently MkDocs is used to provide an *user friendly* output of the content on GitHub Pages. If - and only if - the repository's content evolves to something useful that's worth it to open up for editing by a broader community, it should be considered to abandon it after exporting its content as a basis for the to-be MediaWiki instance. But until then and unless this thing flies, a Git repo should perfectly do to get organized.

# Getting started

If you only want to use the documentation, then you can just access its latest version on [nmbr73.github.io/Kernfusion/](https://nmbr73.github.io/Kernfusion/). But this documentation won't be all too useful unless there are people who volunteer to complement and update it. Find here what's needed to get involved ...

Tools you should have in your belt are at least Git, GitHub, Obsidian, VSCode, and Python. For macOS it's recommended to use [Homebrew](https://brew.sh) to manage the installation of third party tools.

> [!example]- Tool installation on macOS
>
> ```
> # install homebrew
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
>
> # install git and github cli
> brew install git
> brew install gh
>
> # install obsidian and/or vscode editors
> brew install --cask obsidian
> brew install --cask visual-studio-code
>
> # install python and (maybe) lua for scripting
> brew install python@3.10
> brew install lua
> ```

First clone the Kernfusion repository by doing a `gh repo clone nmbr73/Kernfusion` (or alternatively by a  `git clone https://github.com/nmbr73/Kernfusion`).

Download Obsidian from [obsidian.md](https://obsidian.md) or install via [`brew install --cask obsidian`](https://formulae.brew.sh/cask/obsidian#default). Obsidian is used to edit files in the `Wiki/` subfolder. To do so just open this folder in Obsidian as a vault (select "Open folder as vault" and then chose the 'Kernfusion/Wiki' subdirectory).

You should the see the exact documentation you are currently reading in Obsidian:

![[Screenshot of the Wiki as an Obsidian Vault.png]]

# Authoring

Topics of the articles should be all around visual effect tools in general and the BMD products in particular. It's worth to mention Blender, Houdini, and whatever the market has to offer in this area - but they are well covered by other documentations and communities, and therefore focus here is on DaVinci Resolve and Fusion and how such tools integrate with these in a workflow for visual artists.

Target audience of the articles is (maybe) ...

- users / vfx artists, using the different tools
- administrators / pipeline engineers, provisioning and maintaining a vfx toolchain
- developers, writing tools, coding scripts and programming visual effects

... with a focus on the latter two (in general very good user manuals exists for the end-users) and blurred borders between the three.

Please organize / structure your articles with the different audiences in mind; complete articles dedicated to a specific audiences may be tagged as such (maybe \#artist, \#admin, \#automation, \#scripting, \#dev, or the like?). But I can't (and don't want to) set the rules how to do this: I think (hope) that it will just happen with some good examples that others copy and evolve.

# Potential Sources

There s a lot of material we could start with and which is available. But ==it must be checked what of it may be used under which conditions.== Then each option need to be examined, if and how an initial import can be done - but most of it will probably need some scripting and of manual effort.

- Andrew has written nearly 2000 pages of documentation
- Roger Magnusson's Fusion Class Browser could deliver lots of API definitions
- rne1223 has structured a lot of information for his [fuse-snippets](https://github.com/rne1223/fuse-snippets)
- [VFxPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page) contains a lot of (still valid) information that could serve as a basis
- There are many threads in the WSL forum that are written and structured in the format of an article or  documentation
- The BMD ASCII files in the developers examples could be a good start to extend and experiment

Feel free to extend this list with sources you know of.

# Next steps

Currenly just my personal to-do list:

- [ ] Checkout the different export options of [Scrivener](https://www.literatureandlatte.com/scrivener/overview) (used by Andrew); I need a combination that maintains the order of chapters (not the case with .md), the image file names (not the case with .docx, at least not if it's exported from docs.google), and as much of the formatting as possible. May try copy'n'paste directly from to tool instead of the Google Doc ... or maybe FODT (a flat OpenDoc XML) could do ... regrettably there seems to be no DocBook export.
- [ ] Allow for an easy local run of what currently the GitHub Action does; to allow everyone to test the scripts and the MkDocs output. Guess running a simple Docker container would be the best option to do this.
- [ ] Write a script to split a large .md file into single files on the basis of top-level headlines; this would allow to generate an index / toc file that lists each file in the correct order
- [ ] Write a script to make the Obsidian files better suited for MkDocs: Convert file names in URL friendly names whilst maintaining the links in the MarkDown; Add the original filename as a top level heading in each file; rename the foldername.md to an index.md whilst maintaining the links; etc.
- [ ] Some time ago I played with the Fusion Class Browser to make it export some MarkDown files; have not yet got far with that solution, but still I believe its better to make the code create a clean export instead of cleaning it up afterwards; idk, however, first I have to find that solution on my hard disk
- [ ] Would be good to have some custom MarkDown extensions; i.e. having API descriptions integrated in a format that could be scanned for reuse it for intellisense and such would be great; trying to cleanly embed YouTube videos could be an experiment to start with ... first these must be implemented for Obsidian (see maybe [obsidian-simple-embeds](https://github.com/samwarnick/obsidian-simple-embeds) and in particular [obsidian-thumbnails](https://github.com/Meikul/obsidian-thumbnails) to play with it), and then maybe a MkDocs extension is needed to render it (or a quick and dirty script that patches the .md before it gets processed by MkDocs - not clean, it would work for other tools too).
- [ ] Should think about what I use and how to map it to a MediaWiki afterwards; e.g. folders could serve as categories and the index.md files as description of the respective category.


<!--

> [!TODO] Check out ...
>
> - [jobindj/obsidian-publish-mkdocs](https://github.com/jobindj/obsidian-publish-mkdocs) and similar tools
> - Sphynx, MkDoc, ... MediaWiki to Markdown, Pandoc
>
>
> - https://github.com/jobindjohn/obsidian-publish-mkdocs
>
> - https://github.com/ObsidianPublisher/obsidian-mkdocs-publisher-python
> - https://github.com/ObsidianPublisher/obsidian-github-publisher

> To create notes / descriptions / hierarchy for the folders in Obsidian:
> - https://github.com/xpgo/obsidian-folder-note-plugin
> - https://github.com/akosbalasko/zoottelkeeper-obsidian-plugin


# Welcome to the Kernfusion (yet not a) Wiki!

Yet nothing usable to be found here ... still nothing more than my personal notebook / scribbling pad. ...

* [[Event-Functions]]
* [[AddControlPage]]
* [[MultiButtonControl]]
* [[WebGL to DCTL|WebGL to DCTL]]

-->
