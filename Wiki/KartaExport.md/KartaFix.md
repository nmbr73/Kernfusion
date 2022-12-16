# Immersive Pipeline Integration Guide

Created: 2022-01-29 Last Updated: 2022-12-12 06:00 AM UTC -4

By: Andrew Hazelden \<<andrew@andrewhazelden.com>\>

![[image287.png]]![[image399.png]]

Welcome to the Kartaverse

*Contributed by* [*Andrew
Hazelden*](https://ca.linkedin.com/in/andrewhazelden)

About

As a technical writer and pipeline TD in the visual effects sector, I am
pleased to be able to share a new workflow guide. In time, I hope the
learning content might be deemed an essential read for those interested
in accelerating immersive media post-production workflows using
Blackmagic Design's Resolve Studio and Fusion Studio software as the
central hub-like toolset.

The free guide has over 512 pages of content that covers the primary
steps required to get a working content creation pipeline established
from scratch for artists working at a freelancer, or small boutique
studio scale of operation.

I'll be the first to admit that the document is a long read but you will
be rewarded with a wide range of insights into topics you've likely not
explored in-depth before. Enjoy!

Special Thanks

Special thanks go out to BMD staff including Peter Chamberlain, Steve
Roberts, Kerry de Boer, Stephanie Hueter, Daniel Koch, and Peter Loveday
for their assistance over the many years I've worked on Resolve/Fusion
based community projects. Without their kind and thoughtful help many
projects including this guide would not have been possible for me to
create.

Overview

The pipeline integration guide is written with the goal of helping new
visual effects teams get up-and-running with a BMD (Blackmagic Design)
Resolve Studio v18 & Fusion Studio v18 centric pipeline from scratch.

Since this is a workflow automation focused document, it will also cover
the WSL Reactor Package Manager, the installation and use of render
managers, the installation and configuration of 3rd party DCC (digital
content creation) tools from the perspective of a compositor's needs, an
overview of common Windows/Linux/macOS command-line utilities,
bare-metal Windows/Linux operating system reloads, OpenColorIO,
OpenImageIO, and more.

The end audience for this guide is primarily artists who are considering
adopting "The Kartaverse" pipeline tools into their workflows.

If you would like technical assistance with the Kartaverse, check out
the project's new [Kartaverse Google
Group](https://groups.google.com/g/kartaverse).

Install Reactor Package Manager

If you already use Blackmagic Design's Resolve, Resolve Studio, or
Fusion Studio software then the singular most important tool you can
choose to install is likely the free [Reactor Package
Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067).

The Fusion community developed the Reactor software as a group effort to
create a single-stop resource that hosts the largest collection of
curated content for extending the capabilities of Resolve/Fusion.
Reactor also includes a lot of content that was previously available
only on the
[VFXPedia](https://www.steakunderwater.com/VFXPedia/96.0.243.189/index4875.html?title=Main_Page)
resource.


**YouTube \| Reactor is released - GET IT NOW!**

<https://www.youtube.com/watch?v=mklCsf8yOUk>

[![[image314.png]]](https://www.youtube.com/watch?v=mklCsf8yOUk)

**YouTube \| Fusion Reactor now available for BMD DaVinci Resolve**

<https://www.youtube.com/watch?v=iEIFl6gp58Q>

[![[image316.png]]](https://www.youtube.com/watch?v=iEIFl6gp58Q)

So far the Reactor Package Manager has been installed over 190,000 times
since 2018! Wow. 🎉

[![[image90.png]]](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862)

To start using Reactor, first you need to download the
[Reactor-Installer.lua](https://www.steakunderwater.com/wesuckless/download/file.php?id=4862)
script to your computer.

![[image261.png]]

Start up a new Resolve (Free), Resolve Studio, or Fusion Studio session.
Open the Console window. Then simply drag the installer script from your
desktop into the Fusion Console tab to run it.

Note: If you are in the Fusion page or using Fusion Studio you can press
the "Shift + 0" shortcut to display the Console window.

If for some reason the drag-and-drop approach to launching the Reactor
installer fails to work... Alternatively, you can also copy/paste the
text contents of the script into the Console text entry area.

![[image267.png]]

In the DaVinci Resolve Fusion page and in Fusion Studio you can also
drag the script from your desktop into the Nodes view to run it.

When the Reactor Installer starts you are presented with the following
dialog. If you want to go with the default settings you simply have to
press the "Install and Launch" button.

![[image384.png]]

Custom Install Path Button

When installing Reactor you also have the option to choose a "Custom
Install Path". This button allows you to select a custom location you
would like to have the Reactor content installed to. This could be a
location like your user account's home folder, or another hard drive on
your system, or a mapped network drive mount point for shared usage of
Reactor content.

You can change the installed Reactor location later on by modifying the
Fusion "PathMap" preferences and pointing the "Reactor:" PathMap at a
new folder path.

Reactor Installation Status

Reactor shows a progress bar while the installation process is underway.

![[image357.png]]

When the Reactor installation is complete an Explorer (Win), Finder
(macOS), or Nautilus (Linux) folder browsing window is displayed. This
shows you the location on-disk where new Reactor content is downloaded
to. This folder in Fusion terms is called the "Reactor:" PathMap
location.

# Some Examples to test Styles, Export, Transformation

This is to check what happens to self defined styles in the output.
That's to see how some more *semantic markup* of the text could be
realised and how to preserve the information for output formatting.

Some Lua code as a single `Code Block (Lua)`:

-- defines a factorial function

function fact (n)

if n == 0 then

return 1

else

return n \* fact(n-1)

end

end

print("enter a number:")

a = io.read("\*number") -- read a number

print(fact(a))

And again some Lua code, but this time written down in the corresponding
style instead of selection the text and then setting the style. This way
the "next" option of the Style should take effect and question is, if
this leads to separate paragraphs of the same style or something else.

-- The famous words:

print("Hello World!")

... and we are back to normal.

Essential Reactor Atom Packages

There are currently (as of 2022-11-08) a total of 356 atom packages in
the Reactor Package Manager. This means there is likely something
interesting for just about any type of Resolve/Fusion user's tastes.

If you are regularly creating visual effects in Fusion Studio then the
following Reactor atom packages are likely something you would deem
essential to maintain your productivity and sanity:

-   Attribute Spreadsheet (Batch node editing)
-   Append (Modify clip timings in a node-based fashion)
-   AudioWaveform (Visualize .wav audio files)
-   Batch Change Parameters (Batch node editing)
-   ClassBrowser (Undocumented Scripting API browser)
-   Cryptomatte
-   DeleteFileRequesterHistory (Speed up file dialog load time by
    pruning the recent files list)
-   Eyeon Legacy (Archive Composition Script)
-   Glitch Tools (Create intentional defects / video artifacts in your
    footage)
-   hos_SplitEXR_Ultra (Helps split apart multi-channel EXR footage)
-   KAK (A powerful node-based keyer)
-   Krokodove (The ultimate Fusion motion-graphics toolset)
-   MultiMerge (Merge imagery with a multi-input like layer stack)
-   ml_LFTools (Lens Flares)
-   nuke2fusion (Helps Nuke Users migrate to Fusion with modified hotkey
    bindings and node names)
-   ReadEXR Ultra (Multi-Part EXR reader with filename token support)
-   SlashFor (Batch node editing with expressions in the Console)
-   SuckLessAudio (A modifier to import .wav audio files)
-   stx_tools (Custom macros including an optical flow based warp
    tracker)
-   STMapper (An amazing UV Pass/ST Map warping DCTL Fuse. It's SO
    FAST!!!)
-   Shadertoys (A wild visual trip with DCTL ports of popular ShaderToy
    fragment shaders)
-   TimeMachine (Retime nodes)
-   Tintensity (Color Correction)
-   UI Manager Lua & Python Examples (Code examples for creating custom
    Qt based GUIs in scripts)
-   LifeSaver (Multi-Part EXR writer with filename token support)
-   ParallelIO pioSaver (Multi-Channel EXR writer with filename token
    support)

Adding KartaVR via Reactor

In order to install KartaVR you need to have Resolve/Fusion and the
Reactor Package Manager installed beforehand. To add the KartaVR
packages to a new workstation, first start by launching the Reactor
Package Manager window.

In Fusion Studio you can do this by opening the root-level "Reactor"
menu, then select the "Open Reactor" menu item.

![[image172.png]]

In Resolve Studio you can do this by opening the root-level "Workspaces"
menu, then navigating to the "Scripts \> Comp \> Reactor \> Open
Reactor..." menu item.

![[image371.png]]

When the Reactor Package Manager window loads initially you will see a
list of all the atom packages that are able to be installed using this
user interface.

Note: The content that is listed in the Reactor window comes from the
[Reactor GitLab repository](https://gitlab.com/WeSuckLess/Reactor). If
you have an outgoing firewall, or your country/company/ISP (internet
service provider) has network filtering rules that block access to
GitLab you will have to use another approach to install the Reactor
content on your system.

In the Reactor window, double-click on the left side-bar category item
labelled "Kartaverse" to expand this hierarchy.

![[image18.png]]

Then select the "Kartaverse \> KartaVR" sub-category on the left sidebar
to shorten the amount of content displayed in the part of the Reactor
window where atom packages are listed.

![[image311.png]]

Click on the package name "KartaVR" in the main part of the Reactor
window, and then press the "Install" button.

A progress dialog is displayed that shows each of the files as they are
downloaded from the Reactor GitLab repository via cURL and installed
into the "Reactor:/Deploy/" PathMap location on your hard disk.

![[image41.png]]

Several "Install Script Confirmation" dialogs will be displayed during
the Reactor installation process. The dialog is asking for your input.

You can press the "OK" button if you would like to set up several
preferences automatically during the install of the Reactor "Bin"
category content like the FFmpeg utility. Alternatively, you can press
the "Cancel Installation" button and that specific "Install Script" item
will be skipped.

![[image75.png]]

After the "KartaVR" content has been fully installed, we then need to
click on the package name "KartaVR 3rd Party Libraries" to install it as
well. This Reactor package adds the extra open-source utilities needed
to efficiently use the KartaVR automation scripts.

The "KartaVR 3rd Party Libraries" atom package description in the
Reactor window lists all of the open-source tools you can optionally
choose to install.

![[image148.png]]

Adding Vonk Ultra via Reactor

Vonk Ultra provides a wide range of "data node" fuses that allow you to
create efficient node graphs in Fusion that directly work with text,
numbers, CSV spreadsheets, JSON, XML, YAML, and many other types of data
using modifier nodes. More information about [Vonk Ultra can be read in
the
documentation](https://docs.google.com/document/d/1U9WfdHlE1AZHdU6_ZQCB1I2nSa5I7TyHG2vKMi2I7v8/edit?usp=sharing).

After you have the Reactor Package Manager window open again, you have
the option to select the "Kartaverse \> Vonk Ultra" category on the left
sidebar.

To install Vonk Ultra, click on the package named "Vonk Ultra", and then
press the "Install" button. This will automatically install each of the
required Vonk sub-packages in a single step.

![[image121.png]]

Once the Reactor installation process is complete, please relaunch
Resolve or Fusion standalone. This will cause Fusion to scan for and
then load the new fuses we just installed. Scanning for new fuses is a
process only done when Fusion first starts up.
