The following text is nonsense I guess - a good opportunity for someone who has a clue about the subject and can write in English: please go ahead and replace it!


## Motivation

Finding a "how to do this simple thing" all to often seems to be like searching the [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page) mirror, reading not only multiple articles the information is distributed across, but also the discussion pages, to then jump into some threads on the [wesuckless](https://www.steakunderwater.com/wesuckless/) and [bmd](https://forum.blackmagicdesign.com) forums to finally try a google search to maybe complement the whole picture by some (excellent but sometimes ancient) blog posts.

As done with VFxPedia, suggested by nmbr73, picked up by LearnNowFX, and supported by Andrew Hazelden: A MediaWiki is probably best suited to maintain such information and to make it some ever evolving and living documentation. We truly are a long way from that, but you have to start somewhere.


## Vision

Simply put, the idea is to build a *Wiki of ConFusion* to become *the next gen VFxPedia*; to revive the approach of building up a community driven knowledge base around VFx in general and the BMD tooling in particular. And yes, I know that this is impossible, totally ridiculous and absolutely insane, but ... I have no clue - I'm a beginner enough that I just don't care.

> [!quote]
>
> The day before something is a breakthrough, it’s a crazy idea.
> -- Peter Diamandis


## Approach

Most probably some 'critical mass' in terms of useful content is needed to attract people to use the information and to be willing to put own efforts in updating and complementing it.

Therefore the attempt is to first collect some existing documentation and rearrange it to be used as a foundation for a future Wiki.


## Tools

The [Kernfusion](https://github.com/nmbr73/Kernfusion) repository is here to compile, sort, structure and reformat content from different sources. Besides some tooling and experiments, the [Wiki/](https://github.com/nmbr73/Kernfusion/tree/main/Wiki) folder is the place where things mainly happen.

This folder is an [Obsidian](https://obsidian.md) vault, which - for the time being - seems to be well suited for the purpose: Obsidian is a free and easy to use note taking app, and behind the scenes it is file based with all content in MarkDown format. MarkDown files, in turn, can be easily managed, read, converted and allow for collaborating and versioning via Git. Currently MkDocs is used to provide a *user friendly* output of the content on GitHub Pages. If - and only if - the repository's content evolves to something useful that's worth it to open up for editing by a broader community, it should be considered to abandon it - that is after exporting the repo's content some day as a basis for the to-be MediaWiki instance. But until then and unless this thing flies, a Git repo should perfectly do to get organized.


## Getting started

If you only want to use the documentation, then (for the time being) you can just access its latest version on [confusion.nmbr73.net](http://confusion.nmbr73.net/). But this documentation won't be all too useful unless there are people who volunteer to complement and update it. Find here what's needed to get involved ...

### Tools installation

Tools you should have in your belt are at least Git, GitHub, and Obsidian for editing the documentation; you may want to install Python, VSCode, and maybe Lua if you are interested in working on the scripts.

> [!example]- Tool installation on macOS
>
> For macOS it's recommended to use [Homebrew](https://brew.sh) to manage the installation of third party tools.
> You may want to use one or the other of the following commands ...
>
> ```sh
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

Download Obsidian from [obsidian.md](https://obsidian.md) (or install via [`brew install --cask obsidian`](https://formulae.brew.sh/cask/obsidian#default) if you are on a Mac). Obsidian is used to edit the files in the `Wiki/` subfolder. To do so just open this folder in Obsidian as a vault (select "Open folder as vault" and then chose the 'Kernfusion/Wiki/' subdirectory).

You should then see the exact documentation you are currently reading in Obsidian:

![[Screenshot of the Wiki as an Obsidian Vault.png]]

### Editing in Obsidian

...

### Git to apply your edits

Git and GitHub are used not only for versioning, but also in the sense of a collaboration tool. The `main`branch will soon be "protected" against direct modifications. This means: Even if you just want to edit some text or fix some typos you (currently) must use Git and its key functionalities like branches and synchronization with remotes. But knowing a little bit of Git is totally worth it in so many situations so you should definitely give it a try ...

> [!TODO]- Correct and complement the Git description
> It's meant to be a very(!) short "howto", to allow people not familiar with git to get quickly started to work on this repo, but by no means as a full introduction to Git. Still it needs some rework.

Before working on Kernfusion:
```sh
git switch main
git fetch
git branch <NAME>
git switch <NAME>
git push --set-upstream origin <NAME>
```


Do create a snapshots of your local changes whenever you finished a piece of work:
```sh
git status # to see your changes
git add . # to add all your changes
git commit -m <DESCRIPTION> # commit these changes your local repo
```
Use a description that could be read as *"If applied, this commit will _&lt;DESCRIPTION&gt;_"* (see [How to Write a Git Commit Message](https://cbea.ms/git-commit/)).


This is to build up a documented version history.


Push your changes on your branch to the origin’s main from time to time
```sh
git pull # get any changes, that might have been made to your branch
git push
```

...


### File and directory structure

> [!summary] tl;dr
> - Group articles, but don't try to put them in a linear order
> - Obsidian tags are considered to be categories
> - All pages in a folder are considered subpages
> - A folder subpage is a Markdown file in that folder with the folders name
> - The `Wiki/` folder and only the `Wiki/` folder must have a `README.md`
> - Do not name any file `index.md`
> - `.pages` files are meant to be eliminated (remember: don't put articles in a linear order)

Intention is to build up a collection of articles to eventually transfer them into a Wiki some day (most probably based on [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki)).

A Wiki has no "linear" structure, but is more a network of linked articles. This being said, it must be avoided to try to put the pages into an order - even though the file navigation panel (on the left in Obsidian, or the MkDocs's static output) may tempt you to do so. As a compensation for this, links must be embedded in a meaningful way whenever possible in order to let the information network emerge.

Still there is a way for a rough structuring of Wiki articles by assigning them a *[category](https://www.mediawiki.org/wiki/Help:Categories)*. As an article can belong to multiple categories, Obsidian's tags mechanism should be well suited to mimic categories.

Another way to organise articles in a (Media)Wiki are *[subpages](https://www.mediawiki.org/wiki/Help:Subpages)*. In this repository subpages are realized by folders. To provide the text the folder itself should be associated with, every folder must contain a Markdown file with its filename matching the folders name.

> [!warning] index.md files
> MkDocs can use `index.md` files as a folders page. But these are a pain to use, i.e. when setting links to such pages in Obsidian (we end up with tons of pages named 'index' and have to set alternative link texts for all of them). A usable compromise has still to be found here!



## Authoring

### Write with DaVinci Resolve / Fusion in mind

Topics of the articles should be all around visual effect tools in general and the BMD products in particular. It's worth to mention Blender, Houdini, After Effects, and whatever the market has to offer in this area - but they are well covered by other communities, and therefore focus here is on DaVinci Resolve and Fusion and how such tools integrate with these in a workflow for visual artists.

### Write with an audience in mind

Target audience of the articles is (maybe) ...

- users / vfx **artists**, using the different tools
- administrators / operators / engineers / **pipeline TDs**, provisioning and maintaining a vfx toolchain
- **developers**, writing tools, coding scripts, implementing drivers and programming visual effects

... with a focus on the latter two (in general very good and extensive manuals exist for the end-users of the tools) and blurred borders between the three.

Please organize / structure your articles with the different audiences in mind; complete articles dedicated to a specific audiences may be tagged as such ... maybe by `#artist`, `#admin`, `#automation`, `#scripting`, `#dev`, or the like? But I can't (and don't want to) set the rules how to do this: I think (hope) that it will just happen with some good examples that others copy and evolve.

### Write with a Wiki in mind

Depending on the source, we will have some material structured like a book - and people tend to build documentation this way. But whenever you ask yourself "how can I bring the files in the Obsidian folder into the right order", or "the order of the articles on the left hand side of MkDocs output is not correct", you are probably on the wrong track! A Wiki is a "network" of articles and not designed to be read from a beginning to an end.

> [!warning] Content will hardly be publishable as a book!
>
> It's really nice, to have manuals as a PDF or an ePub. But, it must be clear that this will unfortunately hardly be possible with the approach pursued here. This is a serious disadvantage of which one must be aware.

### Write with Style

Make sure that you write your text to have a meaning, not a nice formatting. The formatting comes for free and is very flexible if you got the semantics right. If for example you write using tools like Word, Pages, Scrivener, or such, then you are probably on the wrong track as soon as you set a font, its size, a color, or something similar. You almost always want to use a "Style" for that! This way you can set and change the formatting of such elements easily and for each target output format individually.

### Folders vs Tags (Subpages vs Categories)

Subpages help to group articles that belong together. For example all [[Kartaverse]] core technologies are placed in a 'Kartaverse' folder. Categories are a different kind of grouping: Articles from very different subpages can belong to the same category and a single article can belong to multiple categories. There might be for example articles of a 'Reference' kind in very different folders (subpages). In some cases even both groupings can make sense: All the Kartaverse workflows are grouped by a 'Workflows' subpage in the Kartaverse and each such article is tagged as a 'Workflow' (each Kartaverse Workflow is a Workflow, but not every Workflow has to be a Kartaverse Workflow).



