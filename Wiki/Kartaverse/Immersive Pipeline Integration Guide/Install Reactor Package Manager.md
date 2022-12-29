---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

If you already use Blackmagic Design's Resolve, Resolve Studio, or Fusion Studio software then the singular most important tool you can choose to install is likely the free [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067).

The Fusion community developed the Reactor software as a group effort to create a single-stop resource that hosts the largest collection of curated content for extending the capabilities of Resolve/Fusion. Reactor also includes a lot of content that was previously available only on the [VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page) resource.

**YouTube \| Reactor is released - GET IT NOW!**

<https://www.youtube.com/watch?v=mklCsf8yOUk>

[![[Kartaverse/Immersive Pipeline Integration Guide/img/image314.png]]](https://www.youtube.com/watch?v=mklCsf8yOUk)

**YouTube \| Fusion Reactor now available for BMD DaVinci Resolve**

<https://www.youtube.com/watch?v=iEIFl6gp58Q>

[![[Kartaverse/Immersive Pipeline Integration Guide/img/image316.png]]](https://www.youtube.com/watch?v=iEIFl6gp58Q)

So far the Reactor Package Manager has been installed over 190,000 times since 2018! Wow. 🎉

[![[Kartaverse/Immersive Pipeline Integration Guide/img/image90.png]]](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862)

To start using Reactor, first you need to download the [Reactor-Installer.lua](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862) script to your computer.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image261.png]]

Start up a new Resolve (Free), Resolve Studio, or Fusion Studio session. Open the Console window. Then simply drag the installer script from your desktop into the Fusion Console tab to run it.

Note: If you are in the Fusion page or using Fusion Studio you can press the "Shift + 0" shortcut to display the Console window.

If for some reason the drag-and-drop approach to launching the Reactor installer fails to work... Alternatively, you can also copy/paste the text contents of the script into the Console text entry area.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image267.png]]

In the DaVinci Resolve Fusion page and in Fusion Studio you can also drag the script from your desktop into the Nodes view to run it.

When the Reactor Installer starts you are presented with the following dialog. If you want to go with the default settings you simply have to press the "Install and Launch" button.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image384.png]]

Custom Install Path Button

When installing Reactor you also have the option to choose a "Custom Install Path". This button allows you to select a custom location you would like to have the Reactor content installed to. This could be a location like your user account's home folder, or another hard drive on your system, or a mapped network drive mount point for shared usage of Reactor content.

You can change the installed Reactor location later on by modifying the Fusion "PathMap" preferences and pointing the "Reactor:" PathMap at a new folder path.

Reactor Installation Status

Reactor shows a progress bar while the installation process is underway.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image357.png]]

When the Reactor installation is complete an Explorer (Win), Finder (macOS), or Nautilus (Linux) folder browsing window is displayed. This shows you the location on-disk where new Reactor content is downloaded to. This folder in Fusion terms is called the "Reactor:" PathMap location.