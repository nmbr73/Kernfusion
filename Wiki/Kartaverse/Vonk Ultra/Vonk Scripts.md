---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

### Comp Scripts

Comp Scripts

Vonk includes several comp scripts that can be located on disk at:

`Scripts:/Comp/Vonk Ultra/`

Render Selected

The "Render Selected" script will launch a GUI based rendering of the currently active node in the Nodes view. This will re-cook the upstream node branches that lead into the selected node.

#### Vonk Open Sub-Folder

Vonk Open Sub-Folder

The "Open" folder of scripts are used to quickly access Vonk resources.

![[image275.png]]

#### Show Comps Folder

Show Comps Folder

The "Show Comps Folder" menu item opens up the "`Reactor:/Deploy/Comps/Kartaverse/Vonk Ultra/`" folder in a Finder/Explorer/Nautilus window.

#### Show Docs Local

Show Docs Local

The "Show Docs Local" menu item opens up the "`Reactor:/Deploy/Docs/Kartaverse/Vonk Ultra/Vonk Ultra Data Nodes.pdf`" documentation in your operating systems' default PDF viewing tool. This is a local on-disk version of the Vonk documentation guide you are currently reading now.

#### Show Docs Online

Show Docs Online

The "Show Docs Online" menu item displays a Google Docs based online version of the Vonk documentation guide you are currently reading now.

#### Show Fuses Folder

Show Fuses Folder

The "Show Fuses Folder" menu item opens up the "`Fuses:/Kartaverse/Vonk Ultra/`" folder in a Finder/Explorer/Nautilus window.

#### Show Lua Modules Folder

Show Lua Modules Folder

The "Show Lua Modules Folder" menu item opens up the "`Macros:/Kartaverse/Vonk Ultra/`" folder in a Finder/Explorer/Nautilus window.

#### Show Macros Folder

Show Macros Folder

The "Show Macros Folder" menu item opens up the "`Reactor:/Deploy/Modules/Lua/`" folder in a Finder/Explorer/Nautilus window.

#### Show Temp Folder

Show Temp Folder

The "Show Temp Folder" menu item opens up the "`Temp:/Vonk/`" folder in a Finder/Explorer/Nautilus window.

#### Vonk Tools Sub-Folder

Vonk Tools Sub-Folder

The "Tools" folder is used to carry out Vonk centric utility tasks.![[image324.png]]

Create All Data Nodes

The "Create All Data Nodes" menu item adds every single Vonk node to the currently open composite. This is useful if you want to browse visually through the GUIs of the nodes to familiarize yourself with the large collection of fuses.

### Tool Scripts

Tool Scripts

Vonk includes several tool scripts that can be located on disk at:

`Scripts:/Tool/Vonk Ultra/`

These nodes are accessible when you have a node selected in the Nodes view area. Right-clicking on a node will display a pop-up contextual menu. Navigating to the "Script \> Vonk Ultra" menu entry will provide access to Vonk centric scripts that can be run on the active node selection.

You can have one, or more nodes selected when running a Tool script. The Tool script will be launched individually for each item in the selection list. Inside a Tool script a global variable named "tool" will exist that provides the name of the active node.

![[image186.png]]

#### Render Selected

Render Selected

The "Render Selected" script will launch a GUI based rendering of the currently active node in the Nodes view. This will re-cook the upstream node branches that lead into the selected node.