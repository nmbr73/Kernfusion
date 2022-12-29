
> [!SUMMARY] A package manager for Resolve/Fusion
> Reactor is a community driven package manager that hosts the largest collection of curated content for extending the capabilities of Resolve/Fusion.

If you already use Blackmagic Design's Resolve, Resolve Studio, or Fusion Studio software then the singular most important tool you can choose to install is likely the free [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067).

The Fusion community developed the Reactor software as a group effort to create a single-stop resource that hosts the largest collection of curated content for extending the capabilities of Resolve/Fusion. Reactor also includes a lot of content that was previously available only on the VFXPedia resource.



## Install Reactor Package Manager

> [!SUMMARY]
> See the [Reactor Release Announcement](https://www.steakunderwater.com/wesuckless/viewtopic.php?t=1814) WSL post for the most recent instructions on on how to download and install Reactor.
>
> Download the [Reactor-Installer.lua](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862) file and drag'n'drop it into your Fusion's [[Nodes panel]].

[YouTube | Reactor is released - GET IT NOW!](https://www.youtube.com/watch?v=mklCsf8yOUk)<iframe width="560" height="315" src="https://www.youtube.com/embed/mklCsf8yOUk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[YouTube | Fusion Reactor now available for BMD Davinci Resolve](https://www.youtube.com/watch?v=iEIFl6gp58Q)<iframe width="560" height="315" src="https://www.youtube.com/embed/iEIFl6gp58Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

So far the Reactor Package Manager has been installed over 190,000 times since 2018!

### Download and run the Installer

To start using Reactor, first you need to download the [Reactor-Installer.lua](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862) script to your computer. 

Start up a new Resolve (Free), Resolve Studio, or Fusion Studio session. Open the Console window. Then simply drag the installer script from your desktop into the Fusion Console tab to run it. 

> [!TIP] Shortcut "Shift + 0" to open the Console
> If you are in the Fusion page or using Fusion Studio you can press the "Shift + 0" shortcut to display the Console window.

If for some reason the drag-and-drop approach to launching the Reactor installer fails to work… Alternatively, you can also copy/paste the text contents of the script into the Console text entry area. 

![[Reactor - Reactor Script in Console.png]]

In the DaVinci Resolve Fusion page and in Fusion Studio you can also drag the script from your desktop into the Nodes view to run it.

When the Reactor Installer starts you are presented with the following dialog. If you want to go with the default settings you simply have to press the "Install and Launch" button.

  ![[Reactor - Ready to Install Dialog.png]]

> [!NOTE] Custom Install Path
> When installing Reactor you also have the option to choose a "Custom Install Path". This button allows you to select a custom location you would like to have the Reactor content installed to. This could be a location like your user account's home folder, or another hard drive on your system, or a mapped network drive mount point for shared usage of Reactor content. 
>
> You can change the installed Reactor location later on by modifying the Fusion "PathMap" preferences and pointing the "Reactor:" PathMap at a new folder path.


### Reactor Installation Status

Reactor shows a progress bar while the installation process is underway.

  ![[Reactor - Reactor Install Progess.png]]

When the Reactor installation is complete an Explorer (Win), Finder (macOS), or Nautilus (Linux) folder browsing window is displayed. This shows you the location on-disk where new Reactor content is downloaded to. This folder in Fusion terms is called the "Reactor:" PathMap location.

## Open Reactor Package Manager

In Fusion Studio you can do this by opening the root-level "Reactor" menu, then select the "Open Reactor" menu item.
![[Reactor - Open Reactor in Fusion.png]]


In Resolve Studio you can do this by opening the root-level "Workspaces" menu, then navigating to the "Scripts > Comp > Reactor > Open Reactor…" menu item.

![[Reactor - Open Reactor in Resolve.png]]

When the Reactor Package Manager window loads initially you will see a list of all the atom packages that are able to be installed using this user interface. 

Note: The content that is listed in the Reactor window comes from the [Reactor GitLab repository](https://gitlab.com/WeSuckLess/Reactor). If you have an outgoing firewall, or your country/company/ISP (internet service provider) has network filtering rules that block access to GitLab you will have to use another approach to install the Reactor content on your system.

### Where to go from here?

There are currently (as of 2022-11-08) a total of 356 atom packages in the Reactor Package Manager. This means there is likely something interesting for just about any type of Resolve/Fusion user's tastes. You may start having a first look at some [[Reactor/Essential Reactor Atom Packages/Essential Reactor Atom Packages]]





