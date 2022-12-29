---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

In order to install KartaVR you need to have Resolve/Fusion and the Reactor Package Manager installed beforehand. To add the KartaVR packages to a new workstation, first start by launching the Reactor Package Manager window.

In Fusion Studio you can do this by opening the root-level "Reactor" menu, then select the "Open Reactor" menu item.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image172.png]]

In Resolve Studio you can do this by opening the root-level "Workspaces" menu, then navigating to the "Scripts \> Comp \> Reactor \> Open Reactor..." menu item.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image371.png]]

When the Reactor Package Manager window loads initially you will see a list of all the atom packages that are able to be installed using this user interface.

Note: The content that is listed in the Reactor window comes from the [Reactor GitLab repository](https://gitlab.com/WeSuckLess/Reactor). If you have an outgoing firewall, or your country/company/ISP (internet service provider) has network filtering rules that block access to GitLab you will have to use another approach to install the Reactor content on your system.

In the Reactor window, double-click on the left side-bar category item labelled "Kartaverse" to expand this hierarchy.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image18.png]]

Then select the "Kartaverse \> KartaVR" sub-category on the left sidebar to shorten the amount of content displayed in the part of the Reactor window where atom packages are listed.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image311.png]]

Click on the package name "KartaVR" in the main part of the Reactor window, and then press the "Install" button.

A progress dialog is displayed that shows each of the files as they are downloaded from the Reactor GitLab repository via cURL and installed into the "Reactor:/Deploy/" PathMap location on your hard disk.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image41.png]]

Several "Install Script Confirmation" dialogs will be displayed during the Reactor installation process. The dialog is asking for your input.

You can press the "OK" button if you would like to set up several preferences automatically during the install of the Reactor "Bin" category content like the FFmpeg utility. Alternatively, you can press the "Cancel Installation" button and that specific "Install Script" item will be skipped.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image75.png]]

After the "KartaVR" content has been fully installed, we then need to click on the package name "KartaVR 3rd Party Libraries" to install it as well. This Reactor package adds the extra open-source utilities needed to efficiently use the KartaVR automation scripts.

The "KartaVR 3rd Party Libraries" atom package description in the Reactor window lists all of the open-source tools you can optionally choose to install.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image148.png]]