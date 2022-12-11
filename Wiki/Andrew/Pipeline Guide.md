- Krokodove Essentials: https://docs.google.com/document/d/1geePjQ5gqkF8AEFA00M15sdk63SVpq304ehnYqF9-r8/edit

- **Kartaverse Workflows: Immersive Pipeline Integration Guide**: https://docs.google.com/document/d/1tewIaHZh8mWI8x5BzlpZBkF8eXhK2b_XhTWiU_93HBA/edit#heading=h.k0ukquu0neab




Kartaverse Workflows

Immersive Pipeline Integration Guide

# First Edition

Created: 2022-01-29 Last Updated: 2022-12-03 10.55 PM (UTC -4)

By: Andrew Hazelden <[andrew@andrewhazelden.com](mailto:andrew@andrewhazelden.com)>


![[Pipeline Guide.img/Resolve Studio Splash.png]]![[Pipeline Guide.img/Fusion Studio Splash.png]]

# Overview

The pipeline integration guide is written with the goal of helping new visual effects teams get up-and-running with a BMD (Blackmagic Design) Resolve Studio v18 & Fusion Studio v18 centric pipeline from scratch.



Since this is a workflow automation focused document, it will also cover the WSL Reactor Package Manager, the installation and use of render managers, the installation and configuration of 3rd party DCC (digital content creation) tools from the perspective of a compositor's needs, an overview of common Windows/Linux/macOS command-line utilities, bare-metal Windows/Linux operating system reloads, OpenColorIO, OpenImageIO, and more.



The end audience for this guide is primarily artists who are considering adopting "The Kartaverse" pipeline tools into their workflows.



If you would like technical assistance with the Kartaverse, check out the project's new [Kartaverse Google Group](https://groups.google.com/g/kartaverse).



- [[Reactor#Install Reactor Package Manager]]
- [[KartaVR#Adding KartaVR via Reactor]]
- [[Vonk Ultra#Adding Vonk Ultra via Reactor]]

- [[Kartaverse]]





# Fusion Render Node Customization

It is important to customize the Fusion Render node program's PathMap settings if you would like your render farm  to be able to access the same Reactor content that you have installed in Resolve/Fusion on your laptop/desktop/workstation. This is especially true after fuses are installed using the Reactor Package Manager. 



If you rely on fuses, OFX plugins, or FusionSDK C++ compiled plugins, you need to pre-install the 3rd party addons on each render node in your render farm. If you send a Fusion composite to a render farm node that lacks a required plugin it will generate an error during the batch rendering process.



Something that can help reduce the pain of setting up and syncing Reactor content across a render farm is sharing the exact same Reactor content across a mapped SMB drive mount, or on a NFS shared mount point.



An extra step that can often be overlooked is the requirement to configure a custom "LuaModules:" PathMap entry in the Fusion Render Node app preferences to avoid Fusion Render Manager errors when batch rendering comps that use fuses like the Vonk data nodes or Cryptomatte.



Note: The example below shows the PathMaps used for locally installed Reactor content that was added to a Reactor default "AllData:" folder based install. 



You can point the "Reactor:" PathMap at any folder path you need to as long as it is not a UNC path, and it doesn't have high-ASCII or unicode multibyte extended characters in the filepath. 



Make sure to have a trailing slash on the final absolute filepath used to define the PathMap entry for your version of the "From: Reactor:'' and “To: /Volumes/Some/Random/Pipeline/Folder/Path/Reactor/" install location.

## Configuring Fusion Render Node PathMaps



1. Open the Fusion Render Node program and select the "Preferences..." menu item.



![[Pipeline Guide.img/Untitled.png]]



2. Click on the "Global Settings > Path Map" category on the left side of the Preferences window.



![[Pipeline Guide.img/Untitled_1.png]]



3. At the bottom of the window click on the "New" button to add a new entry to the "User" section of the "Path Map" view.



4. Enter the following settings From: LuaModules: and To: UserPaths:Modules/Lua. Click the "Save" button to retain these settings.



5. If you don't have Reactor Path Map entries added to Fusion Render Node already, then you might have to further customize the preferences to add values like:



Windows:



From: Reactor: and To: C:\ProgramData\Blackmagic Design\Fusion\Reactor\



macOS:



From: Reactor: and To: /Library/Application Support/Blackmagic Design/Fusion/Reactor/



Linux:



From: Reactor: and To: /var/BlackmagicDesign/Fusion/Reactor/



Also you would need to edit the pre-existing UserPaths PathMap entry:



From: UserPaths: and To: UserData:;AllData:;Fusion:;Reactor:Deploy



6. Restart Fusion Render Manager to lock in these values.



Note: If the LuaModules PathMap entries were not added to Fusion Render Node's preferences, a typical error message in Fusion Render Node would look a bit like this:



14/Apr/22 16:12:50: .../Fusion/Fuses/Vonk Ultra/Text/Create/vTextFromArray.fuse:5: module 'vjsonutils' not found:

no field package.preload['vjsonutils']

no file 'LuaModules:vjsonutils.lua'

no file 'LuaModules:vjsonutils/init.lua'

no file 'LuaModules:vjsonutils.so'

# Automated Reactor PathMaps in Resolve Studio and Fusion Studio

If you need to install Reactor on an entire render farm, the following guide explains how to configure the preferences using command-prompt based shell scripting:



[https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42846#p42846](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42846#p42846)

![[Pipeline Guide.img/Untitled_2.png]]

Installing the BMD Resolve / Fusion Software

Blackmagic Design's Resolve software is a powerful editing and color correction environment. Resolve is a mainstay at many high-end post-production facilities in the film & TV sector.



Blackmagic Design's Fusion Studio software is a node-based compositing environment that allows for the creation of high-quality visual effects shots. Fusion provides artists with a very capable 2.5D compositing environment, and supports the design of complex animated 2D/3D motion graphics with a high level of node-based proceduralism. Fusion also enables 360VR content creation, and more.

## Download Resolve/Fusion Studio from BMD's Website

If you want to install the absolutely latest release of Resolve or Fusion you should go directly to the BMD Support Center Website to access the installers: 

[https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion](https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion)



![[Pipeline Guide.img/BMD Support Center.png]]



Alternatively, the Steak Underwater Fusion community forum has a concise list of all BMD [Resolve](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=38797#p38797) and [Fusion](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=26553#p26553) releases with download links.

# Resolve (Free)

If you are looking for "Resolve (free)" it is listed in the BMD support center as simply "Resolve". Resolve (Free)'s software license terms allow for both personal and commercial use of the software at no cost. 

### Resolve (free) 18.1 Linux Download

[https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Linux](https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Linux)

### Resolve (free) 18.1 Windows Download

[https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Windows](https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Windows)

### Resolve (free) 18.1 macOS Download

[https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Mac%20OS%20X](https://www.blackmagicdesign.com/ca/support/download/ce671c375b4d48e2bf9dc5fb422aa9c9/Mac%20OS%20X)

## About Resolve and the Fusion Page

Blackmagic Design provides access to a version of the Fusion compositing environment as a custom page in the Resolve software called the "Fusion" page.



![[Pipeline Guide.img/Resolve Fusion page.png]]



The Fusion page environment allows video editors to create their own title templates in Fusion and use them on the Edit page. The Fusion page node-based environment makes it a quick job to perform basic visual effects compositing tasks inside a larger Resolve project. 



The Fusion page availability in Resolve (Free) led to the retirement of the earlier Fusion (Free) Standalone product at Fusion v9. If you want access to a standalone version of Fusion that is only found in the Fusion Studio product.



The Fusion page adds a new analogy of a "MediaIn" and "MediaOut" node which interfaces with the Media Pool/Edit/Delivery pages, in addition to the traditional "Loader" and "Saver" nodes used in Fusion for working with image sequences like OpenEXR format media.



The primary limitation of the free version of Resolve is that it can export footage at up to 3840x2160px resolution. This resolution limit is enforced as a maximum of 3840 px on the horizontal axis, and a maximum of 2160px on the vertical axis. A variety of advanced features like optical flow support, HMD previewing, and several other Fusion nodes are held back until you upgrade to Resolve Studio or Fusion Studio. 



All in all, most people can get quite far in their everyday workflows in Resolve (Free). 



If you are a freelancer doing multi-pass compositing with 4K UHD resolution EXR footage you can be very productive using merely the Resolve (Free) Fusion page environment. This is an optimal configuration to use while you are quickly mastering new skills and learning what is possible with the toolset.

# Resolve Studio (Paid)

![[Pipeline Guide.img/Resolve Studio Splash_1.png]]



The paid version of Resolve is known as "Resolve Studio". 



There is a separate installer for Resolve Studio that is available on the BMD Support Center website. This is a separate download from the previous free version of Resolve that you might already have installed while you were evaluating the software. The two Resolve installers place the files at the same location on your hard disk so only one of them can exist at a time.



The paid version, Resolve Studio, is activated using either: a Resolve Studio "activation card" license, or a hardware-based USB licensing dongle that holds a Resolve Studio or a Fusion Studio v7-18+ license.

### Resolve Studio 18.1 Linux Download

[https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Linux](https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Linux)

### Resolve Studio 18.1 Windows Download

[https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Windows](https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Windows)

### Resolve Studio 18.1 macOS Download

[https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Mac%20OS%20X](https://www.blackmagicdesign.com/ca/support/download/2ff9be8a1a9c4082b1fe977133816b6a/Mac%20OS%20X)

## Resolve Studio Improvements over the Resolve (Free) Fusion page



Resolve Studio unlocks access to higher-resolution rendering support, provides improved GPU-based hardware acceleration options, unlocks FusionSDK compiled plugin support for running tools like Krokodove, and gives access to external command-line automation via FuScript/Lua/Python. The paid version also adds machine learning features, optical flow, z-depth/disparity generator tools, 360VR headset preview support in the Fusion page, stereo 3D tools, and more.

# Fusion Studio Standalone (Paid)

![[Pipeline Guide.img/Fusion Studio Splash_1.png]]



"Fusion Studio" is the term for the dedicated standalone version of the Fusion compositing environment. Fusion Studio v18 can be activated with a Fusion Studio v7-18+ hardware-based USB dongle license, a Resolve Studio dongle license, or with a Resolve Studio "activation card" license.

### Fusion Studio 18.1 Linux Download

[https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Linux](https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Linux)

### Fusion Studio 18.1 Windows Download

[https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Windows](https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Windows)

### Fusion Studio 18.1 macOS Download

[https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Mac%20OS%20X](https://www.blackmagicdesign.com/ca/support/download/5b520062049c4182bd3ee66ffad6df4d/Mac%20OS%20X)

## Fusion Studio Improvements over the Resolve (Free) Fusion page

Fusion Studio provides a dedicated, full-screen, standalone environment for compositing without the overhead of having all of Resolve loaded into memory at the same time. 



Fusion Studio also saves your project files into .comp format documents. The .comp file format holds plain text encoded Lua table data which is easier to manage and backup inside of a larger visual effects production pipeline.



The paid Fusion Studio product unlocks access to higher-resolution rendering support, provides improved GPU-based hardware acceleration options, unlocks FusionSDK compiled plugin support for running tools like Krokodove, and gives access to external command-line automation via FuScript/Lua/Python. The paid version also adds machine learning features, optical flow, z-depth/disparity generator tools, 360VR headset preview support in the Fusion page, stereo 3D tools, and more.



If you have Fusion Studio installed on your system you also have the ability to access and use the Fusion Render Node program which allows for a near unlimited number of render nodes to be run on the same LAN based subnet with no additional license costs from BMD. This feature can massively speed up your rendering productivity on projects that require faster turn around.



Fusion Studio Standalone has a built-in Render Manager feature that works well for freelance, and solo-artists who work primarily from a single workstation based GUI session in a home-office or small office environment. The Fusion Studio bundled Render Manager is accessed using the "File > Render Manager" menu item or the "Control + M" hotkey.



![[Pipeline Guide.img/Fusion Render Manager.png]]

# Fusion Render Node

The Fusion Render Node program is available if you have a Fusion Studio license active on your LAN based subnet. Fusion Render Node is provided as a separate installer bundled alongside the Fusion Studio download from the BMD Support Center website.



![[Pipeline Guide.img/Fusion Render Node Install.png]]




When getting started, the Fusion Render Node program is typically controlled from inside a Fusion Studio based artist session using the "Fusion Render Manager". 



The Fusion render node program can also be launched directly from the command-prompt with CLI arguments, or you can control the render node software from an external render manager program of your choice.

## Command Line Usage

If you launch Fusion Render Node from a Terminal/Command-Prompt window with the "-h" help flag added to the end of the line, you will see a list of the full commands that are available for your use:



"/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node" -h



Fusion Render Node [<filename.comp> | <filename.dfq>] [/quiet] [/render [/frames <frameset>] [/start <frame>] [/end <frame>] [/step <step>] [/quit]] [/listen] [/join <host>] [/log <filename>] [/cleanlog] [/verbose] [/quietlicense] [/version] [/pri high|above|normal|below|idle] [/args [...]] [/execute <script string>]



When you render a Fusion .comp file via the command prompt, the program control can be managed 100% manually under human control using the following style of shell syntax:



"/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node" "/Users/vfx/Documents/MyProject/MyProject.comp" -render -verbose -quit



If you need a quick way to grab the filepath for your .comp document in the Finder (macOS) environment, you can right-click on the file with the ALT/Option key held down on the keyboard. A contextual menu item appears with a "Copy as Pathname" menu item. This will place the full absolute file path to the document in your MacOS copy/paste clipboard.



![[Pipeline Guide.img/Fusion Render Node - Copy as Path.png]]



On Windows 10/11 you have a similar feature that lets you right-click on a file, with the shift-key held down. A contextual menu item appears with a "Copy as Path" menu item.



![[Pipeline Guide.img/Fusion Render Node Windows Copy as Path.png]]

## External Render Manager Usage

If you have a team of artists who rely on Fusion Render Node, as part of a larger post-production workflow, you will likely experience productivity benefits from adopting a 3rd party render manager like the [Amazon AWS Thinkbox Deadline](https://aws.amazon.com/thinkbox-deadline/) or [Pixar Tractor](https://renderman.pixar.com/tractor) software. 



Having an external render management tool, that was made by a 3rd party company, allows you to combine Fusion based comp rendering jobs alongside your existing 3D rendering workloads coming from a 3D department.



Using a render manager like Deadline makes it easy to control the order of operations for a group of tasks, called a “[job batch](https://www.awsthinkbox.com/blog/job-batches-a-guide)”, when they are computed on a render farm. This is often called a linked "dependent task". 



Having a dependent job submitted to Deadline, in a single step, reduces the amount of manual "render wrangling" a human operator has to do when supervising complex jobs running on a large farm.



The "Submit Fusion Job to Deadline" scripted tool is used to define the Fusion .comp file you would like to render, the frame range to render, how many frames should be rendered per-job task, the version of Fusion Render Node to use, and many other options.

![[Pipeline Guide.img/Deadline Submit Fusion Job.png]]

# Automated Fusion Studio Installs

Here is a guide that covers automated installation of Fusion Studio and Fusion Render Node from the command-line:

[https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12528#p12528](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12528#p12528)

# Fusion Studio Standalone on Linux Preferences

-   Fusion Studio > Preferences > User Interface


-   [x] Use gray background interface

-   [ ] Auto control close tools


-   Fusion Studio > Preferences > PathMap


-   [x] Enable reverse mapping of non-user paths


-   Fusion Studio > Preferences > Memory > Interactive Render


-   [x] Simultaneous Branching


-   Fusion Studio > Preferences > Memory > Final Render:


-   Render 10 frames at once

-   [x] Simultaneous Branching


-   Fusion Studio > Preferences > Frame Format > Color depth


-   32 bits float per channel (128 bit)


-   Fusion Studio > Preferences > Flow > [ ] Auto remove routers

-   Fusion Studio > Preferences > Tweaks > OpenGL > [x] Use float16 textures


-   Fusion Studio > Preferences > Script > Options > Script editor:


-   /usr/bin/gedit


-   Fusion Studio > Preferences > Script > Python Version: 


-   Python 2.7

-   Python 3.10


# Install Resolve Studio on Linux

Resolve Install Folder Path:

/opt/resolve/

# Resolve Studio on Linux Preferences

-   User > UI Settings


-   [x] Reload lask working project when logging in

-   [x] Use gray background for user interface

-   [x] Use gray background in viewers


-   User > Project Save and Load


-   [x] Live Save

-   [x] Project Backups


-   System > General > General Preferences


-   External scripting using: Network


-   System > Media Storage


-   [x] Direct I/O

-   Mount: /home/vfx/Documents/BlackmagicDesign/DaVinci Resolve/ResolveCache


-   Fusion Settings > Script > Options > Script editor:


-   /usr/bin/gedit


-   Fusion Settings > Script > Python Version: 


-   Python 2.7

-   Python 3.10


-   Fusion > Fusion Settings > General > [x] Summarize Load Errors


Getting Started With Nodes in Fusion

If you are getting started with Fusion it can be a bit scary using nodes for the first time.

# Loading Imagery

![[Pipeline Guide.img/fusion-essentials-loading-and-saving-footage.png]]

Imagery is imported into Fusion using Loader or MediaIn nodes.



Imagery is exported from Fusion using Saver or MediaOut nodes. 



If your Fusion timeline is set to have a single frame range (the start frame and end frame values are the same) you will be rendering a still image with your Saver node. If your Fusion timeline has a start frame and end frame range with different values, you will be exporting an image sequence.



When you are rendering imagery with a Saver node, frame padding is defined in an image sequence filename by writing in a frame number like 0000 to to match the number of zero padded digits you want in the final image:



C:\media\image_sequence.0000.exr



You can render an image to your operating system's temp folder using a Fusion feature called a "path map" which is a relative path that is used in place of the drive name:



Temp:\image_sequence.0000.exr



There is a path map option "Comp:\" that can be used to load imagery relative to the location of the current Fusion .comp compositing file. This makes it easy to move .comp projects between systems.



Comp:\image.0000.exr

# Making Node Connections

Nodes are connected in Fusion by dragging a line from a red "output" box shape on one node into a triangle shaped "input" on another node.



![[Pipeline Guide.img/fusion-essentials-connecting-nodes.png]]



If you want to connect a macro with multiple output "red" boxes like the "VerticalCross2CubicFaces" macro to your node graph, it helps if you hover your cursor over the red box shape so a tooltip will pop-up with the name of the specific output.



![[Pipeline Guide.img/fusion-essentials-node-outputs.png]]



To view the current output of a node, you need to drag the node from the flow view to a viewer window. This will update the viewer window with that node's output.



If you drag a node with the shift key held down you can completely disconnect it from a node graph.



You can break the connection of a node by hovering over the starting part or ending part of a connection line. When the line end part turns light blue you can drag it away from the connection point and the node will be disconnected.



![[Pipeline Guide.img/fusion-essentials-disconnecting-a-node.gif]]



If you want to make a connection to a node that has multiple inputs, you can hold down the ALT/Option key on your keyboard as you drag a new connection line to the node shape. A handy popup will appear that lists each of the inputs by name.



![[Pipeline Guide.img/fusion-essentials-alt-key-node-popup.png]]

# The Fusion Viewer Window

You can toggle to a single viewer or a double viewer window layout using the following icon at the top of the screen:



![[Pipeline Guide.img/fusion-essentials-view-layouts.png]]



This is the typical viewer window layout in Fusion where there are two viewer windows available at the top of the Fusion UI.



![[Pipeline Guide.img/fusion-essentials-viewer-window.png]]

When a node is selected in the "flow" area, you can load its imagery into a specific viewer window by clicking with the left mouse button and dragging that node icon into the viewer window.



Another way to load a node's imagery into a specific viewer window is by pressing the "1" key for the left viewer window, or the "2" key for the right viewer window. To clear the imagery out of both viewer windows press the backquote "tilde" key that is located just below the escape key on most keyboards.

## Color and Viewer LUTs

![[Pipeline Guide.img/fusion-essentials-color-channels.png]]

You can access individual color channels in the viewer window's toolbar with the color channel menu, or by clicking in the viewer window and pressing the hotkeys C (Shows the Color RGB Channels), R (Shows the Red Channel), G (Shows the Green Channel), B (Shows the Blue Channel), or A (Shows the Alpha Channel).



If you are working with EXR format multi-channel imagery that includes extra image channels, more entries will be displayed in the color channel menus for items like Z-Depth, Disparity X/Y, Motion Vectors, etc.

![[Pipeline Guide.img/fusion-essentials-lut.png]]

The LUT button allows you to change the viewer windows' preview LUT (Look Up Table) which means you can preview the effect of different color spaces on your imagery. This is useful for viewing RAW, sRGB, or Linear gamma based imagery. If your imagery looks washed out when loaded in Fusion it is typically due to a LUT setting mismatch.

![[Pipeline Guide.img/fusion-essentials-ociocolorspaceviewlut.png]]

If you need to preview imagery in a color space other than the footage's native format, I recommend you try out the OpenColorIO based LUT menu option called OCIO ColorSpace ViewLUT as it is one of the easiest to use.



When the OCIO ColorSpace LUT is active, you can select the Edit... option in the LUT menu and change the OpenColorIO source space and output space to match your footage and monitor settings. This is handy for previewing LWF linear workflow based EXRs imagery in a monitor native sRGB format.



As a tip, you can type a Color Gamma value of 2.2 into the OCIO ColorSpace LUT window to perform a "live" on the fly linear workflow gamma 1.0 to sRGB gamma 2.2 conversion that will be displayed only in the Viewer window but the linear color values in the final rendered imagery with be unaffected.

## Viewer Zoom

![[Pipeline Guide.img/fusion-essentials-zoom-levels.png]]

If an image is too large to easily be seen in the viewer window, you can press the "FIT" icon in the viewer window to scale the imagery to the size of the viewer window. The hotkey for fitting the image to the viewer window is Control + F (Win/Linux) or Command + F (macOS).



You can adjust the image zoom level in the viewer window with the menu that is located to the left of the fit icon. To jump to the 100% zoom level you can use the Control + 1 (Win/Linux) or Command + 1 (macOS) hotkey on your keyboard.



Holding down the Control key (Win/Linux) or  Command key(macOS) and scrolling the mouse wheel also allows you to zoom in/out on the imagery in the viewer window.

## Viewer Transparency

![[Pipeline Guide.img/fusion-essentials-transparent-checker-bg.png]]

The viewer "•••" kebab menu (the menu entry with three dots) has a "Checker Underlay" option that is used to toggle on/off the transparent background checkerboard pattern in the viewer. This will allow you to either have a black background shown behind your transparent alpha channel image areas or a dark grey checker pattern.

## Proxy Modes

There are two proxy mode buttons in the Fusion UI. The proxy buttons are labeled "Prx" and "APrx" and are located just below the timeline, to the right of the playback controls.

When you use the left mouse button to click on the "Prx" button you can toggle the proxy mode ON or OFF.



![[Pipeline Guide.img/proxy-icons.png]]

When the proxy mode is enabled, the viewer windows are rendered at a reduced resolution compared to your final output setting. This makes Fusion's viewer windows more responsive and interactive which is quite noticeable when you start to adjust nodes and update the node settings on footage over 2K in resolution. 



Using proxies as you develop a new comp is a very effective way to improve the rendering speed in your Viewer windows which is an essential workflow technique when working with high resolution media or on demanding composites that are slow to render.



![[Pipeline Guide.img/proxy-resolution.png]]

If you click on the "Prx" button with your right mouse button, a popup menu will appear that lets you adjust the level of the proxy resolution reduction that is used when the proxy mode is enabled.



Proxy level "1" will render the viewer window at full resolution. Setting the proxy level to a value higher than "1" will cause Fusion to reduce the quality of the imagery in the viewport by drastically reducing the render resolution. The proxy control has the ability to massively increase the speed that Fusion can update the imagery that is displayed in the viewer windows.



The "APrx" button is the Auto Proxy mode and it is used to provide a way to have a "draft quality" like proxy mode enabled. The APrx feature is activated the moment you start adjusting sliders and settings for a node, which allows you to have a real-time preview of the changes. When you stop adjusting the node settings, the auto proxy rendering state will deactivate and then your standard resolution / proxy settings will be used.



# Adding Nodes Quickly

![[Pipeline Guide.img/add-tool-dialog.png]]

When you are working in Fusion's flow area, you can press the Shift + Space hotkey to open up the Add Tool dialog. This window provides a quick way to add new tools and macros to your scene without having to navigate through the menu system to find the right item.



As you type in the name of the tool or macro you want to add, the list is updated with matching entries. You can type in partial names and the window will search for the closest item. In this example I typed in "Alpha" in the text field at the bottom of the dialog and only the nodes and macros with alpha in part of their name are listed.



![[Pipeline Guide.img/add-tool-dialog-alpha.png]]



Resolve/Fusion Scripting

Resolve Studio's scripting API and pipeline customization support has slowly improved since Python and Lua scripting were added in Resolve v15 back in 2018. The Resolve scripting API was originally added at the same time as the Fusion page was brought into Resolve since it was derived from Fusion Studio's pre-existing FuScript bindings.

## Scripting Options

Resolve Studio/Fusion Studio supports running scripts using Python 2.7 & 3.6-3.10+, as well as Lua scripting. There is a "[Python Script Snippets for Fusion TDs](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11955#p11955)" Steakunderwater thread that collects useful Python compatible code snippets in one convenient place.

## GUI Toolkits

If you create a Resolve script using Python or Lua you have the option of using an integrated GUI creation toolkit called "UI Manager" which is based upon the QT window manager. If you require more complex GUI creation tools you can also bring along your own [PySide](https://www.qt.io/qt-for-python) install.



The Lua and Python scripting documentation for the Resolve API is located on-disk in the Developer folder. Additionally, there is a "Workflow Integrations" interface which adds NodeJS based scripting, too.



![[Pipeline Guide.img/Screen Shot 2022-11-09 at 6.34.24 AM.png]]



Note: The "[README.txt](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=36549#p36549)" file in the Workflow Integrations folder also includes an aside that talks briefly about UI Manager. This readme document acts as the only official notes published by Blackmagic Design about the existence of the UI Manager GUI creation toolkit. 



In part, this sparse documentation situation is due to the fact that the Fusion 8 Scripting Guide PDF was published prior to the addition of the UI Manager library in Resolve/Fusion. 



This "README.txt" file is located on-disk at:

#### Windows Docs:

C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\Developer\Workflow Integrations\README.txt

#### macOS Docs:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Developer/Workflow Integrations/README.txt

#### Linux Docs:

Path to be validated.

## Script Paths

User created Python and Lua scripts are placed on-disk in either of the two Resolve based "Scripts" folders:



C:\Users\<User Account>\AppData\Roaming\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\



C:\ProgramData\Blackmagic Design\DaVinci Resolve\Fusion\Scripts\



It is also possible to configure a relative filepath system called a "PathMap'' which allows you to use a custom folder path for storing scripts, macros, and other resources. This is customized in the "Fusion > Fusion Settings…" menu. In the Fusion Settings window, look under the left sidebar entry labelled "PathMaps".



![[Pipeline Guide.img/Resolve Pathmap Settings.png]]

### Fusion Class Browser Script

There is a 3rd Party Scripting API browser tool distributed in the Reactor Package Manager called the "Fusion Class Browser" that is helpful for learning more about undocumented scripting API features. 



This screenshot shows the results from examining the available Fairlight API functions using the Fusion Class Browser script.



![[Pipeline Guide.img/Reactor Class Browser Script.png]]

### UI Manager Scripting Examples

The Steakunderwater Fusion community forum's "[Building GUIs With Fusion's UI Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=10463#p10463)" scripting thread provides example Lua and Python code to get you started. 



There is a companion "UI Manager Lua & Python Examples" package in the Reactor Package Manager that simplifies the steps needed to download and install the collection of example script resources.



![[Pipeline Guide.img/UI Manager.png]]

### ScriptLib Files

Fusion has a .scriptlib file based-approach that can be used to run Lua code when a fresh Fusion session is started, or a new comp is created. Scriptlib files also allow the addition of new 3rd party Lua functions and global variables that are then available in all other Lua scripts you might run, and in fresh Fusion Console window sessions.



The Reactor Package Manager provides a "Resolve Essentials" atom package that improves the QoL (Quality of Life) for Resolve based scripting enthusiasts. This package also restores a missing scriptlib file that comes included with Fusion Studio but not with Resolve Studio. 



This resource is copied into the scripts PathMap-based folder location of:

Scripts:/bmd.scriptlib



Which in Reactor terms equates to:

Reactor:/Deploy/Scripts/bmd.scriptlib

### Actions/Event Callbacks

Resolve's Fusion page has an action/event callback system that is implemented via .fu and .zfu files. These documents are placed in the "Config:/" PathMap folder. 



A .fu file is a configuration document that is stored in a Lua table based text file. A .zfu file is a zip archive that holds a .fu file and any extra supporting resources like companion scripts or PNG formatted icons at the base level of the zip file with no encapsulating folders.



If a user-created action needs access to an on-disk resource, there is a "$CFG/" token value that can be entered as a prefix to a Lua script's file path entry. This $CFG token represents the parent folder where the .zfu/.fu file is located on-disk:



Execute = [[target:RunScript("$CFG/SomeScript.lua", { mousex = args._sxpos, mousey = args._sypos })]],



A .fu file can be used to create new menus in Fusion Standalone, assign hotkeys to scripts and actions, and capture event hooks for many of the tasks a compositor carries out, as well as add drag-n-drop support for processing files dragged from a Desktop folder browsing window into the Nodes view.



The UI Manager example scripts include a minimal prototype of a QT-based Action/Event script listener tool called "Action Listener". This script can help you discover new and novel ways to automate your compositing workflows.



![[Pipeline Guide.img/Action Listener 1.png]]

## GPU Accelerated Effects

The Edit/Color/Fusion pages all support the use of OFX plugins. 



There is a customized version of the OFX plugin development documentation available in Resolve's Developer folder.



![[Pipeline Guide.img/OpenFX Plugin Development Folder.png]]



Resolve also has a DCTL (DaVinci Color Transform Language) that is used to create LUTS. More information about DCTL is available in BMD's Docs. Also check out the [BaldAvenger GitHub repository](https://github.com/baldavenger/BaldavengerOFX) for code examples.



![[Pipeline Guide.img/DCTL Plugin Development Folder.png]]



The addition of the Fusion page in Resolve allowed for the inclusion of an "Effects Template" feature. These templates are installed using .setting and .drfx files which are based around Fusion macros that are packaged and used directly on clips in a video editing timeline.



This system allows for any Fusion node to be wrapped into a Group/Macro container object and exported for use in the Edit page.



![[Pipeline Guide.img/Resolve Effects Templates.png]]



Custom GUI controls added to an Effects Template "macro" are accessible in the Inspector view on the Edit Page.



![[Pipeline Guide.img/Resolve Effects Template in Edit Page Inspector.png]]



You are able to refine an Edit page effect using the controls provided by the Fusion page. This is done by clicking the small magic-wand icon next to the macro's name in the Inspector window. The magic-wand icon has a small arrow pointing towards the base of the wand.



![[Pipeline Guide.img/Resolve Effects Template Wand in Inspector.png]]



Switching from the Edit page into the Fusion page in this fashion provides access to Fusion's traditional Spline and Keyframe editor views. 



These animation editing controls in Fusion are more full-featured for adjusting keyframes and spline curve tangents than is possible with traditional ResolveFX/OFX Plugins that are animated on the Edit page.



![[Pipeline Guide.img/Resolve Effects Template in Fusion Page Curves.png]]

### Fusion SDK

The Fusion page also has a Fusion SDK which is a C++ API. This development kit allows the creation of 2D Effects, 3D workspace based content, Renderer3D node based plugin rendering engines, the addition of new Loader/Saver node file formats, and more to be created. 



The FusionSDK C++ files are available by request to developers at zero cost but require the signing of an NDA (Non-Disclosure Agreement) with the BMD Developer program.



I'd suggest you try contacting BMD's support team about this topic, or if you happen to see Steve Roberts or Matt Jefferson at a BMD booth at a tradeshow event near you, make sure to ask them for more details while meeting them in-person.

## Fuse SDK

The Fusion page has a Fuse API which allows DCTL(DaVinci Color Transform Language) based hardware accelerated graphics operations to be done inside a Lua scripted node that works seamlessly in a cross-platform way across Metal, OpenCL, and CUDA based GPUs. 



The Fuse API also supports [LuaJIT](https://luajit.org/luajit.html) based code to be used to do operations like render vector shapes, process image metadata, add custom image importer/exporter support, or apply effects. This Fuse API is the Fusion equivalent of Nuke Blink Scripting.



BMD released a new Fuse SDK PDF guide this year which is an excellent document for getting developers and enthusiasts comfortable with the Fuse API. The guide comes with Resolve/Fusion v18 now but it is also possible to download the guide from the BMD Software Support Center's "Latest Support Notes" category: [Fusion_Fuse_SDK.pdf](https://documents.blackmagicdesign.com/UserManuals/Fusion_Fuse_SDK.pdf?_v=1658361162000)



![[Pipeline Guide.img/BMD Support Center - Fuse SDK Guide.png]]



## Macros

A macro in the Fusion page is basically a grouped set of Fusion stock nodes that are collected inside a collapsible folder group. 



When a macro is created using a grouped object it can have an internal registry-based node identifier type of either a "MacroOperator" or a "GroupOperator". 



A macro is saved to disk as a plain text document that represents an ASCII-encoded Lua table structure on-disk. The macro file is saved with the file extension .setting.



When making macros to share with other users, it is important to know that a GroupOperator node can be easily re-expanded and edited later in the Nodes view. 



A MacroOperator is harder to inspect as it needs you to copy the node into a programmer's plain text editor to revise its settings by hand.



When you have a MacroOperator open in a text editor, you can find & replace the word "MacroOperator" with "GroupOperator". This will allow you to visually expand that node's group in the Nodes view.



When creating macros, expressions can be added, along with intool scripts, and custom UserControl based GUIs. This allows for the construction of unique purpose built nodes that can work in both the Fusion and Edit pages. 



There is an introductory "[Macro Building Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11590#p11590)" thread on the Steakunderwater forum that helps artists create their own macros in only a short period of time.



![[Pipeline Guide.img/WSL macro building essentials.png]]



Building GUIs With Fusion's UI Manager

Resolve/Fusion supports the use of a native Lua and Python based GUI building system called the UI Manager library. This library is used whenever you need to create your own custom graphical user interface in a Fusion based Lua or Python script. 



The UI Manager allows you to add object oriented windows, buttons, text fields, sliders, tree list views, and controls that are accessible inside your script code. The UI Manager library is QT window manager based, and it is designed to replace Fusion 7's older IUP and AskUser dialog approaches when creating script based GUIs.

# Available GUI Elements

As you start to construct new user interfaces in Resolve/Fusion, you can add the following GUI elements by placing them inside the window's ui:VGroup{} tag:



-   ui:VGroup{}

-   ui:HGroup{}

-   ui:Stack{}

-   ui:VGap{}

-   ui:HGap{}

-   ui:Button{}

-   ui:CheckBox{}

-   ui:ColorPicker{}

-   ui:ComboBox{}

-   ui:DoubleSpinBox{}

-   ui:Label{}

-   ui:LineEdit{}

-   ui:Slider{}

-   ui:SpinBox{}

-   ui:TabBar{}

-   ui:TextEdit{}

-   ui:Tree{}


# What is an ID Tag?



In the UI Manager an important concept to understand at this point is that an ID tag string is placed inside the { } curly braces on every control in the GUI layout. 



The ID tag setting could be just a single letter in quotes or it could be a longer text string (written without spaces) that is used to define the name that Lua uses to access that specific GUI element from code. 



ID = 'myCustomName',



ID tags are used to allow the UI Manager to respond uniquely to user interactions with each of the controls in a window such as handling button clicks, sliders, checkboxes, typing text in a textfield, etc…

# AddWindow()

The AddWindow() command is used to create a new UI Manager window. This window holds the GUI elements in a user interface.



![[Pipeline Guide.img/Untitled_3.png]]



The following code snippet shows the bare minimum of code you need to add to a Lua script in order to create a new UI Manager based window that has a GUI element inside of it. 



In this piece of sample code a new window is created that has the title "My First Window". The label GUI element is added to the view that displays the textual message "This is a Label". You can close the new view by clicking on the standard window close box.



-- Create a new window

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = { 100, 100, width, height },

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:Label{ ID = 'L', Text = 'This is a Label'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

win:Show()

disp:RunLoop()

win:Hide()

# How do I use the new GUI elements?

## ui:VGroup{} / ui:HGroup{}



The ui:VGroup{} and ui:HGroup{} GUI elements are used to create vertical and horizontal layouts inside the window. You can stack multiple of these group objects nested inside of each other to create complex GUIs with UI elements arranged onscreen in rows and columns, or even a grid style of layout is possible.



Lua:

ui:VGroup{

  ID = "root",

  -- Add your GUI elements here:

}.




Python:

ui.VGroup({"ID": "root"},[

# Add your GUI elements here:

]),



## ui:VGap{} / ui:HGap{}



The ui:VGap{} and ui:HGap{} GUI elements are used to provide space between each of the GUI controls so it is easier to navigate inside the window and to create a more logical grouping of the elements inside of a ui:VGroup{} or ui:HGroup{} layout. The gap controls have options that allow you to define the space between controls using either pixels or a relative measurement.



This example adds a 5 pixel wide horizontal gap between the controls that are placed on either side of a ui:HGap element in a ui:VGroup{} or ui:HGroup{} layout:



Lua:

ui:HGap(5),



Python:

ui.HGap(5),



This example creates a flexible sized horizontal between the controls that are placed on either side of a ui:HGap element in a ui:VGroup{} or ui:HGroup{} layout:



Lua:

ui:HGap(0, 1.0),



Python

ui.HGap(0, 1.0),

## ui:Button{}

The ui:Button{} control will create a simple rectangular shaped clickable button. 

![[Pipeline Guide.img/Untitled_4.png]]



You can assign a textual label to the new button by adding an attribute like: Text = 'The Button Label'. If your operating system's default font supports showing Emoji's or extended Unicode characters you can add them to the Text label string on a button, too.



If you want to add a button to a UI Manager window layout that is done by writing an entry like this:

ui:Button{ID = "MyButton", Text = "Connect"},



The Text setting for the button is the actual label that is written on the button. You are able to use Unicode based Emoji icons as part of the Text label string if you are looking for an easy way to add a picture to the button.



The ID setting for the button is the internal name that is used to access the button from other functions in your Lua script.



After you have created a new ui:Button entry inside of your window creation code, further down in the Lua script you would add a matching function that responds to events that are triggered when the button is pressed.



Since I have an ID setting of MyButton I would need to create a Lua function like this to handle the button clicking action:

function win.On.MyButton.Clicked(ev)

print('Hello World!')

end



Inside of the win.On.MyButton.Clicked() function you are free to write in any Lua code you want. 



You can also rename the button's label once it has been clicked by assigning a new text string to the button label .Text attribute. The new string text that you can assign to the button label doesn't have to be a hard quoted object. It could be a string that is sourced at run-time from a dynamic element coming right from the active Fusion comp like the name of the active node selection, the current composite's filename, or it could come from any Lua variable you want to assign.



Changing a button label at runtime using Lua:

function win.On.MyButton.Clicked(ev)

itm.MyButton.Text = "Link Active"

end



Adding a button using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = { 100, 100, width, height },

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:HGroup{

      Margin = 50,

      ui:Button{ID = 'MyButton', Text = 'The Button Label'},

    }

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

function win.On.MyButton.Clicked(ev)

  print('Button Clicked')

    disp:ExitLoop()

end

win:Show()

disp:RunLoop()

win:Hide()



Adding a button using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({'WindowTitle': 'My First Window', 'ID': 'MyWin', 'Geometry': [100, 100, 200, 50], 'Spacing': 0,},[

ui.VGroup({'Spacing': 0,},[

# Add your GUI elements here:

ui.HGroup({},[

# Add four buttons that have an icon resource attached and no border shading

ui.Button({

'ID': 'MyButton',

'Text': 'The Button Label',

}),

]),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:

def _func(ev):

print('Button Clicked')

disp.ExitLoop()

dlg.On.MyButton.Clicked = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:CheckBox{}

The ui:CheckBox{} control will add a checkbox to the window layout. This control is used to define a [boolean](https://en.wikipedia.org/wiki/Boolean_algebra) value which represents either a true (1) or false (0) logical state that corresponds visually to a checked or unchecked status for the control.



![[Pipeline Guide.img/Untitled_5.png]]



You can assign a label to the new checkBox by adding an attribute like: 

Text = 'The Checkbox Label'.



Adding a Checkbox using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = { 100, 100, width, height },

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    Margin = 50,

    -- Add your GUI elements here:

    ui:CheckBox{ID = 'MyCheckbox', Text = 'The Checkbox Label'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

function win.On.MyCheckbox.Clicked(ev)

  print('[Checkbox] ' .. tostring(itm.MyCheckbox.Checked))

end

win:Show()

disp:RunLoop()

win:Hide()



Adding a Checkbox using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 400, 200],},[

ui.VGroup({"Spacing": 0,},[

# Add your GUI elements here:

ui.CheckBox({"ID": "MyCheckbox", "Text": "The Checkbox Label"}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



def _func(ev):

print("[Checkbox] " + str(itm["MyCheckbox"].Checked))

dlg.On.MyCheckbox.Clicked = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:ColorPicker{}

The ui:ColorPicker{} control provides Red/Green/Blue color sliders and a preview color swatch that can be used to create a custom color value.



![[Pipeline Guide.img/Untitled_6.png]]



You can enter a default color for the ColorPicker using:

ui:ColorPicker{ ID = "Color", Color = { R = 0.753, G = 0.753, B = 0.753, A = 1}},



If you need an alpha channel slider in the ColorPicker then you can use:

ui:ColorPicker{ ID = "Color", Color = { R = 1, G = 1, B = 1, A = 1}, DoAlpha = true  },



You can read the color picker RGB float values using:



red = itm.Color.Color.R

green = itm.Color.Color.G

blue = itm.Color.Color.B



Adding a color picker using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = {100, 100, width, height},

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:ColorPicker{ID = 'Color'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

win:Show()

disp:RunLoop()

win:Hide()

## ui:ComboBox{}

The ui:ComboBox{} control allows you to show a ComboControl / Options Menu style of menu that allows you to select an individual menu item from a list of entries. 



![[Pipeline Guide.img/Untitled_7.png]]



You can read the text string for the current ComboBox selection using ".CurrentText" like this:

print(itm.MyCombo.CurrentText)



You can read the index value for the current ComboBox selection using ".CurrentIndex" like this:

print(itm.MyCombo.CurrentIndex)



Note: You need to define the list of menu items outside the AddWindow() function using the AddItem() command.



Adding a ComboBox using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,100

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = {100, 100, width, height},

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:ComboBox{ID = 'MyCombo', Text = 'Combo Menu'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

-- Add the items to the ComboBox menu

itm.MyCombo:AddItem('Apple')

itm.MyCombo:AddItem('Banana')

itm.MyCombo:AddItem('Cherry')

itm.MyCombo:AddItem('Orange')

itm.MyCombo:AddItem('Mango')

itm.MyCombo:AddItem('Kiwi')

-- This function is run when a user picks a different setting in the ComboBox control

function win.On.MyCombo.CurrentIndexChanged(ev)

  if itm.MyCombo.CurrentIndex == 0 then

    -- Apple

    print('[' .. itm.MyCombo.CurrentText .. '] Lets make an apple crisp dessert.')

  elseif itm.MyCombo.CurrentIndex == 1 then

    -- Banana

    print('[' .. itm.MyCombo.CurrentText .. '] Lets make a banana split with ice cream.')

  elseif itm.MyCombo.CurrentIndex == 2 then

    -- Cherry

    print('[' .. itm.MyCombo.CurrentText .. '] Lets make some cherry tarts.')

  elseif itm.MyCombo.CurrentIndex == 3 then

    -- Orange

    print('[' .. itm.MyCombo.CurrentText .. '] Lets peel an orange and have sliced orange boats.')

  elseif itm.MyCombo.CurrentIndex == 4 then

    -- Mango

    print('[' .. itm.MyCombo.CurrentText .. '] Lets eat cubed mango chunks with yoghurt.')

  elseif itm.MyCombo.CurrentIndex == 5 then

    -- Kiwi

    print('[' .. itm.MyCombo.CurrentText .. '] Lets have a fresh Kiwi snack.')

  end

end

win:Show()

disp:RunLoop()

win:Hide()



Adding a ComboBox using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 400, 45], "Spacing": 10,},[

ui.VGroup({"ID": "root",},[

# Add your GUI elements here:

ui.ComboBox({"ID": "MyCombo", "Text": "Combo Menu"}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



def _func(ev):

if itm['MyCombo'].CurrentIndex == 0:

print('[' + itm['MyCombo'].CurrentText + '] Lets make an apple crisp dessert.')

elif itm['MyCombo'].CurrentIndex == 1:

print('[' + itm['MyCombo'].CurrentText + '] Lets make a banana split with ice cream')

elif itm['MyCombo'].CurrentIndex == 2:

print('[' + itm['MyCombo'].CurrentText + '] Lets make some cherry tarts.')

elif itm['MyCombo'].CurrentIndex == 3:

print('[' + itm['MyCombo'].CurrentText + '] Lets peel an orange and have sliced orange boats.')

elif itm['MyCombo'].CurrentIndex == 4:

print('[' + itm['MyCombo'].CurrentText + '] Lets eat cubed mango chunks with yoghurt.')

elif itm['MyCombo'].CurrentIndex == 5:

print('[' + itm['MyCombo'].CurrentText + '] Lets have a fresh Kiwi snack.')

dlg.On.MyCombo.CurrentIndexChanged = _func



# Add the items to the ComboBox menu

itm['MyCombo'].AddItem("Apple")

itm['MyCombo'].AddItem("Banana")

itm['MyCombo'].AddItem("Cherry")

itm['MyCombo'].AddItem("Orange")

itm['MyCombo'].AddItem("Mango")

itm['MyCombo'].AddItem("Kiwi")



dlg.Show()

disp.RunLoop()

dlg.Hide()



## ui:DoubleSpinBox{}

The ui:DoubleSpinBox{} control allows you to enter numeric values. This GUI element can be incremented by typing a number in directly, pressing the up and down arrow buttons, or by clicking in the number field and then scrolling your mouse scroll wheel.



![[Pipeline Guide.img/Untitled_8.png]]



You will typically want to control the size of the ui:DoubleSpinBox control in the GUI by placing it inside a ui:VGroup{} or ui:HGroup{} element.



Adding a DoubleSpinBox number field using Lua:



local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,75

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = {100, 100, width, height},

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:DoubleSpinBox{ID='MySpinner'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

function win.On.MySpinner.ValueChanged(ev)

  print('[DoubleSpinBox Value] '.. itm.MySpinner.Value)

end

win:Show()

disp:RunLoop()

win:Hide()



Adding a DoubleSpinBox number field using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 280, 45], "Spacing": 10,},[

ui.VGroup({"ID": "root"},[

# Add your GUI elements here:

ui.DoubleSpinBox({"ID": "MySpinner"}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



def _func(ev):

print( "[DoubleSpinBox Value] " + str(itm['MySpinner'].Value))

dlg.On.MySpinner.ValueChanged = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:Label{}

The ui:Label{} control allows you to add a block of non user editable text to the window.



![[Pipeline Guide.img/Untitled_9.png]]



Using several Label elements inside of your different ui:VGroup{} or ui:HGroup{} layouts can help visually break up a larger more complex window layout into smaller more logical groupings. This will make it easier for a user to understand what a set of controls can be used for.



Adding a textual label using Lua:



local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = {100, 100, width, height},

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:Label{ID = 'L', Text = 'This is a Label', Alignment = { AlignHCenter = true, AlignTop = true },},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

win:Show()

disp:RunLoop()

win:Hide()



Adding a textual label using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 400, 200],},[

ui.VGroup({"Spacing": 0,},[

# Add your GUI elements here:

ui.Label({"ID": "Label", "Text": "This is a Label",}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:Slider{}

The ui:Slider{} control provides a horizontal slider control.



![[Pipeline Guide.img/Untitled_10.png]]



Add a slider using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,100

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = {100, 100, width, height},

  Spacing = 10,

  ui:HGroup{

    ID = 'root',

    -- Add your GUI elements here:

    ui:Slider{ID = 'MySlider'},

    ui:Label{ID = 'MyLabel', Text = 'Value: ',},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

  disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

itm.MySlider.Value = 25

itm.MySlider.Minimum = 0

itm.MySlider.Maximum = 100

function win.On.MySlider.ValueChanged(ev)

  itm.MyLabel.Text = 'Slider Value: ' .. tostring(ev.Value)

end

win:Show()

disp:RunLoop()

win:Hide()



Add a slider using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 400, 100],},[

ui.HGroup({"Spacing": 0,},[

# Add your GUI elements here:

ui.Slider({"ID": "MySlider",}),

ui.Label({"ID": "MyLabel", "Text": "Value:",}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



itm['MySlider'].Value = 25

itm['MySlider'].Minimum = 0

itm['MySlider'].Maximum = 100



def _func(ev):

itm['MyLabel'].Text = "Slider Value: " + str(ev['Value'])

print("Slider Value: " + str(ev['Value']))

dlg.On.MySlider.ValueChanged = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:LineEdit{}

The ui:LineEdit{} control adds a single line based editable text field control.



![[Pipeline Guide.img/Untitled_11.png]]



The "PlaceholderText" attribute lets you define a label text that is shown when the field is empty. This is useful for indicating what the control is meant to be used for.



Add a LineEdit field using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 400,200

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = { 100, 100, width, height },

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    Margin = 50,

    -- Add your GUI elements here:

    ui:LineEdit{ID='MyLineTxt', Text = 'Hello Fusioneers!', PlaceholderText = 'Please Enter a few words.',},

    ui:Button{ID = 'PrintButton', Text = 'Print Text'},

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

function win.On.PrintButton.Clicked(ev)

  print(itm.MyLineTxt.Text)

end

function win.On.MyLineTxt.TextChanged(ev)

    print(itm.MyLineTxt.Text)

end

win:Show()

disp:RunLoop()

win:Hide()



Add a LineEdit field using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 400, 125],},[

ui.VGroup({"Spacing": 10,},[

# Add your GUI elements here:

ui.LineEdit({"ID": "MyLineTxt", "Text": "Hello Fusioneers!", "PlaceholderText": "Please Enter a few words.", "Weight": 0.5}),

ui.Button({"ID": "PrintButton", "Text": "Print Text", "Weight": 0.5}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



def _func(ev):

print(itm['MyLineTxt'].Text)

dlg.On.PrintButton.Clicked = _func



def _func(ev):

print(itm['MyLineTxt'].Text)

dlg.On.MyLineTxt.TextChanged = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()



## ui:TextEdit{}

The ui:TextEdit{} control adds an editable text field. It is possible to render the text field contents using either unformatted plaintext or HTML.



![[Pipeline Guide.img/Untitled_12.png]]



A ui:TextEdit field's contents can be made read-only (and non-editable) by adding a "ReadOnly" tag like this:

ui:TextEdit{ID='Txt', Text = 'Hello', ReadOnly = true,}



You can change the contents of a ui:TextEdit field using either:

-- Plain unformatted text:

itm.MyTxt.PlainText = 'Hello Fusioneers'



-- HTML encoded text:

itm.MyTxt.HTML = [[<h1>HTML Formatted Text</h1><p>This this HTML rendered in a ui:TextEdit field!</p>]]



The "PlaceholderText" attribute lets you define a label text that is shown when the field is empty. This is useful for indicating what the control is meant to be used for.



Add a TextEdit field using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 600,800

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'My First Window',

  Geometry = { 100, 100, width, height },

  Spacing = 10,

  ui:VGroup{

    ID = 'root',

    Margin = 50,

    -- Add your GUI elements here:

    ui:TextEdit{ID='MyTxt', Text = 'Hello', PlaceholderText = 'Please Enter a few words.',}

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

function win.On.MyTxt.TextChanged(ev)

    print(itm.MyTxt.PlainText)

end

win:Show()

disp:RunLoop()

win:Hide()



Add a TextEdit field using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({ "WindowTitle": "My First Window", "ID": "MyWin", "Geometry": [100, 100, 600, 800], "Spacing": 10, "Margin": 10,},[

ui.VGroup({ "ID": "root",},[

# Add your GUI elements here:

ui.TextEdit({ 

"ID": "MyTxt",

"Text": "Hello",

"PlaceholderText": "Please Enter a few words.",

"Lexer": "fusion",

}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



def _func(ev):

print(itm['MyTxt'].PlainText)

dlg.On.MyTxt.TextChanged = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()

## ui:Tree{}

The ui:Tree{} control creates a spreadsheet like grid layout. This is useful for listing elements in a report with rows and columns.



![[Pipeline Guide.img/Untitled_13.png]]



The entries in a ui:Tree can be made clickable and sortable using the following tags:

ui:Tree{ID = 'Tree', SortingEnabled=true, Events = {  ItemDoubleClicked=true, ItemClicked=true }, },



You can detect a single click on a row using "function win.On.Tree.ItemClicked(ev)".



You can detect a double click on a row using "function win.On.Tree.ItemDoubleClicked(ev)".



Inside the single click or double click events you can read the row name text that was clicked with "ev.item.Text[1]". The index value in the [] brackets is the specific column heading text you want to display. 



You can edit the contents of a specific tree view cell that was clicked on using "ev.column" to access an individual cell: 

-- A Tree view cell was clicked on

function win.On.Tree.ItemClicked(ev)

  -- You can use the ev.column value to edit a specific ui:Tree cell label

  ev.item.Text[ev.column] = '*CLICK*'

end



It is possible to add folding disclosure triangle sections to a tree view to have sub-headings. This is a more advanced topic so it will be discussed in a future tutorial.



The width of each heading is adjusted using the ".ColumnWidth" setting:

-- Resize the Columns

itm.Tree.ColumnWidth[0] = 150

itm.Tree.ColumnWidth[1] = 300

itm.Tree.ColumnWidth[2] = 50



When you are dynamically re-building a tree view you can use the "itm.Tree:Clear()" command to clear out the existing items.



Add a tree view using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 430,700

win = disp:AddWindow({

  ID = 'MyWin',

  WindowTitle = 'Tree',

  Geometry = { 100, 100, width, height },

  Spacing = 0,

  ui:VGroup{

    ID = 'root',

    ui:Tree{ID = 'Tree', SortingEnabled=true, Events = {ItemDoubleClicked=true, ItemClicked=true}, },  

  },

})

-- The window was closed

function win.On.MyWin.Close(ev)

    disp:ExitLoop()

end

-- Add your GUI element based event functions here:

itm = win:GetItems()

-- Add a header row.

hdr = itm.Tree:NewItem()

hdr.Text[0] = ''

hdr.Text[1] = 'Column A'

hdr.Text[2] = 'Column B'

hdr.Text[3] = 'Column C'

hdr.Text[4] = 'Column D'

hdr.Text[5] = 'Column E'

itm.Tree:SetHeaderItem(hdr)

-- Number of columns in the Tree list

itm.Tree.ColumnCount = 5

-- Resize the Columns

itm.Tree.ColumnWidth[0] = 100

itm.Tree.ColumnWidth[1] = 75

itm.Tree.ColumnWidth[2] = 75

itm.Tree.ColumnWidth[3] = 75

itm.Tree.ColumnWidth[4] = 75

itm.Tree.ColumnWidth[5] = 75

-- Add an new row entries to the list

for row = 1, 50 do

  itRow = itm.Tree:NewItem();

  -- String.format is used to create a leading zero padded row number like 'Row A01' or 'Row B01'.

  itRow.Text[0] = string.format('Row %02d', row);

  itRow.Text[1] = string.format('A %02d', row);

  itRow.Text[2] = string.format('B %02d', row);

  itRow.Text[3] = string.format('C %02d', row);

  itRow.Text[4] = string.format('D %02d', row);  

  itRow.Text[5] = string.format('E %02d', row);

  itm.Tree:AddTopLevelItem(itRow)

end

-- A Tree view row was clicked on

function win.On.Tree.ItemClicked(ev)

  print('[Single Clicked] ' .. tostring(ev.item.Text[0]))

  -- You can use the ev.column value to edit a specific ui:Tree cell label

  ev.item.Text[ev.column] = '*CLICK*'

end

-- A Tree view row was double clicked on

function win.On.Tree.ItemDoubleClicked(ev)

  print('[Double Clicked] ' .. tostring(ev.item.Text[0]))

end

win:Show()

disp:RunLoop()

win:Hide()



Add a tree view using Python:

ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "Tree", "ID": "MyWin", "Geometry": [100, 100, 430, 700], "Spacing": 0,},[

ui.VGroup({"ID": "root",},[

ui.Tree({

"ID": "Tree",

"SortingEnabled": True,

"Events": {

"CurrentItemChanged": True,

"ItemActivated": True,

"ItemClicked": True,

"ItemDoubleClicked": True,

},

}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



# Add a header row

hdr = itm["Tree"].NewItem()



hdr.Text[0] = ""

hdr.Text[1] = "Column A"

hdr.Text[2] = "Column B"

hdr.Text[3] = "Column C"

hdr.Text[4] = "Column D"

hdr.Text[5] = "Column E"

itm["Tree"].SetHeaderItem(hdr)



# Number of columns in the Tree list

itm["Tree"].ColumnCount = 5



# Resize the Columns

itm["Tree"].ColumnWidth[0] = 100

itm["Tree"].ColumnWidth[1] = 75

itm["Tree"].ColumnWidth[2] = 75

itm["Tree"].ColumnWidth[3] = 75

itm["Tree"].ColumnWidth[4] = 75

itm["Tree"].ColumnWidth[5] = 75



# Add an new row entries to the list

for row in range(1,50):

itRow = itm["Tree"].NewItem()



# .format is used to create a leading zero padded row number like "Row A01" or "Row B01".

itRow.Text[0] = "Row {0:02d}".format(row)

itRow.Text[1] = "A {0:02d}".format(row)

itRow.Text[2] = "B {0:02d}".format(row)

itRow.Text[3] = "C {0:02d}".format(row)

itRow.Text[4] = "D {0:02d}".format(row)

itRow.Text[5] = "E {0:02d}".format(row)



itm["Tree"].AddTopLevelItem(itRow)



# A Tree view row was clicked on

def _func(ev):

print("[Single Clicked] " + str(ev["item"].Text[0]))

dlg.On.Tree.ItemClicked = _func



# A Tree view row was double clicked on

def _func(ev):

print("[Double Clicked] " + str(ev["item"].Text[0]))

dlg.On.Tree.ItemDoubleClicked = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()



## AddConfig

AddConfig() is a function that is often used to capture window closing hotkeys events. 



This approach stops Fusion from closing your foreground composite document each time a user presses Escape, Control+W/Command+W, or Control+F4/Command+F4 when the user expects the hotkey will be used to actually close a UI Manager GUI window instead.



AddConfig using Lua:

-- Check the current operating system platform

local platform = (FuPLATFORM_WINDOWS and 'Windows') or (FuPLATFORM_MAC and 'Mac') or (FuPLATFORM_LINUX and 'Linux')



-- Create the appropriate hotkey message if you are on Windows/Linux or Mac

local hotkeyTextMessage = 'Press (Control + W) or (Control + F4) to close this window.'

if platform == 'Mac' then

hotkeyTextMessage = 'Press (Command + W) or (Command + F4) to close this window.'

end



-- Create the UI Manager GUI

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 900,132



win = disp:AddWindow({

ID = 'HotkeysWin',

TargetID = 'HotkeysWin',

WindowTitle = 'Dynamic Hotkeys',

Geometry = {0, 100, width, height},

Margin = 20,

Spacing = 0,



ui:HGroup{

ID = 'root',

-- Add your GUI elements here:



ui:Label{

ID = 'HotkeysLabel',

Alignment = {

AlignHCenter = true,

AlignTop = true,

},

Text = hotkeyTextMessage,

Font = ui:Font{

Family = 'Droid Sans Mono',

StyleName = 'Regular',

PixelSize = 24,

MonoSpaced = true,

StyleStrategy = {

ForceIntegerMetrics = true,

},

},

},

},

})




-- Add your GUI element based event functions here:

itm = win:GetItems()



-- The window was closed

function win.On.HotkeysWin.Close(ev)

disp:ExitLoop()

end



-- The app:AddConfig() command that will capture the "ESCAPE", "Control + W", or "Control + F4" hotkeys so they will close the Dynamic Hotkeys window instead of closing the foreground composite.

app:AddConfig('Hotkeys', {

Target {

ID = 'HotkeysWin',

},



Hotkeys {

Target = 'HotkeysWin',

Defaults = true,

CONTROL_W = 'Execute{cmd = [[app.UIManager:QueueEvent(obj, "Close", {})]]}',

CONTROL_F4 = 'Execute{cmd = [[app.UIManager:QueueEvent(obj, "Close", {})]]}',

ESCAPE = 'Execute{cmd = [[app.UIManager:QueueEvent(obj, "Close", {})]]}',

},

})



win:Show()

disp:RunLoop()

win:Hide()



app:RemoveConfig('Hotkeys')

collectgarbage()




AddConfig using Python:

# The app:AddConfig() command that will capture the "Escape", "Control + W", or "Control + F4" hotkeys so they will close the window instead of closing the foreground composite. It is worth noting that comp.Execute() is run asynchronously so it might kick in the 2nd time the script is run in a Fusion session...

comp.Execute(

"""

app:AddConfig("MyWin", {

Target {

ID = "MyWin",

},

Hotkeys {

Target = "MyWin",

Defaults = true,



CONTROL_W = "Execute{cmd = [[app.UIManager:QueueEvent(obj, 'Close', {})]]}",

CONTROL_F4 = "Execute{cmd = [[app.UIManager:QueueEvent(obj, 'Close', {})]]}",

ESCAPE = "Execute{cmd = [[app.UIManager:QueueEvent(obj, 'Close', {})]]}",

},

})

""")



ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({"WindowTitle": "My First Window", "ID": "MyWin", "TargetID" : "MyWin", "Geometry": [25, 140, 950, 470], "Spacing": 0,},[

ui.VGroup({"Spacing": 0,},[

# Add your GUI elements here:

ui.Label({"ID": "Label", "Text": "Press the \"Escape\", \"Control + W\", or \"Control + F4\" hotkeys to close this window.",}),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:



dlg.Show()

disp.RunLoop()

dlg.Hide()



## File and Folder Browsing Dialogs

The RequestFile/RequestDir functions provide pre-made file browsing user interfaces for situations where you need to provide a "Browse" button that allows you to select files on-disk.



![[Pipeline Guide.img/File Dialog.png]]

![[Pipeline Guide.img/Folder Dialog.png]]




Create a request file dialog using Python:

# Display a file dialog using Python + UI Manager. This is an alternative to relying on a legacy AskUser dialog which only works in the Fusion page inside of Resolve.



ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({'WindowTitle': 'Open File Dialog', 'ID': 'MyWin', 'Geometry': [100, 100, 500, 75],},[

ui.VGroup({'Spacing': 0,},[

# Add your GUI elements here:

ui.HGroup({'Weight': 0.0,},[

ui.Label({'ID': 'Label', 'Text': 'Filename', 'Weight': 0.1}),

ui.LineEdit({'ID': 'FileLineTxt', 'Text': '', 'PlaceholderText': 'Please Enter a filepath', 'Weight': 0.9}),

ui.Button({'ID': 'BrowseButton', 'Text': 'Browse', 'Geometry': [0, 0, 30, 50], 'Weight': 0.1}),

]),

ui.VGap(),

ui.HGroup({'Weight': 0.1},[

ui.Button({'ID': 'OpenButton', 'Text': 'Open File', 'Geometry': [0, 0, 30, 50], 'Weight': 0.1}),

]),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:

def _func(ev):

print('[Open File] Button Clicked')

disp.ExitLoop()

dlg.On.OpenButton.Clicked = _func



def _func(ev):

selectedPath = fu.RequestFile()

if selectedPath:

itm['FileLineTxt'].Text = str(selectedPath)

dlg.On.BrowseButton.Clicked = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()



# Expand relative filepaths using the Fusion based "MapPath" function:

filepath = app.MapPath(itm['FileLineTxt'].Text or '')

# Alternatively you could expand comp file specific PathMaps using:

# filepath = comp.MapPath(itm['FileLineTxt'].Text)



print('\n\n[Open File]', filepath)



Create a request directory dialog using Python:

# Display a folder dialog using Python + UI Manager. This is an alternative to relying on a legacy AskUser dialog which only works in the Fusion page inside of Resolve.



ui = fu.UIManager

disp = bmd.UIDispatcher(ui)



dlg = disp.AddWindow({'WindowTitle': 'Open Folder Dialog', 'ID': 'MyWin', 'Geometry': [100, 100, 500, 75],},[

ui.VGroup({'Spacing': 0,},[

# Add your GUI elements here:

ui.HGroup({'Weight': 0.0,},[

ui.Label({'ID': 'Label', 'Text': 'Foldername', 'Weight': 0.1}),

ui.LineEdit({'ID': 'FolderLineTxt', 'Text': '', 'PlaceholderText': 'Please Enter a folder path', 'Weight': 0.9}),

ui.Button({'ID': 'BrowseButton', 'Text': 'Browse', 'Geometry': [0, 0, 30, 50], 'Weight': 0.1}),

]),

ui.VGap(),

ui.HGroup({'Weight': 0.1},[

ui.Button({'ID': 'OpenButton', 'Text': 'Open Folder', 'Geometry': [0, 0, 30, 50], 'Weight': 0.1}),

]),

]),

])



itm = dlg.GetItems()



# The window was closed

def _func(ev):

disp.ExitLoop()

dlg.On.MyWin.Close = _func



# Add your GUI element based event functions here:

def _func(ev):

print('[Open Folder] Button Clicked')

disp.ExitLoop()

dlg.On.OpenButton.Clicked = _func



def _func(ev):

selectedPath = fu.RequestDir()

if selectedPath:

itm['FolderLineTxt'].Text = str(selectedPath)

dlg.On.BrowseButton.Clicked = _func



dlg.Show()

disp.RunLoop()

dlg.Hide()



# Expand relative filepaths using the Fusion based "MapPath" function:

folderpath = app.MapPath(itm['FolderLineTxt'].Text or '')

# Alternatively you could expand comp file specific PathMaps using:

# folderpath = comp.MapPath(itm['FolderLineTxt'].Text)



print('\n\n[Open Folder]', folderpath)



Create file dialogs using Lua:

local ui = fu.UIManager

local disp = bmd.UIDispatcher(ui)

local width,height = 1024,200



win = disp:AddWindow({

ID = 'MyWin',

WindowTitle = 'Open File and Folder Dialogs',

Geometry = {100, 100, width, height},

Spacing = 10,

Margin = 50,

ui:VGroup{

ID = 'root',

Weight = 1,



-- Add your GUI elements here:

-- Open File

ui:HGroup{

ui:Label{

ID = 'FileLabel',

Text = 'File:',

Weight = 0.25,

},

ui:Label{

ID='FileTxt', 

Text = 'Please Enter a file path.',

Weight = 1.5,

},

ui:Button{

ID = 'FileButton', 

Text = 'Select a File',

Weight = 0.25,

},

},



-- Open Folder

ui:HGroup{

ui:Label{

ID = 'FolderLabel',

Text = 'Folder:',

Weight = 0.25,

},

ui:Label{

ID='FolderTxt',

Text = 'Please Enter a folder path.',

Weight = 1.5,

},

ui:Button{

ID = 'FolderButton', 

Text = 'Select a Folder',

Weight = 0.25,

},

},

},

})



-- Add your GUI element based event functions here:

itm = win:GetItems()



-- The window was closed

function win.On.MyWin.Close(ev)

disp:ExitLoop()

end



-- The Open File button was clicked

function win.On.FileButton.Clicked(ev)

print('Open File Button Clicked')

selectedPath = tostring(fu:RequestFile('Brushes:/smile.tga'))



print('[File] ', selectedPath)

itm.FileTxt.Text = selectedPath

end



-- The Open Folder button was clicked

function win.On.FolderButton.Clicked(ev)

print('Open Folder Button Clicked')

selectedPath = tostring(fu:RequestDir('Scripts:/Comp'))

print('[Folder] ', selectedPath)

itm.FolderTxt.Text = selectedPath

end



win:Show()

disp:RunLoop()

win:Hide()

# Using SlashFor to Batch Edit Nodes in a Comp

Normally a fuse is associated with creating visual imagery in Fusion's viewer window.



There is another type of fuse that is possible and it is called a "Console" fuse. This is a tool that is designed simply to process text and print out results back into the Console window.



In order to make it easier to build custom Python and Lua scripts that interface with Console fuses, a technology called a "SlashCommand" was created.



The SlashCommands that are installed via Reactor exist on-disk at the PathMap location of:

Reactor:/Deploy/Scripts/SlashCommand/



When you type text into the Fusion Console window, with a leading slash character added, that line of text-based input is interpreted as a SlashCommand. This is used to launch a custom 3rd party Lua or Python script to parse the user input.



Note: It would be theoretically possible to create a fully interactive "MUD-like" text-adventure game interpreter with a SlashCommand based script.



SlashFor is by far the most significant SlashCommand fuse. It was created by WSL member tberakis in the following Reactor Submissions thread: 

[WSL | [Submission] /for console slash-command](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=14260#p14260)



![[Pipeline Guide.img/Untitled_14.png]]



Here is an example of what the "SlashFor" tool returns in the Console when it is run without any parameters entered after the tool name:



![[Pipeline Guide.img/SlashCommand SlashFor.png]]



#### Usage Example:

> /for

Usage: /for (selected|visible|all) [tooltype[,tooltype...]] [where <condition>] <command> [ & <command>...]

Supported commands:

animate <input> [(with <modifier>|remove)] [force]

color [tile <color>] [text <color>] [fill <color>]

get <input> ([at <time>])

getattrs <attribute>

select [(add|remove)]

set <input> ([at <time>] to <value>|expression <exp>)

setattrs <attribute> (to <value>)

setclip (to <value>)

setname (to <value>)

version [(up|down|to <value>)]

## SlashFor Syntax Examples

Set the Size of all selected tools to 1.0: 

/for selected set Size to 1.0 



Set "Use GPU" to Disable:

/for selected set UseGPU to 0

/for all ColorCorrector set UseGPU to 0

/for all Merge set UseGPU to 0

/for all set UseGPU to 0



Set "Use GPU" to Auto:

/for selected set UseGPU to 1

/for all ColorCorrector set UseGPU to 1

/for all Merge set UseGPU to 1

/for all set UseGPU to 1



Set "Use GPU" to Enable:

/for selected set UseGPU to 2

/for all ColorCorrector set UseGPU to 2

/for all Merge set UseGPU to 2

/for all set UseGPU to 2



Set the SeetheRate of all FastNoise tools in the comp to 1.0: 

/for all FastNoise set SeetheRate to 1.0 



Double the current size of each Merge or Transform currently selected: 

/for selected Merge,Transform set Size to value*2.0 



Select all FastNoise tools: 

/for all FastNoise select



Add all tools to the active selection where Size > 1: 

/for all where Size > 1.0 select add



Remove all Merge tools from the active selection where Angle < 0:

/for all Merge where Angle < 0 select remove

#### Loader Node

Set the EXR Part for a Loader node:

/for selected Loader set Clip1.OpenEXRFormat.Part to "C"



/for selected Loader set Clip1.OpenEXRFormat.Part to "directdiffuse"



Set the RGBA EXR Channel names for Loader nodes, one command at a time:

/for all Loader set Clip1.OpenEXRFormat.RedName to "R"

/for all Loader set Clip1.OpenEXRFormat.GreenName to "G"

/for all Loader set Clip1.OpenEXRFormat.BlueName to "B"

/for all Loader set Clip1.OpenEXRFormat.AlphaName to "A"



Set the RGBA EXR Channel names for Loader nodes on a single line:

/for all Loader set Clip1.OpenEXRFormat.RedName to "R" & set Clip1.OpenEXRFormat.GreenName to "G" & set Clip1.OpenEXRFormat.BlueName to "B" & set Clip1.OpenEXRFormat.AlphaName to "A"



Set individual EXR Channel names for Loader nodes, one command at a time:

/for all Loader set Clip1.OpenEXRFormat.RedName to "R"

/for all Loader set Clip1.OpenEXRFormat.GreenName to "G"

/for all Loader set Clip1.OpenEXRFormat.BlueName to "B"

/for all Loader set Clip1.OpenEXRFormat.AlphaName to "A"

/for all Loader set Clip1.OpenEXRFormat.ZName to "Z"

/for all Loader set Clip1.OpenEXRFormat.CovName to "pixelCover"

/for all Loader set Clip1.OpenEXRFormat.ObjIDName to "objectID"

/for all Loader set Clip1.OpenEXRFormat.MatIDName to "materialID"

/for all Loader set Clip1.OpenEXRFormat.UName to "U"

/for all Loader set Clip1.OpenEXRFormat.VName to "V"

/for all Loader set Clip1.OpenEXRFormat.XNormName to "NX"

/for all Loader set Clip1.OpenEXRFormat.YNormName to "NY"

/for all Loader set Clip1.OpenEXRFormat.ZNormName to "NZ"

/for all Loader set Clip1.OpenEXRFormat.XVelName to "velX"

/for all Loader set Clip1.OpenEXRFormat.YVelName to "velY"

/for all Loader set Clip1.OpenEXRFormat.XRevVelName to "rvelX"

/for all Loader set Clip1.OpenEXRFormat.YRevVelName to "rvelY"

/for all Loader set Clip1.OpenEXRFormat.XPosName to "posX"

/for all Loader set Clip1.OpenEXRFormat.YPosName to "posY"

/for all Loader set Clip1.OpenEXRFormat.ZPosName to "posZ"

/for all Loader set Clip1.OpenEXRFormat.XDispName to "dispX"

/for all Loader set Clip1.OpenEXRFormat.YDispName to "dispY"



Set all of the available EXR Channel names for Loader nodes on a single line:

/for all Loader set Clip1.OpenEXRFormat.RedName to "R" & set Clip1.OpenEXRFormat.GreenName to "G" & set Clip1.OpenEXRFormat.BlueName to "B" & set Clip1.OpenEXRFormat.AlphaName to "A" & set Clip1.OpenEXRFormat.ZName to "Z" & set Clip1.OpenEXRFormat.CovName to "pixelCover" & set Clip1.OpenEXRFormat.ObjIDName to "objectID" & set Clip1.OpenEXRFormat.MatIDName to "materialID" & set Clip1.OpenEXRFormat.UName to "U" & set Clip1.OpenEXRFormat.VName to "V" & set Clip1.OpenEXRFormat.XNormName to "NX" & set Clip1.OpenEXRFormat.YNormName to "NY" & set Clip1.OpenEXRFormat.ZNormName to "NZ" & set Clip1.OpenEXRFormat.XVelName to "velX" & set Clip1.OpenEXRFormat.YVelName to "velY" & set Clip1.OpenEXRFormat.XRevVelName to "rvelX" & set Clip1.OpenEXRFormat.YRevVelName to "rvelY" & set Clip1.OpenEXRFormat.XPosName to "posX" & set Clip1.OpenEXRFormat.YPosName to "posY" & set Clip1.OpenEXRFormat.ZPosName to "posZ" & set Clip1.OpenEXRFormat.XDispName to "dispX" & set Clip1.OpenEXRFormat.YDispName to "dispY"

#### MediaIn Node

Set the MediaID tag on a MediaIn node:

/for selected MediaIn set MediaID to "445f0cf6-8888-4f2d-9014-1fa8829e9acd"



Set the EXR Part for a MediaIn node:

/for selected MediaIn set Layer to "C"

/for selected MediaIn set Layer to "directdiffuse"



Set the RGBA EXR Channel names for a MediaIn node, one command at a time:

/for selected MediaIn set RedName to "R"

/for selected MediaIn set GreenName to "G"

/for selected MediaIn set BlueName to "B"

/for selected MediaIn set AlphaName to "A"



Set the RGBA EXR Channel names for a MediaIn node, on a single line:

/for selected MediaIn set RedName to "R" & set GreenName to "G" & set BlueName to "B" & set AlphaName to "A"



/for selected MediaIn set RedName to "C.R" & set GreenName to "C.G" & set BlueName to "C.B" & set AlphaName to "C.A"



Set the In/Out time range for a MediaIn node:

/for selected MediaIn set GlobalIn to 0 & set GlobalOut to 47



#### Animate

Animate Size of all selected tools with default modifier (BezierSpline): 

/for selected animate Size 



Animate Size of all visible tools (ie not modifiers) with CubicSpline:

/for visible animate Size with CubicSpline 



Animate Size of all selected tools, replacing any already animated ones: 

/for selected animate Size force 



Animate Seethe of all FastNoise tools, creating a ramp from 1.0 to 5.0 over 100 frames: 

/for all FastNoise animate Seethe & set Seethe at 0 to 1.0 & set Seethe at 100 to 5.0 



Remove animation from Size of all selected tools: 

/for selected animate Size remove 

#### Expressions

/for can be limited to only affect a subset of the nodes in a comp using the term "where <expression>".



Set the Size of all selected tools to 1.0, if it's already > 1.0: 

/for selected where Size > 1 set Size to 1.0 



Set is able to create Fusion-based expression entries on node inputs, too.



Set a Seethe expression on selected FastNoise tools: 

/for selected FastNoise set Seethe expression time/10.0



#### Select

The 'select' command changes the active selection of nodes in the Nodes view area:



Select all FastNoise tools: 

/for all FastNoise select



Add all tools to the selection where Size > 1:

/for all where Size > 1.0 select add



Remove all Merge tools from the selection where Angle < 0: 

/for all Merge where Angle < 0 select remove

#### Color

The 'color' command is used to modify node colors in the Node view.



Set the tile color to red for selected tools: 

/for selected color tile 1,0,0



Set the text color to green for selected FastNoise tools with a non-zero SeetheRate: 

/for selected FastNoise where SeetheRate ~= 0 color text 0,1,0

#### Set Name

Rename a node:

/for selected Loader setname to "MyLoader"

/for selected Saver setname to "MySaver"

/for selected Fuse.vTextCreate setname to "Txt"

/for selected Fuse.vNumberCreate setname to "Num"

### Set Clip Filenames

Set a Loader node's Clip filename:

/for all Loader setclip to "Comp:/Import.0000.exr"



Set a Saver node's Clip filename:

/for all Saver setclip to "Comp:/Export.0000.exr"

#### Set Clip Version

If a Loader or Saver node has a version tag added to the clip filename like "V001" or "v001" then the /for versioning features will be your new best friend.



![[Pipeline Guide.img/Untitled_15.png]]



Set Loader or Saver Node Filename Version Tags:

/for selected version up

/for selected version down

/for selected version to 5



/for all version up

/for all version down

/for all version to 99



/for selected Loader version up

/for selected Loader version down

/for selected Loader version to 99



/for selected Saver version up

/for selected Saver version down

/for selected Saver version to 99

#### Set Attributes

Turn ON the passthrough option for the selected Loader nodes:

/for selected Loader setattrs TOOLB_PassThrough to true



Turn OFF the passthrough option for the selected Loader nodes:

/for selected Loader setattrs TOOLB_PassThrough to false

#### Get Attributes

Read a node's attributes:

/for all getattrs TOOLS_RegID

/for all getattrs TOOLST_Clip_Name

/for all getattrs TOOLB_PassThrough



Read the most recent render time for the selected nodes:

/for selected getattrs TOOLN_LastFrameTime

#### Get Input Values

Read a node's inputs:

/for all Transform get Aspect

/for all get StyledText

/for all get Font

/for all get Center

#### Modify 3D Meshes

##### FBX/OBJ 3D Meshes

Rename the node:

/for selected SurfaceFBXMesh setname to "pCubeFBX"



FBX/OBJ - Modify the object name selected from the 3D model hierarchy:

/for selected SurfaceFBXMesh set ObjName to "pCube"



FBX/OBJ - Clear the object name selected from the 3D model hierarchy:

/for selected SurfaceFBXMesh set ObjName to ""



FBX/OBJ - Modify the take name:

/for selected SurfaceFBXMesh set TakeName to "Take 999"



FBX/OBJ - Modify the imported file name:

/for selected SurfaceFBXMesh set ImportFile to "Comp:/Media/pCube.fbx"



/for selected SurfaceFBXMesh set ImportFile to "Macros:/KartaVR/Images/roller_coaster_track.fbx"

##### Alembic 3D Meshes

Rename the node:

/for selected SurfaceAlembicMesh setname to "pCubeABC"



ABC - Modify the object name selected from the 3D model hierarchy:

/for selected SurfaceAlembicMesh set ObjName to "Mesh/pCube"



ABC - Clear the object name selected from the 3D model hierarchy:

/for selected SurfaceAlembicMesh set ObjName to ""



ABC - Modify the imported file name:

/for selected SurfaceAlembicMesh set ImportFile to "Comp:/Media/pCube.abc"

#### OFX and Fuses

OFX plugins and Fuses can be targeted by SlashFor if you know their node type via the Registry ID value:

/for all ofx.com.frischluft.openFX.DepthOfField select

/for all Fuse.Wireless select

/for all Fuse.vImageWireless select

/for all Fuse.vTextCreate select

#### Render

The /for render flags make selective rendering of nodes in a comp easier:

/for render [step <value>]



Render Selected Nodes:

/for selected render



Render Selected nodes step by 25 frames at a time:

/for selected render step 25



Render all Saver nodes:

/for all Saver render



Render all Saver nodes step by 100 frames at a time:

/for all Saver render step 100

# Hypertext Compositor

[Hypertext Compositor is an Interactive Documentation & Walkthrough Tool for Compers](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=23827#p23827)



The "Hypertext Compositor" tool is available in Reactor and it can be used to create e-documentation and templated comp walkthroughs. It is accessible in the Reactor "Docs" category.



![[Pipeline Guide.img/Reactor Hypertext Compositor.png]]



The Hypertext Compositor script looks for an HTML formatted sidecar .htm webpage file in the same folder as a .comp file. This allows you to pass along an illustrated guide about the composite to other users.



Hypertext Compositor supports the use of custom Fusion comp based HTML "a href" anchor codes to create guided tutorials that can control the Fusion timeline, adjust comp settings, add nodes/macros/media/3D models, run scripts, and display content in the viewer window when you click on the hyperlinks. If you Shift+Click on a hyperlink a preview of the URL will be displayed.



In Resolve/Fusion you can also drag an .htm file from your desktop and drop it in the Nodes view and the webpage will be displayed in a new window.



Hypertext Compositor was inspired by an old-school Fusion term called "SBS" or Side-by-Side that was used to represent an approach where a Lua script could be run by Fusion as soon as a .comp file of the same name was opened. The Hypertext Compositor extends this Side-by-Side system to support comp specific documentation.

### Hypertext Compositor Screenshots

Here are two screenshots that show the Hypertext Compositor window active with a side-by-side webpage loaded. The clickable links are able to help guide the usage of the composite that is open.



![[Pipeline Guide.img/ht-screenshot.jpg]]![[Pipeline Guide.img/ht-view.png]]

### Hypertext Compositor Usage



If you had a composite called "wesuckless.comp", the SBS HTML formatted sidecar file would be named "wesuckless.htm". When the composite is opened using the "File > Open..." or "File > Open Recent > " menu items, the matching HTML guide would be displayed automatically.



### Hypertext Compositor Editor



An HTML code editor is provided that makes it easy to live-edit and preview the .htm documentation with the images visible, and special clickable hyperlinks are active, too. At the top left of the Editor UI is a ComboBox menu that allows you to quickly add the commands to control a Fusion session.



![[Pipeline Guide.img/Reactor Hypertext Compositor_1.png]]



Images

The HTML Viewer supports PNG images. You can refer to the media using a PathMap based image embedding source URL. To display an image with a relative path starting at the same folder as your .comp/.htm file is located use:

<img src="Comp:/example.png">



or you could make a "docs" subfolder in your comp directory using and display the image using:

<img src="Comp:/docs/example.png">



HTML Anchor Commands

Select a node by name:

<p><a href="Select://Saver1">Saver</a></p>



View the selected node:

<p><a href="View://">View Selected Node</a></p>



View the selected node on the left viewer:

<p><a href="ViewLeft://">View Selected on Left</a></p>



View the selected node on the right viewer:

<p><a href="ViewRight://">View Selected on Right</a></p>



View a node by name:

<p><a href="View://FastNoise1">FastNoise1</a></p>



View a node on the left viewer by name:

<p><a href="ViewLeft://FastNoise1">FastNoise1</a></p>



View a node on the right viewer by name:

<p><a href="ViewRight://FastNoise1">FastNoise1</a></p>



Frame a view:

<p><a href="FrameAll://FlowView">FrameAll FlowView</a></p>



Rename the selected node:

<p><a href="Rename://CharlieLoader">Rename the node to CharlieLoader</a></p>



Render a node by name:

<p><a href="Render://Saver1">Saver</a></p>



Start the sequence playback:

<p><a href="Play://">Play</a></p>



Rewind the playback:

<p><a href="Rewind://">Rewind Playback</a></p>



Go to a specific frame in the timeline:

<p><a href="Time://12">Jump to frame 12</a></p>



Nudge the Playhead in the timeline to step between keyframes and in between keyframes:

<p><a href="NudgePlayhead://Right">Nudge Playhead Right</a></p>

<p><a href="NudgePlayhead://Left">Nudge Playhead Left</a></p>



Stop the playback:

<p><a href="Stop://">Stop the Playback</a></p>



Save the composite:

<p><a href="Save://">Save the .comp</a></p>



Load a composite:

<p><a href="Load://Comp:/sidecar_demo_end.comp">Load a .comp</a></p>

<p><a href="Load://Reactor:/Deploy/Comps/Templates/UT_Anonymous_Water.comp">Load a .comp</a></p>



Add a macro:

<p><a href="AddSetting://Reactor:/Macros/Creator/NyanCat.setting">Add the NyanCat macro</a></p>



Add a node:

<p><a href="AddTool://GridWarp">Add GridWarp node</a></p>



Add a Loader node:

<p><a href="AddMedia://Comp:/Render/image.0000.exr">Add an image</a></p>

<p><a href="AddMedia://Reactor:/Deploy/Macros/KartaVR/Images/latlong_wide_ar.jpg">Add an image</a></p>



Run a script:

<p><a href="RunScript://Reactor:/Deploy/Scripts/Comp/hos_SplitEXR_Ultra.lua">Split the selected EXR image</a></p>



Open Reactor:

<p><a href="AddAtom://">Open the Reactor package manager</a></p>



Toggle the passthrough mode on a node:

<p><a href="PassthroughOn://Loader1">Passthrough On Loader1</a></p>

<p><a href="PassthroughOff://Loader1">Passthrough Off Loader1</a></p>



Toggle the passthrough mode on the currently selected node:

<p><a href="PassthroughOn://">Passthrough On Selected Node</a></p>

<p><a href="PassthroughOff://">Passthrough Off Selected Node</a></p>



Run a shell command from the terminal:

<p><a href="Shell://env">List environment variables on Mac/Linux</a></p>

<p><a href="Shell://set">List environment variables on Windows</a></p>



Run a Lua/Python command:

<p><a href="Execute://Print([=[Hello World]=])">Print "Hello World" in the Fusion Console</a></p>



Run a Fusion action:

<p><a href="DoAction://App_CustomizeHotkeys">Run the Customize Hotkeys Action</a></p>



Lock the comp to suppress file dialogs:

<p><a href="Lock://">Lock the Comp</a></p>



Unlock the comp to show file dialogs:

<p><a href="Unlock://">Unlock the Comp</a></p>



Undo the last action:

<p><a href="Undo://">Undo</a></p>



Redo the last action:

<p><a href="Redo://">Redo</a></p>



Show a preference window:

<p><a href="ShowPrefs://PrefsScript">Show the scripting preference window</a></p>



Import an ABC file:

<p><a href="AbcImport://">Import ABC Mesh</a></p>



Import an FBX/OBJ file:

<p><a href="FBXImport://">Import FBX/OBJ Mesh</a></p>



Import an SVG Vector file:

<p><a href="SVGImport://">Import SVG Vector</a></p>



Import a Shape file:

<p><a href="ShapeImport://">Import Shape</a></p>



Toggle the display of the Bins window:

<p><a href="Bins://">Toggle Bin Window</a></p>



Toggle the display of the Render Manager window:

<p><a href="RenderManager://">Toggle Render Manager Window</a></p>



Working With Environment Variables

An environment variable can be thought of as a system wide preference that any program that is started is able to read. An environment variable is a technique that system administrators will often use to customize the operating environment that software runs inside of on a workstation or render node. 



This concept of customizing environment variables allows you to pass a common set of preferences to multiple executable programs in a consistent way. It helps inform software of the custom values you might want to define system wide and avoids using hard-coded fixed settings in each application. 



It is possible to read environment variables inside of just about every general purpose programming language or scripting language like C, C++, C#, Python, Lua, Perl, PHP, Batch, and BASH/ZSH, etc.

# Windows Environment Variables

The "PATH" variable, which is written as %PATH% when accessed from the command prompt window, is used for several purposes. One of those use cases is to define which executable programs on your computer  (.exe, .bat, etc files) can be run from a terminal session simply by typing in the program's base filename without having to always write in the full folder path to the program. 



This saves a lot of time when a user frequently navigates a filesystem hierarchy in a text based command prompt/terminal window and runs a series of command line tools.



Editing the Windows OS %PATH% environment variable is done by opening your Windows System Control Panel. Click on the Advanced system settings button on the left side of the window.



![[Pipeline Guide.img/Untitled_16.png]]



The "System Properties" window will appear. Click on the Environment Variables... button.



![[Pipeline Guide.img/Untitled_17.png]]



In the "Environment Variable" window you need to scroll down in the "System variables" section of the view and select the Path entry. Click the Edit... button.



![[Pipeline Guide.img/Untitled_18.png]]



On Windows 10 a visual "Edit environment variable" editor window will appear. This dialog has separate path text fields that make it easier to add/remove and re-order the individual environment %Path% variable items.



![[Pipeline Guide.img/Untitled_19.png]]

### Listing the Active Windows Environment Variables

On Windows 10 you can type "set" into the Command Prompt window to see all of the active environment variables on the system.



![[Pipeline Guide.img/Untitled_20.png]]

# Linux Environment Variables

If you are on a Linux system, system wide environment variables are typically defined by editing either a "$HOME/.profile" or "$HOME/.bash_profile" document based upon your current shell.



You would then add new environment variable to the profile document that look a bit like this:



export REACTOR_DEBUG_FILES=true

export REACTOR_DEBUG=true

export REACTOR_INSTALL_PATHMAP=AllData:

### Listing the Active Linux Environment Variables

On Linux you can type "env" into the Terminal window to see all of the active environment variables on the system.

## macOS Environment Variables

If you are on macOS Monterey, you might have several environment variables active in your macOS ZSH session, that were defined via a "$HOME/.zshrc" file. If you add more and more environment variables to your workstation in this fashion, you will later on be quite surprised to find out these values are not used system wide in all of the programs you might run. 



In the long term, MacOS power users tend to transition away from relying on .zshrc files as the way they define their environment variables over to using macOS Launch Agent .plist files. The .plist file approach is advantageous as it allows executables that are started by double-clicking on the .app package, or run from the dock, to access the same environment variables values that can be accessed in Terminal sessions and in AppleScripts, too.



On a MacOS system the easiest and most reliable way to set up new environment variables is with the help of LaunchAgent .plist files. If you want to make it easy to visually edit a LaunchAgent PLIST document as you get started, you can look at using a 3rd party utility like ["LaunchControl" by Soma-Zone](http://www.soma-zone.com/LaunchControl/).



Most often Launch Agent .plist files are edited by hand in a programmer's text editor, to customize them, before you would install them on your system. 

Here is an example of a Launch Agent PLIST text file that ships with the Reactor package manager. It is named "setenv.reactor.REACTOR_DEBUG.plist" and is used to turn on debug logging via a "REACTOR_DEBUG" environment variable that is set to a value of "true":



<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

<plist version="1.0">

    <dict>

    <key>Label</key>

    <string>setenv.reactor.REACTOR_DEBUG</string>

    <key>ProgramArguments</key>

    <array>

    <string>/bin/launchctl</string>

    <string>setenv</string>

    <string>REACTOR_DEBUG</string>

    <string>true</string>

    </array>

    <key>RunAtLoad</key>

    <true/>

    </dict>

</plist>



These type of Launch Agent .plist documents are designed to be installed on your MacOS system using root permissions to the folder:

/Library/LaunchAgents/

Alternatively, you can install a Launch Agent .plist file in your home folder:

/Users/vfx/Library/LaunchAgents

When you go to install the .plist files you will need to change the documents to be owned by "root", have the group name of "wheel", and have a Unix "octal" file permission setting of 644.

sudo chown root /Library/LaunchAgents/setenv.reactor.*.plist

sudo chgrp wheel /Library/LaunchAgents/setenv.reactor.*.plist

sudo chmod 644 /Library/LaunchAgents/setenv.reactor.*.plist

You can take a look at the file permissions of the Launch Agent files on your system using the following terminal command:

ls -la /Library/LaunchAgents/

You will then see a directory listing that looks something like this:

drwxr-xr-x  24 root  wheel   816 Nov 17 12:28 .

drwxr-xr-x+ 62 root  wheel  2108 Nov 17 11:59 ..

-rw-r--r--   1 root  wheel   715 Oct 26  2016 org.macosforge.xquartz.startx.plist

-rw-r--r--@  1 root  wheel   474 Nov 17 05:42 setenv.reactor.REACTOR_BRANCH.plist

-rw-r--r--@  1 root  wheel   463 Oct 25 07:25 setenv.reactor.REACTOR_DEBUG.plist

-rw-r--r--@  1 root  wheel   475 Oct 25 07:27 setenv.reactor.REACTOR_DEBUG_FILES.plist

-rw-r--r--@  1 root  wheel   473 Dec  7 22:23 setenv.reactor.REACTOR_INSTALL_PATHMAP.plist

### Listing the Active macOS Environment Variables

On MacOS you can type "env" into the Terminal window to see all of the active environment variables on the system.



![[Pipeline Guide.img/Untitled_21.png]]



# Configuring Fusion Centric Environment Variables

Common Environment variables in a fully configured Fusion Studio deployment typically include:



-   PATH

-   LD_LIBRARY_PATH

-   FUSION16_PROFILE

-   FUSION16_PROFILE_DIR

-   FUSION16_MasterPrefs

-   FUSION_LICENSE_SERVER


-   FUSION_PLUGIN_PATH

-   FUSION_OFX_PLUGIN_PATH

-   OCIO

-   LUA_PATH

-   LUA_CPATH

-   REACTOR_DEBUG




Essential reading on this topic includes:



-   [VFXPedia | Fusion Environment Variables](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexdca0.html?title=Environment_Variables)

-   [VFXPedia | Per-User Preferences and Paths](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexad6a.html?title=Per-User_Preferences_and_Paths)

-   [VFXPedia | Administrators FAQ](https://www.steakunderwater.com/VFXPedia/96.0.243.189/indexa105.html?title=Administrators_FAQ)




## Blocking Incompatible OFX Plugins From Loading in Fusion

After you install a wider range of compositing tools on your visual workstations and render nodes, you will likely need to set up a "Fusion OFX Blocklist File". This will stop a wide range of Fusion startup error messages from being spawned regularly by the broken OFX plugins, that would otherwise spam the Console window and halt Fusion with nagging error dialogs.



The standard OFX Plugin folder location is:



Windows:

C:\Program Files\Common Files\OFX\Plugins



Mac:

/Library/OFX/Plugins/



Linux:

/usr/OFX/Plugins/



An interesting thing about using an OFX blocklist file approach, is that it allows incompatible OFX plugins to be skipped transparently when Fusion Studio/Fusion Render Nodes are launched. This is achieved by specifically defining the exact name of the OFX plugins you want excluded, one-item-per-line in the file. 



This document is created at the PathMap location of:



Profile:\FusionOFX.blocklist



The "UI Manager" atom package includes a handy script called the "OFX Blocklist Generator" that streamlines the effort needed to prepare a Fusion Studio v18 compatible blocklist resource. The script scans inside your OFX Plugins folder path and then lists those items in a new text-based configuration file.



![[Pipeline Guide.img/UI Manager OFX Blocklist Generator.png]]

## Fusion Profile Customizations

A customized Fusion Profile Path can be configured to pre-define the Fusion preferences for an artist through the use of environment variables, along with a Fusion Master Prefs.



Make sure to define a Master Prefs locking setting when generating the Lua table based document.

## Fusion Diagnostic Tool

The "UI Manager" atom package includes a handy script called the "Fusion Diagnostics Tool" that allows you to troubleshoot your most common Fusion-based environment variables in a low-effort fashion.



![[Pipeline Guide.img/UI Manager Fusion Diagnostics Tool.png]]

AWS Deadline Deployment

![[Pipeline Guide.img/Deadline Worker Startup.png]]



Deadline is a render manager and job scheduling tool that is distributed by Amazon AWS Thinkbox. Deadline has Win/Linux/macOS cross platform support and can run on-premise or in the cloud via Amazon AWS EC2.



Amazon AWS Thinkbox provides a very accessible 50,000 render nodes for free licensing option which allows companies to get comfortable with the toolset before committing to it as their core tool.

[https://www.awsthinkbox.com](https://www.awsthinkbox.com/)

# Deadline Monitor



Rendering jobs in Deadline are managed using the "Monitor" program which can be run on artist workstations, and on render node systems, too.



![[Pipeline Guide.img/Untitled_22.png]]

# Deadline Configuration

## Configure Monitor Options

    Monitor Options

        Task List

            Rendering Task Double-Click Behaviour - Connect to Worker log

### Tools > Super User Mode

    Monitor Options

        Misc

            [x] Start in Super user mode

### Tools

    Configure Repository Options

    - Client Setup

        - Remote Control

        [x] Remote Administration

        (x) Disable the allow list

### Performance Settings

    - (Auto Adjust) button

        5 workers

### Mapped Paths

    (might be required later)

### Usage Based Licensing

[ ] Use Cloud License Server

[ ] Use dynamic licensing mode

[ ] Autodetect 3rd party Usage based license consumption

### Tools

- Manage Pools



The Manage Pools window is where you configure the individual groups of render nodes that have certain collections of software installed and licensed, or that are running a similar operating system, or hardware configuration. 



This interface allows you to segment job tasks you want to run based upon the best fit for the available hardware, GPU, OS, or software needs.



![[Pipeline Guide.img/Untitled_23.png]]

#### Pools:

    maya

    vray

    fusion

    houdini

    ptgui

#### Assigned Pools

    R1 - vray, fusion, houdini, ptgui

    R2 - maya, vray, fusion, houdini, ptgui

    R3 - vray, fusion, houdini, ptgui

    R4 - vray, fusion, houdini, ptgui

    R5 - maya, vray, fusion, houdini, ptgui

## Configure Script Menus

    Use shift-select to highlight the tools you aren't using. The "Edit Selection" button has an "[x] Enable" checkbox you can turn off to hide a tool from the Submit menus.



![[Pipeline Guide.img/Untitled_24.png]]

### 2D Comp

    Fusion

### 3D

    Houdini

    Maya

    V-Ray

### Misc

    Command Line

    Command Script

    Python

### Processing

    DJV

    FFmpeg

    Mistika VR

    VDenoise

## Submitters

Deadline uses a "submitter" tool to define how a new job task is created. This is the interface where you specify all the parameters for the program you want to launch and the type of data you want to process.

#### Fusion

The highest "Version" is currently "16". We need to add "18".

#### Houdini

The highest "Version" is currently "19". We need to add "19.5".

#### Maya

Supports "Version" 2023 by default.



#### Editing Worker "Render Node" Attributes.

If you would like to edit a Deadline worker system's attributes you can right-click on a worker. In the contextual menu select "Worker Properties".



Then navigate in the dialog to "General > Worker Description". Enter a value that clearly defines what type of computer system is used for the current render node like:

Threadripper 3990X

## Deadline Submitter Installers

    F:\Deadline\DeadlineRepository10\submission\Maya\Installers

    F:\Deadline\DeadlineRepository10\submission\Houdini\Installers

    F:\Deadline\DeadlineRepository10\submission\Fusion\Installers

## Configure Plugins

The "Configure Plugins" window is where you set up the individual programs you want Deadline to control, and specify the installation location for each version of the apps you 

want to launch on render nodes.



![[Pipeline Guide.img/Untitled_25.png]]



### Configure Plugins > MayaBatch - Done by default



### Configure Plugins > MayaCmd - Done by default



### Configure Plugins > Fusion

C:\Program Files\Blackmagic Design\Fusion Render Node 18\FusionRenderNode.exe

C:\Program Files\Blackmagic Design\Fusion 18\Fusion.exe

/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode

/opt/BlackmagicDesign/Fusion18/Fusion

/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node

/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

### Configure Plugins > FusionCmd

C:\Program Files\Blackmagic Design\Fusion Render Node 18\FusionRenderNode.exe

C:\Program Files\Blackmagic Design\Fusion 18\Fusion.exe

/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode

/opt/BlackmagicDesign/Fusion18/Fusion

/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node

/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

### Configure Plugins > Vray

C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64\maya_vray\bin\vray.exe

### Configure Plugins > vdenoise

C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64\vray\bin\vdenoise.exe

### Configure Plugins > Houdini

Houdini has its own bundled version of the Python scripting utilities called "Hython" aka. "Houdini Python".

##### Houdini 19.5 Hython Executable



C:\Program Files\Side Effects Software\Houdini 19.5.368\bin\hython.exe

/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/bin/hython

/opt/hfs19.5.368/bin/hython



##### Houdini 19.5 Sim Tracker File



C:\Program Files\Side Effects Software\Houdini 19.5.368\houdini\python3.7libs\simtracker.py

/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.0/Resources/houdini/python3.7libs/simtracker.py

/opt/hfs19.5.368/houdini/python3.7libs/simtracker.py

## Deadline Plugins Patching

In order to get the most out of Amazon AWS Deadline software, you will likely need to edit a few of the submitters and configuration files by hand in a programmer's text editor like "Notepad++", "BBEdit", or "Gedit". This step is relevant in cases where you are using the Deadline toolset in the license-free mode, and are working without a paid AWS Thinkbox support contract.



The "Submit Fusion Job To Deadline" scripted GUI looks like this image below. It has been modified to add newer Fusion Render Node version support than currently comes in a stock release of Deadline. Instructions below cover this process.



![[Pipeline Guide.img/Deadline Submit Fusion Job_1.png]]



We need to start by adding a revised set of "Fusion.ico" / "FusionCmd.ico" image resources to match our use of BMD Fusion Studio v18.




The following items listed below are listings of the individual text files you need to manually open up in your text editor. Also included are the sections of the text file you need to find in the document and then edit by hand.



## Fusion plugin

### Edit File

plugins\Fusion\Fusion.options

### Changes

Default=18

### Content to Edit

[Version]

Type=string

Label=Version

Category=Fusion Version

Description=The Fusion version to render with

Required=true

DisableIfBlank=false

Default=18

### Edit File

plugins\Fusion\Fusion.param

### Content to Add

[Fusion17RenderExecutable]

Type=multilinemultifilename

Label=Fusion 17 Render Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=0

Default=C:\Program Files\Blackmagic Design\Fusion Render Node 17\FusionRenderNode.exe;C:\Program Files\Blackmagic Design\Fusion 17\Fusion.exe;/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode;/opt/BlackmagicDesign/Fusion17/Fusion;/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 17/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 17 Render Node executable used for rendering. Enter alternative paths on separate lines.



[Fusion17WaitForExecutable]

Type=string

Label=Fusion 17 Wait For Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=1

Default=

Description=If you use a proxy FusionRenderNode.exe, set this to the name of the renamed original.  For example, it might be set to FusionRenderNode_original.exe.



[Fusion17VersionToEnforce]

Type=string

Label=Fusion 17 Version To Enforce

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=2

Default=

Description=Deadline will only render Fusion 17 jobs on Workers running this version of Fusion 17. Use a ; to separate alternative versions. Leave blank to disable this feature.



[Fusion17SlavePreferenceFile]

Type=filename

Label=Fusion 17 Node Preference File

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=3

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render. Leave blank to disable this feature.



[Fusion18RenderExecutable]

Type=multilinemultifilename

Label=Fusion 18 Render Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=0

Default=C:\Program Files\Blackmagic Design\Fusion Render Node 18\FusionRenderNode.exe;C:\Program Files\Blackmagic Design\Fusion 18\Fusion.exe;/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode;/opt/BlackmagicDesign/Fusion18/Fusion;/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 18 Render Node executable used for rendering. Enter alternative paths on separate lines.



[Fusion18WaitForExecutable]

Type=string

Label=Fusion 18 Wait For Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=1

Default=

Description=If you use a proxy FusionRenderNode.exe, set this to the name of the renamed original.  For example, it might be set to FusionRenderNode_original.exe.



[Fusion18VersionToEnforce]

Type=string

Label=Fusion 18 Version To Enforce

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=2

Default=

Description=Deadline will only render Fusion 18 jobs on Workers running this version of Fusion 18. Use a ; to separate alternative versions. Leave blank to disable this feature.



[Fusion18SlavePreferenceFile]

Type=filename

Label=Fusion 18 Node Preference File

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=3

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render. Leave blank to disable this feature.

## FusionCmd plugin

Added a revised FusionCmd.ico for Fusion v18.

### Edit File

plugins\FusionCmd\FusionCmd.options

### Content Edit

[Version]

Type=string

Label=Version

Category=Fusion Version

Description=The Fusion version to render with

Required=true

DisableIfBlank=false

Default=18

### Edit File

FusionCmd.param

### Content to Add

[Fusion17RenderExecutable]

Type=multilinemultifilename

Label=Fusion 17 Render Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=0

Default=C:\Program Files\Blackmagic Design\Fusion Render Node 17\FusionRenderNode.exe;/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode;/opt/BlackmagicDesign/Fusion17/Fusion;/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 17/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 17 Console Node executable used for rendering. Enter alternative paths on separate lines.



[Fusion17SlavePreferenceFile]

Type=filename

Label=Fusion 17 Render Node Preference File

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=1

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render Node. Leave blank to disable this feature.



[Fusion18RenderExecutable]

Type=multilinemultifilename

Label=Fusion 18 Render Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=0

Default=C:\Program Files\Blackmagic Design\Fusion Render Node 18\FusionRenderNode.exe;/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode;/opt/BlackmagicDesign/Fusion18/Fusion;/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 18 Console Node executable used for rendering. Enter alternative paths on separate lines.



[Fusion18SlavePreferenceFile]

Type=filename

Label=Fusion 18 Render Node Preference File

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=1

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render Node. Leave blank to disable this feature.

### Edit File

F:\Deadline\DeadlineRepository10\scripts\Submission\FusionSubmission.py

### Content to Edit

    scriptDialog.AddControlToGrid( "VersionLabel", "LabelControl", "Version", 5, 0, "The version of Fusion to render with.", False )

    scriptDialog.AddComboControlToGrid( "VersionBox", "ComboControl", "18", ["5","6","7","8", "9", "16", "17", "18"], 5, 1 )

    commandLineModeBox = scriptDialog.AddSelectionControlToGrid( "CommandLineModeBox", "CheckBoxControl", False, "Command Line Mode", 5, 2, "Enable to render in command line mode using the FusionCmd plugin (this disables some features)." )

    commandLineModeBox.ValueModified.connect(CommandLineModeChanged)



    scriptDialog.AddControlToGrid( "BuildLabel", "LabelControl", "Build", 6, 0, "", False )

    scriptDialog.AddComboControlToGrid( "BuildBox", "ComboControl", "None", ("None","32bit","64bit"), 6, 1 )

    scriptDialog.AddSelectionControlToGrid("SubmitSceneBox", "CheckBoxControl", True, "Submit Comp File", 6, 2, "If this option is enabled, the flow/comp file will be submitted with the job, and then copied locally to the Worker machine during rendering.")

    scriptDialog.EndGrid()

### Edit File

F:\Deadline\DeadlineRepository10\scripts\Submission\HoudiniSubmission.py

### Content to Edit

HOU_VERSIONS = ("9.0", "10.0", "11.0", "12.0", "13.0", "14.0", "15.0", "15.5", "16.0", "16.5", "17.0", "17.5", "18.0", "18.5", "19.0", "19.5")

### Edit File

F:\Deadline\DeadlineRepository10\plugins\Houdini\Houdini.param

### Content to Edit

[Houdini19_5_Hython_Executable]

Label=Houdini 19.5 Hython Executable

Category=Render Executables

CategoryOrder=0

Type=multilinemultifilename

Index=14

Default=C:\Program Files\Side Effects Software\Houdini 19.5.368\bin\hython.exe;/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/bin/hython;/opt/hfs19.5/bin/hython

Description=The path to the hython executable. It can be found in the Houdini bin folder.



[Houdini19_5_SimTracker]

Label=Houdini 19.5 Sim Tracker File

Category=HQueue Simulation Job Options

CategoryOrder=1

Type=multilinemultifilename

Index=10

Default=C:\Program Files\Side Effects Software\Houdini 19.5.368\houdini\python3.7libs\simtracker.py;/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/houdini/python3.7libs/simtracker.py;/opt/hfs19.5/houdini/python3.7libs/simtracker.py

Description=The path to the simtracker.py file that is used when distributing HQueue sim jobs. This file can be found in the Houdini install.

### Edit File

F:\Deadline\DeadlineRepository10\plugins\Houdini\Houdini.options



(test the Default= line which I added)

### Content to Edit

[Version]

Type=label

Label=Version

Category=Houdini Version

CategoryOrder=1

Description=The version of Houdini to use for rendering.

Required=false

DisableIfBlank=true

Default=14

### Deadline Worker

Options Menu

    [x] Hide When Minimized

    [x] Minimize on Startup

## Deadline Todos

Document how to solve the issue with the Deadline sanity check function when submitting Fusion comps that lack a Saver node, when the "Command-Line Mode" checkbox is disabled. 



This default sanity checking feature of Deadline's for pre-flight inspecting the contents of a .comp file can interfere with the rendering of composites that use fuses like ExternalMatteSaver, LiveSaver, pioSaver, or Vonk data nodes to save media directly to disk.

# Pixar Tractor Deployment

Pixar's Tractor render management tool is often installed and used alongside Pixar's RenderMan production renderer on Linux based headless render nodes. 

[https://renderman.pixar.com/tractor](https://renderman.pixar.com/tractor)



A tractor license entitlement is often provided with RenderMan commercial licenses. This is defined as a "FeatureInfo" block in your Pixar.license file:

<FeatureInfo>

    <FeatureName>Tractor</FeatureName>

    <FeatureVersion>2.000</FeatureVersion>

    <ExpirationDate>22-jul-2023</ExpirationDate>

    <FeatureCount>10</FeatureCount>

    <FeatureCode>...</FeatureCode>

    <ExtraData></ExtraData>

</FeatureInfo>



Tractor is also available separately as a standalone offering which can be purchased with maintenance from the Pixar RenderMan team sales staff.

## Controlling Tractor



Tractor can be controlled from a WebUI, as well as from a terminal based command-line session, or Python scripting.



![[Pipeline Guide.img/Pixar Tractor.png]]

## Tractor and macOS Port Ranges

When running Tractor Blade on macOS systems it is important to change the default port number from trying to open a new connection to port 80.  A popular alternative port number to use is 8080.



For compatibility reasons, a higher port range number has to be defined manually in the Tractor preference files to avoid Tractor communication messages being blocked by the macOS network rules.



The command-line syntax to start a Tractor Blade engine on port 8080 is:

# Start Tractor Blade

/opt/pixar/Tractor-2.4/bin/tractor-blade --engine=tractor-engine:8080 &



Installing Common Utilities

# Install AnyDesk Screen Sharing on Linux

AnyDesk is a remote access tool which allows for system administration tasks to be done via screen sharing. It can tunnel a remote connection through a firewall if required.

[https://www.anydesk.com/](https://www.anydesk.com/)



# Add a new AnyDesk repo entry

cat > /etc/yum.repos.d/AnyDesk-RHEL.repo << "EOF"

[anydesk]

name=AnyDesk RHEL - stable

baseurl=http://rpm.anydesk.com/rhel/$releasever/$basearch/

gpgcheck=1

repo_gpgcheck=1

gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY

EOF



# Add Anydesk using the DNF package manager

sudo dnf install anydesk

# Install TeamViewer Screen Sharing on Windows/macOS

[https://www.teamviewer.com/en/](https://www.teamviewer.com/en/)



# Install Parsec Screen Sharing on Windows

[https://parsec.app/](https://parsec.app/)



# Install RealVNC Screen Sharing on Windows

[https://www.realvnc.com/en/](https://www.realvnc.com/en/)



For more information:

-   [https://www.realvnc.com/en/connect/download/vnc/](https://www.realvnc.com/en/connect/download/vnc/)


# Install Steam on Linux

[https://www.dedoimedo.com/computers/rocky-linux-8-steam.html](https://www.dedoimedo.com/computers/rocky-linux-8-steam.html)

# Remote Keyboard and Mouse Sharing with Synergy

Through the magic of [Synergy keyboard/mouse sharing](https://symless.com/synergy) it is possible to track the mouse pointer seamlessly across the two or more systems, regardless of the host OS platform.



This can remove the need to juggle multiple keyboards on the same desk if you need to manage Windows, Linux, and macOS systems as part of your daily activities.



![[Pipeline Guide.img/Untitled_26.png]]

## Sharing a Microsoft Windows Keyboard with a macOS System Using Windows Key vs Command Key Remapping



![[Pipeline Guide.img/Synergy Mac Side Command Key Remapping.png]]

# VirtualHere Network-Based USB Device Sharing

If you have several fixed USB licensing dongles that you need to be able to float between several different computers, then the VirtualHere software is a miracle for your problems.

[https://www.virtualhere.com/](https://www.virtualhere.com/)



One thing to keep in mind when buying a VirtualHere license is that the host server program is a perpetual licensed program but it is tied to one fixed host system ID and no license migrations are provided. Ever.

# Sharp Keys Based Keyboard Remapping for Windows

The Sharp Keys utility for Windows is excellent if you need to modify the default key bindings of a specific key on your keyboard. This is typically required when using a macOS keyboard with Control/Option/Command keys connected to a remote access session hosted on a Windows PC.



[Microsoft App Store | SharpKeys](https://apps.microsoft.com/store/detail/sharpkeys/XPFFCG7M673D4F)



You have a useful option with the Sharp Keys utility of being able modify both the left and right side "Windows" keys on your keyboard to an alternative kep mapping.



![[Pipeline Guide.img/Mac Keyboard Sharp Keys Command Remap.PNG]]



Or you could choose to bind only a single Windows key (like the left Windows key) to an alternative key mapping. This allows you the flexibility to occasionally access the original unmodified right Windows key.



![[Pipeline Guide.img/Sharp Keys.png]]

# Install Meta QuestLink / AirLink Drivers on Windows

Please see guide "Kartaverse Workflows | SketchFab in VR Via QuestLink "

[https://docs.google.com/document/d/1sWkv5H7ZAM1SnqrEXYRL3kBKnvjqmDjKTA9v9ObN490/edit](https://docs.google.com/document/d/1sWkv5H7ZAM1SnqrEXYRL3kBKnvjqmDjKTA9v9ObN490/edit)



![[Pipeline Guide.img/Untitled_27.png]]



# Windows System Internals Utilities

[https://learn.microsoft.com/en-us/sysinternals/downloads/](https://learn.microsoft.com/en-us/sysinternals/downloads/)



Installing Digital Content Creation Apps

An effective content creation pipeline is able to support a wide range of tools to allow artists to work effectively. Below is an ever-expanding list of popular design tools with detailed installation, software configuration, and automation/scripting notes being added over time.

# Install Blender 3 on Linux

Blender is a free open-source GPL licensed 3D package that features integrated modeling, texturing, animation, simulation, rendering, video editing, and compositing tools.

[http://blender.org/](http://blender.org/)



# Add Blender v3

sudo dnf install blender -y

# Autodesk Maya on Linux

## Maya Installation

![[Pipeline Guide.img/Untitled_28.png]]



# GUI Install of Maya

./Setup



# CLI Maya Install

cd Packages

sudo rpm -ivh Maya2020*.rpm adlmapps*.rpm adsklicensing*.rpm adlmflex*.rpm



# Force the install with -f

sudo rpm -ivhf --force  *.rpm



# Add the extra stuff

sudo dnf install libpng15 compat-openssl10 -y



sudo dnf install mesa-libGLw libXp gamin audiofile audiofile-devel compat-openssl10 libpng15 libnsl python2 xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi -y



# Run Maya

/usr/autodesk/maya2022/bin/maya

## Common Maya Preferences

-   Interface > Devices > Mouse scroll wheel > [x] Enable

-   Display > Performance > Max res. for swatches "4k x 4k"

-   Display > View > (x) Background Gradient

-   Settings > Rendering > Preferred Renderer > V-Ray

-   Settings > Rendering > Preferred Render Setup System > Legacy Render Layers


## Maya.env File Settings

A Maya.env file is used to hold environment variable settings for a specific Maya release version.



The initial Maya.env file can be created on Linux using:

sudo mkdir -p $HOME/maya/2023/

sudo chmod -R 777 $HOME/maya/

nano $HOME/maya/2023/Maya.env



When editing this file you can paste in:

# Suppress Arnold not found error message:

MAYA_NO_WARNING_FOR_MISSING_DEFAULT_RENDERER=1



# Set the CIP disable flag:

MAYA_DISABLE_CIP=1

## Running Maya Batch from the Linux Command-Line



The batch version of Maya can be run on render node systems using:

maya -batch --help



Render -help

Usage: Render [options] filename

       where "filename" is a Maya ASCII or a Maya binary file.



Common options:

  -help              Print help

  -test              Print Mel commands but do not execute them

  -verb              Print Mel commands before they are executed

  -keepMel           Keep the temporary Mel file

  -listRenderers     List all available renderers

  -renderer string   Use this specific renderer

  -r string          Same as -renderer

  -proj string       Use this Maya project to load the file

  -log string        Save output into the given file

  -rendersetuptemplate string Apply a render setup template to your scene before command line rendering.  Only templates exported via File > Export All in the Render Setup editor are supported.  Render setting presets and AOVs are imported from the template.  Render settings and AOVs are reloaded after the template if the -rsp and -rsa flags are used in conjunction with this flag.

  -rst string        Same as -rendersetuptemplate

  -rendersettingspreset string Apply the scene Render Settings from this template file before command line rendering.  This is equivalent to performing File > Import Scene Render Settings in the Render Setup editor, then batch rendering.

  -rsp string        Same as -rendersettingspreset

  -rendersettingsaov string Import the AOVs from this json file before command line rendering.

  -rsa string        Same as -rendersettingsaov



Specify a valid -r option to get a more detailed help about a renderer.

For example: Render -help -r sw




To check the current Maya version you can run:

maya -batch -v

# Maya 2020, Cut Number 202011110415



You can verify that Maya has been registered and activated by a network or log-in license using the following command-line licensing utility:



/opt/Autodesk/AdskLicensing/9.2.1.2399/helper/AdskLicensingInstHelper list



If successful, Maya should appear in the list of products returned by the Adsk Licensing Inst Helper utility. A sample output from running the executable looks like this:



[

  {

    "feature_id": "MAYA",

    "def_prod_key": "657L1",

    "def_prod_ver": "2020.0.0.F",

    "sel_prod_key": "657L1",

    "sel_prod_ver": "2020.0.0.F",

    "supported_lic_methods": [

      2,

      1,

      4

    ],

    "lic_servers": [

      ""

    ],

    "serial_number_sa": "...",

    "serial_number_nw": "...",

    "def_prod_code": "MAYA",

    "sel_prod_code": "MAYA"

  }

]




Manually creating a License.env file

sudo nano /usr/autodesk/maya2020/bin/License.env



Used a text editor to add your network licensing details to the License.env file

MAYA_LICENSE=657L1

MAYA_LICENSE_METHOD=network



Manually creating a maya.lic license file

sudo nano /var/flexlm/maya.lic



Add your floating license server details to the maya.lic text file:

SERVER R1 0

 USE_SERVER



At this point you should add "/opt/Autodesk/Adlm/R17/lib64/" directory temporarily to the "LD_LIBRARY_PATH" environment variables to set your shared libraries for this session.



For example, you can run the following command in a BASH shell:

export LD_LIBRARY_PATH=/opt/Autodesk/Adlm/R17/lib64/



It is a good idea to backup the old Maya licensing .pit file:

sudo mv /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit.bak

sudo rm -rf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit



Now you can run the following commands to register Maya with the Autodesk licensing app:



In the following example the serial number is represented as  <...> for a snipped out value to be replaced with your own code.



An example Maya product key is 657L1 (which is used for Maya 2020).



{

cd /usr/autodesk/maya2020/bin



/usr/autodesk/maya2020/bin/adlmreg -i N 657L1 657L1 2020.0.0.F <...> /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit

}



When deploying a new Linux based render node, if a Maya network license was not listed by the Adsk Licensing Inst Helper utility, you can manually register a license using a command line syntax that looks roughly like this:



sudo /opt/Autodesk/AdskLicensing/9.2.1.2399/helper/AdskLicensingInstHelper register -pk 657L1 -pv 2020.0.0.F -el EN_US -cf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit



If the licensing service is not running, you can start it using the following command. 



Note: When running a program with a service based approach, the executable will continue to run in the session.



sudo /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/AdskLicensingService --run



Verify the licensing service is running using:

sudo systemctl status adsklicensing



# ● adsklicensing.service - Autodesk Licensing Service

#    Loaded: loaded (/usr/lib/systemd/system/adsklicensing.service; enabled; vendor preset: disabled)

#    Active: active (running) since Fri 2021-04-23 14:40:20 ADT; 1min 5s ago

#  Main PID: 26769 (AdskLicensingSe)

#     Tasks: 33

#    CGroup: /system.slice/adsklicensing.service

#            └─26769 /usr/bin/AdskLicensingService --run

#  Apr 23 14:40:20 Moonraker systemd[1]: Started Autodesk Licensing Service.



You should verify again if the service is running. If it is still not running, set up the licensing service manually:



{

sudo getent group adsklic &>/dev/null || sudo groupadd adsklic

sudo id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/sbin/nologin

sudo ln -sf /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/AdskLicensingService /usr/bin/AdskLicensingService

sudo mkdir /usr/lib/systemd/system

sudo cp -f /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/adsklicensing.el7.service /usr/lib/systemd/system/adsklicensing.service

sudo chmod 644 /usr/lib/systemd/system/adsklicensing.service

sudo systemctl daemon-reload

sudo systemctl enable adsklicensing

sudo systemctl start adsklicensing

}



Take a look at the Autodesk knowledge base for more information about installing configuring Maya on Linux:

-   [Autodesk | Install Maya on Linux using the rpm package](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-E7E054E1-0E32-4B3C-88F9-BF820EB45BE5-htm.html?us_oa=akn-us&us_si=5a1aa406-06ec-422c-aefb-472c419b3d7d&us_st=maya%20linux%20install)


-   [Autodesk | Additional information for Linux](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-3E0A3A36-B1C2-4B91-994B-731C672D9694-htm.html)

-   [Autodesk | Additional required Linux libraries for Maya](https://knowledge.autodesk.com/support/maya/troubleshooting/caas/CloudHelp/cloudhelp/2022/ENU/Installation-Maya/files/GUID-D2B5433C-E0D2-421B-9BD8-24FED217FD7F-htm.html)


# Andersson Technologies SynthEyes Pro

SynthEyes Pro is high-quality, feature rich, cross-platform compatible MatchMoving software for the film & TV sector. It supports 360VR footage tracking, and stereo 3D camera rigs.



[https://www.ssontech.com](https://www.ssontech.com/)



For more information:

-   [YouTube | SynthEyes | Universal Scene Description (USD) Export, with Tricks](https://www.youtube.com/watch?v=_vHHYXptZpA)

-   [YouTube | Using SynthEyes with Resolve](https://www.youtube.com/watch?v=KIBeSmKekQ0)


# Chaos Group V-Ray Renderer

Chaos Group makes a cross-platform compatible production renderer that runs efficiently on a CPU or a GPU. 



V-Ray's render engine has very strong indirect illumination lighting features that make rendering artifact-free interior scenes of architecture easier and faster than ever.



[https://www.chaos.com/](https://www.chaos.com/)

## V-Ray Benchmark

### Installing V-Ray Benchmark on Linux

# Add the extra libraries to support Electron GUI and GTK based apps

sudo dnf install libpng15 compat-openssl10 -y



# Fix a Vray Benchmark GUI error in the terminal window caused by a missing canberra GTK2 library module

sudo dnf install libcanberra-gtk2 -y

### V-Ray Benchmark Download

Go to the Chaos Group "Benchmark" webpage to download the most recent version.

[https://www.chaos.com/vray/benchmark](https://www.chaos.com/vray/benchmark)



Copy the downloaded V-Ray benchmark app to the opt folder

sudo cp $HOME/Desktop/vray-benchmark-5.02.00 /opt/vray-benchmark-5.02.00



Run the benchmark utility

cd /opt/

/opt/vray-benchmark-5.02.00

### Render Node Benchmarks

The reference system for Kartaverse v5 is an AMD TRX 40 based Threadripper 3990X based server that has high-performance CPU and GPU compute capabilities.



V-Ray CPU Test 

68,232



V-Ray CUDA Test 

7988



V-Ray RTX Test 

11344



It's worth mentioning that the V-Ray benchmark program is Multi-GPU and Multi-CPU aware which is excellent when fine-tuning a new workstation build.



![[Pipeline Guide.img/vrary rtx benchmarks.jpg]]![[Pipeline Guide.img/vray cuda benchmarks.jpg]]

## Installing V-Ray Universal Render Node

Chaos Group sells monthly or annual V-Ray license subscriptions that provide access to a dedicated cross-platform "Universal" render node program.



This executable supports the creation of render farms that can process content coming from a wide range of host DCC (digital-content creation) packages. All that is needed is for the DCC program to use a V-Ray plugin to export standalone .vrscene files. 



![[Pipeline Guide.img/Vray Render Node.png]]

## V-Ray Installer XML-Based Config Files

After you run the V-Ray installer program, you have the option of saving a config file to disk that holds all of your choices. This config file is exported using the XML file format. 



The config file is particularly helpful when carrying out numerous V-Ray Universal Render Node deployment tasks on a render farm since the installer program allows you to run the executable from a text-based SSH shell session:



sudo ./vray_adv_52003_maya2023_centos7 -configFile="/home/vfx/config_vray.xml" -ignoreErrors=1

## V-Ray Licensing Preference File

When V-Ray is used with a network license checkout option, a file is created on-disk named:

$HOME/.ChaosGroup/vrlclient.xml



Since the ".ChaosGroup" folder starts with a period character it is typically hidden on macOS and Linux filesystems by default.



A vrlclient.xml file that does a network license checkout will typically look like this document:

<VRLClient>

<LicServer>

<Host>R1</Host>

<Port>30304</Port>

<Host1></Host1>

<Port1>30304</Port1>

<Host2></Host2>

<Port2>30304</Port2>

<User></User>

<Pass></Pass>

</LicServer>

</VRLClient>



The Host field can hold either a hostname or IP address. This value can be customized visually by the V-Ray installer program to point to your LAN's V-Ray license server system.

## V-Ray Environment Variables

### Linux Standalone

export VRAY_FOR_MAYA2023_MAIN=/usr/autodesk/maya2023/vray

export VRAY_FOR_MAYA2023_PLUGINS=/usr/autodesk/maya2023/vray/vrayplugins

export VRAY_OSL_PATH_MAYA2023=/usr/autodesk/Maya2023/opensl

export VRAY_PATH=/usr/autodesk/maya2023/vray/bin

export VRAY_SEND_FEEDBACK=1

export VRAY_TOOLS_MAYA2023=/usr/autodesk/Maya2023/bin



### Windows Standalone

VRAY_FOR_MAYA2023_MAIN=C:\Program Files\Chaos Group\V-Ray\Standalone for x64\vray

VRAY_FOR_MAYA2023_PLUGINS=C:\Program Files\Chaos Group\V-Ray\Standalone for x64\vray\vrayplugins

VRAY_OSL_PATH_MAYA2023=C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64/opensl

VRAY_SEND_FEEDBACK=1

VRAY_TOOLS_MAYA2023=C:\Program Files\Chaos Group\V-Ray\Maya 2023 for x64/bin

### macOS Standalone

VRAY_FOR_MAYA2023_MAIN=/Applications/Autodesk/maya2023/vray

VRAY_FOR_MAYA2023_PLUGINS=/Applications/ChaosGroup/V-Ray/Maya2023/VRay.app/Contents/MacOS/plugins

VRAY_OSL_PATH_MAYA2023=/Applications/ChaosGroup/V-Ray/Maya2023/opensl

VRAY_PATH=/Applications/Autodesk/maya2023/vray/bin

VRAY_SEND_FEEDBACK=0

VRAY_TOOLS_MAYA2023=/Applications/ChaosGroup/V-Ray/Maya2023/bin

## Manually Starting V-Ray Server

If you need direct control over a V-Ray DR process you can manually start the vrayserver executable from a command-prompt/terminal session. 



Here is a Linux based example:

sudo /usr/ChaosGroup/V-Ray/Maya2023-x64/bin/vrayserver



Here is a Windows based example:

cd /usr/ChaosGroup/V-Ray/Maya2023-x64/bin

sudo ./registerVRayServerDaemon

sudo ./startVRayServerDaemon 

## V-Ray DR Check 

The V-Ray DR Check utility is available on all supported host operating systems. The tool  lets you see the specifics for a running V-Ray Universal Render Node session. You need to specify the exact hostname or IP address for a render node system along with a port number. The default V-Ray DR port number is 20207.



/usr/ChaosGroup/V-Ray/Maya2023-x64/bin/vraydr_check -host=10.20.30.2 -port=20207



On macOS and Linux systems it is possible to check if multiple concurrent V-Ray rendering processes are active, or stalled, on a render node using the terminal-based ps utility with the output piped into grep:



echo "[List V-Ray Processes]"

ps -edf  | grep "vray\.bin"

## V-Ray Distributed Rendering

When project deadlines are fast approaching, having a render farm with the V-Ray Universal Render Node program installed on multiple nodes is an excellent resource to use for V-Ray DR (Distributed Rendering). This V-Ray DR technique will dramatically accelerate the final-frame and interactive rendering performance of an artist's interactive GUI session. 



With DR active in your V-Ray render sessions, artists have the option to access multiple render nodes concurrently, and will be able to use that hardware to perform faster interactive lighting and "look development" in programs that have a full-featured V-Ray integration plugin like Maya, Houdini, and 3DS Max.



This V-Ray distributed rendering approach is discussed in the following article:

[Master V-Ray Next for Maya with this 4-part practical guide](https://www.chaos.com/blog/master-v-ray-next-for-maya-with-this-4-part-practical-guide)



![[Pipeline Guide.img/Vray distributed rendering.gif]]

## V-Ray Scene Render for Fusion Fuse

[WSL [BETA] kvrVraySceneRender Fuse Thread Post](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=40575#p40575)



Render V-Ray based .vrscene file assets interactively from the V-Ray VFB window, from within the comfort of a Resolve/Fusion GUI or Fusion Render Node session, via V-Ray Universal Render Node command-line interface bindings.



![[Pipeline Guide.img/vraySceneRender.jpg]]



## GUI Controls

![[Pipeline Guide.img/VrayBatchRender.jpg]]



The VRScene Filename control supports the use of PathMaps and %04d style frame padding characters.



The EXR Filename control supports the use of PathMaps and %04d style frame padding characters.



The "Static Frame" control allows you to load either a (static) single image, or an image sequence.



The "Interactive" control allows you to have the rendering launched during a Fusion Studio GUI artist session. When this control is unchecked, renderings are only carried out during batch renders.



The "Skip Rendering if image exists" checkbox allows you to make sure you aren't re-rendering the same frame again. This control will look for the expected image name on-disk and only launch a rendering of a new image if no image file is found.

## Workflow Notes

This fuse works with Cryptomatte since a "Metadata.Filename" record is added automatically to the image output stream that is generated by the V-Ray Batch Render fuse. This metadata information allows Cryptomatte masking operations to work in Fusion if the VRScene file being rendered has the Cryptomatte render element enabled.

### Dev Todo Sooner List

-   Error handling - missing V-Ray host program error is mis-identified as a missing scene

-   Drag and drop import .vrscene file into Fusion comp view

-   Parse the vrscene file on drag/drop import to look for scene filename token

-   "Open VRScene in Script Editor" Button - Open the file with the Script editor defined in the Fusion preferences

-   V-Ray Bin hosts on MacOS/Win/Linux selector


### Dev Todo Later List

-   Customize EXR Filename

-   Render Element Override controls

-   Figure out multi-rendering of same frame issue

-   Check-point auto-save image every N minutes

-   Get EXR image name from popen() result

-   Batch vs interactive rendering

-   VFB project workspace - save history tab path

-   Cryptomatte depth is not 32-bit - look at V-Ray frame buffer settings in Maya

-   EffectsMask input on VrayBatchRender sets bucket priority masking


### Image Saved File Info

[2021/Jul/8|06:41:39] [2117 MB] Successfully written image file "/Volumes/Projects/Yeti_Vray_Project/images/tmp/blue_fur.exr"

### When drag/drop importing a vrsene file grab the name from the fields:



img_file="sphere.exr";

img_dir="/Users/vfx/Documents/maya/projects/default/images/tmp/";

### A sample .vrscene code block:

SettingsOutput vraySettingsOutput {

  img_width=1920;

  img_height=1080;

  img_pixelAspect=1;

  img_file="sphere.exr";

  img_dir="/Users/vfx/Documents/maya/projects/default/images/tmp/";

  img_file_needFrameNumber=0;

  img_separateAlpha=0;

  img_noAlpha=0;

  img_dontSaveRgbChannel=0;

  img_deepFile=0;

  img_rawFile=0;

  img_rawFileVFB=1;

  img_rawFileSaveColorCorrections=0;

  img_clearMode=0;

  anim_start=1;

  anim_end=1;

  anim_frame_padding=4;

  anim_renumber_on=0;

  anim_renumber_start=0;

  anim_renumber_step=1;

  anim_ren_frame_start=0;

  frame_start=1;

  frames_per_second=1;

  frames=ListInt(    1);

  rgn_left=0;

  rgn_width=1920;

  rgn_top=0;

  rgn_height=1080;

  bmp_width=1920;

  bmp_height=1080;

  r_left=0;

  r_width=1920;

  r_top=0;

  r_height=1080;

  relements_separateFolders=0;

  relements_separate_rgba=0;

  relements_divider=".";

  film_offset_x=0;

  film_offset_y=-0;

 }

# Pixar RenderMan

Pixar's RenderMan is the original production renderer used in the film industry for feature animation and visual effects. The native RenderMan scene description format is called a RenderMan Interface Bytestream (.rib) file.



[https://renderman.pixar.com/](https://renderman.pixar.com/)



RenderMan Resources

-   [Download RenderMan Non-Commercial Edition](https://renderman.pixar.com/store) (free)

-   [Learn RenderMan](https://renderman.pixar.com/learn) (free)

-   [Art of RenderMan Volume 1 Training Video](https://renderman.pixar.com/the-art-of-renderman---vol-1) (free)


## RenderMan for Fusion (TF31 Plugin)

Marcel Gandriau (Tolosa Films) has a new RenderMan v24 for Fusion plugin that is under development for Resolve Studio and Fusion Studio. The plugin is able to work with RenderMan's paid and NC (Non-Commercial) editions.



This image shows the Eisko Louise character asset from the RenderMan learning page being used with the TF31 RenderMan for Fusion plugin:

![[Pipeline Guide.img/Louise Character.png]]



This image shows a plush dragon model with alembic hair curves. The asset is from the RenderMan learning page and it is shown in a Fusion composite that uses the TF31 RenderMan for Fusion plugin:

![[Pipeline Guide.img/dragon plush xgen.png]]



This image shows the Cookies and Milk assets from the RenderMan learning page in a Fusion composite that uses the TF31 RenderMan for Fusion plugin:

![[Pipeline Guide.img/cookies and milk.png]]




The TF31 integration plugin provides Fusion-based artists with access to Pixar's RenderMan software which is a high-quality film-level production renderer that can be used to raytrace a detailed 2D scene with reflections, refractions, subsurface shading, advanced lighting including light-filters, and render-time procedural features like Xgen Hair.



This makes it possible to use Fusion's 3D workspace and node-graph to author native RenderMan .rib formatted scene description files. This RIB formatted content is exported to disk by a Renderer3D node, and rendered using RenderMan Pro Server.



There is a handy "RigExtractor" command-line utility included with the TF31 plugin. It is used to translate RenderMan for Maya, and RenderMan for Blender exported .rib files into Fusion node-graph based comps with underlays:



RibExtractor <YourRenderManScene.rib> <directory>



An early-access version of the TF31 plugin runs today with Fusion Studio v18 on macOS (Intel x64) and Windows 10/11 systems. It is available in limited release as a beta version hosted on the Steakunderwater forum's [FusionSDK zone](https://www.steakunderwater.com/wesuckless/viewtopic.php?t=5552) (A WSL forum login with FusionSDK access permissions added is required to view this link).

## RenderMan NC (Non-Commercial) Installer Download

The Pixar RenderMan learning website provides access to a [downloadable copy of RenderMan v24 NC (Non-Commercial)](https://renderman.pixar.com/store).



Click the "Free to Try" button to register for a free RenderMan account that allows you to download the RenderMan DCC plugin, RenderMan Pro Server, and LocalQueue.



![[Pipeline Guide.img/renderman 24 nc download.png]]




The current (as of 2022-11-25) RenderMan NC v24.4 release for macOS has the filename of:

RenderMan-InstallerNCR-24.4.0_2226589-osxMojave_clang10.x86_64.dmg

## Fixing a PRMan Installer Disk Permissions Issue

In order for the macOS based RenderMan NC installer to be able to write the files to disk it is a good idea to add the "RenderMan Installer.app" file to the "System Preferences > Security & Privacy > Privacy > Full Disk Access" section. Make sure to enable the checkbox by that entry's name in the dialog.



Additionally, you can temporarily change the folder permissions on the Pixar folder to make installing files easier:



sudo chmod -R 777 /Applications/Pixar/



Once these changes have been made you can run the "RenderMan Installer.app" program and the RPS (RenderMan Pro Server) and RFM (RenderMan for Maya) installs will complete successfully.



![[Pipeline Guide.img/install.png]]



If you don't make the macOS disk permission changes, the first time the RenderMan installer is run it will generate and save the "pixar.license" license file to disk. Unfortunately the RenderMan installer will then report a disk permission write access issue on macOS Monterey which causes the installer to fail at the stage of creating the "RenderManProServer-24.4" and "RenderManForMaya-24.4" sub-folders in the Pixar directory. This error stage cancels the reset of the install process.



![[Pipeline Guide.img/install rfm error.png]]![[Pipeline Guide.img/install rps error.png]]



## Configuring RenderMan Environment Variables



If you want to use the RenderMan for Fusion (TF31) plugin, or RenderMan Pro Server, it helps to add several environment variables to your system.

### macOS Environment Variables

Since macOS Monterey uses ZSH for the default terminal, I created a "$HOME/.zshenv" file and added the following content to the text file:

export RMSTREE=/Applications/Pixar/RenderManForMaya-24.4

export RMANTREE=/Applications/Pixar/RenderManProServer-24.4

export RFMTREE=/Applications/Pixar/RenderManForMaya-24.4

export RFM_VERSION=24.4

export RFM_MAYA_VERSION=2023

export PIXAR_LICENSE_FILE=/Applications/Pixar/pixar.license

### Windows Environment Variables

On Windows 10/11 you can use the System Control Panel to add the following environment variable entries. Some of these entries will be automatically added for you by the RenderMan installer.



RMANTREE=C:\Program Files\Pixar\RenderManProServer-24.4\

RFMTREE=C:\Program Files\Pixar\RenderManForMaya-24.4\

RFM_VERSION=24.4

RFM_MAYA_VERSION=2023

PIXAR_LICENSE_FILE=C:\Program Files\Pixar\pixar.license

PATH=C:\Program Files\Pixar\RenderManProServer-24.4\bin;C:\Program Files\Pixar\RenderManProServer-24.4\lib

## Using the RenderMan for Fusion (TF31) Plugin

### Install The TF31 Plugin

Copy the TF31 plugin files into one of the Fusion "Plugins:/" PathMap supported folder locations on-disk.



On Windows you need to add the following RenderMan Pro Server library files to the Plugins folder:

-   libprman.dll (from Pixar/RenderManProServer-xx.x/lib/)

-   libpxrcore.dll (from Pixar/RenderManProServer-xx.x/bin/)

-   libstats.dll (from Pixar/RenderManProServer-xx.x/bin/)




The TF31 plugin bundled files include:

-   RibRendererMac.plugin or RibRendererWin.plugin

-   aovs.json

-   tf31.tif




The "tf31.tif" image is the default placeholder texture map that is applied to 3D models when they are viewed in the Fusion 3D workspace's viewer window context. The image shows a RenderMan "R" shaped logo:



![[Pipeline Guide.img/tf31.png]]

### Launch Fusion Studio



On macOS, if you defined your RenderMan environment variables using a $HOME/.zshenv file you can start Fusion Studio v18 from a terminal session using:

"/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion" -verbose -clean -log "$HOME/Desktop/Fusion_log.txt"



On Windows, you can start Fusion Studio v18 from a command-prompt session using:

"C:\Program Files\Blackmagic Design\Fusion 18\Fusion.exe" /verbose /clean /log "%USERPROFILE%\Desktop\Fusion_log.txt"



Launching Fusion Studio from a terminal/command-prompt window is useful for troubleshooting purposes as it lists detailed diagnostic logging information, and saves error messages to a log file on-disk as well, if there are any issues.

### Check the TF31 Plugin Version

If you want to see what version of the TF31 plugin you have installed, select the "Fusion Studio > About Fusion Studio" menu entry. This will open the "About Fusion Window". 



Then click on one of the TF31 plugin's nodes, in the list on the lower left part of the window, to see the exact build date.



![[Pipeline Guide.img/TF31 Plugin Build.png]]

### The Tools Menu

The RenderMan for Fusion nodes are accessible in Fusion Studio using the "Tools > TF31 > pxr > " menus.



![[Pipeline Guide.img/Tools Menu.gif]]

### Fusion Preferences

The plugin has its own Fusion preference page found at:

Global and Default Settings > Rib



![[Pipeline Guide.img/Fusion Prefs.png]]



## Creating RenderMan Node Graphs in Fusion

![[Pipeline Guide.img/Shading Network.png]]



If you are building a new RenderMan scene in Fusion, the typical node-connections used with the TF31 plugin are:



TF31PxrSurface -> TF31PxrSG

TF31PxrSG -> Shape3D

Shape3D -> Merge3D

TF31PxrCamera -> Merge3D

TF31PxrRectLight -> Merge3D

Merge3D -> Renderer3D



The "TF31PxrSurface" node is the Pixar surface material node.

The "TF31PxrSG" node represents a typical Autodesk Maya style shading group.

The "TF31PxrCamera" node is used to add a Pixar camera to the scene.

The "TF31PxrRectLight" node is a rectangular area light.

### Renderer3D Node

The "Renderer3D" node is used to define the render-time output settings for a Fusion 3D scene graph. 



When creating a new Fusion 3D comp, you need to change the Renderer3D node's "Render Type" setting from outputting the scene using a typical OpenGL or software rendering setting over to using the "Rib Renderer''. This allows a RenderMan .rib file to be generated.



![[Pipeline Guide.img/Tf31 Renderer Type.png]]



The Renderer3D node has a "Preview" button that can be used to export a .rib file that holds the 3D scene graph information. When the Preview button is pressed an additional RenderMan Tractor Render Manager/LocalQueue based "Alfred" .afl job description file is created at the same time. 



This "Alfred" .alf file streamlines the process of using RenderMan Pro Server to create renderings in the background without blocking a Fusion Studio GUI based artist session.



![[Pipeline Guide.img/Local Queue.png]]

### TF31PxrAlembic Node

It is possible to bypass Fusion's AlembicMesh3D node and import Alembic data natively using a "TF31PxrAlembic" node. This native mesh loading node allows attributes like subdivision surface creases to be retained.

### Surface Material Previews

Note: When RenderMan surface materials are displayed in the real-time Fusion 3D viewer window contexts you will see a place-holder texture map on the 3D models that features a repeating pattern of a small RenderMan "R" shaped logo on all of the surfaces.



![[Pipeline Guide.img/PXrSG Nodes.png]]



Rendering Exported RIB Files Using RenderMan Pro Server

After you export a .rib file to disk, you are able to render it directly from a terminal window on a macOS system using a shell command like:



/Applications/Pixar/RenderManProServer-24.4/bin/prman "$HOME/Documents/Blackmagic Design/Fusion/test/ribs/test_000.rib"



The rib file will typically render an OpenEXR formatted image to disk with the .openexr file extension. You can view the image in the "IT.app" utility.



![[Pipeline Guide.img/RenderMan Pro Server CLI Render.png]]

## RenderMan Lacks ARM64 Native Support

Note: At the current moment you cannot use the TF31 plugin on a macOS system with an Apple ARM64 architecture based CPU. You need to run the TF31 plugin on a native Intel x64 based macOS system or a Hackintosh.



This is due to the Pixar RenderMan SDK's lack of ARM64 compatible include/header/libraries in the currently shipping version of RenderMan Pro Server. Hopefully this ARM64 support issue will be fixed when Autodesk Maya ships with ARM64 native support, and the RenderMan for Maya plugin also ships with ARM64 support as well.



In the meantime you will see this error message on a macOS ARM64 system if you run the TF31 plugin inside of Fusion Studio.

![[Pipeline Guide.img/No ARM64 Support.png]]

## What the heck is a Fusion Plugins Blocklist File?

If you have a Fusion 3rd party plugin loading issue during Fusion Studio's startup process you will typically see an error message that starts with the words "Unable to load plugin".



![[Pipeline Guide.img/Fusion Rib Error.png]]



After the plugin fails to load an entry is added automatically to the file:

%appdata%\Blackmagic Design\Fusion\Profiles\Default\Plugins17.blocklist



This blocklist file is used to stop recurring Fusion Studio startup error messages from being displayed in the future.



The blocklist file contents will typically look like this:

{

{ "C:/ProgramData/Blackmagic Design/Fusion/Reactor/Deploy/Plugins/RibRenderer.plugin", 1666459470000 }

}



After you correct the issue that caused the 3rd party plugin's error state to occur, you can remove the entry that was added in the Plugins17.blocklist file. This allows the plugin to be used in the future.

# ftrack / ftrack Connect Deployment

[https://www.ftrack.com/en/connect](https://www.ftrack.com/en/connect)



ftrack Studio is a shot management, production tracking, and media review platform. ftrack Connect integrates the toolset with your creative apps. It allows you to optimize your pipeline, publish assets, launch tools, run integrations, and streamline daily workflows with custom processes unique to your studio.



This process allows the assignment of tasks to individual staff on a project, and streamlines version control which tracks revisions on individual shots, along with managing the media created.



The "ftrack connect" software is used to help interconnect the core ftrack program with the rest of your production pipeline.



-   [ftrack Connect Product Page](https://www.ftrack.com/en/connect)

-   [ftrack Connect Docs](http://ftrack-connect.rtd.ftrack.com/en/latest/about/index.html)

-   [ftrack Developer Hub](https://www.ftrack.com/en/developer)

-   [ftrack Integrations](https://www.ftrack.com/en/integrations)

-   [ftrack Python API](http://ftrack-python-api.rtd.ftrack.com/en/stable/index.html)

-   [ftrack Help | Getting Started With the API](https://help.ftrack.com/en/articles/1054630-getting-started-with-the-api)

-   [ftrack Help | Developing with ftrack](https://help.ftrack.com/en/collections/133732-developing-with-ftrack)

-   [ftrack Help | Query Syntax](https://help.ftrack.com/en/articles/1040506-query-syntax)

-   [ftrack Help | Publishing](https://help.ftrack.com/en/articles/1040441-publishing)


#### ftrack-fusion | A Resolve/Fusion Integration for ftrack Connect‬

Development on a new community created ftrack integration for BMD Fusion Studio and Resolve Studio is underway. Please bookmark the following webpages to stay up-to-date on progress information:



[https://gitlab.com/AndrewHazelden/ftrack-fusion](https://gitlab.com/AndrewHazelden/ftrack-fusion)



For more information:

-   [WSL | [DEV] ftrack-fusion | A Resolve/Fusion Integration for ftrack Connect](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42471#p42471)

-   [GitHub | Movalex ftrack Saver Node Python Script](https://github.com/movalex/fusion/tree/master/Scripts/Comp/DEV/ftrack)





# Re:Vision Effects

Re:Vision Effects creates a wide range of VFX plugins that help with tasks like image uprezzing, lens distortion correction, motion vector warping, multi-view stereo color matching, and ST Map based warping. The plugins work with just about every single editing and compositing package out there, including Resolve/Fusion.



[https://revisionfx.com/](https://revisionfx.com/)



The Re:Vision Effects company is a USA based collaborator that is working with the Left Angle Autograph software's development team to help re-design and re-imagine what is possible in artist-friendly next-generation motion graphics and compositing workflows. The future is literally being made right now. 🚀



[https://www.left-angle.com/](https://www.left-angle.com/)

# CineSyncPlay Deployment

Ftrack has a new [CineSyncPlay](https://www.ftrack.com/en/cinesync/download-cinesync-5) program that makes image sequence, movie, and 360VR media playback fast and easy. It is cross-platform compatible and runs on Windows, Linux, and macOS.



CineSyncPlay supports command line flags which allows it to be added to the Amazon AWS Thinkbox "Deadline" render manager's Monitor program as the default media viewer. Double-clicking on a completed job task in the Deadline Monitor window will then display the final rendered footage instantly for review and playback. This works really smoothly in an immersive pipeline.

# Backlight Ikonic Deployment

Ikonic is a cloud based media management solution. Ikonic is released by the same parent company that creates the ftrack software.

[https://www.iconik.io](https://www.iconik.io/)

# Jupyter Notebook Deployment

![[Pipeline Guide.img/Untitled_29.png]]



Jupyter is used for interactive scripting with programming languages like Python. It is popular with machine learning, data science, and computer vision researchers.



More information about how to use Jupyter Notebook with Resolve/Fusion can be read here:



Kartaverse Workflows | Jupyter Notebook for Resolve/Fusion

[https://docs.google.com/document/d/1Jza91fL7csYVOSgYCMsa17r3DMmaJdwXevieTh-tqWg/edit](https://docs.google.com/document/d/1Jza91fL7csYVOSgYCMsa17r3DMmaJdwXevieTh-tqWg/edit)

# SideFX Houdini 19.5 Install for Windows

## Change Windows Env vars for HFS

- Name = HFS:  

- Value = C:\Program Files\Side Effects Software\Houdini 19.5.357  

## Install Options

- Houdini

Main Application

File Associations

Industry File Types

SideFX Labs

Desktop icon

HQueue Client

- C:\HQueueClient

- Host = 10.20.30.1

- Port = 5000

## Houdini HKey

Licensing Program



C:\Program Files\Side Effects Software\Houdini 19.5.357\bin\hkey.exe  



Licensing Settings

- "File > Change License Server" Menu

- Add Custom Server if required, or use web based licensing for Houdini Indie.

# Houdini 19.5 Install for Linux

![[Pipeline Guide.img/Untitled_30.png]]

## Linux Dependencies

Required for libXss.so.1

sudo dnf install -y libXScrnSaver



Required for ibnsl.so.1

sudo dnf install -y libnsl



Note: Houdini 19.5 will not run on a Linux distro that has glibc 2.34 installed. This includes new Ubuntu Linux releases shipped after Jan 2021.

## License Houdini on Linux

If you need to license Houdini on on a computer without a monitor connected (aka a headless Linux compute node), the licensing stage can be done by creating a text file on-disk at:

$HOME/.sesi_licenses.pref



The text file contents should list the hostname that is acting as a Houdini floating license server:

serverhost=10.20.30.1



## Linux Network shares

You can connect a Houdini based Linux render node to an NFS based shared file server drive mount using BASH shell commands like:



sudo mkdir -p  /Volumes/Farm

sudo chmod -R 777 /Volumes/Farm



sudo nano /etc/fstab



R1:/Volumes/Farm /Volumes/Farm nfs   auto,rw,async,noatime,nolock,bg,nfsvers=3,intr,tcp,actimeo=1800 0 0



sudo mount -a

df -h

## Install Houdini + HQueue on Linux

It is possible to install Houdini from a terminal window or via a remote SSH session using the following BASH shell commands:



cd $HOME/Downloads/Houdini/houdini-19.5.303-linux_x86_64_gcc9.3



#  To fix an error "python3.9.tar.gz: Cannot open: Permission denied"

sudo chmod -R 777 .



sudo ./houdini.install



Where do you want to install the HQueue Server? [/opt/hqueue] ==> 

/opt/hqueue



# Set the user account as "vfx" not "hqueue" in the installer dialog:

Where do you want to install the HQueue Client? [/home/hquser/hqclient] ==> 

/home/vfx/hqclient



cd /opt/hfs19.5

./houdini_setup_bash



sudo chmod -R 777 /opt/hfs19.5



nano $HOME/.bash_profile



# User specific environment and startup programs

cd /opt/hfs19.5

source /opt/hfs19.5/houdini_setup

cd $HOME



# Create the dummy HQ Shared root folder

sudo mkdir -p /mnt/hq/



# Start hqueue server

cd /opt/hqueue/scripts

sudo chmod -R 777 /opt/hqueue/

./hqserverd start



# Start hqueue client

cd $HOME/hqclient

./hqclientd start

./hqclientd restart

## Uninstall Houdini on Linux

cd /opt/hfs19.5

sudo ./houdini.uninstall

sudo rm -rf /opt/sidefx_packages/



# Remove HQServer

sudo rm -rf /opt/hqueue/



# Remove HQclient in the hquser folder

ssh hquser:hqpass@localhost

or

su - hquser

# enter password "hqpass"



rm -rf /home/hquser/hqclient



## Houdini Viewport Customizations

d hotkey = display options

Background = Dark (Applied to both the Obj and Stage contexts)

Default desktop: Technical

Global UI scale: 1.25




## HQ Scheduler Notes

Linux based Houdini TOPs - hqueuescheduler:  

HFS > Python Executable: $HFS/bin/hython

# Houdini Environment Variables

If you need to keep a Houdini project file organized and make sure the asset filepaths are up-to-date, you can use the following tokens as placeholders in filename fields. The tokens will be evaluated automatically when the node graph is cooked at render time:



$F4 = 4 digits of frame padding on the current frame number

$HQHOSTS = The name of the current render node that is processing this frame chunk

$HFS = The path to the Houdini program files folder where the houdini setup shell script is stored inside of

$HIP = The path to the folder where the current Houdini .hip file is stored

$HIPNAME = The name of the current Houdini .hip file

# SideFX HQueue Render Manager

HQueue is a cross-platform compatible network render manager program with a Web-based user interface that comes from SideFX software. It is a license-free toolset that can be installed on an unlimited number of render nodes without requiring a Houdini license.

## Step 1.

Modify the HQROOT entries from your HQServer "network_folders.ini" file's settings to a local dummy folder like:



HQROOT

C:\HQShared



Also create a Windows based system environment variable for:

HQROOT = C:\HQShared  



Edit the "C:\HQClient\hqnode.ini" file so the server is set to:



[main]

server = 10.20.30.4

port = 5000



[job_environment]

## Step 2.

In TOPs, clear out the pre-existing "PDG Path Map" fields.




Set the "topnet1" node to use a "Default Scheduler" entry like:

localscheduler (local only jobs)

or

hqueuescheduler1 (network jobs)

## Step 3.

Inside the current task area set the "hqueuescheduler" node to use:

HQueue Server:

http://localhost:5000

or

http://10.20.30.4:5000



HFS:

[ ] Universal HFS (Clear out)

Linux HFS Path: (Clear out)

macOS HFS Path: (Clear out)

Windows HFS Path: $HFS



Paths:

Load Item Data From: Temporary JSON File



Uncheck "[ ] Compress work item data".

## Step 4.



Press the "U" key in the nodes view area to navigate back to the top-level tasks view.



Select "topnet1" in the nodes view.



To launch a new batch network render, click on the "Dirty All" button to clear out any render progress information. Then click on "Cook Output Node".

### Popular HQueue Errors

Error: localsharedroot path not found.



This happens if a dummy $HQROOT value is not entered.



Note: With "RPC Message Passing" the render job fails, so use JSON temp files instead.



Note: Don't use a fully expanded absolute filepath for the Windows SideFX Houdini folder in place of $HFS, or it will error the job.

# Alembic ROP + HQueue in TOPs

Alembic files can be written to disk inside task-based node graph using an Alembic ROP node.

## hqscheduler Node



Add an "hqscheduler" node in the TOPs context.



HFS: $HFS

Python: From HFS

## ropalembic Node

Add a "ropalembic" node to the tasks context.



ROP Alembic Tab



Evaluate Using:

Frame Range



Alembic File:



$HIP/geo/$HIPNAME/$OS.$F4.abc

or

$HIP/geo/$HIPNAME/$OS/$OS.$F4.abc



Root Object:

/obj/<Select the geo node to export>




ROP Fetch Tab:

Frames per Batch: 1




OP Cook path:

/tasks/topnet1/ropalembic1/ropnet1/alembic1

## Waitforall Node



If you want to merge the execution branching in TOPS for multiple parallel tasks, add a "waitforall" node at the end of the node tree.

## USD Render in TOPS

It is possible to export OpenUSD files from a task context. This is done with a ROP node approach.



In tasks context



ROP USD Output  

- [x] use External LOP



LOP Path: (need to define in new projects)

/stage/output0



Output file:

$HIP/geo/$HIPNAME.$OS.usd



Connected to:



USD Render



Source: 

USD File - Upstream Output File



Output:

$HIP/render/$HIPNAME.$OS.<F4>.exr

### Stage

Geometry

> Camera

> Render Settings (or RenderProduct if old school v18)

> Output0

# Render Fusion Comps in Houdini TOPs

A Houdini TOPs based node graph can be used to create workflow automation projects in a visual interface. It is another way to control a task that would otherwise need to be run as a Deadline Render Manager based job using a custom submitter.



It is possible to use Houdini TOPs to control image processing workflows:

[https://docs.google.com/document/d/1l9L-LhCxTobZmRlinu3oKUM61EuqtZJmcf_Tv1VG-8Q/edit](https://docs.google.com/document/d/1l9L-LhCxTobZmRlinu3oKUM61EuqtZJmcf_Tv1VG-8Q/edit)



![[Pipeline Guide.img/Untitled_31.png]]



# Distributing a Houdini TOPs Job With HQueue

# ![[Pipeline Guide.img/Untitled_32.png]]

Shortly after you create your first TOPs job in Houdini, you will feel the need to speed up your render time and output volume through another layer of automation. This is where distributed compute techniques come into play. 



Houdini includes the (free) HQueue render farm controller program that should likely be your first port-of-call in distributing a TOPs based task to render nodes. 



If you eventually out-grow the features provided by the bundled HQueue render manager, you also have the option of distributing a TOPs job using Pixar's Tractor render manager, or the Amazon AWS Thinkbox Deadline render manager.

# Configuring HQueue on Windows

Here are a few tips to help you configure a fresh install of HQueue.



As a small observation, when working in a small render farm, the act of pointing the HQROOT path at your storage server's primary volume, tends to just cause headaches when you only have one shared hard disk for the whole file server.



Also, it helps to segment your HQueue Pools into separate groups per operating system. Don't mix and match them unless you have taken the time to set up and fully customize environment variables for use on any OS specific value you need to rely on in a TOPs job.

## Step 1.

Modify the HQROOT entries from your HQServer "network_folders.ini" file's settings to a local dummy folder like:



HQROOT

C:\HQShared



Also create a Windows based system environment variable for:

HQROOT = C:\HQShared



Edit the "C:\HQClient\hqnode.ini" file so the server is set to:



[main]

server = 10.20.30.2

port = 5000



[job_environment]



## Step 2.

In TOPs, clear out the pre-existing "PDG Path Map" fields.



Set the "topnet1" node to use:

Default Scheduler:

localscheduler (local only jobs) 

or

hqueuescheduler1 (network jobs)

## Step 3.

Then inside the current task area:



Set the "hqueuescheduler" node to use:

HQueue Server: 



You can connect as localhost if HQueue is running on the same system as Houdini:

[http://localhost:5000](http://localhost:5000/) 



Or you can enter the server's fixed IP v4 address like:

http://10.20.30.4:5000



HFS:

[ ] Universal HFS (Clear out)

Linux HFS Path: (Clear out)

macOS HFS Path: (Clear out)

Windows HFS Path: $HFS



Paths:

Load Item Data From: Temporary JSON File

Uncheck "[ ] Compress work item data".

## Step 4.

Press the "U" key in the node view context to navigate back to the top level Tasks view.



Select "topnet1" in the nodes view.



To launch a new batch network render, click on the "Dirty All" button to clear out any render progress information. Then click on "Cook Output Node".

## Popular HQueue Error Messages

Error: localsharedroot path not found.



This happens if a dummy $HQROOT value is not entered.



Note: If you enabled the TOPs based parameter for "RPC Message Passing", and the render job fails each time it is run, a workaround is to switch over to using JSON temp files instead. JSON temp files on the small scale can be more reliable and easier to manage on a small farm.



Note: Don't try to manually enter a fully expanded absolute filepath that points to the Windows SideFX Houdini folder, in place of the $HFS environment variable. Doing this will likely result in rendering errors when you cook a TOPs job.

## HQueue Links

mqserver

[https://www.sidefx.com/docs/houdini/ref/utils/mqserver.html](https://www.sidefx.com/docs/houdini/ref/utils/mqserver.html)



Photogrammetry Tools

# Agisoft Metashape Deployment

Metashape is a popular Russian-made photogrammetry toolset that has cross-platform support for Windows, Linux, and macOS. 

[https://www.agisoft.com/](https://www.agisoft.com/)



The Metashape standard edition is very affordable. The professional version adds video processing, GPS coordinates, more advanced control registration options, command-line support, Python scripting access, and render cluster option for using multiple computers to process more data. It is possible to create high-quality MVS (Multi-View Stereo) generated depthmaps using Metashape Pro and its Python scripting interface.



Note: The Agisoft Metashape software was previously known as Agisoft Photoscan prior to 2018.

## Checking Metashape Command-Line Parameters

If you need to check the current command-line parameters available in Metashape Pro, run the following code in the command-prompt:



"C:\Program Files\Agisoft\Metashape Pro\metashape.exe" --help



![[Pipeline Guide.img/Untitled_33.png]]

## Setting up an AGI Metashape Pro Render Cluster

Let's enable network processing of data in Metashape Pro.



# Start a single server instance and make sure all storage is NFS or SMB based.

"C:\Program Files\Agisoft\Metashape Pro\metashape.exe" --server --control 10.20.30.1 --dispatch 10.20.30.1

# Start up cluster nodes 

"C:\Program Files\Agisoft\Metashape Pro\metashape.exe" --node --dispatch 10.20.30.1



When you are in a Metashape Pro based GUI session, you should now enable the network processing option in the prefs.



Switch in the Metashape Preferences window to the "Network" tab. Make sure to type in the address of the server that is controlling the whole compute farm into the "Host name" field. In my case this is a system with the IP address of "10.20.30.1". If you are running the session on your own local computer you can stick with the default value of "127.0.0.1".



# ![[Pipeline Guide.img/Untitled_34.png]]

## KartaVR Metashape Automation Script

KartaVR provides a "Send to Photoscan" script that allows you to export Loader/Saver based media from a Fusion composite into a new Agisoft Metashape .psx project file.



![[Pipeline Guide.img/script-send-media-to-photoscan-tutorial.png]]



For More information

-   [Send Media to Photoscan Docs](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#send-media-to-photoscan)

-   [YouTube | Send Media to Photoscan Video](https://www.youtube.com/watch?v=7t0w1Y3tRb8)




With this Lua script you can select as many loader and saver node clips as you want in the Fusion flow area and all of those images will be added to the same "chunk" in the new AGI Photoscan project.



![[Pipeline Guide.img/script-send-media-to-photoscan.png]]



When a loader node with an image sequence is selected, the full frame range of the footage that is configured in the loader node will be sent to AGI Metashape as individual images. If a saver node is selected then an image sequence will be sent to AGI Metashape using the renderable start to end frame range values.



The standard edition of Agisoft Metashape only knows how to open up JPEG, TIFF, PNG, BMP, EXR, TGA, PGM, PBM, and DNG images. 



If you have several video clips that you would like to use in Metashape standard edition then you should run that footage through the KartaVR [Convert Movies to Image Sequences](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#convert-movies-to-image-sequences) script first and it will process a folder full of movie files and output ready to use image sequences.

# COLMAP

COLMAP is a cross-platform compatible open-source photogrammetry toolset. It creates point cloud and polygon mesh based outputs and supports command-line operation as well as having a GUI.



[https://colmap.github.io/](https://colmap.github.io/)



For More Information:

-   [COLMAP Installation](https://colmap.github.io/install.html)

-   [COLMAP Tutorials](https://colmap.github.io/tutorial.html)

-   [COLMAP CLI](https://colmap.github.io/cli.html)

-   [COLMAP FAQ](https://colmap.github.io/faq.html)





COLMAP is best known in recent times for being the command-line SfM based camera registration tool used by NVIDIA's InstantNGP toolset for NeRF based scene creation.

# Reality Capture PPI Deployment

Reality Capture is a Windows based photogrammetry toolset that was acquired by Epic Games.

[https://www.capturingreality.com/RealityCapture-PPI](https://www.capturingreality.com/RealityCapture-PPI)



Reality Capture heavily relies on a NVIDIA CUDA GPU to perform the multi-view image registration and alignment stages. Reality Capture supports the use of a Windows command-prompt based command-line interface for automation.



Reality Capture's best strength is being able to import and work with tens of thousands of images from a photogrammetry scanning project. You don't have to pre-filter the camera views to the same extent that other photogrammetry tools require.



Reality Capture scene export parameters can be saved into an XML based file format:



<ModelExport exportBinary="1" exportInfoFile="1" exportVertices="1" exportVertexColors="0"

   exportVertexNormals="0" exportTriangles="1" exportTexturing="1" meshColor="4294967295"

   tileType="0" exportTextureAlpha="0" exportToOneTexture="0" oneTextureMaxSide="16384"

   oneTextureUsePow2TexSide="1" exportCoordinateSystemType="1" settingsAnchor="0 0 0"

   settingsScalex="1" settingsScaley="1" settingsScalez="1" texturesFileType="png"

   formatAndVersionUID="obj 000 " exportModelByParts="0" exportRandomPartColor="0"

   exportCameras="0" exportCamerasAsModelPart="0" numberAsciiFormatting="%.16e">

  <Header magic="5786949" version="1"/>

</ModelExport>



Scene cropping in Reality Capture can be saved to a .rcbox file that internally is an XML based file format:



<ReconstructionRegion globalCoordinateSystem="+proj=geocent +ellps=WGS84 +no_defs" globalCoordinateSystemName="local:1 - Euclidean"

   isGeoreferenced="1" isLatLon="0" yawPitchRoll="0 -0 -0">

  <widthHeightDepth>6.86994028091431 7.52994060516357 6.13969278335571</widthHeightDepth>

  <Header magic="5395016" version="2"/>

  <CentreEuclid>

    <centre>-0.607471704483032 0.591201782226563 12.0405006408691</centre>

  </CentreEuclid>

  <Residual R="1 0 0 0 1 0 0 0 1" t="0 0 0" s="1"/>

</ReconstructionRegion>




When automating multi-view Reality Capture workflows, it is helpful to know that the toolset is able to export each of the active camera locators to an XMP metadata format that includes both the transform matrix and lens distortion parameters. XMP data is internally stored in an XML based file format:



<x:xmpmeta xmlns:x="adobe:ns:meta/">

  <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">

    <rdf:Description xcr:Version="2" xcr:PosePrior="locked" xcr:ComponentId="{02FFA67D-FB37-48C9-AAAE-115D1A41F754}"

       xcr:DistortionModel="division" xcr:DistortionCoeficients="-0.266409870680064 0 0 0 0 0"

       xcr:FocalLength35mm="15.8017301481925" xcr:Skew="0" xcr:AspectRatio="1"

       xcr:PrincipalPointU="0.00460590178527446" xcr:PrincipalPointV="-0.00856809553444162"

       xcr:CalibrationPrior="locked" xcr:CalibrationGroup="-1" xcr:DistortionGroup="-1"

       xcr:InTexturing="1" xcr:InColoring="0" xcr:InMeshing="1" xcr:latitude="179.984035152606480N"

       xcr:longitude="33.770888658912980E" xcr:version="2.2.0.0" xcr:altitude="643119440/10000"

       xmlns:xcr="http://www.capturingreality.com/ns/xcr/1.1#">

      <xcr:Rotation>-0.134784620568843 0.851774231082322 -0.506274397261226 0.00661363302515503 -0.510152020736598 -0.860058821009682 -0.990852847761129 -0.119271014930193 0.0631273243627475</xcr:Rotation>

      <xcr:Position>2.24050332940992 1.49823826996755 11.8964921935577</xcr:Position>

    </rdf:Description>

  </rdf:RDF>

</x:xmpmeta>

# AliceVision Meshroom Deployment

AliceVision Meshroom is an open-source photogrammetry pipeline that is node-based. It includes a CUDA GPU optimized version of the SIFT utility to align images which means the toolset runs on Windows and Linux.

[https://alicevision.org/](https://alicevision.org/)



![[Pipeline Guide.img/pasted image 0.png]]



An interesting feature of MeshRoom is its capability of performing photogrammetry and panoramic 360VR image stitching using the same node-based toolset.

For More information:

-   [Google Groups | AliceVision](https://groups.google.com/g/alicevision)

-   [SketchFab | AliceVision](https://sketchfab.com/AliceVision)

-   [YouTube | AliceVision](https://www.youtube.com/c/AliceVisionOrg)

-   [YouTube | A quick presentation of HDR 360 panorama in Meshroom](https://www.youtube.com/watch?v=WLrB1eiw3Cc)

-   [YouTube | A quick presentation of 3D reconstruction pipeline in Meshroom](https://www.youtube.com/watch?v=1U0g_zxVDdg)


# R3DS Wrap

Wrap and Wrap4D are used to perform optical-flow based mesh wrapping on photogrammetry derived raw scan meshes. It allows you to transfer the geometric detail onto a clean base-mesh model that has uniform topology.



R3DS is a Russian based independent software developer.

[https://www.russian3dscanner.com/](https://www.russian3dscanner.com/)

# Instant Meshes

Instant Meshes is an open-source program that can be used to perform mesh cleanup operations. The program has a GUI and a CLI interface. You can draw topology flow curves on a surface and this is used to dynamically retopo a polygon model.

[https://github.com/wjakob/instant-meshes](https://github.com/wjakob/instant-meshes)

# CloudCompare

CloudCompare is a cross-platform compatible open-source program that is extremely capable as a LIDAR, point cloud, and mesh editing tool. There is a dedicated CloudCompare viewer tool called CCViewer. 



[https://www.cloudcompare.org/](https://www.cloudcompare.org/)



CloudCompare supports all common point cloud formats including .e57, .xyz, .ply. LIDAR scanner data can be imported from proprietary formats by installing the Faro SDK and other similar 3rd party libraries.



CloudCompare can do direct mesh/point cloud editing, model rotations/levelling, point density filtering, and model slicing/bounding box trims. 



It has a command-line interface which allows CloudCompare to be automated for both 3D file format conversions, and editing operations.



CloudCompare is written in Qt and has a C++ based plugin API that can be used by 3rd parties to extend the features of the toolset.

## CloudCompare 4x4 Transform Matrix

CloudCompare allows you to copy/paste 4x4 transform matrix data that is used to apply model rotation, translation, and scaling operations.



An ASCII formatted 4x4 Transform matrix looks like this:

1.000000000000 0.000000000000 0.000000000000 0.000000000000

0.000000000000 1.000000000000 0.000000000000 0.000000000000

0.000000000000 0.000000000000 1.000000000000 0.000000000000

0.000000000000 0.000000000000 0.000000000000 1.000000000000



## CloudCompare Cross Sections

CloudCompare CLI allows you to load in a pre-saved cross-section parameters template from an external XML file:



<?xml version="1.0" encoding="UTF-8"?>

<CloudCompare>

<!-- BoxThickness: base clipping-box dimensions -->

<!-- Thickness values must be positive -->

<BoxThickness x="" y="" z=""/>

<!-- BoxCenter: clipping-box center -->

<!-- Optional (if not defined, the center of the bounding-box of each entity will be used instead) -->

<BoxCenter x="" y="" z=""/>

<!-- 'Repeat' dimension for cross sections generation. Additional RepeatDims can be added to split in multiple dimensions. -->

<!-- Can be 0 (X), 1 (Y) or 2 (Z) -->

<RepeatDim>0</RepeatDim>

<!-- Gap between two sections (might be negative, but bigger than the (minus) thickness along the repeat dimension). -->

<!-- Optional (gap = 0 by default) -->

<RepeatGap>0</RepeatGap>

<!-- Input/Output folder path -->

<!-- 'FilePath' key: all files (but XML ones) present in the folder pointed by FilePath will be loaded (previously loaded entities will be removed!) -->

<!-- 'OutputFilePath' key: if defined, output files will be saved in this folder (if not, FilePath will be used or the current folder if neither are defined) -->

<!-- (Note: output entities are be saved in sub-folders) -->

<OutputFilePath>E:\Kartaverse\projects\untitled\meshes\obj</OutputFilePath>

<!-- Use this option if you want to use the previously loaded entities -->

<!--FilePath>E:\Kartaverse\projects\untitled\meshes\obj</FilePath--> 

<!-- Use this option if you want to sequentially load files in a folder (it requires less memory if you have lots of entities) -->

</CloudCompare>

# MeshLab

MeshLab is an open-source program that is capable of performing point cloud and mesh based editing operations. 



The earlier MeshLabServer CLI program has been retired and replaced with a Python scripting layer.

[https://www.meshlab.net/](https://www.meshlab.net/)

# RPLY Binary to ASCII Format PLY Model Converter

RPLY is a command-line tool with ANSI C-language source code that allows [Stanford PLY](https://en.wikipedia.org/wiki/PLY_(file_format)) formatted models and point clouds to be translated between binary and ASCII encoding formats.

[http://w3.impa.br/~diego/software/rply/](http://w3.impa.br/~diego/software/rply/)

# Lib e57

The e57 file format is often used to hold LIDAR laser scanner generated compressed RGB point cloud data, along with RGB imagery, and other data samples.



[http://libe57.org/](http://libe57.org/)



Saving intermediate scan data as a series of e57 files is far more compact to store on-disk than using either a PLY or XYZ based ASCII scene description format representation of the same point cloud records. Working with a data compressed volumetric file format like e57 significantly reduces disk and network bandwidth overhead when processing hundreds of GBs of volumetric information.

# AWS Thinkbox Sequoia

Sequoia is a free point-cloud editing toolset from Amazon AWS. Sequoia is capable of being used with AWS Deadline for batch processing of volumetric information. It supports the export of scan data to e57 files.

[https://www.awsthinkbox.com/sequoia](https://www.awsthinkbox.com/sequoia)

# Faro Scene

The Faro Scene software is used to process LIDAR scan data from FARO brand LIDAR scanners like the Faro Focus model. The MSRP for Faro Scene is approx. $6500.



[https://www.faro.com/en/Products/Software/SCENE-Software](https://www.faro.com/en/Products/Software/SCENE-Software)



![[Pipeline Guide.img/Untitled.jpg]]



For more information about Faro Scene and Faro Focus Scanners:

-   [Faro Focus Scanners](https://www.faro.com/en/Products/Hardware/Focus-Laser-Scanners)

-   [Faro Scene Software](https://www.faro.com/en/Products/Software/SCENE-Software)

-   [Vimeo | SEPRI (Spanish Language) | Using a laser scanner to map caves and caverns in Puerto Rico](https://vimeo.com/666185584)


# ![[Pipeline Guide.img/Untitled_35.png]]

Using Faro Scene, a semi-automated approach can be taken to register and align LIDAR information. The Faro Scene integrated masking tools helped to remove and "clip out" the LIDAR scanner tripods from each station scan. Finally, the point clouds are merged into a unified dataset that spans the full length of the scanned environment.



Faro Scene is able to export finished point cloud data into a [compressed e57 file format](http://libe57.org/) which is an excellent choice for volumetric post-production workflows.



![[Pipeline Guide.img/Untitled_36.png]]![[Pipeline Guide.img/Untitled_37.png]]



A Faro Focus 360 LIDAR scanner captures both point cloud data, and RGB color images from an integrated CMOS image sensor. The RGB image data is primarily used to colorize the point cloud samples. Additionally, the same RGB data from the original camera views can be exported from FARO Scene as high-resolution 360VR stitched panoramic images.



The following Faro Focus LIDAR scanner photos were provided by Robert Moreno of La Sociedad Espeleológica de Puerto Rico, Inc. (SEPRI) "Speleological Society of Puerto Rico" [http://sepri.org/](http://mundosubterraneo.org/)

![[Pipeline Guide.img/Untitled_1.jpg]]



![[Pipeline Guide.img/Untitled_2.jpg]]



![[Pipeline Guide.img/Untitled_3.jpg]]

# Leica Cyclone Register 360

Leica Cyclone is the name for a suite of LIDAR scan processing tools. The Register 360 product has a simplified user interface that makes it convenient for a casual user to process scan data. 



[https://leica-geosystems.com/products/laser-scanners/software/leica-cyclone/leica-cyclone-register-360](https://leica-geosystems.com/products/laser-scanners/software/leica-cyclone/leica-cyclone-register-360)



The Cyclone software is able to work with LIDAR data from multiple vendors including Leica and Faro. The first time you import Faro Focus LIDAR scan data into Leica Cyclone you will be asked to install the Faro SDK plugin.

# Pixar OpenUSD Tools

The Pixar OpenUSD repository includes several utility tools that perform handy operations on .usd, .usdc, .usda, .usdz and .abc files. If you want access to pre-compiled versions of these USD tools, NVIDIA's Omniverse team, and the SideFX Houdini software bundle the CLI tools inside a "bin" folder.



[https://github.com/PixarAnimationStudios/USD](https://github.com/PixarAnimationStudios/USD)



Details on how to compile your own builds of the OpenUSD repository provided CLI tools can be read here:

[The Ultimate Guide to OpenUSD Pipeline Development | Overview](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=26969#p26969)

## USDView

USDView is an efficient 3D scene graph viewing tool provided by the OpenUSD repo. It is a program that makes it easy to inspect individual assets and composed USD scenes. You are able to render loaded scenes using any Hydra compatible plugin renderer that is installed on the system.



![[Pipeline Guide.img/usdview-kitchen-scene.png]]

## J-Cube Multiverse for Maya and Muse

J-Cube makes the excellent Multiverse for Maya plugin, along with the standalone Muse OpenUSD file editing tools.

[https://j-cube.jp/solutions/multiverse/](https://j-cube.jp/solutions/multiverse/)

## Kartaverse OpenUSD Tools

It's worth mentioning the Kartaverse KartaVR and Vonk data node toolsets unlock several additional export formats in Resolve/Fusion for volumetric data.

### Export Point Cloud Script

The KartaVR Export point cloud script works with the currently selected PointCloud3D node in the Fusion node graph.



![[Pipeline Guide.img/Export Point Cloud 1.jpg]]



The "Export to Point Cloud" script can also be used to de-compose a Fusion FBXMesh3D loaded OBJ model into its individual vertices when the point cloud is exported.



![[Pipeline Guide.img/Decompose to points.jpg]]



KartaVR supports .ma (Maya ASCII) based exports from Fusion 3D system PointCloud3D nodes, and OBJ meshes.



![[Pipeline Guide.img/Export to Maya.jpg]]



![[Pipeline Guide.img/Maya Export Scene Contents.jpg]]

## Vonk 3D Node

The Vonk data node "v3DToFile" fuse makes it possible to export the PointCloud3D node data to disk in a parametric node-based fashion. This node works in the Fusion Studio and Resolve Studio GUI.



![[Pipeline Guide.img/Untitled_38.png]]



Connect a PointCloud3D node's output connection directly to the v3DToFile node input connection:

PointCloud3D.Output -> v3DToFile.Input



The "Point Cloud Format" ComboControl allows you to select the export format used. Options include:  "XYZ ASCII (.xyz)", "PLY ASCII (.ply)", and "PIXAR USDA ASCII (.usda)".



The "Filename" text field supports Vonk vText based connections. This allows you to dynamically generate a filename via data node approaches. 



The Filename field contents can include relative PathMap values like "Comp:/" that will be expanded at render time. 



If a sub-folder is specified in the filename field, and it is missing at render time, the sub-folders will be re-created automatically when the file is saved to disk. This is helpful if you want to use per–timeline-frame numbered folders in the output filepath.

### Vonk 3D Example Comp

There is a Fusion example comp provided with the Vonk data nodes that shows how the v3DToFile workflow is done. 



![[Pipeline Guide.img/Vonk 3D Demp Comp.png]]



The example is located on-disk at the following PathMap location:

Reactor:/Deploy/Comps/Kartaverse/Vonk Ultra/Demo 3D/Demo 3D.comp



NVIDIA InstantNGP Deployment 

This is an open-source NeRF toolset for interactive neural graphics based volumetric rendering. The testbed program runs with the help of the COLMAP utility for camera registration.



[https://github.com/NVlabs/instant-ngp](https://github.com/NVlabs/instant-ngp)



![[Pipeline Guide.img/Untitled_39.png]]



For more information:

-   [Kartaverse Workflows | Creating Volumetric NeRFs](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit)

-   [GitHub | Agisoft Metashape camera location to NERF conversion tool](https://github.com/EnricoAhlers/agi2nerf)


# NeRF Studio

[https://docs.nerf.studio/](https://docs.nerf.studio/)



For more information:

-   [GitHub | NeRF Studio](https://github.com/nerfstudio-project/nerfstudio/)

-   [Collab | NeRF Studio](https://colab.research.google.com/github/nerfstudio-project/nerfstudio/blob/main/colab/demo.ipynb)


# Adobe Substance 3D Painter

[https://www.adobe.com/products/substance3d-painter.html](https://www.adobe.com/products/substance3d-painter.html)

# RizomUV

[https://www.rizom-lab.com/](https://www.rizom-lab.com/)



Spatial Audio Tools

# Impulse Response Simulation

Extensive research is underway to explore the feasibility of analytically generating sound [impulse response](https://support.apple.com/en-ca/guide/logicpro/lgcef2af4d05/mac) files from the volumetric scan data. 



This approach helps increase the realism of the immersive XR experiences by allowing for a more accurate sound playback of field-recorded sound elements. These techniques can model sound sources and the audio level "fall off" when they are hidden by occlusions (large blocking objects) such as natural caverns, and interior spaces like hallways and tunnels.



# Reaper DAW

Reaper is a free open-source DAW software package that is excellent for spatial audio workflows. It doesn't force any pre-conceptions onto the audio so you can flexibly work with multi-track sound information.



[https://www.reaper.fm/](https://www.reaper.fm/)



# Logic Pro

Apple's [Logic Pro](https://www.apple.com/logic-pro/) DAW software can be used to trim spatial audio based recordings down to the sound clip's final edited duration. The program runs on macOS systems.

## ![[Pipeline Guide.img/Untitled_40.png]]

# Resolve Fairlight DAW

Blackmagic Design's NLE software Resolve (free) and Resolve Studio (Paid) include a copy of the Fairlight DAW.



[https://www.blackmagicdesign.com/products/davinciresolve/fairlight](https://www.blackmagicdesign.com/products/davinciresolve/fairlight)



![[Pipeline Guide.img/Fairlight DAW.png]]

## About Fairlight

Fairlight has its own dedicated page environment inside the Resolve software:

![[Pipeline Guide.img/Fairlight.png]]



Fairlight makes it possible for advanced audio post-production workflows to be completed inside the same Resolve project database that holds Media pool based footage, Fusion page composites, and Resolve Edit page video editing timelines.

## Fairlight Sound Library

When you first open the Fairlight page Sound Library tab an option is presented to "Download DaVinci Resolve's Free Sound Library". 



![[Pipeline Guide.img/Fairlight Downloads.png]]



Clicking the "Download" button takes you to the BMD Support Center webpage in your default web browser. After completing the 2-part form on the webpage you can then download a macOS or Windows based install package.

![[Pipeline Guide.img/Fairlight Sound Library.png]]



Once you press the "Register & Download" button a new download link will be generated for your session.



![[Pipeline Guide.img/Fairlight Sound Library Download.png]]



On macOS systems you would open up and mount the downloaded DMG (Disk Image) file named: 

Blackmagic_Fairlight_Sound_Library_Mac.dmg



The disk image holds a "Install Fairlight Sound Library 1.0.pkg" installer.



![[Pipeline Guide.img/Fairlight DMG.png]]



The PKG installer then adds the 1.12 GB of sound resources to a folder that Resolve's Fairlight page can access.



![[Pipeline Guide.img/Installer.png]]




# Unreal Engine MetaSounds

Epic Game's Unreal Engine 5 includes the [MetaSounds DSP technology](https://docs.unrealengine.com/5.0/en-US/AudioFeatures/MetaSounds/) for ambisonic spatial audio playback on PC desktops, Consoles and VR HMDs.



For more information about Unreal MetaSounds:

-   [MetaSounds Reference Guide](https://docs.unrealengine.com/5.0/en-US/metasounds-reference-guide-in-unreal-engine/)

-   [MetaSounds: The Next Generation Sound Sources](https://docs.unrealengine.com/5.0/en-US/metasounds-the-next-generation-sound-sources-in-unreal-engine/)


# Cycling '74 Max

Max is a node based creation environment used to create audio and interface with hardware like MIDI devices.

[https://cycling74.com/products/max](https://cycling74.com/products/max)



For more information about Max:

-   [Max Downloads](https://cycling74.com/downloads)

-   [Learn Max](https://cycling74.com/learn)

-   [Max Resources](https://cycling74.com/resources)

-   [Max Docs](https://cycling74.com/learn/documentation)

-   [Cycling Forums](https://cycling74.com/forums)


# Spat Revolution

Spat allows artists, sound-designers, and sound-engineers to create and mix audio that is targeted at creating outstanding immersive experiences. The toolset provides options for WFS (Wave Field Synthesis). Spat Revolution comes with three integration plugins for use with DAW packages.



[https://www.flux.audio/project/spat-revolution/](https://www.flux.audio/project/spat-revolution/)

# Fraunhofer SpatialSound Wave

[https://www.idmt.fraunhofer.de/en/institute/projects-products/spatialsound-wave.html](https://www.idmt.fraunhofer.de/en/institute/projects-products/spatialsound-wave.html)

# Morrow Sound

[https://www.morrowsound.com/](https://www.morrowsound.com/)

# Dolby Atmos

[https://www.dolby.com/technologies/dolby-atmos/](https://www.dolby.com/technologies/dolby-atmos/)

# Spatial Audio Designer

[https://newaudiotechnology.com/products/spatial-audio-designer/](https://newaudiotechnology.com/products/spatial-audio-designer/)

# NVIDA VR Works | Audio Tools

[https://developer.nvidia.com/vrworks/vrworks-audio](https://developer.nvidia.com/vrworks/vrworks-audio)

# Noisemakers Ambi Plugin

The Noisemakers Ambi tools help create 3D audio scenes which can be used in the production of 360VR/180VR videos, and immersive experiences.



[https://www.noisemakers.fr/product/ambi-bundle-hd/](https://www.noisemakers.fr/product/ambi-bundle-hd/)



Noisemakers creates ambisonic plugins including:

-   [AMBI PAN HD](https://www.noisemakers.fr/ambi-pan-hd/) – Position input sounds in the 3D scene

-   [AMBI VERB HD](https://www.noisemakers.fr/ambi-verb-hd/) – Add 360 reverberation

-   [AMBI LIMITER HD](https://www.noisemakers.fr/ambi-limiter-hd/) – Control the ambisonic bus peak level

-   [AMBI HEAD HD](https://www.noisemakers.fr/ambi-head-hd/) – Render the 3D scene to binaural audio

-   [AMBI EYES](https://www.noisemakers.fr/ambi-eyes/) - Monitor 360 videos while authoring audio

-   [AMBI CONVERTER](https://www.noisemakers.fr/ambi-converter/) - Convert B-format signals between FuMa and ambiX 




# Comsol Multiphysics Simulations

A friend of the Kartaverse project, Jared Sandrew (from InfiniteWorld), introduced our audio research group to Jason Riggs from Harman International. Jason volunteered his time over multiple sessions, and shared his insights via Zoom on advanced audio workflows, sound impulse response creation, and an overview of acoustic simulation technologies. Part of that effort by Jason was to explain how the [Comsol Multiphysics](https://www.comsol.com/) software is used to pre-visualize detailed and accurate audio environments based upon measured real-world locations for HiFi home audio and automotive audio needs.



Comsol Multiphysics, when combined with the Comsol [acoustics simulation module](https://www.comsol.com/acoustics-module), dramatically expands on what is possible for digitally simulating acoustic environments using hybrid FEM (Finite Element) solvers.



![[Pipeline Guide.img/Untitled_4.jpg]]



This is a sample Comsol website image of simulating sound emission from a source like a speaker element:



![[Pipeline Guide.img/pasted image 0_1.png]]



These techniques potentially take the volumetric research further by allowing for a greater understanding of the acoustic properties of the environments such as caves, and visualize how sounds in this space propagate.



![[Pipeline Guide.img/Untitled_41.png]]



## Ultrasonic Sounds in Caves

Through the use of software like Comsol, it is possible to fully visualize and simulate the acoustic properties of how [ultrasonic avoidance](https://en.wikipedia.org/wiki/Ultrasound_avoidance) is used by bats for navigation and hunting insects using sound recordings of bat vocalizations. One can see plots in 2D and in 3D of the sound waves propagating outwards as bats fly through a large underground cavern hunting for insects.



This image shows a real-world ultrasonic audio recording of a pulse train of bat chirps from a cave in Puerto Rico:



![[Pipeline Guide.img/Untitled_42.png]]



# Microsoft Triton | Project Acoustics

The Microsoft Triton / [Project Acoustics](https://docs.microsoft.com/en-us/gaming/acoustics/what-is-acoustics) learning resources have been enormously helpful to Kartaverse development efforts. Project Acoustics ships with extensive background reference material that clarifies what is currently possible with real-time acoustic simulation-driven spatial audio playback and for insight into game engine-based uses of [acoustic impulse responses](https://docs.microsoft.com/en-us/gaming/acoustics/design-process).



For more information:

-   [Web | Microsoft Project Triton Immersive Engine](https://www.microsoft.com/en-us/research/project/project-triton/) 

-   [YouTube | Project Triton | Interactive Sound Simulation: Rendering immersive soundscapes in games](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)

-   [Web | Microsoft | What is Acoustics](https://docs.microsoft.com/en-us/gaming/acoustics/what-is-acoustics)

-   [Web | Microsoft Project Triton | FAQs](https://docs.microsoft.com/en-us/gaming/acoustics/faq)

-   [GitHub | Microsoft Project Acoustics](https://github.com/microsoft/ProjectAcoustics/issues)

-   [GitHub | Microsoft | Project Acoustics 2.0 now available!](https://github.com/microsoft/ProjectAcoustics/issues/55)


Project Triton | Unity Plugin

-   [Web | Microsoft Project Triton | Project Acoustics Unity3d Editor plug-in](https://www.microsoft.com/en-us/download/details.aspx?id=57346)

-   [Web | Microsoft Project Triton | Project Acoustics Unity3d Quickstart](https://docs.microsoft.com/en-us/gaming/acoustics/unity-quickstart)


Project Triton | Unreal Plugin

-   [Web | Microsoft Project Triton | Project Acoustics Unreal Editor plug-in and Wwise plug-in](https://www.microsoft.com/en-us/download/details.aspx?id=58090)

-   [Web | Microsoft Project Triton | Project Acoustics Unreal Quickstart](https://docs.microsoft.com/en-us/gaming/acoustics/unreal-quickstart)


Project Triton | Talks

-   [YouTube | Microsoft | Project Triton | GDC 2017 - A general introduction to the ideas behind Project Triton and its integration in Gears of War 4](https://www.youtube.com/watch?v=qCUEGvIgco8)

-   [YouTube | Microsoft | Project Triton | GDC 2019 - An introductory talk on Project Acoustics and plugins for Unity and Unreal](https://www.youtube.com/watch?v=uY4G-GUAQIE)

-   [Web | Microsoft | Project Triton | SIGGRAPH 2014 - Core algorithms and architecture of the system](https://www.microsoft.com/en-us/research/publication/parametric-wave-field-coding-precomputed-sound-propagation/)

-   [Web | Microsoft | Project Triton | SIGGRAPH 2018 - Extend the model spatial audio effects such as portaling](https://www.microsoft.com/en-us/research/publication/parametric-directional-coding-for-precomputed-sound-propagation/)





![[Pipeline Guide.img/Untitled_43.png]]

Project Acoustics Figure: Connecting simulation to audio DSP with parameters



The Project Acoustics YouTube video "[Interactive sound simulation: Rendering immersive soundscapes in games and virtual reality](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)" is an excellent primer on next-gen real-time audio capabilities.



[![[Pipeline Guide.img/Untitled_44.png]]](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)



Audio Definition Model / OSC / MIDI

# ADM - Audio Definition Model

[https://adm.ebu.io/](https://adm.ebu.io/)

# ADM-OSC

[https://github.com/immersive-audio-live/ADM-OSC](https://github.com/immersive-audio-live/ADM-OSC)



# OSC (Open Sound Control)

[https://opensoundcontrol.stanford.edu/](https://opensoundcontrol.stanford.edu/)



For more information:

-   [Wikipedia | OSC](https://en.wikipedia.org/wiki/Open_Sound_Control)

-   [OSC | Specifications](https://opensoundcontrol.stanford.edu/spec-1_0.html)

-   [OSC | NIME Paper](https://opensoundcontrol.stanford.edu/files/2009-NIME-OSC-1.1.pdf)

-   [OSC | Application Support](https://opensoundcontrol.stanford.edu/page-list.html#implementations)


# Spat Revolution | Flux | ADM OSC

[https://doc.flux.audio/en_US/spat_revolution_doc/Ecosystem_&_integration_ADM_OSC.html](https://doc.flux.audio/en_US/spat_revolution_doc/Ecosystem_&_integration_ADM_OSC.html)

# TouchOSC

[https://hexler.net/touchosc](https://hexler.net/touchosc)



For More Information:

-   [Traktor for TouchOSC](https://hexler.net/touchosc/manual/setup-traktor)

-   [Vimeo | TouchOSC | Scripting Demo](https://vimeo.com/565870285)

-   [TouchOSC | Lua Scripting API](https://hexler.net/touchosc/manual/script)

-   [TouchOSC | Manual](https://hexler.net/touchosc/manual/introduction)

-   [Hexler | Protokol Utility](https://hexler.net/protokol)

-   [Hexler | KodeLife](https://hexler.net/kodelife)

-   [Hexler | TochViZ](https://hexler.net/touchviz)


# Control Booster for Tangent Panels

[https://souandrerodrigues.com.br/controlbooster/](https://souandrerodrigues.com.br/controlbooster/)

# Node Red

[https://github.com/Streampunk/node-red-contrib-dynamorse-core](https://github.com/Streampunk/node-red-contrib-dynamorse-core)



RAW and HDRI Image Processing Tools

HDRI (High Dynamic Range Imagery) is able to represent a wider range of visual information through the storage and use of floating point values. 



These RGB formatted high-dynamic range pixel samples exceed the typical 8-bit style 0-255 / 0-1 range of color information stored in a JPEG, BMP, or MP4 like file format that is often shown on a traditional computer monitor or mobile phone screen.



HDRI imagery can be created from RAW image data, by merging bracketed photos taken across a wide range of exposure levels, or from 3D renderings. Common file formats for floating-point HDRI image data include EXR, HDR, and TIFF.



In an HDRI image the center region of a super-white "sun" disc shape might read out as an RGB floating point value like 16+ when selected with a color picker. In an 8-bit image this sun disc RGB color value would typically be clamped at an integer value of 255, or a floating point value of 1.0.

# HDRsoft Photomatix Pro

Photomatix Pro is an easy to use HDR image bracket merging tool that features a batch automation interface that allows you to quickly process a large collection of exposure-bracketed images into HDRI media. 



With Photomatix's batch processing interface EXR format image output is supported which is an excellent choice for visual effects workflows.

[https://www.hdrsoft.com/resources/photomatix-pro-features-highlights.html](https://www.hdrsoft.com/resources/photomatix-pro-features-highlights.html)

## Photomatix Batch Processing Workflows

These two screenshots show common settings for batch processing operations.



![[Pipeline Guide.img/photomatix  Insta360_Pro_z360_PhotomatixPro_Batch_Bracketing_to_EXR.png]]



![[Pipeline Guide.img/photomatix Insta360_Pro_z360_PhotomatixPro_Batch_Tonemapping_to_Tiff_16_bit.png]]

# DxO Optics PhotoLab

PhotoLab is the continuation of the earlier Nikon RAW photo processing tools. This suite of tools is useful for photogrammetry applications that need to maximize image quality.



Few people have discovered that PhotoLab has a "generally undocumented" command-line interface that can allow for batch image processing. 

[https://www.dxo.com/dxo-photolab/](https://www.dxo.com/dxo-photolab/)

## DxO PhotoLab Command-Line Settings



DxO PhotoLab has a CLI module called DopCor (DxO Correction Engine) which allows you to batch process DNG/RAW footage, and apply color correction presets. This is handy for pre-processing media before running photogrammetry workflows such as adding micro-contrast, reducing JPEG/MPEG compression artifacts, or fine tuning color correction settings.

## PhotoLab Program Paths

### PhotoLab v3



Windows:

C:\Program Files\DxO\DxO PhotoLab 3\DopCor.exe



macOS:

/Applications/DXOPhotoLab3.app/Contents/XPCServices/XPCCor12.xpc/Contents/MacOS/XPCCor12

### PhotoLab v2



Windows:

C:\Program Files\DxO\DxO PhotoLab 2\DopCor.exe



macOS:

/Applications/DXOPhotoLab3.app/Contents/XPCServices/XPCCor12.xpc/Contents/MacOS/XPCCor12

## DopCor Usage Summary



Step 1. Create the DxO PhotoLab temp working folder

mkdir "%TEMP%\DxO\"



A logfile named "%TEMP%\DxO\DxO_Output_Log.txt" is written to disk. Make sure the folder named "%TEMP%\DxO" exists in advance by creating the "DxO" sub-folder inside the temporary files folder using the Windows Command Prompt.



Step 2. Place a sample image, and a corresponding .dop sidecar file at:

REM %TEMP%\DxO\Cam01.0001.jpg

REM %TEMP%\DxO\Cam01.0001.jpg.dop



Step 3. Run DxO PhotoLab 3's DopCor CLI Program

"C:\Program Files\DxO\DxO PhotoLab 3\DopCor.exe" ^

--debug ^

--cafsdir="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\Modules" ^

--cafsdb="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\CAFList3.db" ^

--oclcache="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3" ^

--img="%TEMP%\DxO\Cam01.0001.jpg" ^

--sidecar="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\Presets\2 - Neutral colors.preset" ^

--output="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\OutputSettings.xml" ^

--outputpath="%TEMP%\DxO"




You will need to change the following two DopCor CLI settings to match your current needs: 



A) Edit the '--img="%TEMP%\DxO\Cam01.0001.jpg" ^' entry to define the actual image you want to convert. Make sure this filename is unique and doesn’t already exist on-disk.



B) Also define the DxO preset you want to use by editing the entry. (You will need to write in your own custom preset saved to disk from the PhotoLab GUI.)



'--sidecar="%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\Presets\2 - Neutral colors.preset" ^'.

## Photolab Command-Line Usage Notes

Note 1: You need to port the DxO PhotoLab "Export to disk" dialog generated macOS .plist formatted "OutputSettings.plist" preference file into a Windows based pure XML document for DopCor.exe on Windows to run successfully. This requires you to extract inline encoded XML "blob" data and then save it to an external document.



The DxO PhotoLab 3 on macOS OutputSettings file is located at:

$HOME/Library/DxO PhotoLab v3/OutputSettings.plist



The DxO PhotoLab 3 on Windows OutputSettings file is located at:

C:\Users\<User name>\AppData\Local\DxO\DxO.PhotoLab.exe_StrongName_addo3jomrfkt2faiwwfxxb444r1xfvlh\3.2.0.4344\user.config



The encoded blob data is found in the user.config/OutputSettings.plist file here:



<setting name="OutputSettings" serializeAs="String">

        <value>&lt;ArrayOfanyType xmlns="http://schemas.microsoft.com/2003/10/Serialization/Arrays" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"&gt;&lt;anyType i:type="a:FileOutputSettings" xmlns:a="http://schemas.datacontract.org/2004/07/DxO.OpticsPro.OutputSettings"&gt;&lt;a:AllowResampling&gt;false&lt;/a:AllowResampling&gt;&lt;a:CanDisable&gt;true&lt;/a:CanDisable&gt;&lt;a:CustomIccProfile/&gt;&lt;a:CustomResolution&gt;72&lt;/a:CustomResolution&gt;&lt;a:DestinationFolder/&gt;&lt;a:DestinationIsOriginalFolder&gt;true&lt;/a:DestinationIsOriginalFolder&gt;&lt;a:Enabled&gt;true&lt;/a:Enabled&gt;&lt;a:FormatType&gt;Tiff&lt;/a:FormatType&gt;&lt;a:FullOutputPath/&gt;&lt;a:GenerateTemporaryFile&gt;false&lt;/a:GenerateTemporaryFile&gt;&lt;a:IccProfile&gt;Original&lt;/a:IccProfile&gt;&lt;a:Id&gt;f6a2ef05-befc-44de-8e1e-36649cd33855&lt;/a:Id&gt;&lt;a:InterpolationType&gt;Bicubic&lt;/a:InterpolationType&gt;&lt;a:JpegQuality&gt;99&lt;/a:JpegQuality&gt;&lt;a:OutputHeight&gt;1024&lt;/a:OutputHeight&gt;&lt;a:OutputName&gt;DxO&lt;/a:OutputName&gt;&lt;a:OutputSizeUnit&gt;Pixels&lt;/a:OutputSizeUnit&gt;&lt;a:OutputWidth&gt;1024&lt;/a:OutputWidth&gt;&lt;a:OverwriteOutputFile&gt;false&lt;/a:OverwriteOutputFile&gt;&lt;a:RawSuffix&gt;_raw&lt;/a:RawSuffix&gt;&lt;a:RenderingIntent&gt;Perceptual&lt;/a:RenderingIntent&gt;&lt;a:ResolutionUnit&gt;dpi&lt;/a:ResolutionUnit&gt;&lt;a:RgbSuffix/&gt;&lt;a:SavedExifFields&gt;All&lt;/a:SavedExifFields&gt;&lt;a:Sharpness i:nil="true"/&gt;&lt;a:Suffix&gt;_cor&lt;/a:Suffix&gt;&lt;a:SuffixForSnaphot&gt;_ds&lt;/a:SuffixForSnaphot&gt;&lt;a:TemporaryFileSuffix&gt;tmp&lt;/a:TemporaryFileSuffix&gt;&lt;a:Tiff8Bits&gt;false&lt;/a:Tiff8Bits&gt;&lt;a:TiffCompression&gt;false&lt;/a:TiffCompression&gt;&lt;a:UseRawOrRgbSuffix&gt;false&lt;/a:UseRawOrRgbSuffix&gt;&lt;a:UseUniqueNaming&gt;false&lt;/a:UseUniqueNaming&gt;&lt;a:UseVirtualCopySuffix&gt;false&lt;/a:UseVirtualCopySuffix&gt;&lt;a:Watermark i:type="b:Watermark" xmlns:b="http://schemas.datacontract.org/2004/07/DxO.OpticsPro.DopCommon.OutputSettings"&gt;&lt;b:Active&gt;false&lt;/b:Active&gt;&lt;b:FileName i:nil="true"/&gt;&lt;b:Position xmlns:c="http://schemas.datacontract.org/2004/07/System.Windows"&gt;&lt;c:_x&gt;1&lt;/c:_x&gt;&lt;c:_y&gt;1&lt;/c:_y&gt;&lt;/b:Position&gt;&lt;/a:Watermark&gt;&lt;/anyType&gt;&lt;/ArrayOfanyType&gt;</value>

      </setting>




Attached inline below is an extracted, then un-encoded, and ready to use example OutputSettings.xml file that can be used with DxO PhotoLab on Windows. Place the "OutputSettings.xml" document in the folder location of:

%USERPROFILE%\AppData\Local\DxO\DxO PhotoLab 3\OutputSettings.xml




### OutputSettings.xml file contents:



<ArrayOfanyType xmlns="http://schemas.microsoft.com/2003/10/Serialization/Arrays" xmlns:i="http://www.w3.org/2001/XMLSchema-instance">

  <anyType xmlns:a="http://schemas.datacontract.org/2004/07/DxO.OpticsPro.OutputSettings" i:type="a:FileOutputSettings">

    <a:AllowResampling>false</a:AllowResampling>

    <a:CanDisable>true</a:CanDisable>

    <a:CustomIccProfile />

    <a:CustomResolution>300</a:CustomResolution>

    <a:DestinationFolder />

    <a:DestinationIsOriginalFolder>true</a:DestinationIsOriginalFolder>

    <a:Enabled>true</a:Enabled>

    <a:FormatType>Jpeg</a:FormatType>

    <a:FullOutputPath />

    <a:GenerateTemporaryFile>false</a:GenerateTemporaryFile>

    <a:IccProfile>Original</a:IccProfile>

    <a:Id>9ac5986a-34e5-44f4-8cde-6aa93e4bce72</a:Id>

    <a:InterpolationType>Bicubic</a:InterpolationType>

    <a:JpegQuality>99</a:JpegQuality>

    <a:OutputHeight>1024</a:OutputHeight>

    <a:OutputName>DxO</a:OutputName>

    <a:OutputSizeUnit>Pixels</a:OutputSizeUnit>

    <a:OutputWidth>1024</a:OutputWidth>

    <a:OverwriteOutputFile>false</a:OverwriteOutputFile>

    <a:RawSuffix>_raw</a:RawSuffix>

    <a:RenderingIntent>Perceptual</a:RenderingIntent>

    <a:ResolutionUnit>dpi</a:ResolutionUnit>

    <a:RgbSuffix />

    <a:SavedExifFields>All</a:SavedExifFields>

    <a:Sharpness i:nil="true" />

    <a:Suffix>_DxO</a:Suffix>

    <a:SuffixForSnaphot>_ds</a:SuffixForSnaphot>

    <a:TemporaryFileSuffix>tmp</a:TemporaryFileSuffix>

    <a:Tiff8Bits>true</a:Tiff8Bits>

    <a:TiffCompression>true</a:TiffCompression>

    <a:UseRawOrRgbSuffix>false</a:UseRawOrRgbSuffix>

    <a:UseUniqueNaming>false</a:UseUniqueNaming>

    <a:UseVirtualCopySuffix>false</a:UseVirtualCopySuffix>

    <a:Watermark xmlns:b="http://schemas.datacontract.org/2004/07/DxO.OpticsPro.DopCommon.OutputSettings" i:type="b:Watermark">

      <b:Active>false</b:Active>

      <b:FileName i:nil="true" />

      <b:Position xmlns:c="http://schemas.datacontract.org/2004/07/System.Windows">

        <c:_x>1</c:_x>

        <c:_y>1</c:_y>

      </b:Position>

    </a:Watermark>

  </anyType>

</ArrayOfanyType>




Additional tip: If you don't have a valid OutputSettings file specified when running DopCor you will get the CLI error:

[DopCor|Error] OutputSettings file doesn't exists or is not a valid OutputSettings files

(Exit code: -1)




Note 2: The Windows Command Prompt window supports the use of the "^" carat character as a "line-continuing" symbol. If you place this at the the end of each line of text, it allows you to use multi-line text submission that has a carriage return placed after each command. This is far easier to manage in Notepad++ compared to typing in one super long line of text. When the text block that uses the "^" carat is pasted into the Command Prompt window, the text with "^" carat character at the end of each line is treated as a single, super long, block of text and the new line characters are ignored. Always copy/paste a final trailing blank (empty) line of text when you run this type of text in the Command Prompt.



Note 3: The DxO DopCor error message "[DopCor|Error] Parameters file doesn't exist or is not a valid sidecar" is caused by an invalid .preset file being linked into the --sidecar parameter. As far as I can tell a .preset file is wanted for this attribute, not the typical .dop sidecar file that would be named something like "image.ext.dop".



Note 4: DopCor runs with a single stream socket via an XPC remote port connection. So don't try to queue multiple concurrent image streams at the same time on one system as they are handled FIFO (First In, First Out) so you won't see a performance improvement.



DxO uses a tool called "XPCCor" to do remote procedure calls between its app for lower-level image conversions than the CLI offers:

[https://en.wikipedia.org/wiki/Remote_procedure_call](https://en.wikipedia.org/wiki/Remote_procedure_call)



This is done with these modules:

-   DOPCor

-   DXF EngineServer

-   XPC Connection

-   XPC Listener




On macOS the executable "remote procedure call" interface program is located at:

/Applications/DxO PhotoLab 3.app/Contents/XPCServices/XPCor12.xpc/Contents/MacOS/XPCore12



The DxO PhotoLab toolset when running from Lightroom uses this XPCCor interface.



On macOS this is the list of interface commands that appear to drive the remote socket communications between a client tool like Lightroom plugin of DxO and DopCore:



-   DOPCor

-   XPC Connection

-   XPC Listener

-   XPC Listener Delegate

-   PL Crash Reporter

-   DOP Crash Handler

-   DOPCor Server Xpc Interface

-   DOP Cmd Parser

-   DOPCor Client

-   DOPCor Server

-   DOP Exception Handler

-   DXF EngineServer

-   DXF Image

-   DXF Profile

-   DXF Progress

-   DXF Correction Agent

-   DXF Thread Graph


## DopCor Standalone CLI Syntax



Usage:

DopCor [OPTIONS]+



General switches:



Command line options:

-h, -help Display help and exit

-l, --listening Server mode (Use -l --help for related help)

--debug Increase verbosity



Command line switches:

-c, --cafsdir=PATH [Required] {PATH} to directory containing DxO Modules

-d, --cafsdb=PATH [Required] {PATH} to DxO Modules database

-k, --oclcache=PATH [Required] {PATH} to Open Clcachefile (ocl64.cache)

-i, --img=PATH [Required] {PATH} to input image files

-s, --sidecar=PATH [Required] {PATH} to Preset file

-o, --output=PATH [Required] {PATH} to output settings file

-p, --outputpath=PATH [Required] {PATH} to folder where to write processed image

-f, --outputsuffix=SUFFIX to append to the name of processed image

-t, --threads=VALUE Max number of threads (default: 32)



-cl, --opencl Enable OpenCL acceleration

-tim, --tilemanager=VALUE Enable TileManager

-tip1, --tilememorysize=VALUE Tile pool size. The value must be a power of 2, expressed in MB (default: 1024 MB).




Server mode switches:

Tip: Use -l --help to list the Server mode switches



-p, --port=PORT The PORT for Server mode (default: 9875)

-d, --timeout=TIMEOOUT The TIMEOUT for server shutdown without connection (defaut 60: seconds)



Possible Spare Option:

/Start

## DopCor CLI Exit Code States:

0 = Success

-1 = Error

## DopCor CLI returned status message strings:

-   Invalid command line:

-   Unknown option(s):

-   Press Ctrl + C to quit

-   Unable to start

-   DopCor Errors found No error

-   Crash On Startup

-   #Debugger On Startup

-   Unable to open parameters file

-   Unable to open parameters file:

-   Output directory '{0}' doesn't exist.

-   Default directory will be used

-   Invalid suffix '{0}'.

-   Default suffix '{1} 'will beused.

-   Processing error

-   Current Step Progression

-   Not supported property:

-   Step changed:

-   Step: Progression changed:

-   Cafs directory must be specified

-   Cafs directory doesn't exists

-   Cafs database must be specified

-   Cafs database doesn't exists

-   Number of processing threads is invalid

-   Tile memory pool size is invalid

-   (OpenCl cache file path must be specified

-   Source image is required

-   Source image doesn't exists

-   Parameters file is required

-   Parameters file doesn't exists or is not a valid sidecar

-   OutputSettings file is required

-   OutputSettings file doesn't exists or is not a valid OutputSettings files


# Canon Digital Photo Professional

[https://en.canon-cna.com/support/consumer_products/software/digital-photo-professional.html](https://en.canon-cna.com/support/consumer_products/software/digital-photo-professional.html)

# ACES Color Management

The ACES color management system is an adopted industry-wide standard for the entertainment sector. All footage and textures used in film, animation, visual effects, and games are created, edited, and displayed with ACES color profiles enabled.

[https://acescentral.com](https://acescentral.com/)

"ACEScg" is the color profile used for computer generated imagery.

All digital cinema camera systems have custom vendor specific ACES color profiles.

Finished film and TV projects are delivered as DCPs (digital cinema packages) and DCDM (digital cinema distribution masters). These delivery formats are based around a specific "ACES 2065-1" color encoding standard. This is used for the long-term archiving of all media in the motion picture industry.

Library of Congress DCDM Guide:

[Digital Cinema Initiative Distribution Master (DCDM)](https://www.loc.gov/preservation/digital/formats/fdd/fdd000177.shtml)

## OpenColorIO

As you start to work with media from a wide range of sources, including digital cinema cameras, RAW high-bit-depth footage from 360VR camera rigs, and CG renderings, the need for an end-to-end color managed workflow becomes essential and unavoidable.



Currently, your best option is to consider using an ACES OpenColorIO v1.0.3 based color managed workflow in Fusion Studio v18.1 and Fusion Render Node 18.1.

[https://opencolorio.org/](https://opencolorio.org/)



OCIO Resources:

-   [ACES Central](https://community.acescentral.com/)

-   [OpenColorIO Documentation](https://opencolorio.readthedocs.io/en/latest/)

-   [OpenColorIO GitHub Repo](https://github.com/AcademySoftwareFoundation/OpenColorIO)

-   [YouTube | StatixVFX | Fusion Pipeline - Getting started with OCIO and ACES](https://www.youtube.com/watch?v=Sfer5VZKe1U)


## Installing OpenColorIO

## ![[Pipeline Guide.img/OCIO Logo.png]]

Installing OpenColorIO v1.0.3 is done by downloading the resources directly from an OCIO repository, or to install the OCIO config files with the Reactor Package Manager.



Unzip the OCIO files and either store the "aces" folder locally on your laptop/workstation's internal hard disk, or if you are working in a studio environment move the OCIO config folder to a shared mount point on a file server that is accessible to the machines on your local LAN subnet so the Fusion Render Node systems and other computers can access the content.



Next, you need to define a custom environment variable that tells all of the OCIO compatible graphics tools on your system where to find your aces config folder. The environment variable is named "OCIO", and the value you define for that environment variable is the full absolute filepath on your hard disk to the "config.ocio" file.

## Using OpenColorIO in Fusion

With OCIO installed on your system, in Fusion Studio v18.1 you can then add a viewer LUT that allows you to preview footage correctly on your monitor. A viewer LUT allows you to maintain the original working color space and gamut for the footage loaded into your composite, while previewing the content in a correct fashion on your monitor so you will be able to make informed decisions as a compositor.



![[Pipeline Guide.img/OCIO Viewer LUT.png]]



The "OCIOColorspace" node is then used by Fusion's node graph to convert your footage into the right space for your needs.



![[Pipeline Guide.img/OCIOColorspace Node View.png]]



With the OCIOColorspace node selected in the Nodes view you can then access the controls in Fusion's Inspector view. The primary controls you are concerned with in this node are the "Source Space" and "Output Space" settings.



![[Pipeline Guide.img/OCIOColorspace Node Inspector.png]]



When you are working on a large-scale professional media project you will typically receive and deliver footage as ACES 2065-1 formatted content when interfacing with external vendors.



All your in-house compositing, and node-based 360VR/180VR/Fulldome based stitching, paint, and roto operations should be done using ACEScg.



ACEScg usage at your studio also covers all of the imagery that your 3D department renders when they deliver EXR format media to a compositor that contains beauty and denoised RGBA render passes coming from production renderers like RenderMan, V-Ray, Arnold, Redshift, Houdini Karma, or Blender Cycles X. 



An important detail for your 3D department to keep in mind, when generating OpenEXR based image sequences from a 3D rendering package, is that you can opt to use a 16-bit half-float framebuffer, with the ZIPS or DWAA codec for your RGBA based beauty pass and denoised content. 



The technical passes stored in an EXR file, like Z-depth, cryptomatte, world position, UV, and motion vectors should however be kept as 32-bit float image data for numerical precision reasons. Do not use a lossy compression codec on technical passes as it will create visual artifacts when you go to apply those channels in your compositing workflows.

# OpenImageIO



OIIO Resources:

-   [OIIO Docs](https://openimageio.readthedocs.io/en/v2.4.5.0/)

-   [OIIO GitHub Repository](https://github.com/OpenImageIO/oiio)




360VR Stitching Tools

# Google VR180 Creator

If you are exploring VR180 workflows with BMD Resolve/Fusion, it is handy to have a copy of the "Google VR180 Creator" program to be able to easily inject the SBS 180 metadata tags into your final MP4 video file.

Step 1. Google in their infinite wisdom removed the VR180 Creator tool from their website recently but a copy of the program for macOS/Windows/Linux is available for download from the [Internet Archive "Wayback Machine" snapshot of the site](https://web.archive.org/web/20210617180345/https://arvr.google.com/vr180/apps/).



![[Pipeline Guide.img/VR180 Creator 1.jpg]]

Step 2. Drag the "VR180 Creator.app" file from the disk image into your macOS Applications folder.

![[Pipeline Guide.img/VR180 Creator 2.jpg]]

Step 4. If you are on a macOS Monterey system you will likely have to edit the "System Preferences > Security & Privacy > Full Disk Access" settings to allow the application to run.

# Using the VR180 Creator App With 180°x180° FOV Center-Cropped LatLong Image Projection Based Media



After launching the VR180 Creator app you have several options to choose from. We want to add VR180 metadata to an existing MP4 video that was exported from Resolve/Fusion already.



Select the "Prepare for Publishing" option.



![[Pipeline Guide.img/VR180 Creator 3.jpg]]

Drag an MP4 video into the window, or select the file manually from your hard disk by clicking on the blue "Select" button in the center of the view.

![[Pipeline Guide.img/VR180 Creator 4.jpg]]

Customize the "Prepare for publishing" settings before exporting your video:

![[Pipeline Guide.img/VR180 Creator 5.jpg]]

Viewing the Finished VR180 Metadata Injected Movie in YouTube's VR media player allows you to pan-and-tilt the view to navigate around the scene:

![[Pipeline Guide.img/VR180 Creator 6.jpg]]

# KartaLink Media Command

Media Command is a scriptable interface for batch processing content that resides in your Resolve Media Pool. This streamlines the process of selecting footage, and running automation scripts on those specific items.

When Media Command is launched it automatically scans for Lua and Python scripts that are located on your hard disk inside the "Reactor:/Deploy/Scripts/MediaCommand/" folder. These items are added to the "Command Script" ComboMenu in the interface.

If you are a long time Fusion user, you will find the Media Command script was designed to give your Media page content management operations the same power and flexibility as you have with a Fusion page "tool" script in the Fusion nodes view context.

![[Pipeline Guide.img/media_command.png]]

Media Command Resources:

-   [Media Command | Reactor Repo Markdown Docs](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.KartaLink.MediaCommand/Docs/Kartaverse/KartaLink/Media%20Command/Media%20Command.md)

-   [WSL | [RELEASED] KartaLink | Media Command](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42661#p42661)

-   [WSL | Resolve Media Pool "Script" Menu Entry](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=38824#p38824)

-   [BMD Forums | DaVinci Resolve Feature Requests | Media Pool "Script" Menu Entry](https://forum.blackmagicdesign.com/viewtopic.php?f=33&t=146616)


# Media Command Docs

### Search Controls

The "Type:" ComboMenu allows you to limit the tree view to show only media of a certain format. The menu options are: "All", "Still", "Video", "Video + Audio", "Audio", "Compound", "Fusion", "Generator", "Geometry", "Stereo", "Subtitle", and "Timeline".



![[Pipeline Guide.img/type_combomenu.png]]



The "Search:" text field allows you to narrow down the results in the tree view with plain text search of the "Clip Name" and "File Name" records.



![[Pipeline Guide.img/search_field.png]]



The "Select: (All) (None) (Invert)" buttons can be used to quickly modify the footage that is selected in the tree view. It is worth noting that the select buttons work on the content that is visible in the tree view at the current moment so you can apply the select buttons to the filtered search results, then flip back to the full unfiltered list of content in the tree view.



![[Pipeline Guide.img/select_buttons.png]]

### Script Controls

The "Command Script:" ComboMenu allows you to select a Lua or Python script you would like to run.



![[Pipeline Guide.img/command_script.png]]



The (Edit) button will open the active command script using the script editor defined in the Fusion preferences.



The (Go!) button will run the active command script and use it to process the media that is selected in the tree view.



![[Pipeline Guide.img/edit_go_buttons.png]]

### View Controls

If the "Keep Open" button is active, the Media Command window will remain open after a script is launched. This is handy if you need to batch process multiple clips in rapid succession. If this button is inactive the Media Command window will close each time a script is run.



The "Console" button toggles the visibility of the Console window. If you need to troubleshoot a script there is likely useful diagnostic information already visible in the Console.



The "Refresh" button allows you to reload the tree view listing. This is something you might want to do after modifying the content in the Media Pool/Media page, or if you have changed the currently active bin.



![[Pipeline Guide.img/view_buttons.png]]

### Script Usage

Step 1. Place your custom .lua or .py scripts into the "Reactor:/Deploy/Scripts/MediaCommand/" folder.



Step 2. Launch the Media Command script from the Resolve "Workspaces > Scripts > Edit > Kartaverse > KartaLink > Media Command" menu entry.



Step 3. Select the footage you would like to batch process by clicking on the tree view row entries in the Media Command window. At the moment you need to click on the actual "text" words on the row to toggle the "selected" checkbox state.



Step 4. Choose a script you would like to run on the selected media using the "Command Script" ComboMenu, then press the "Go" button.

### Creating a Media Command Script

When a script is launched it has an "args" global variable that holds a plain text formatted Lua table structure.



Note: If you are using Python scripting in Resolve v18, you might have to set Resolve to use Python 2.7 if the built-in API command "bmd.readstring()" is unable to convert a plain text formatted table into a Python dict. This is done in the "Fusion > Fusion Settings..." menu item. Switch to the "Script" section on the left side of the view and then enable the "Default Python Version > Python 2.7" option in the window.



![[Pipeline Guide.img/fusion_settings_script.png]]

## Bundled Scripts

#### Copy File Name.lua

Copies the file names from the selected footage into the clipboard buffer.



#### Copy File Path.lua

Copies the absolute file path from the selected footage into the clipboard buffer.



#### Copy JSON.lua

Copies the clip properties as JSON formatted data into the clipboard buffer.



#### Copy Lua Table.lua

Copies the clip properties as Lua table formatted data into the clipboard buffer. This format of data can be reimported with the Fusion based Vonk data nodes directly into a ScriptVal.



#### List Args

Outputs a Lua table/Python dict with the active clip properties to the Console window.



#### List Clips

Outputs the clip name from the selected footage to the Console window.



#### XR/Add MediaIn to Comp.lua

Adds the selected images to the currently open Fusion compositing session. The clip properties are automatically added to each of the MediaIn node "Comments" fields. This allows you to create Text+ node based burn-ins from any of the Clip properties with the help of a Text+ node StyledText field expression.

#### XR/Send to DeoVR.lua

Opens a new DeoVR Player on Windows session where the currently selected images are auto-loaded into the media playback tool.



#### XR/Send to PTGui.lua

Opens a new PTGui session where the currently selected images are auto-loaded into the project.

![[Pipeline Guide.img/script_send_to_ptgui.png]]

### Example Comps

Clip Lua Table to ScriptVal.comp

This example shows how "Copy Lua Table" script exports can be used with the Vonk data nodes.



![[Pipeline Guide.img/example_clip_lua_table_to_scriptval.png]]



The file available on-disk at the following PathMap location:



Reactor:/Deploy/Comps/Kartaverse/KartaLink/Media Command/Clip Lua Table to ScriptVal.comp



# TouchDesigner Real-Time Immersive Workflows

TouchDesigner is a node-based real-time visual creation environment. 



TD's initial development roadmap branched off from its parent app, SideFX Prims/Houdini, in the early days of things but the program still shares many of the same paradigms, crazy acronyms, and ideas.



The commercial version of TD can be licensed using several methods including a CodeMeters based cloud-floating license, or a hardware USB dongle.



There is a free non-commercial edition of TD that you can get started with that is limited to 720p output but otherwise has all the other main features enabled for learning.



TD Links:

-   [https://derivative.ca/download](https://derivative.ca/download)

-   [https://derivative.ca/learn](https://derivative.ca/learn)

-   [https://derivative.ca/UserGuide/TouchDesigner](https://derivative.ca/UserGuide/TouchDesigner)




TouchDesigner is a good choice for building a custom node-based panoramic 360VR video stitching environment with support for multiple video input streams from capture hardware or IP network video streams. It supports depth sensors, a wide range of HID input devices, and VR HMDs.



TD 360VR Stitching Resources:

-   [YouTube | Hugh Hou | Edit Canon R5C & R5 VR180 w/ DaVinci Resolve 18 FREE - 3D 8K 60fps RAW LT Clog3 Workflow](https://www.youtube.com/watch?v=2GW7nb47rB4)


-   [WarpStitch + STMap + Canon R5C + RF 5.2mm Dual Fisheye VR180 Example Project](https://bit.ly/3jO7i9w) (720 MB)


# Real-Time Video Stitching with TouchDesigner + KartaVR + STMaps

## Building the STMap Warping Node-Graph in TD

![[Pipeline Guide.img/TouchDesigner Real-Time STMap Warping.png]]



This video stitching approach works live and real-time in TouchDesigner. It uses a pre-made STmap template image to warp Canon R5C + RF 5.2mm dual fisheye imagery into a 180VR Side-by-Side layout.



This example requires you to have a custom STMap template image created beforehand which is a task KartaVR can help with. 😃 



For more information about ST Maps check out the article:

[https://docs.google.com/document/d/1lQ-wc9ucLJqj-HL7iKMNWA71klV5O1fk2-JicRB6gDY/edit?usp=sharing](https://docs.google.com/document/d/1lQ-wc9ucLJqj-HL7iKMNWA71klV5O1fk2-JicRB6gDY/edit?usp=sharing)

Step 1. Create a new TouchDesigner project. Set the End/REnd frame range to the duration of the video footage you want to export. Customize the FPS parameter to 60 fps.



Step 2. Use a MovieFileIn node to load an STMap template image named "Media/EOS_R5C_RF52_STMap.0001.exr".



Step 3. Use a node to bring in the Canon R5C video footage. 



You can import a pre-existing movie file from disk using a "MovieFileIn" node.



Or



You can import a live video feed into TouchDesigner with the help of either an NDI video stream, or a video capture card.



Step 4. Add a "Remap" node. Connect the Canon R5C footage and the STMap footage to the input connection on the Remap node.



Step 5. Add a MovieFileOut node and connect it to the Remap node. This is how the finished footage is exported from TouchDesigner. 



Choose if you want to save out an image sequence or a movie file.



Then customize the File attribute to define the filename for rendered footage.



When you toggle on the "Record" button", the MovieFileOut footage will be written to disk. You can turn on the "Pause" button if you want to pause the export process.



It is a good idea to turn off the "[x] Realtime" checkbox at the top toolbar area in TouchDesigner if you are offline rendering a Movie file to disk and don't want to have any skipped frames.



Step 6. If you want you could enable pushing footage out to an HMD in real-time, or to an HDMI video output connection, or to a real-time internet video streaming platform with the "videostreamout" node.

## Fusion Studio Based STMap Template Creation

STmap Creation.comp![[Pipeline Guide.img/Fusion STmap Creation.png]]



This example processes Canon EOS 180VR footage filmed with a Canon EOS R5C Camera Body and a Canon RF 5.2mm Dual Stereo Fisheye 190° Lens.



A CustomTool node was used to create the source ST Map default gradient pattern of a red and green gradient color.



Fusion's right-click in the node view > Copy/Paste Instance contextual menu items were used to duplicate the RGB color warping nodes and make an instanced version of the nodes that automatically mirror those settings.This allowed us to swap out the RGB imagery and run an ST map warping template through in their place.



Then a Combiner node merged the left and right eye views' STMap warping templates into a side-by-side format.



The STMap warping template was then saved to disk as a single frame duration still image. 



An STMap template needs to be saved in a high dynamic range format like a 16 bit or 32 bit per channel image format. The EXR image format makes a good output choice and you can use any 100% lossless image codec such as ZIP or None.



A ChangeDepth node was added just before the CustomTool to push the frame buffer to a floating-point high dynamic range format (32-bit float). This ensures we aren't working with a gradient image that is low-dynamic range for the rest of the comp.



For more information about ST Maps check out the article:

-   [KartaVR Workflows | Creating ST Maps](https://docs.google.com/document/d/1lQ-wc9ucLJqj-HL7iKMNWA71klV5O1fk2-JicRB6gDY/edit?usp=sharing)




STmap Rendering.comp

![[Pipeline Guide.img/Fusion STmap Rendering.png]]



This composite uses a pre-made STmap template image to warp Canon R5C + RF 5.2mm dual fisheye imagery into a 180VR Side-by-Side layout. The template was created with the help of the KartaVR WarpStitch fuse.



This example uses the STMapper fuse for warping the STmap template which is available in the Reactor Package Manager. 



A stereo 3D preview of the scene is viewed with an anaglyph node and the kvrReframe360Ultra fuse which is available in the Reactor Package Manager. 

## Resolve VR180 Warping via STMapperInline

This approach works in the Resolve Studio Edit page. It uses a pre-made STmap template image to warp Canon R5C + RF 5.2mm dual fisheye imagery into a 180VR Side-by-Side layout. 



This example requires you to have installed the STMapper fuse and the STMapperInline "Effects Template" macro which are available in the Reactor Package Manager. 



For more information about ST Maps check out the article:

-   [KartaVR Workflows | Creating ST Maps](https://docs.google.com/document/d/1lQ-wc9ucLJqj-HL7iKMNWA71klV5O1fk2-JicRB6gDY/edit?usp=sharing)




Step 1. Create a new Resolve Studio project. 



![[Pipeline Guide.img/Resolve Project Settings 1.png]]



Step 2. Edit the project settings. 



![[Pipeline Guide.img/Resolve Project Settings 2.png]]



Set the Master Settings to use a Timeline format > Timeline Resolution of 8192x4096 px processing.



Set the Timeline Format > Playback frame rate to 59.94 frames per second.



Set the Image Scaling to use an Input Scaling > Mismatched resolution files > Stretch frame to all corners.



Set the Output Scaling to Mismatched resolution files > Stretch frame to all corners.



![[Pipeline Guide.img/Resolve Create New Timeline 1.png]]

![[Pipeline Guide.img/Resolve Create New Timeline 2.png]]![[Pipeline Guide.img/Resolve Create New Timeline 3.png]]

Step 3. Add the movie file to the Resolve Media Pool. Create a new timeline based upon the clip. 



In the "Create New Timeline" dialog uncheck "[x] Use Project Settings".

Switch to the Format tab and enable Timeline Resolution 8192 x 4096 processing.

Timeline Frame Rate 59.94 fps. Mismatched Resolution Stretch frame to all corners.



Step 4. In the Edit page, open the "Effects" tab at the top left of the user interface. Expand the "Toolbox > Effects > Stitching" section. Select the "STMapperInline" item and drag it onto the video clip in the Edit page timeline.

### ![[Pipeline Guide.img/Resolve Edit Page - Effects Template - STMapper Inline.png]]

Step 5. Expand the Edit page "Inspector" tab. Switch to the Effects section in the Inspector window. Select the STMapperInline item. 



Click the "Browse" button and navigate on your hard disk to where this example project file is stored to select the STMap warping template image named: "STMap Canon R5C RF 5.2mm/Resolve Project/Media/EOS_R5C_RF52_STMap.0001.exr".



After a moment the Edit page preview window should show the results of the STMap warping the dual fisheye imagery into a side-by-side 180VR cropped 180x180° LatLong view layout.



Step 6. You can now edit the footage.



Step 7. The footage is then rendered via the Delivery page. If you are on a macOS system a good output format might be to use:



Render Settings > Custom



[x] Export Video



Format: QuickTime

Codec: Apple ProRes

Type: Apple ProRes 422 HQ



Resolution: Custom

8192 x 4096 px



Frame Rate: 59.94 fps



![[Pipeline Guide.img/Resolve Delivery Page.png]]

# PTGui Pro Batch Automated Workflows

PTGui Pro is the golden standard of panoramic 360VR stitching programs. For pipeline automation needs it has a powerful feature called batch-builder that lets you automate repetitive tasks like bulk stitching of HDRIs, or automatically stitch multi-view image sequences.



[https://ptgui.com/](https://ptgui.com/)



The Batch-Builder mode needs image sequences to be broken down into numbered folders for each timeline frame. Each folder holds all of the camera views  for one specific frame number from the image sequences. Then a PTGui .pts file is copied into that folder.



![[Pipeline Guide.img/Untitled_45.png]]



You can then use the Batch-Builder user interface in PTGui Pro to process this media. 



Alternatively, you can control the PTGui command line task from a render manager like Deadline, or a toolset like Houdini TOPs, or a Fusion composite running Vonk Data Nodes.



## PTGui Uses a JSON Based Project File Format

A big change for PTGui v11-12+ project files is that they are stored in a JSON format. This means both the Notepad++ for Fusion atom package in the Reactor, and the Vonk JSON data nodes in Fusion can be used to interactively read every single attribute on the fly.



![[Pipeline Guide.img/npp_for_fusion_json_pts_viewing.png]]

## A Summary of the PTGui Pro .pts JSON Hierarchy



### PTGui .pts Image Name

project.imagegroups.[#].images.[1].filename

### Camera View Data

project.imagegroups.[#].maskbitmap = 2be950115163281b1954bd0cf1951d00

project.imagegroups.[#].images.filename =  "Media/CameraA.0001.jpg"

project.imagegroups.[#].images.include = true / false



project.imagegroups.[#].size = [2700,2700]

project.imagegroups.[#].position.params.yaw

project.imagegroups.[#].position.params.pitch

project.imagegroups.[#].position.params.roll



project.controlpoints.[#] = {"t":0,"0":[1,0,580,1306],"1":[2,0,2388,1305]},



project.panoramaparams.hfov

project.panoramaparams.vfov

project.panoramaparams.projection = equirectangular

project.panoramaparams.outputcrop = [0,0,1,1]



project.globallenses.[#].lens.params.focallength

project.globallenses.[#].lens.params.cropcircleradius

project.globallenses.[#].lens.params.cropcenteroffset

project.globallenses.[#].lens.params.a

project.globallenses.[#].lens.params.b

project.globallenses.[#].lens.params.c

project.globallenses.[#].shift.params.longside

project.globallenses.[#].shift.params.shortside

### PTGui .pts Mask Base64 Encoded PNG

assets.[#].data



Each of the hand-painted masks created in PTGui for an individual camera view is saved into the .pts file as a JSON record that holds an inline Base64 encoded PNG image.



 The image framebuffer uses an indexed color palette with support for 3 un-anti-aliased colors; black (unpainted), red (exclude zone), and green (include zone).

##### Individual Mask Base64 Data Record

assets.data

assets.id = 2be950115163281b1954bd0cf1951d00




## Using PTGui Batch Builder with KartaVR

The KartaVR toolset includes two Lua-based automation scripts called "[PTGui BatchBuilder Creator](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#batch-builder-creator)" and "[PTGui BatchBuilder Extractor](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#batch-builder-extractor)" which can be used to bring multi-view media into and out of a numbered-folder hierarchy.



![[Pipeline Guide.img/kartavr scripts-ptgui-batchbuilder-creator.png]]![[Pipeline Guide.img/kartavr scripts-ptgui-batchbuilder-extractor.png]]



## Using PTGui with Vonk Ultra

The Vonk Data Nodes also provide several example .comp files that show approaches for automating a PTGui workflow.



![[Pipeline Guide.img/PTGui batch stitching.png]]

## Virtual Production Cylinder Stitching Example

This KartaVP stitching example shows an interesting workflow that interactively stitches a PTGui Pro v12 .pts file inside of Fusion's node graph via a RunCommand node.



![[Pipeline Guide.img/Stitched_Cylinder.jpg]]



Then Vonk JSON and Vonk Text data nodes work together to parse the JSON formatted .pts file to extract the relative file path location of the PTGui Pro v12 Batch rendered HDRI panoramic image.



![[Pipeline Guide.img/Vonk_JSON_PTS_Loading.png]]



Finally, a simulated virtual production LED video stage wall is created using Fusion's 3D workspace. The latest PTGui Pro stitched imagery is automatically placed onto this LED video wall surface. A camera3D node can then be flown around inside the virtual production stage filming volume to create reframed shots with the wrap-around live-action background plate visible.



![[Pipeline Guide.img/Virtual_Production_Cylinder_Previz.png]]

This sample footage was captured using a Nikon D750 Camera with an AF DX Fisheye-Nikkor 10.5mm F/2.8 ED lens. A Nodal Ninja panoramic head was adjusted to an indexed rotation value of 15 degrees per view rotation increment, and 12 view angles were captured in the Nikon RAW NEF image format starting at 1:30 AM, local time on 2021-12-08.

Each photo was HDR exposure blended from a set of three RAW images taken at +3EV, 0EV, and -3EV. The pictures had an average of a 30 second exposure time, ISO 1600, aperture F/8, and the content was captured using a manual exposure mode.

# SGO MistikaVR Stitching Workflows

SGO MistikaVR is a popular program for stitching 360VR videos with optical flow seaming. It supports the import of PTGui .pts project files for new camera rig template creation, and is capable of exporting STMaps that bake out the lens template setting used.



Mistika Boutique offers a wide range of online finishing features to expand on the 360VR stitching capabilities users get with MistikaVR. SGO also has a node-based video encoding and workflow automation tool that is appropriately called Mistika Workflows.



SGO Mistika is available on a subscription plan.

[https://www.sgo.es/](https://www.sgo.es/)

## Distributed MVR Stitching Via a Render Farm

MistikaVR has command-line support which allows for external render manager based control and job distribution using programs like Amazon AWS Deadline. 



This allows you to build a mini-render-cluster on a LAN network or in the cloud to speed up your immersive workflows when taking on ultra-high resolution stitching tasks of footage over 8K-16K+ resolution. 



A MVR distributed rendering process becomes relevant if you start to create live-action captured backgrounds for virtual production LED video stage productions that need extreme image quality and lightning-fast turnaround times.



![[Pipeline Guide.img/Deadline MistikaVR.png]]



You can use a combination of the "Submit MistikaVR Job to Deadline" controls for the "Pool", "Concurrent Tasks", "Machine Limit", and "Machine List" settings to hone the exact job distribution parameters to meet your GPU-powered render farm's precise hardware capabilities and scale. 



The "Frames Per Task" control specifies how many frames are sent to an individual render node in a single job task. Setting a lower value might protect against memory leaks and GPU glitches from accumulating. Setting a higher value reduces the startup time overhead for launching a new MVR task.



![[Pipeline Guide.img/Deadline MistikaVR Submit.png]]

# StitchEm VideoStitch Studio + VahanaVR

VideoStitch Studio and VahanaVR played an important role in the development of the 360VR stitching market. Eventually Orah and other products came to market from the same company.



[https://github.com/stitchEm/StitchEm](https://github.com/stitchEm/StitchEm)

[https://github.com/stitchEm/camorah](https://github.com/stitchEm/camorah)



VideoStitch Studio User Interface:

![[Pipeline Guide.img/video stitch studio.jpg]]



VahanaVR User Interface:

![[Pipeline Guide.img/Vahana VR.jpg]]

## License

VideoStitch Studio is an MIT-licensed open-source project. A license key is not required to run the software. The software was originally developed by VideoStitch SAS. After the company folded in 2018, the source code was acquired by the newly founded non-profit organization stitchEm, to publish it under a free software license.



StitchEm Resources:

-   [StitchEm Facebook Group](https://www.facebook.com/groups/stitchEm)

-   [Getting Started YouTube Video by Veroma](https://www.youtube.com/watch?v=MhC42-t8nEg)


## StitchEm GitHub Release Page

You can download the various StitchEm builds for macOS and Windows from the [project's GitHub Releases page](https://github.com/stitchEm/stitchEm/releases). Take note of the GPU support requirements for each of the software releases to line that information up with your system's actual hardware.

## StitchEm Reactor Package Manager Based Install

Both the StitchEm Video Stitch Studio and VahanaVR programs are available in the Reactor package manager's "Bin" category for Windows users.



![[Pipeline Guide.img/StitchEM Vahana VR.png]]![[Pipeline Guide.img/StitchEM Video Stitch.png]]

# Resolve/Fusion HMD Connectivity

When you are running Resolve Studio (the Paid edition of Resolve) you can connect to an HMD inside the Fusion page compositing session environment. This is done by opening up the "Fusion > Settings..." menu.

In Fusion Studio Standalone this settings change is done by opening the "Fusion Preferences" menu item.

![[Pipeline Guide.img/Fusion Quest Link Prefs.jpg]]

Then in the Fusion page settings window select the category on the left side of the window labelled "VR Headset". In this "VR Headset" section you can adjust the HMD settings to match your personal needs. With the HMD Support in the Resolve Fusion page, you can use Oculus SDK, and OpenVR based HMDs. The same approach works inside of Fusion Studio Standalone, too.

If you have an Oculus Quest HMD you can tether this HMD to Resolve's Fusion page as an output device by installing the Windows 10 based "Quest Link" drivers found on the Oculus website ([https://www.meta.com/help/quest/articles/headsets-and-accessories/oculus-link/meta-quest-link-compatibility/](https://support.oculus.com/444256562873335/?fbclid=IwAR058T1P5zQgtf-IPt8H6wYS_uJYArpw7jBhNEMcBHrapXjncPzwmoNePtw)). Then you connect a USB 3 class cable with a USB-C connector from your PC's USB 3 or 3.1 class USB port to the Quest HMD. 

Personally speaking, I'm using a fairly long "Amazon Basics" USB-C cable and it works for my needs, although I wish it had a right angle connector on it like the Oculus Quest default charging cable has since I'm sometimes worried I might put stress on the Quest end of the cable when using room-scale 6DoF approaches with the HMD.

# KartaVR WarpStitch Ultra Fuse

WarpStitch is a hardware-accelerated DCTL fuse for Resolve/Fusion that allows you to warp and stitch fisheye imagery into an equirectangular/spherical/LatLong image projection panoramic video. Floating-point 16-bit per channel, and 32-bit per channel image processing is supported so you can work with bracket merged high dynamic range data and stitch the media into a spherical HDRI. 



The DCTL support in WarpStitch allows the same fuse code to run equally well in a cross-platform fashion on Windows/Linux/macOS systems running across CUDA, OpenCL, and Metal GPU hardware.



WarpStitch Ultra was created by David Kohen (Learn Now FX), and Andrew Hazelden (KartaVR for Fusion). Development was made possible based upon code contributions from Chad Capeland's [CustomShader3D](https://indicated.com/download/3cus-sample-warping-fisheye-to-equirectangular-2/) project, and [DCTL code examples](https://github.com/baldavenger/DCTLs/blob/master/DCTL_OFX/DCTL_Functions.h) by BaldAvenger.



WarpStitch Ultra Resources:

-   [YouTube | Hugh Hou | Edit Canon R5C & R5 VR180 w/ DaVinci Resolve 18 FREE - 3D 8K 60fps RAW LT Clog3 Workflow](https://www.youtube.com/watch?v=2GW7nb47rB4)


-   [WarpStitch + STMap + Canon R5C + RF 5.2mm Dual Fisheye VR180 Example Project](https://bit.ly/3jO7i9w) (720 MB)




![[Pipeline Guide.img/WarpStitch Canon 180VR.png]]



Open-Source Software License Terms:

The WarpStitch fuse is Apache 2.0 licensed. 



DCTL Fuse Support Requirements:

-   An OpenCL, CUDA, or Metal based GPU 

-   Fusion Studio 17-18+ or Resolve 17-18+




Known Issues:

-   IMU Control page code not active yet 

-   Stereo3D Control page code not active yet 

-   Panotools A/B/C lens distortion code not present yet in lens distortion controls 




## The WarpStitch Ultra User Interface

![[Pipeline Guide.img/WarpStitch 1.png]]![[Pipeline Guide.img/WarpStitch 2.png]]![[Pipeline Guide.img/WarpStitch 3.png]]![[Pipeline Guide.img/WarpStitch 4.png]]

## An Introduction to WarpStitch Ultra

1. Use a Loader or MediaIn node in Fusion to import footage that was filmed with a circular fisheye lens. Select this node. 



2. With the Nodes view active, press the "Shift + Space" hotkey to display the Select Tool dialog. 



Type in "WarpStitch" and then press the "Add" button to insert a new KartaVR WarpStitch node into your composite. WarpStitch should now be connected to your Loader or MediaIn node. 



3. It is a good idea to insert an "AutoDomain" node into the composite immediately after a WarpStitch node, so Fusion will effortlessly handle the frame size and aspect ratio changes performed by WarpStitch. An AutoDomain node can be added using the "Shift + Space" hotkey to display the Select Tool dialog. Type in "AutoDomain" and then press the "Add" button. 



4. Select the WarpStitch node in your comp. In the Inspector window there is a "View Mode" ComboMenu control, which is at the top of the list of controls for the node. 



The "View Mode" ComboMenu lets you switch between seeing the "Final Result", the "Original Image", or a variety of diagnostic modes like "Initial Crop", "Rotated Image", "Vector Mask", "Masked Image", "Warped Image", and "Color Corrected Image" which are useful for inspecting the intermediate stages of internal data processing performed by the WarpStitch node. 



There are four tabs present that we need to interact with labeled "Lens", "Color", "Image", and "Settings".

The "Lens" tab provides the controls needed to adjust the warping process including: - Defining the lens center with the "Optical Frame Center" control - Modifying the original image's rotation is possible with the "Image Orientation > Angle" control. 



It allows you to choose between 0, 90, 180, and 270 degree rotations. - Applying vector masking to your imagery is done with the "Circular Fisheye Masking" / "Rectangular Masking" / "Split View Masking" controls - Adjusting the FOV for the circular fisheye lens is done with the "Diagonal Field of View" control. 



A typical circular fisheye lens might have a 180 degree FOV. - Rotation of the spherical image projection output is done via the Rotate Sphere controls which provide access to rotating the warped image via a set of "Tilt", "Pan" and "Roll" controls. If you wanted to rotate a panoramic image horizontally by 180 degrees you would set the Pan control to 180. 



The "Color" tab provides the controls needed to perform basic per-camera view color corrections to help your footage better match up when blended. 



The Exposure, Gamma, Levels, and Output Levels controls allow you to adjust the overall brightness and contrast in the image along with the shadows and highlights. 



The Saturation and Vibrance controls allow you to make the colors "pop" and appear more vivid. The White Balance section provides Color Temperature and Tint controls which allow you to compensate for per-camera differences in the color of the lighting. 



The "Image" tab allows you to adjust the image aspect ratio settings for the final warped image. Additionally, the "Output ST Map" checkbox tells the WarpStitch node to output a "UV Pass" warping template image called an "ST Map" which can be used to store a pre-computed image projection transform into an image's red and green color channels. The "Edge Settings > Edge" control can help fix seam artifacts. 



The "Settings" tab allows you to assign your own intool scripting based "Frame Render Scripts", along with providing access to a pair of Edit Code buttons labeled "Edit Fuse" and "Reload Fuse" that can be used to manually tweak the default range of WarpStitch's user interface controls or to adjust any other aspect of the fuse's code. 



5. Switch back to the "Lens" tab. 

Adjust the "Initial Crop > Optical Frame Center" control to place the onscreen "X" shaped on-screen viewer control in the center of the circular fisheye image. 



If you click in the Fusion viewer window so it has the user input focus, you can tap the TAB key several times to quickly toggle the active onscreen control widget so the "X" shaped on-screen viewer control is highlighted in red and can be dragged around visually with your cursor. 



Note: If you are working with footage from a 1-piece panoramic camera that places both the front and back fisheye images inside the same image frame in a "SBS" side-by-side layout, you can typically start out by changing the "Optical Frame Center" value from "0.5" over to either "0.25" or "0.75" as an initial starting point before you would then refine the value further. 



Change the "View Mode" to "Initial Crop". 



The "Initial Crop > Frame Border Padding" slider can be used to help "uncrop" a circular fisheye image that has been captured on a 16:9 video sensor that would cut off part of the circular fisheye image frame area. 



If your camera body was rotated when mounted on the panoramic camera rig, you can adjust the "Image Orientation > Angle" setting to correct for this view rotation. The "View Mode" control labeled "Rotated Image" lets you verify the image orientation adjustment is set as you'd expect so you can be sure you have the correct "upright" axis defined for the image before it is warped into a spherical image projection. 



6. Change the "View Mode" to "Masked Image" to see the circular masking applied to the imagery. 



To adjust the circular fisheye masking setting, you can use the Inspector and drag the slider for the "Vector Masking > Circular Fisheye Masking > Mask Diameter" control to line up with the border of your fisheye lens image data, or the circular shaped onscreen control handle can be used to resize the mask visually. 



The "Vector Masking > Circular Fisheye Masking > Mask Softness" slider allows you to adjust how hard or soft you want the mask edge to appear. Additionally, you could set the "View Mode" to "Vector Mask" to see just the black/white masking output if you want to see the precise size of the mask used and its overall softness. 



7. The "Warped Image > Diagonal Field of View" control can be adjusted to change the FOV of the circular fisheye image. Typical wide angle fisheye lenses are somewhere in the range of 180 - 220 degree FOV. 



You need to change the "View Mode" control to "Warped Image" or "Final Result" to see the effects of the FOV modifications. The Rotate Sphere controls for Tilt, Pan, and Roll are used to adjust the placement of the fisheye image inside the final spherical image projection. 



8. Switch to the Color tab. This tab allows you to perform "Quick 'n Dirty" modifications to each of the camera views you are processing. This is a time saver if you need to apply small color tweaks. 



The "View Mode" control has a "Color Corrected Image" option that allows you to see the result of these changes. If you need to perform more complex color corrections you could always add a separate ColorCorrector node to the comp per-camera view. 



Change the "View Mode" over to "Final Result" to see the effects of all the settings applied at once. This "Final Result" option is the setting WarpStitch should be left at when you are done with all your adjustments and want to look at the footage downstream in your composite. 



9. Repeat the main steps shown in sections 1-8 to set up each of the per-camera views you want to warp into a spherical image projection. For speed of adjustment consider using the copy/paste instance approach alongside the Deinstance controls tip to rapidly deploy many near identical camera views. 



10. Connect each of the WarpStitch per-camera view processed composite branches together using either a series of Merge nodes chained together, or with a kvrMergeLayers node that supports blending multiple image input connections that are fed into the same node simultaneously. 

# KartaVR Reframe360 Ultra Fuse

A DCTL fuse that allows you to reframe your equirectangular/spherical/LatLong panoramic videos to create unique camera angles. 



The code was ported by David Kohen (Learn Now FX), and Andrew Hazelden (KartaVR for Fusion) from the original open-source Reframe360 Resolve OpenFX plugin by Stefan Sietzen. Development was made possible based upon code contributions from the [DCTL code examples](https://github.com/baldavenger/DCTLs/blob/master/DCTL_OFX/DCTL_Functions.h) by BaldAvenger.



kvrReframe360Ultra Resources:

-   [WSL | Reframe 360 Ultra Thread](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=36688#p36688)

-   [YouTube | Hugh Hou | How to ReFrame ANY 360 Video in DaVinci Resolve FREE in Real Time (Insta360, GoPro MAX, Qoocam 8K)](https://www.youtube.com/watch?v=CWw2DaXC7OU)




![[Pipeline Guide.img/Reframe360 Ultra Fusion UI.png]]



Open-Source Software License Terms:

The WarpStitch fuse is Apache 2.0 licensed. 



DCTL Fuse Support Requirements: 

-   An OpenCL, CUDA, or Metal based GPU 

-   Fusion Studio 17-18+ or Resolve 17-18+ 




## The Reframe360 Ultra User Interface

![[Pipeline Guide.img/Reframe360 1.png]]![[Pipeline Guide.img/Reframe360 2.png]]

## Fusion Comp Examples

When the "Reframe360 Ultra" Reactor atom package is installed you can explore the example Fusion composites in this folder:

Reactor:/Deploy/Comps/KartaVR/Reframe360/



## How to Solve a "Black Hole" Issue in Resolve

kvrReframe360 Ultra users have occasionally reported having a black circle region appear in the zenith and nadir zones of their panoramic video when reframing footage in the Resolve Edit/Fusion page. After working through the reports with the users, the following solution was found to be effective:

The issue is related to the source MP4 video file having a 2:1 aspect ratio, and their editing timeline was set to use a 16:9 aspect ratio or 1:1 aspect ratio for the output.

Resolve's default Timeline Settings will typically fit the panoramic footage to the frame size on one axis, and crop the footage on the other axis which creates the black hole artifact.

To fix the black region at the bottom of the frame issue, you should edit the Resolve Timeline settings.

In the Timeline Settings window, uncheck the "[x] Use Project Settings" checkbox. Then edit the "Mismatched Resolution" preference so it is set to "Stretch frame to all corners".



This will fit the source MP4 video so the width and height are scaled to precisely match the frame size of the rendered video.



The "Mismatched resolution files" setting can also be defined in the "Project Settings > Image Scaling > Input Scaling" preferences window, too.

![[Pipeline Guide.img/Reframe360 Black Hole Fix.jpg]]



# Resolve/Fusion 360VR Point Tracking

## Applying 2D Tracking to LatLong 360VR based 3D Transforms



This post explains how to link a Tracker node to a Transform3D node. This allows you to track a 2D element in 360VR monoscopic footage with a stock Fusion Tracker node.



Step 1. Add a Tracker node to the comp, connect the Tracker node to your Loader/MediaIn based footage, and perform a 1-point track of an object in the frame. Refine the point tracking output using traditional Fusion tracking techniques, which can be found in other tutorials.



Step 2. Add your 3D element to the scene using either an FBX Mesh, ABC Mesh, or Fusion's geometry tools like a Shape3D node.



Step 3. Add a Transform3D node. Connect the geometry to the Transform3D node. Then select the Transform3D node.



![[Pipeline Guide.img/Example Comp.png]]



Step 4. Y-Axis Rotation Linking:



On the Y Rotation channel right-click and select the Connect To > Tracker1 > Offset X Position (3D Space). 



![[Pipeline Guide.img/Y-Axis Connect To.png]]



Then on the Y Rotation channel, right-click again and select "Insert > Calculation: First Operand -> Calculation". 



![[Pipeline Guide.img/Y-Axis Insert.png]]



This will add a "Calculation on Transform3D" modifier to the node.



Click on the "Modifiers" tab on the Transform3D node to see the new modifier.  The First Operand is linked to the tracker's X offset animation curve. Set the "Operator" to "Multiply". Then set the "Second Operand" to "-360".



![[Pipeline Guide.img/Y-Axis Modifier.png]]



Tip: Alternatively, if you are working with 180VR footage you can set the "Second Operand" value to "-180".



Step 5. X-Axis Rotation Linking:

On the X Rotation channel right-click and select the Connect To > Tracker1 > Offset Y Position (3D Space). 



Then on the X Rotation channel, right-click again and select "Insert > Calculation: First Operand -> Calculation". 



This will add a "Calculation on Transform3D" modifier to the node.



Click on the "Modifiers" tab on the Transform3D node to see the new modifier. The First Operand is linked to the tracker's Y offset animation curve. Set the "Operator" to "Multiply". Then set the "Second Operand" to "180".



![[Pipeline Guide.img/Modifiers.png]]

## Applying 2D Tracking to the PanoMap Node

It is also possible to apply this same type of approach to a PanoMap node's rotation controls.



![[Pipeline Guide.img/PanoMap Tracking Comp.png]]



The PanoMap node's Rotation X and Rotation Y channels are what you would bind to the Tracker node in a similar fashion as a Transform3D node's rotation controls.



![[Pipeline Guide.img/PanoMap Node.png]]



The same modifier approach is then used to adapt the screen space 0-1 normalized coordinate system into a 360VR centric 360x180° coordinate system value range.



![[Pipeline Guide.img/Modifer on PanoMap.png]]



# Fusion/Kartaverse EXR Multi-Part vs Multi-Channel Workflows

This example shows two EXR image files that both contain 45 camera views along with an ST Map template. This is intended to be a demo of EXR Multi-Channel and Multi-Part usage.



The footage shows a green storm hurricane lantern that was rendered from V-Ray for Maya in a custom stereo camera rig that created 45 views in a linear camera array configuration. The camera filmback was altered so it created a uniform and consistent multi-view output that is "stereo converged" at the same zero parallax distance in the 3D scene.



For the purpose of this demo I grabbed pre-existing media from an existing GitHub project called [Lightfielder Suite](https://github.com/AndrewHazelden/LightfielderSuite). 

## EXR Sample Media Download Link

To follow along on your local system, you can download the sample media here:

[https://www.andrewhazelden.com/projects/kartaverse/downloads/exr_multipart_vs_multichannel.zip](https://www.andrewhazelden.com/projects/kartaverse/downloads/exr_multipart_vs_multichannel.zip)

## What is the Difference?

A "Part" in EXR image container terms can be thought of as a Photoshop layer. Each part in an EXR image can hold an arbitrary amount of image channels.



A "Channel" in EXR image container terms would be one greyscale channel of data like "Red", "Green", "Blue", "Alpha", or "Z-Depth" data.



It is possible to hold multi-view data in an EXR container as either:



1 set of RGBA channels per EXR image like you are doing now.



Or multiple camera views (per-timeline-frame) can be packaged into a single EXR image for easier data portability with systems that can support multi-view or multi-part data I/O like the Resolve Fusion page, or NukeX, etc...



## EXR Multi-Channel Data

![[Pipeline Guide.img/Untitled_46.png]]




The file "Media/Multi-Channel.0000.exr" stores each image from "Cam 01" to "Cam 45" as separate RGBA channels inside the same EXR image. This results in each camera view being accessed with the image data elements named like:



Cam 01.A  

Cam 01.R  

Cam 01.G  

Cam 01.B  

...  

Cam 02.A  

Cam 02.R  

Cam 02.G  

Cam 02.B  

...  

Undistort STMap.A  

Undistort STMap.R  

Undistort STMap.G  

Undistort STMap.B  



This is an example of a Fusion Loader node accessing the multi-channel components in the image:



![[Pipeline Guide.img/Untitled_47.png]]![[Pipeline Guide.img/Untitled_48.png]]![[Pipeline Guide.img/Untitled_49.png]]



## EXR Multi-Part Data

![[Pipeline Guide.img/Untitled_50.png]]



The file "Media/Multi-Part.0000.exr" stores each image from "Cam 01" to "Cam 45" in separate image parts.



This results in each camera view being accessed by name. The individual RGB channels inside the EXR part are all consistently named "RGBA" with no prefix added.



Part Name: Cam 01   

Channels: RGBA  

...  

Part Name: Cam 02  

Channels: RGBA  

...  

Part Name:  Undistort STMap  

Channels: RGBA  



![[Pipeline Guide.img/Untitled_51.png]]![[Pipeline Guide.img/Untitled_52.png]]![[Pipeline Guide.img/Untitled_53.png]]

## Quilted Frame

![[Pipeline Guide.img/Untitled_54.png]]



The image "Media/JPEGS/9x5_quilted_green_lantern.jpg" holds 45 views of imagery in a 5 horizontal x 9 vertical image grid layout.



This would sometimes be called a texture atlas, a quilted image, or a grid/tiled image layout. This media was originally prepared for playback on a Looking Glass Display.



## Multi-View Image Sequences

![[Pipeline Guide.img/Untitled_55.png]]



This approach is the plain-vanilla way to work with multi-view imagery, like you are already doing now. Each image stream from an individual camera on the multi-view camera rig is exported to a separate image sequence.



In this case a single timeline frame from the sample media was named like:

"Media/JPEGs/Lantern.[0000-0044].0000.png"

# Fusion/Kartaverse Lightfield Workflows

## K Lens MultiView

With the help of sample footage from a DPREVIEW article covering the German-made DSLR compatible "K Lens" light-field lens, several proof-of-concept light-field workflows were created in Resolve/Fusion/KartaVR.

The processing steps involved a "K Lens" light-field 3x3 camera view image extraction.

Then each of the 9 camera view positions were precisely aligned and registered against a common image feature. Finally, the output was repackaged back into a tiled grid layout. I used an expression on a Fusion "Text+" node to automatically label and number each camera view which allowed me to visually check and verify that the 3x3 grid layout based frame-packing order was correct.



![[Pipeline Guide.img/K Lens Lightfield.jpg]]



The imagery used for the proof-of-concept test was pulled from a December 8th, 2021 article by Damien Demolder on the DPREVIEW website titled:



[Hands-on with the K-Lens, a light field lens that captures 3D data for post-capture refocusing](https://www.dpreview.com/news/9729848884/hands-on-with-the-k-lens-a-light-field-lens-that-captures-3d-data-for-post-capture-refocusing)



Using this web-sourced image sample for an R&D test meant the footage was available at something like 1/10th of the original DSLR camera body's native photo resolution.

The native resolution for light-field media photographed with a DSLR + K Lens is calculated by breaking apart the 3x3 multi-view layout imagery. This is done as "Image Width ÷ 3", and "Image Height ÷ 3" for the final view size that is visible on a multi-view compatible playback device. 

I don't think the lens resolution is an unworkable issue with the availability of image resizing options like PyTorch driven ML super-resolution techniques, or Topaz Labs software.

When a VFX artist carries out XR post-production, computational imaging techniques in Resolve/Fusion/KartaVR v5 allow "disparity mapping" and "Z-depth" to occur. 

These approaches make it feasible to perform novel view synthesis tasks which generate interpolated views for playback on lenticular based light-field monitors like a "Looking Glass Display". In this case you can have up to 45 unique view angles rendered on screen at the same time using a method called "lenticular slicing".



Interestingly, it is worth noting that a "Lightfield Labs" display ([https://www.youtube.com/watch?v=7oGtgbsmmg8](https://www.youtube.com/watch?v=7oGtgbsmmg8&fbclid=IwAR0kporpI5ojmSlo4z173qOOpioZhf2kJ2Mv3zutsPH4W0eGphb0exOMOgI)) can play 6DoF footage in glasses-free stereo 3D so the viewer experiences comfortable vertical and horizontal stereo parallax effects when changing the viewing position. 



The elegance of having a single light-field lens mounted on a DSLR camera body is the type of innovation needed to support the production requirements of 6DoF live action filmmaking. Wider adoption of these 6DoF concepts will happen once end-to-end solutions exist for multi-view capture, along with affordable displays for multi-view glasses free media playback. 

## Looking Glass Multi-View

KartaVR includes several Looking Glass Display optimized macro nodes and example comps that support light-field image editing, Stereo 3D left/right eye image generation, and Fusion 3D workspace based multi-view rendering.



Check out the [LookingGlassRenderer3D macro](https://andrewhazelden.com/projects/kartavr/docs/macros-guide-looking-glass.html#LookingGlassRenderer3D) docs for information about the node:

![[Pipeline Guide.img/LookingGlassRenderer3D-comp-example.png]]

## Vonk vImageCreateTiles Node

The Vonk Data Node project provides a "vImageCreateTiles" fuse node that makes the creation of image grid layouts a node-based task.



![[Pipeline Guide.img/Untitled_56.png]]



This node makes it easy to create tiled "texture atlas" like grid layouts. If you need the imagery to be scaled down to a specific size, attach a resize or scale node to the image stream before you connect it to the vImageCreateTiles node.



The "Tiles X" control specifies how many images are stacked horizontally.



The "Tiles Y" control specifies how many images are stacked vertically.



The "Reverse X Order" and "Reverse Y Order" checkboxes are used to provide control over the image placement ordering when the grid layout is built. This allows you to start frame 1 at either of the 4 corners of the frame border.

## MultiView Tiled Image Samples

### Pikachu

A 13x10 multi-view stereo based tiled image grid dataset of a Pikachu character is included in the KartaVR images folder:

Reactor:/Deploy/Macros/KartaVR/Images/pikachu_13x10_image_grid.jpg



![[Pipeline Guide.img/pikachu_13x10_image_grid.jpg]]



A YouTube video is available that shows the Pikachu multi-view footage playing back as a navigable 6 DoF real-time lightfield experience inside of Unreal Engine:

[https://www.youtube.com/shorts/lWMF5g1MR_o](https://www.youtube.com/shorts/lWMF5g1MR_o)

### Silver Mask

A 4x4 multi-view image of a photogrammetry-based  silver mask is included in the KartaVR images folder:

Reactor:/Deploy/Macros/KartaVR/Images/lg_silver_mask_4x4_quilted.0001.jpg



![[Pipeline Guide.img/lg_silver_mask_4x4_quilted.0001.jpg]]



A YouTube video is available that shows the silver mask multi-view footage playing back inside of Photoshop as an anaglyph stereo 3D formatted output using the Lighfielder Suite provided set of actions:

[https://www.youtube.com/shorts/YDEcVpiCbZg](https://www.youtube.com/shorts/YDEcVpiCbZg)

### Green Lantern

A 5x9 multi-view image of a V-Ray for Maya rendered green hurricane lantern is included in the KartaVR images folder:

Reactor:/Deploy/Macros/KartaVR/Images/lg_green_lantern_5x9_quilted.0001.jpg



![[Pipeline Guide.img/lg_green_lantern_5x9_quilted.0001.jpg]]



A YouTube video is available that shows the green hurricane lantern multi-view footage playing back on a Looking Glass Display:

[https://youtube.com/shorts/qMnJIbk4lrY](https://youtube.com/shorts/qMnJIbk4lrY)



## Example Fusion-Based Lightfield Compositing Projects

The following Fusion .comp files are provided in the "KartaVR Examples | Comps" atom package in Reactor:



• [LookingGlassRenderer3D.comp](https://andrewhazelden.com/projects/kartavr/docs/examples.html#looking-glass-renderer-3d)

• [Looking Glass 4x4 Quilted Anaglyph Stereo 3D Viewer.comp](https://andrewhazelden.com/projects/kartavr/docs/examples.html#looking-glass-4x4-quilted-anaglyph-stereo-3d-viewer)

• [Looking Glass 4x4 Quilted to Image Sequence.comp](https://andrewhazelden.com/projects/kartavr/docs/examples.html#looking-glass-4x4-quilted-to-image-sequence)

• [Looking Glass 5x9 Quilted Anaglyph Stereo 3D Viewer.comp](https://andrewhazelden.com/projects/kartavr/docs/examples.html#looking-glass-4x4-quilted-to-image-sequence)

• [Looking Glass 5x9 Quilted to Image Sequence.comp](https://andrewhazelden.com/projects/kartavr/docs/examples.html#looking-glass-5x9-quilted-to-image-sequence)



These examples can be installed using the Reactor package manager by navigating on the left side of the window to the "Kartaverse > KartaVR > Comps" category. 



Click on the "KartaVR Examples | Comps" entry in the main atoms list area. Then press the "Install" button.



![[Pipeline Guide.img/KartaVR Example Comps.png]]



The example Fusion comps are installed on-disk to the following PathMap location:

Reactor:/Deploy/Comps/KartaVR/

# Fusion/Kartaverse Multi-View Parallel I/O Concepts

Pio (Parallel I/O) techniques in Fusion allow for more image channels/image streams to run through a Resolve/Fusion node graph than is normally possible in a controlled fashion.



Parallel I/O node graph construction approaches are different from most conventional stock workflows you would see for comp-based media management in a typical YouTube video, or in BMD's own user guides and manuals.



![[Pipeline Guide.img/Parallel IO.jpg]]



An exciting aspect of Fusion-based multi-view comp creation is that data driven approaches can be used to automate and streamline media access through the use of open-source tools like the Vonk Data Nodes, and the ReadEXRUltra fuse.

## Parallel I/O Example Comp Download

This example shows a simplistic representation of multi-input and multi-output approaches applied in a Fusion composite.



[Parallel_IO_Workflow_Demo_1.zip](http://andrewhazelden.com/projects/kartaverse/downloads/Parallel_IO_Workflow_Demo_1.zip)



## Parallel I/O Workflow Summary

Parallel I/O provides a series of modular building blocks that will help accelerate the construction of densely packed multi-view node graphs. The primary use for this type of node assembly is for multi-view panoramic video stitching, for videogrammetry image based modeling, and for UDIM tile-based 3D texture map creation workflows.



This toolset was designed to assist artists who find themselves frequently assembling highly symmetrical layouts. 



You can tell this is happening in your composite if you have a few "stacks" of very well-defined comp branches that travel the full length of the comp tree. These types of stacked multi-view branches in a comp will frequently use many synchronized settings that are mirrored across each view with the help of expression-linked attributes or instanced nodes.



Parallel I/O tools work by containerizing each of the individual processes that run concurrently across each of your individual multi-view data processing steps. This containerization process makes things easier to manage, and very consistent.



From the initial design stage, the Parallel I/O nodes encourage the use of super-nodal modifier nodes like the Vonk data node fuses. This allows for an "every datatype is a node connection away" philosophy.

## What is this idea all about?

My current multi-view data processing technique is done using an approach I call "Parallel I/O", "pI/O", or simply "pio" for short.



When working with all the normal nodes that come with Fusion, pI/O node graphs use multi-input and multi-output connections applied to your own "GroupOperator" based macro nodes. If you want you can place PipeRouters at the bottom of a pI/O node to provide a quick way to view image streams in a Fusion viewer window.



This grouped macro version of pI/O operates as a wrapper-like "container" for any type of node that could be found in Fusion Standalone or Resolve's Fusion page, including 3rd party OFX plugins, too.



This "pI/O" technique can be taken even further in custom DIY-created DCTL fuses, and it can be achieved with compiled FusionSDK based plugins, too. In these situations, you also get the benefit of new connection ports being added only as needed since you can go a bit deeper with the customization.



The Parallel I/O concept is effective for multi-view workflows as it allows you to take many, many, image streams and "trunk" them in parallel as the image data flows through the comp.



(Note: With this approach to parallel data trunking, it is very helpful to change the "Fusion Preferences > Global and Default Settings > Flow > Build direction > " setting to Vertical.)



My goal with this development effort was to allow Fusion to better compete with the near-unlimited EXR channel handling system present in other popular (and far less affordable) node-based compositing packages and to closer match the functional capabilities of the ubiquitous "Shuffle" node to be able to remap these extra image channels however you want to.

## A Detailed Summary of the Parallel I/O Idea

I see the Parallel I/O concept as an excellent way to be able to assign the same image processing settings in bulk, and to have those values transparently kept in sync across each of the individual image streams passing through the node. 



This all happens via the magical wonder of Fusion's Right-Click contextual menu-based "Copy" (Command+C) entry, and the matching "Paste Instance" (Shift+Command+V) menu entry being used on most of the nodes that are packaged inside a "pI/O" wrapper based GroupOperator (aka Group node) shell.



This technique can be done even better when applied to your own fuse-based tools that use the dynamic input connection creation code that originated in the classic Eyeon Software era "Switch.fuse" example that was created by Stefan Ihringer (aka CompFu) all the way back in 2010. This fuse node-based approach makes it so the extra "pI/O" connection ports are created as needed, on the fly, as you connect and disconnect imagery from the Parallel I/O nodes in the Nodes view. Very cool stuff and a nice quality of life improvement.



With these Parallel I/O based multi-view techniques applied in Resolve/Fusion, you can quickly add your own synchronized LUT nodes, cropping, transforming, image projection changes, stabilization, 2D filters, or any other thing you might want to do individually to each image stream that is coming from a multi-view camera array and passing through your composite. 



IMHO, this concept perfectly lines up with the needs of immersive artists who regularly work on multi-view, stereo 3D, 3603D VR, lightfield, or video/photogrammetry workflows.

## Streamlining the Footage Loading and Saving Process

I am currently working on a simpler approach for media management in Fusion by allowing the use of filename tokens in the "Filename" field of Multi-view based Loader/Saver node remakes. These node remakes are being created as fuse nodes (which work in Resolve (free), Resolve Studio, and Fusion Studio Standalone). 



The use of multi-input/multi-output fuses for media access works by leveraging the Fusion native Fuse API PutFrame/GetFrame/EXRIO functions which are accessible from the Vonk "vImage" fuses, the "pioSaver" fuse, and the "LifeSaver" fuse.



The end result of all this deeply technical discussion is that these new KartaVR v5 centric approaches allow an artist, in only a few clicks, to bulk-load a "metric ton" of multi-view footage into a Fusion composite on the fly, which makes it possible to do just about anything to the content in post-production. 



You can then render this multi-view media out via a Fusion GUI session, the Delivery Page, or distribute the task on a render farm or a cloud compute cluster via the unlimited render node license capability of the Fusion Render Node app. Very sweet stuff indeed.



Getting creative as a compositor, and combining pI/O techniques for node building, along with the magical Vonk Fuses, would allow you to dramatically re-define how all of your multi-view imagery is loaded into each image stream in the comp session. Additionally, the media I/O tasks could all be made to happen in a fashion that can be controlled 100% by external data sources that live outside a .comp file such as JSON, XML, YAML, CSV (comma-separated value), TSV (tab-separated value), or IFL files (image file lists). 



With pI/O (and the Vonk fuse) at play, you'd even have the option to pull data into the composite that is stored externally on your local LAN network or the full open interweb via Fusion's LuaJIT FFI scripting bindings that offer built-in cURL based internet socket connections. Adding nodes constructed with live network connectivity to a flow is achieved with a small adaptation of the existing Vonk "vImageFromNet", "vJSONFromNet", or
"vTextFromNet" nodes.



To make this Parallel I/O process faster to use in real-world immersive compositing workflows, I am looking into ways to script and automate the pI/O tools so an artist could select any two compatible nodes in the Nodes views, and do automatic multi-input and multi-output connection wiring in an instant via .fu based hotkey bindings, or with a right-click in the flow "tool" script contextual menu item entry.

## MultiChannel EXR Exporting pioSaver Node

pioSaver is a fuse based replacement for the traditional Saver node. It is available in the Reactor Package Manager.



This fuse uses EXRIO for the file output and supports multi-channel EXR data export. This node is special in that you can use it in comps that are created inside of Resolve's Fusion page and inside of Fusion Standalone.



In this example comp, the Vonk "vTextCreate" fuse node is used to externally supply the base "filename prefix" text string record used for the pioSaver powered EXRIO image saving node. This filename-prefix is added using the token value of "${COMP}/${NODE}/${NODE}".



The Vonk "vTextSubFormat" fuse node is used to add the relative PathMap for the current comp's Render folder, along with the frame padding information, and the image extension using the string "Comp:/Render/{1}.0000.exr"



![[Pipeline Guide.img/pioSaver.png]]

# Fusion Native Lens Distortion Correction

Although it is preferable to be able to exclusively use Panotools/Hugin/PTGui style A/B/C lens distortion parameters in your 360VR workflows…



The built-into Fusion LensDistort node has existed for ages and it allows you to access the lens distortion/undistortion math that is used in the 3D Equalizer camera match-moving/tracking software which is a tool that comes from the feature film VFX industry. The Fusion LensDistort node's "3DE Radial - Fisheye, Degree 8, Release 1" lens distortion model can be used to linearize the f-theta distortion that is present in your 360VR camera rig's original unstitched circular fisheye lens shot media.



![[Pipeline Guide.img/Lens Distort Node.jpg]]



This corrective lens warping action will give your footage a lens distortion effect that more closely resembles an "angular fisheye" lens model, which is often called a "Domemaster" style of image in the 180 degree diagonal FOV (Field of View) planetarium show production space.



The Lens Distortion correction process results in footage that is very consistent and uniform. The resulting media is much easier to apply DIY, artist-driven, 100% manual, node-based stitching techniques to.



Most people don't realize they can use the Fusion LensDistort node in their composites, with no external tool requirement, as long as you don't mind taking some time with test footage to eye-ball the warping effect to taste, for each of the lenses you work with in your 360VR content creation process. With a little practice, this approach will often work well enough for a quick-n-dirty lens correction that is done 100% inside of a stock copy of Fusion or Resolve's Fusion page.



Alternatively, you could explore ST Map (UV pass) warping to apply pre-computed lens correction values sourced from an ST Map template image that you would create externally.  Yes, in the long term, solutions for applying Panotools style A/B/C corrections are preferred... but if you want to get work done today, this post should get you going in a positive direction.

# Fusion Stereo 3D 360VR View Rotation Effects

An important distinction in 360VR post-production is the difference between the idea of levelling a panorama with XYZ rotations (pan/tilt/roll) vs what a reframed video output offers.



If your goal is to level a 360VR video clip, and you want your final output to still be a 360°x180° spherical clip that you can view on an HMD, you should explore the use of the Fusion built-in PanoMap node to apply the view rotation effect.



After you do the view rotation via the PanoMap node, you can render out the footage to a 2:1 aspect ratio movie file, and then use a tool like the Spatial Media Metadata Injector to make this footage play back correctly on YouTube 360 or in a VR movie player like VLC or GoProPlayer.



If you need to level/rotate a Top/Bottom 360VR stereo video, you can use a combination of the Splitter node (Split: Vert), two PanoMap nodes (with the 2nd node added via Copy/Paste Instance (Ctrl+Shift+V hotkey), and then finally a Combiner node (Combine: Vert) at the end.



![[Pipeline Guide.img/PanoMap Stereo Rotations.jpg]]



The Splitter node lets you separate the left and right eyes apart from the TopBottom original footage. The two PanoMap nodes apply your view rotations. Finally, the Combiner node allows you to merge the two separate left and right eye image streams back together into a single TopBottom formatted 360VR output.



A reframing effect, by comparison, acts as its own version of an offline-rendered panoramic movie viewer. The reframing process that the Reframe360 Ultra node does converts a 360VR movie into a "flat" output, which is also called a rectilinear image projection in tools like PTGui. The reframing process takes a spherical 360° panorama and makes it suitable for viewing on a conventional monitor without any VR gear, or for posting on platforms like Instagram, TikTok, or Twitter where there is no native VR playback support. 



A reframed video conversion is also great if you are looking to get a "Tiny Planet" like output from your spherically shot 360°x180° source footage.



![[Pipeline Guide.img/reframe a view.jpg]]

# Resolve Edit Page PanoMap Effects Templates

Here are two Resolve Studio Edit page compatible "Effects Template" versions of the built-in Fusion PanoMap node that might be of use for 360VR video editors.

One macro node is named "PanoMapMono" for monoscopic 360° video usage.

The other macro node is named "PanoMapStereo". The node allows you to work in the Edit page and apply view rotations to stereoscopic 3D Top/Bottom and Side-by-Side formatted 360° video content. This macro has integrated Splitter/Combiner nodes that are expression linked.

![[Pipeline Guide.img/Panomap effects Templates.jpg]]

To use the two effects template files:

Step 1. Download the attached "PanoMapMono.setting.txt" and "PanoMapStereo.setting.txt" files and remove the .txt extension from the end of the filenames.

Macro Download Links:

[PanoMapMono.setting.txt](https://www.andrewhazelden.com/projects/kartaverse/downloads/PanoMapMono.setting.txt?fbclid=IwAR34BbWNJ7MGGbFFkrfSvDYcEd-LtkUmFRF6A4aF5U2YEslufOHJkgTGsxU)

[PanoMapStereo.setting.txt](https://www.andrewhazelden.com/projects/kartaverse/downloads/PanoMapStereo.setting.txt?fbclid=IwAR3sBGTMXh9b39n5mG8uJZfro7iDB-OMLhyY_xNJCccdkixd5XwO_e7yY5M)

Step 2. Create a new "VR'' subfolder inside your Resolve Edit page based Templates folder. You will have to manually create the multiple intermediate subfolders to do this:

Windows:

C:\ProgramData\Blackmagic Design\DaVinci Resolve\Support\Fusion\Templates\Edit\Effects\VR\

macOS:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Templates/Edit/Effects/VR/

Linux:

/var/BlackmagicDesign/DaVinci Resolve/Support/Fusion/Fusion/Templates/Edit/Effects/VR/

Step 3. Copy the Effects Template files into the new "VR" folder created in Step 2.

Step 4. Restart Resolve. Switch to an Edit page timeline with VR footage in it. In the Effects Library Tab navigate to the "Toolbox > Effects" view.

Step 5. Drag a "PanoMap" or "PanoMapStereo" macro onto a clip in the timeline.

Step 6. Select the 360VR video clip in your timeline, then open the Inspector view and select the "Effects" control page/tab. The PanoMap node's controls will be accessible and editable.

For the PanoMapStereo macro node, the "Split: Vert" control is used for "Top/Bottom Stereo" footage. The "Split: Horiz" control is used for "Side-by-Side Stereo" footage.

# Mobius Transformations

Möbius transformations make it possible to apply zoom, rotation, and translation effects to immersive 360VR footage. With Möbius operations, the input and output media will maintain their original 360°x180° degree spherical image projection. This allows you to transform the footage and still be able to view the media on a VR HMD afterwards.

[https://github.com/AndrewHazelden/mobius](https://github.com/AndrewHazelden/mobius)

This is a spherical image before a mobius zoom is applied:

![[Pipeline Guide.img/Mobius_SRC.0024.jpg]]

The next image shows the same scene with a mobius zoom effect used to pull the camera upwards, away from the nadir zone at the bottom of the panorama:

![[Pipeline Guide.img/Mobius_DEST.0024.jpg]]

When the mobius transformed media is displayed in a panoramic image viewer you will see what looks vaguely like a tiny planet result but the media input is still 360°x180° content which allows you to freely look around the scene with a VR HMD on.

Note: A mobius transform approach is distinctly different from the results you get with traditional "overcapture" 360VR reframing processes that will translate a source 360°x180° degree spherical image projection into either a traditional rectilinear "flat" image projection with a ~90° FOV (Field of View) output, or a stereographic "tiny planet" flattened image projection.

## Credits

The Kartaverse Mobius fuse development project is a fork of Henry Segerman's original [Spherical Image Editing GitHub repository](https://github.com/henryseg/spherical_image_editing).

The Kartaverse goal is to port the underlying math formulas from Henry's original code to run as a hardware-accelerated fragment shader inside of DCC packages like Blackmagic Design's Resolve/Fusion post-production software.

## Python Installation

The following resources are required to use the Python based source code in this repository:

-   Python x64 v3.6 - v3.10

-   3rd Party Python Library Install:


-   pip3 install --upgrade pip

-   pip3 install Pillow

-   pip3 install numpy

-   pip3 install scipy


## Mobius Screenshots

Mobius Spherical Zooming

![[Pipeline Guide.img/scaled_test_image.png]]

Mobius Spherical Rotations

![[Pipeline Guide.img/rotated_test_image.png]]

## Python CLI Usage Instructions

python3 mobius.py --input "source.0000.png" --output "output.0000.png" --x 180 --y 135 --zoom 10



python3 mobius.py --input "source.0000.png" --output "output.0000.png" --x 0.5 --y 0.75 --zoom 10 --normalized

## Python Script Syntax

usage: mobius.py [-h] -i INPUT -o OUTPUT -x X -y Y -z ZOOM [-n]



Apply Mobius transformations to spherical 360x180 degree footage.



options:

  -h, --help            show this help message and exit

  -i INPUT, --input INPUT

                        The filepath to your source image

  -o OUTPUT, --output OUTPUT

                        The filepath to your output image

  -x X, --x X           Center X (in degrees)

  -y Y, --y Y           Center Y (in degrees)

  -z ZOOM, --zoom ZOOM  Zoom level

  -n, --normalized      Use normalized (0-1) range screen space coordinates for the CenterX/Y input values

                        instead of degrees.

# Resolve/Fusion LatLong Patcher Node

The Resolve Studio/Fusion Studio native "LatLong Patcher" tool, when operating in the "Apply" mode, takes a 90° FOV CubeMap face image as the input. The cubic view is connected to the "yellow" input triangle on the node. 

That 90° FOV cubic view image is then warped into a LatLong image projection.

![[Pipeline Guide.img/LatLong Patcher Node.jpg]]

The source image fed into a "LatLong Patcher" node, (when this patcher tool is set to the "Apply" Mode), is typically a "MediaIn" or "Loader" node that has a 1:1 aspect ratio. This imagery should be as close as possible to an idealized 90° FOV (Field of View) that corresponds to the "front" face of a cubic panoramic frame format. You can use a crop node to reformat a larger, or wider aspect ratio down to the correct 1:1 ratio that is required.

The "LatLong Patcher" node's "XYZ Rotation" controls allow you to adjust the placement of the converted image by shifting the Yaw/Pitch/Roll.

Tech Note: The animated rotation effect generated by this node, (even when the Motion blur setting is active in the composite), will not typically have motion-blur applied if you keyframe animate the XYZ rotation channels.

For motion-blurred 360VR output, look at a true Fusion 3D workspace based image projection conversion, that is then rendered to disk using a "Renderer3D" node.

This is typically generated using a "Spherical Camera" node that is connected upstream of the "Renderer3D" node, inside the Fusion 3D scene graph you build.

# Resolve/Fusion 360VR Inertial Stabilization Workflows With Gyroflow

## Command-Line Based Shell Script

"[Gyroflow to CSV](https://github.com/EmberLightVFX/Gyroflow-to-CSV)" is a Python script that converts your [Gyroflow](https://gyroflow.xyz/) stabilization to a CSV file.

When using the CLI based Gyroflow to CSV script, make sure to choose "including processed gyro data" when exporting from Gyroflow. By default, Gyroflow saves out the rotation data using a [Euler rotation](https://en.wikipedia.org/wiki/Euler_angles) (ZYX) based notation format. It also saves out the data in your footages' native frame rate.

## Fusion Based Comp Script

[Gyroflow Fusion](https://github.com/EmberLightVFX/Gyroflow-to-CSV/tree/main/Atoms/com.JacobDanell.GyroflowFusion) is a Python-based comp script with a custom UI Manager based GUI that runs inside of the Fusion page, and in Fusion Studio.

Script Requirements:

-   Resolve (free) or Resolve Studio or Fusion Studio

-   Python 3.6+ is required to use this script.


## DragDrop Support

The Gyroflow Fusion toolset supports drag and drop handling of .gyroflow files. This works by dragging the file from an Explorer/Finder/Nautilus desktop folder browsing location and dropping the file into the Fusion nodes view area.

In this situation, the Gyro Fusion script is automatically launched and the "Gyroflow Filename" textfield is pre-filled in advance in the GUI.

## Using the Script

To run the script, open the Fusion Studio based "Script > Gyroflow Fusion > Gyroflow to CSV" Menu item.

![Fusion Script Menu](https://lh4.googleusercontent.com/l4L50BRWZSq3NXYQZIx6nmSEmGEKuiUhVd3KNvI-DqXNxOPx3hTp8pJQhvQmJxQKeXkL2pM7T2v_XkkR_AiegZTx_oQc9ntePMGtn0aAXj-4Q4AHrGjBEM7iBm7CI1PsuLTyVm126O7Yb1O5iA9XbFULgVVhxg36MNGl_TKJ9eHnAzEwes-faKZf8IwHRQ)

## Splash Screen

A splash screen is shown that provides usage information about the required Gyroflow export settings.

"The script converts your Gyroflow stabilization to a CSV file. Make sure to choose "including processed gyro data" when exporting from Gyroflow. As default it saves out the rotations as Euler rotation (ZYX). It also saves out the data in your footages' native frame rate."

Click the "Continue" button to proceed.

Note: If you want to go to the Gyroflow website you can click on the logo image at the top of the dialog.

![Splash Screen Dialog](https://lh5.googleusercontent.com/LyU3eWN4GJ7PQAieGZ7EfKcMG9uLtEvrI4MATAsTv3pBfOBgEed6ZmLjxAbsM5JxdNtbQhZXsmX9YFVrBcONWRPj_u0BKF1DxKEVU9LEeTJWvGJkeBscfwifr39C3ptIPdRctO8T5kSxpsZ_mEa5v2NNd5_2IVH8DA3Xo02dbs0iCfMD1qoIPxDj_A66WA)

## File Dialog

This dialog is used to define the parameters used when the Gyroflow document is exported to a CSV file. In the "Gyroflow Filename" field select a file with the ".gyroflow" file extension.

Click the "Go" button to proceed.

![File Dialog](https://lh4.googleusercontent.com/tY_FGjJxhfVhQng_R7tu-txf16C68JQa8btOUD5jrZ-85mgmRmBWKCfylmmfw55aWXxz44ByNn19h749Ehiif5MH92IDVd8XY7IErYS_fiMLJXNZZTzfU0e9McpUYXv_mT23wfoTgj7d2cOtZUR07Gcx-VJt0B-pDL5jfFWqLMpiXAsVNVz3XPBGy6SZ7Q)

---

If you enabled the '[x] Add "Gyroflow CSV" Nodes to Comp' checkbox in the dialog, a Vonk node graph is inserted into your Fusion composite that has the path to the Gyroflow generated CSV file pre-entered into the "vTextFromFile" node's "Input" textfield.

The nodes named "xGyro1", "yGyro1", and "zGyro1" provide the Number data-type based outputs for the Rotate X/Y/Z channels of IMU (inertial) stabilization data from Gyroflow.

![Macro Nodes](https://lh6.googleusercontent.com/Ehsv1_7QRxsnwWUx91fyNBOVLlBWhYt0JxRfrNaDJSOdM-PJJJI9efvvLBaL7nBDPzrbs4m-wfrgoVuWuw7end34O9OZ868Ph8ZTd9W1N7eDcMFCYr0sB5X0-0S-aCVsrkqlx0Z1qNS4CWPfsYdweRAc6u_U16TlQtyFNKXwVvKQ34OW5wYgSsraMKTEEA)

---

If you have a large Gyroflow file that takes a while to process, you can watch the progress status in the Console window. Clicking the Console button on the top left of the Fusion interface, or pressing the "Shift + 0" hotkey is a quick way to open the Console window.

![Console](https://lh5.googleusercontent.com/1FswdS_bujBq72OfqdaaA2UEeOnhNyDV8HLdcwT_brtZ9V8lIwocblf0YJsb0pYMyzq4OumQKo7uQhZ2NehQtjTeTIPTmZoSSohj_NRVT7iKSJBFwdSuYK8CL_0DjwLpX3rbx3pl_fuNqXBjZIQmwsirzgkE3zOps5g-brvwO4Jyh3IxY7o-FEKPjCqR6Q)

## Macro

A "Gyroflow CSV" macro is available in the "Select Tool" dialog. This macro makes it quick and painless to quickly add the supporting Vonk nodes to the node-graph.

![Select Tool](https://lh3.googleusercontent.com/07A3u4VpWjMVIqekcdXNzav-qp4Dj78hcEUU4Ne3tR4RFBaA9cyek0AucAzVSYkwdYX8my-L8DWLHaUvotALhnzX4pWtCoBGzBKA5RDqNrZKaLS-w0loVA3pRhopDuRsfszaNf9IyJhIDYy90tEmXpq5BiJDP4-ErMb-CsgaWDeVfL-cPmvSXjBUAmwN6Q)

The nodes named "xGyro1", "yGyro1", and "zGyro1" provide the Number data-type based outputs for the Rotate X/Y/Z channels of IMU (inertial) stabilization data from Gyroflow.

![Macro Nodes](https://lh6.googleusercontent.com/V1sv2ZNr0h5tUVJZP7PUAipVFvanDOhg7brADRjQbvvwxLSpBhDdRSsf5jSUIJtoIcZ9pJuE8qp8mAjFuvSsbgvqTjrfDvkAKKvXrmQountvoluDq9zstNccQw2_jSlRk6ZbIrxu6eEzHoiCk-TDb_s1y8MApP8Z4UvQ3omHJX3Y3u-TITmg_C6zOMThGw)

## Example Fusion Comp

A Gyroflow example compositing project is provided that includes a short video clip, a .gyroflow file, and a CSV export. This project shows an applied use of the "Gyroflow to CSV" script and [Vonk](https://docs.google.com/document/d/1U9WfdHlE1AZHdU6_ZQCB1I2nSa5I7TyHG2vKMi2I7v8/edit?usp=sharing) data nodes inside of Fusion.

In order to use this example comp you need to have Vonk installed (from the Reactor Package Manager) to read a Gyroflow CSV file and drive a 3D camera with it.

Open the example project if you want to see how it's done:

Reactor:/Deploy/Comp/Gyroflow Fusion/Gyroflow.comp

![Example Comp](https://lh3.googleusercontent.com/ycmzsIvWGPfqQVtGBKZsIiYvO9JwQaVHBx7DMuFl79bQT26yjT9y0ZNp_Rd_bqikLs11HuMzCWyCjYgMtnJTboKElJN9iKaCFJJSvaAyFwNlwQXDlCcttfMTAA1GggNoIi2X2Glz4tLXIwlFlyiInCtOX4FAghry-zWxLZeGFJF_Nr3m4_K79UEt9Rud2Q)

## Gyroflow Node Connections

You can connect these nodes to your Fusion 3D workspace based Camera3D or Transform3D node's Rotation channels.

![Rotation Channels](https://lh3.googleusercontent.com/kOfTrs8kjuTK6sNaEtHi1dfVDHI_D5q0OKmN3H7XwHyZMe0OwTE2ngQPMXjqwiJaPhpWOPEUFnE9zh5S6unoyRxMAiGsBkPFUya7xkie5GwXREJEZCbRMTX5XwU0jUi1Eli47aCHbSOzc-KEVz5b2G-9H1z9FKvcjS6rZBGjgEceLiZNu4RMTEOY2ooFdQ)

Right-clicking on either of the X/Y/Z channel keyframe "diamond shapes" in the Inspector view provides access to the "Connect To" contextual menu entry.

![Rotation Channels](https://lh4.googleusercontent.com/09BcDWCDVIQ32OQNnkUO_N_KOX6gjMkkLS123Q_324sYDqGijxjZT-JICdrWJxC4FopA83a6vZUfxk0QuEhVGNDwUsKVos1EF3hFKv8i95CF9FjQrq2GxRk3RvKTvWpmK0qyZuhR6xeGk26Bh9wYVTsALSqd3rOmyWfO3OKCRc9MpksX1RW5pmDFrQnrjg)

The mapping of Gyroflow channels is:

xGyro1.Output -> Transform3DOp.Rotate.X

yGyro1.Output -> Transform3DOp.Rotate.Y

zGyro1.Output -> Transform3DOp.Rotate.Z

## Timeline Render Start Frame

The "vNumberAdd" node is used to shift the starting frame number when accessing the CSV (comma separated value) text file's "Index" based line number. By default the offset of adding 1 to the current timeline frame number is entered so things work out of the box with a timeline that has frame 0 as the "Render Start" frame value.

You can easily modify the vNumberAdd node's "Term 2" setting to line up with your VFX workflow needs such as a shot with a frame 1, frame 1000, or frame 1001 "Render Start" frame.

![vNumberAdd](https://lh5.googleusercontent.com/v1LID-FbbJUbwEIehNrbBsTvXfmfE73UfMR0vFGxbti4plV-dVWsRjBrAZhp-aelQQYnwAeo6PVmKmu6vPNEUy_hJpiE4u34MZMAkGyueSKPenKLqO1gfkR8le66aCIyFpao4dTLRGKwOjuPOwbGe4Nc2KO_wdpTz3yQ5ZAgHuKoD_Jq18t9dwhAmcZgQw)

## IMU Motion Corrections

If you need to adjust the direction axis for the IMU corrections, there are two preset values stored in the "Versions" controls for the "xGyro1", "yGyro1", and "zGyro1" nodes.

This applies a "1" or "-1" multiplication operation to the rotation channel data using a Vonk "vNumberMultiply" node's built-in "Factor2" control.

![Gyroflow Multiply](https://lh3.googleusercontent.com/xHd7geFxI8RAulgxbgF_XUl3Nt7Z3kwAcXTWKTHAj354tmtcEDGRapQnXf4Ml6Deki4pyUxjcYWM_HtOV1OTmBgNms-MiwTKlNonZr0_ctnyQfvs_3VFMrzODrnwyA8dBX7q7h5g7_udPBYMwWZaL1KDk-yvftakd7jU4XbUY6cXmkPH1RM26VOUz4pB_w)

## 360VR Rotation Correction

If your footage was filmed on a 360VR spherical camera that records internal IMU data, it is possible to apply the Gyroflow corrections to a Resolve/Fusion built-in "PanoMap" node instead of using a Camera3D or Transform node.

In this case the mapping of Gyroflow channels is:

xGyro1.Output -> Rotate.X

yGyro1.Output -> Rotate.Y

zGyro1.Output -> Rotate.Z

## Monoscopic 360VR

You would connect your source 360VR footage to a Loader/MediaIn node. Then connect the image output to the PanoMap node:

Loader -> PanoMap

or

MediaIn -> PanoMap



![PanoMap](https://lh6.googleusercontent.com/wSc_m9WhcMeuoM1nPy19OB2xusMhDEVpb-ais-eIapHa_z_R7_it5ciiTIP41EYxQ8e7RF6OcvqIPz3A9HE7OnV7zsarawhsFmVh416P_6Z8VINixhLqvSsa2tPczqh35exKPhmH4DykJayMo0YGyMT6lHeFRFXjzJ2Bl3Hrh5RQvBdd3AMSefYP69pW8Q)

## Stereoscopic 3D 360VR

If you are working with Side-by-Side or Over/Under formatted stereo 3D footage, you would need to split apart the left and right eye views with Fusion's built-in "Splitter" node.

The PanoMap node is used to apply the view rotation corrections. When adding PanoMap nodes to the comp, the use of the "Copy" and "Paste Instance" commands can be a timesaver as it will keep the left and right eye view node attributes synced up in the Inspector tab.

Finally, the Fusion built-in Combiner node is used to merge the left and right eye views back together again into a single stereoscopic 3D image.

The node connections are:

Loader/MediaIn -> Splitter



Splitter.Image1 (Left) -> PanoMap (Left)

Splitter.Image2 (Right) -> PanoMap (Right)



PanoMap (Left) -> Combiner.Image1

PanoMap (Right) -> Combiner.Image2



Combiner -> Saver/MediaOut



![PanoMap Stereo](https://lh3.googleusercontent.com/hW93mGZu4zYevI75KhDtKzmgNiHxYny-Yg6qo8WxsvHpfeQvaLnJSCeGZqOk42WDYNg1KZ5wFixG_9bun9Nn5ZTM19XDRMFgugsGltEetoKBMRMxEhDUtJRtB8ohQyHbxGP8FhrLei3MOIXz67uhOxjGYGB4copSl53wGau2L2GHJ9rlunHykHse-d7WPw)

## 360VR Overcapture / Reframing

You could also use Gyroflow X/Y/Z view rotation data to help drive the KartaVR Reframe360 node's output. The Gyroflow data would be connected to the kvrReframe360Ultra node's View Transforms > "Pitch", "Yaw", "Roll" attributes.

This allows the IMU data to be used for the primary view leveling (or motion dampening) effect. This would be followed by a Vonk vNumberMultiply / vNumberAdd node approach to blend in artist controlled keyframable view offset adjustments that are animated across the timeline frame range.

Averaging / motion dampening can be applied using Vonk based temporal effects on Number datatypes. This makes it possible to read frame values ahead/behind the current playhead/timeline frame number (vNumberCompReqTime).

# FFMpeg Command-Line Syntax

[https://ffmpeg.org/](https://ffmpeg.org/)



For more information

-   [FFMpeg Syntax](https://ffmpeg.org/ffmpeg.html)

-   [KartaVR Scripts | Convert Movies to Image Sequences](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#convert-movies-to-image-sequences)

-   [KartaVR Scripts | Combine Stereo Movies](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#combine-stereo-movies)

-   [KartaVR Scripts | Video Snapshot](https://andrewhazelden.com/projects/kartavr/docs/scripts.html#video-snapshot)

-   [Dome2Rect | Image Sequence To Movie](https://github.com/AndrewHazelden/dome2rect/blob/master/imagesequence2movie.bat)


# Apple Compressor Command-Line Syntax

Apple's Compressor program supports command line job submission. This allows for high-quality ProRes 4444XQ video encodes to be done in an automated fashion on a tiny video encoding system like a macMini that could be placed in the corner of a machine room.



Compressor Learning Resources:

-   [Apple | Compressor](https://www.apple.com/final-cut-pro/compressor/)

-   [Apple | Compressor 4 | Shell Commands for Submitting Compressor Jobs](https://help.apple.com/compressor/mac/4.0/en/compressor/usermanual/index.html#chapter=C%26section=1%26tasks=true)


## Image Sequence to Movie Encoding

Almost every macOS based visual effects artist has a copy of Apple Final Cut Pro on their system, along with the Apple Compressor program, regardless of how often they use it.



What you might not have noticed is that Apple Compressor can be used as a standalone tool for batch converting image sequences, like OpenEXR RGBA footage, into a standards compliant ProRes movie output.



When doing the encoding task a key detail is that you need to place one image sequence per folder on your hard disk. Additionally, just to state this one more time since it is important, only have a single image sequence "clip" in that folder so Compressor doesn't get distracted! 



Also it is a good idea to start the image sequence at frame 0000.



To encode an image sequence into a movie, start up the Compressor program. Then select the "File > Add Image Sequence…" menu item.



![[Pipeline Guide.img/Compressor Add Iage Sequence.png]]



You can then adjust the encoding parameters for the current batch job.



If you are doing this operation very often it makes sense to carry along to the next part of this process and automate the task fully with the help of Compressor's command-line interface.

## Compressor Command-Line Usage

macOS ZSH Shell Syntax:



"/Applications/Compressor.app/Contents/MacOS/Compressor" -batchname "ProRes Encode" -jobpath "$Home/Desktop/ImageSequence/" -settingpath "Reactor:/Deploy/Bin/compressor/settings/ProRes.cmprstng" -locationpath "$Home/Desktop/ProRes_Encode.mov"



Note: The ".cmprsrng" file format is a Compressor exported encoding preset settings file.



## Compressor Python + Command-Line Usage



Here is an example that shows how a SilhouetteFX program based Apple Compressor command-line job submission operation can be carried out. The details can be found in the [SilhouetteFX-Python-Scripts GitHub repository here](https://github.com/AndrewHazelden/SilhouetteFX-Python-Scripts/blob/master/Scripts/actions/achEncodeMovieProRes.py).



IP Based Video Workflows

# Newtek NDI (Network Device Interface)

Newtek's NDI video protocol is revolutionizing connected immersive content creation, and fulldome content playback approaches.

[https://www.newtek.com/ndi/applications/](https://www.newtek.com/ndi/applications/)



For  more information:

-   [Wikipedia Network Device Interface](https://en.wikipedia.org/wiki/Network_Device_Interface)

-   [NDI Connect](https://www.newtek.com/ndi/applications/connect/)

-   [NDI SDK](https://ndi.tv/sdk/)


# Nobe Display

[https://timeinpixels.com/nobe-display/](https://timeinpixels.com/nobe-display/)

# LightSailVR VR NDI

[https://lightsailvr.com/tools.php](https://lightsailvr.com/tools.php)



For more information:

-   [VR NDI Documentation](https://docs.google.com/document/d/1vFI9pNKhtdONcOa6RQ1Aa9w2iIXYvvgoHLlu42WtMyk/edit)


# Syphon for macOS

[http://syphon.v002.info/](http://syphon.v002.info/)



For more information:

-   [Syphon | GitHub](https://github.com/Syphon)

-   [Syphon Python Bindings](https://github.com/njazz/syphonpy)


# Spout for Windows

[https://spout.zeal.co/](https://spout.zeal.co/)



For  more information:

-   [Spout | Forum](https://spout.discourse.group/)

-   [Spout To NDI](https://leadedge.github.io/)




Virtual Production Software

# Assimilate LiveFX

[https://www.assimilateinc.com/products/livefx/](https://www.assimilateinc.com/products/livefx/)

# Unreal Engine

[https://www.unrealengine.com/en-US/virtual-production](https://www.unrealengine.com/en-US/virtual-production)

# Unreal nDisplay

[https://docs.unrealengine.com/4.26/en-US/WorkingWithMedia/nDisplay/Overview/](https://docs.unrealengine.com/4.26/en-US/WorkingWithMedia/nDisplay/Overview/)

# Unreal Composure

[https://docs.unrealengine.com/en-US/Engine/Composure/index.html](https://docs.unrealengine.com/en-US/Engine/Composure/index.html)

# OWL Streaming Toolkit for Unreal

Off World produces a solution that improves the artist-friendly nature of Unreal based virtual production workflows. The streaming toolkit allows Unreal rendered low-latency NDI video streams to be passed with RGBA data directly into Assimilate LiveFX.



[https://offworld.live/products/unreal-engine-live-streaming-toolkit](https://offworld.live/products/unreal-engine-live-streaming-toolkit)

# Disguise

[https://www.disguise.one/en/](https://www.disguise.one/en/)

# Unity

[https://unity.com/roadmap/virtual-production](https://unity.com/roadmap/virtual-production)

# TouchDesigner

[https://derivative.ca/UserGuide/TouchDesigner](https://derivative.ca/UserGuide/TouchDesigner)

# Notch

[https://www.notch.one/virtualproduction/](https://www.notch.one/virtualproduction/)

# NVIDIA Omniverse

At the base level, Omniverse is a DCC platform that helps users perform tasks like next-generation OpenUSD workflow design/collaboration, virtual production asset prep, ML synthetic training data generation, and metaverse content creation.



[https://www.nvidia.com/en-us/omniverse/](https://www.nvidia.com/en-us/omniverse/)



The Omniverse toolset has been humorously described by end users as vaguely reminiscent of the entrepreneurial business model that existed in the Klondike era with the "pick and shovel" gear manufacturers. 



The meaning here is that Omniverse is a tool that exists to serve a specific utilitarian purpose — to help the end user get work done fast and efficiently.



The Omniverse end customer is then going off to use the pick and shovel tools they bought on large scale undertakings, to stake their gold claim, and do something big and impactful.

# Aximmetry

[https://aximmetry.com](https://aximmetry.com/)




Virtual Production Hardware

# Brompton LED Video Processors

[https://www.bromptontech.com/](https://www.bromptontech.com/)



# ROE Visual LED Display Panels

[https://www.roevisual.com/en/](https://www.roevisual.com/en/)



# AOTO LED Display Panels

[https://en.aoto.com](https://en.aoto.com/)

# 7th Sense Design Media Servers

[https://7thsense.one/](https://7thsense.one/)

Virtual Production MoCap, MoCo, and Camera Tracking Solutions

# Vicon MoCap

[https://www.vicon.com](https://www.vicon.com/)

# Xsens MoCap

[https://www.xsens.com/](https://www.xsens.com/)

# Faceware MoCap

[https://facewaretech.com](https://facewaretech.com/)

# Move.ai MoCap

[https://www.move.ai](https://www.move.ai/)

# Unreal Metahuman

[https://www.unrealengine.com/en-US/metahuman](https://www.unrealengine.com/en-US/metahuman)

# Ziva Dynamics

[https://zivadynamics.com](https://zivadynamics.com/)

# nCam Camera Tracking

[https://www.ncam-tech.com/](https://www.ncam-tech.com/)

# VIVE Mars Cam Tracking

[https://mars.vive.com/](https://mars.vive.com/)

# EZtrack Tracking Hub

[https://eztrack.studio/](https://eztrack.studio/)

# Gyroflow Flowshutter IMU Data Logger

[https://github.com/gyroflow/flowshutter](https://github.com/gyroflow/flowshutter)



# Mark Roberts Motion Control

[https://www.mrmoco.com/](https://www.mrmoco.com/)




Virtual Production Lens Metadata

A key aspect of virtual production is to have cine lenses that support the passing of lens metadata.

# Cooke Optics

Cooke Optics cinema lenses use the /i technology lens metadata protocol to store important lens information. The /i technology lens data is passed through a PL mount lens connector to the cinema camera body. 



This is a YAML based metadata encoding format that holds 4D time-based data for the lens parameters that is accurately synced to the current video frame. Also having the unique lens serial number record can be helpful in post-production as it provides artists with access to the original Cooke Optics factory lens calibration information which is useful when working with anamorphic lenses that have extensive lens breathing. 



Blackmagic Design URSA 12K camera bodies for example, are able to store the /i technology metadata in native BRAW format media.

Fulldome

Fulldome is the term often associated with video-based planetarium style hemispherical "dome" theaters. 



![[Pipeline Guide.img/Untitled_5.jpg]]



A fulldome theater typically plays 180° angular fisheye content that is stored in a media file called a "domemaster" image projection. It is also possible to use cubic or LatLong/Spherical/Equirectangular image projection footage in a dome theatre. 



Rectilinear image projection content can be warped and stretched to fill a fulldome screen as well.



Affordable portable domes can be inflated on-site, or built with module geodesic construction approaches. Portable domes often use a half-spherical mirror based projection approach that can be played back with a warp-mesh control file.

# Fulldome Playback Software

Common fulldome playback tools include the following products:

## Amateras Dome Player

[https://www.orihalcon.co.jp/amateras/domeplayer/en/](https://www.orihalcon.co.jp/amateras/domeplayer/en/)

## Blendy Dome VJ

[https://blendydomevj.com/](https://blendydomevj.com/)

## Paul Bourke Warp Mesh

[http://paulbourke.net/dataformats/meshwarp/](http://paulbourke.net/dataformats/meshwarp/)

## Whirligig

[http://www.whirligig.xyz/](http://www.whirligig.xyz/)

## Festoon Player

[https://www.festoonsoftware.com/](https://www.festoonsoftware.com/)

# Fulldome Real-time 2D/3D Rendering and Slicing Software

## Amateras

[https://www.orihalcon.co.jp/amateras/index_en.html](https://www.orihalcon.co.jp/amateras/index_en.html)

## Blendy Dome VJ

[https://blendydomevj.com/](https://blendydomevj.com/)

## NEST

[http://www.nestimmersion.ca](http://www.nestimmersion.ca/)

## VUO

[https://vuo.org/](https://vuo.org/)



For more information:

-   [http://www.paulbourke.net/dome/vuo/](http://www.paulbourke.net/dome/vuo/)

-   [http://www.paulbourke.net/dome/vuo/index1.html](http://www.paulbourke.net/dome/vuo/index1.html)


## Unreal Domemaster Camera

[https://www.unrealengine.com/marketplace/en-US/product/dx12-360-livestream-camera](https://www.unrealengine.com/marketplace/en-US/product/dx12-360-livestream-camera)

# Fulldome / Angular Fisheye Post Production Software

## Immersive Compositing

### Adobe AfterEffects | VR Effects

[https://helpx.adobe.com/after-effects/how-to/vr-converter-effect.html](https://helpx.adobe.com/after-effects/how-to/vr-converter-effect.html)

### Foundry NukeX | Spherical Transform

[https://learn.foundry.com/nuke/content/reference_guide/transform_nodes/sphericaltransform.html](https://learn.foundry.com/nuke/content/reference_guide/transform_nodes/sphericaltransform.html)

### Blackmagic Design Resolve Studio/Fusion Studio | KartaVR

[https://andrewhazelden.com/projects/kartavr/docs/](https://andrewhazelden.com/projects/kartavr/docs/)



### SkySkan DomeXF for After Effects

[https://skyskan.com/domexf/](https://skyskan.com/domexf/)



### E&S (Evans & Sutherland)  Virtual Projector for After Effects

## 3D Animation/Rendering/Previz

### Blender

[https://docs.blender.org/manual/es/2.79/game_engine/camera/dome.html](https://docs.blender.org/manual/es/2.79/game_engine/camera/dome.html)

### Domemaster3D for Maya/Max

[https://github.com/zicher3d-org/domemaster-stereo-shader](https://github.com/zicher3d-org/domemaster-stereo-shader)

### PlayblastVR for Maya

[https://www.awn.com/news/playblastvr-maya-v20-now-available](https://www.awn.com/news/playblastvr-maya-v20-now-available)

# Fulldome Hardware

Fulldome hardware vendors, system integrators, and content producers include:

## Front Pictures

[https://frontpictures.com/](https://frontpictures.com/)

## COSM

[https://www.cosm.com/experience-center/](https://www.cosm.com/experience-center/)

## E&S (Evans & Sutherland) DigiStar

[https://www.es.com/digistar/](https://www.es.com/digistar/)

## Spitz, Inc. (COSM)

[https://www.spitzinc.com/](https://www.spitzinc.com/)

## SkySkan DigiSky

[https://skyskan.com/digitalsky-darkmatter/](https://skyskan.com/digitalsky-darkmatter/)

## Konica Minolta | RSA Cosmos

[https://www.konicaminolta.com/planetarium/index.html](https://www.konicaminolta.com/planetarium/index.html)

[https://www.rsacosmos.com/](https://www.rsacosmos.com/)

## Orihalcon Japan

[https://www.orihalcon.co.jp/](https://www.orihalcon.co.jp/)

## Zeiss Planetariums

[https://www.zeiss.com/planetariums/int/home.html](https://www.zeiss.com/planetariums/int/home.html)

# Portable Fulldome Hardware

Portable fulldome hardware vendors, system integrators, and content producers include:

## Loch Ness Productions

[http://www.lochnessproductions.com/](http://www.lochnessproductions.com/)

## NSC Creative UK

[https://www.linkedin.com/company/nsc-creative/](https://www.linkedin.com/company/nsc-creative/)

## ePlanetarium

[https://www.eplanetarium.com/](https://www.eplanetarium.com/)

## Dome3D

[http://www.dome3d.com/](http://www.dome3d.com/)

## The Elumenati

[https://www.elumenati.com/](https://www.elumenati.com/)

Software Packaging and Deployment Tools

# Pkgs.org

This is an essential website to help search and decode the compatibility matrix of 3rd party packages for Linux distros.



[https://pkgs.org/](https://pkgs.org/)

# Alien Package Converter for Linux

The alien command-line utility for Linux makes it possible to extract RedHat style RPM packages and rebuild them so they can be used as .deb Debian Packages on Ubuntu-like Linux distros.

# Rez Package Manager

The Rez package manager is a unique virtual environment toolset designed to meet the precise needs of feature-film level visual effects and animation workflows.



[https://github.com/AcademySoftwareFoundation/rez](https://github.com/AcademySoftwareFoundation/rez)

# Pacifist on macOS

Pacifist is a .pkg file editor and asset extractor for macOS systems. If a .pkg file fails to extract correctly you can use the Pacifist tool to extract all of the assets from the installer bundle to allow for manual software installation procedures to be used.



[https://macappstore.org/pacifist/](https://macappstore.org/pacifist/)

# Nullsoft NSIS Scriptable Install System for Windows

[https://nsis.sourceforge.io/](https://nsis.sourceforge.io/)

[https://nsis.sourceforge.io/Main_Page](https://nsis.sourceforge.io/Main_Page)

# VMWare Install Builder Cross-Platform

This toolset was formerly known as BitRock Install Builder.



[https://store-us.vmware.com/vmware-installbuilder-enterprise-5372464400.html](https://store-us.vmware.com/vmware-installbuilder-enterprise-5372464400.html)

# QT Creator

QT framework based programs are often distributed using the QT installer toolkit.



[https://www.qt.io/product/development-tools](https://www.qt.io/product/development-tools)

# Snap Packages

Linux distros that support snap packages are able to streamline the process of running complex software that has the executable programs and all of the required library dependencies bundled into a single file.



[https://snapcraft.io/](https://snapcraft.io/)

# FlatPack Packages

Linux distros that support FlatPack packages are able to streamline the process of running complex software that has the executable programs and all of the required library dependencies bundled into a single file.



[https://www.flatpak.org/](https://www.flatpak.org/)

# Windows MSI Installer Utility

Windows installers are often provided in a .msi file format. 



The MSI installer utility provides the following command-line options that can be used to automate an install process:



Windows ® Installer. V 5.0.14393.0 



msiexec /Option  [Optional Parameter]



Install Options

</package | /i> 

Installs or configures a product

/a 

Administrative install - Installs a product on the network

/j<u|m>  [/t ] [/g ]

Advertises a product - m to all users, u to current user

</uninstall | /x> 

Uninstalls the product

Display Options

/quiet

Quiet mode, no user interaction

/passive

Unattended mode - progress bar only

/q[n|b|r|f]

Sets user interface level

n - No UI

b - Basic UI

r - Reduced UI

f - Full UI (default)

/help

Help information

Restart Options

/norestart

Do not restart after the installation is complete

/promptrestart

Prompts the user for restart if necessary

/forcerestart

Always restart the computer after installation

Logging Options

/l[i|w|e|a|r|u|c|m|o|p|v|x|+|!|*] 

i - Status messages

w - Nonfatal warnings

e - All error messages

a - Start up of actions

r - Action-specific records

u - User requests

c - Initial UI parameters

m - Out-of-memory or fatal exit information

o - Out-of-disk-space messages

p - Terminal properties

v - Verbose output

x - Extra debugging information

+ - Append to existing log file

! - Flush each line to the log

* - Log all information, except for v and x options

/log 

Equivalent of /l* 

Update Options

/update [;Update2.msp]

Applies update(s)

/uninstall [;Update2.msp] /package 

Remove update(s) for a product

Repair Options

/f[p|e|c|m|s|o|d|a|u|v] 

Repairs a product

p - only if file is missing

o - if file is missing or an older version is installed (default)

e - if file is missing or an equal or older version is installed

d - if file is missing or a different version is installed

c - if file is missing or checksum does not match the calculated value

a - forces all files to be reinstalled

u - all required user-specific registry entries (default)

m - all required computer-specific registry entries (default)

s - all existing shortcuts (default)

v - runs from source and recaches local package

Setting Public Properties

[PROPERTY=PropertyValue]



Consult the Windows ® Installer SDK for additional documentation on the

command line syntax.



Copyright © Microsoft Corporation. All rights reserved.

Portions of this software are based in part on the work of the Independent JPEG Group.

# macOS PKG Installer Utility

On macOS the .pkg installer utility provides the following command-line options that can be used to automate an install process:



installer

Usage: installer [-help] [-dominfo] [-volinfo] [-pkginfo] [-allowUntrusted] [-dumplog]

                 [-verbose | -verboseR] [-vers] [-config] [-plist]

                 [-file ] [-lang ] [-listiso]

                 [-showChoicesXML] [-applyChoiceChangesXML ]

                 [-showChoicesAfterApplyingChangesXML ]

                 -pkg 

                 -target <[DomainKey|MountPoint]>

The installer utility can list provide more verbose help options by adding the -help flag when you run it from the terminal:




installer -help

Usage: installer [options...] -pkg  -target 



Options:

[-dominfo]                 # Display domains that can be installed into.

[-volinfo]                 # Display volumes that can be installed onto.

[-pkginfo]                 # Display package that will be installed

                              (for metapackages, shows contents).

[-query]             # Display information about package metadata.

[-allowUntrusted]          # Allow installing a package signed by an

                              untrusted (or expired) certificate.

[-dumplog]                 # Write log information to standard error

                              (in addition to the usual syslog).

[-help]                    # Display this help information.

[-verbose]                 # Display detailed information.

[-verboseR]                # Display detailed information with

                              simplified progress output.

[-vers]                    # Display this tool version.

[-config]                  # Display command line parameters in XML

                              plist format.

[-plist]                   # Display -dominfo, -volinfo, or -pkginfo in

                              XML plist format (ignored when performing

                              installation).

[-file ]       # Configuration file supplying parameters in

                              XML plist format.

[-lang ]  # Sets the default language Mac OS X will use

                              after installation.

[-listiso]                 # Lists the ISO language codes that are

                              recognized.

[-showChoicesXML]          # Output XML data describing the choices and

                              their properties and state.

[-showChoicesAfterApplyingChangesXML ]

                          # Apply changes specified in the file to the

                              choices in the package and output the

                              resulting XML data.  See below for the

                              file format description.

[-applyChoiceChangesXML ]

                          # Apply changes specified in the file to the

                              package and proceeds with installation.

                              See below for the file format

                              description.



Device:

The -target  parameter is any one of the following:



(1) One of the domains returned by -dominfo.

(2) Volume mount point.  Any entry of the form of /Volumes/Mountpoint.

      ex: /Volumes/Untitled



Flags:

RestartAction # Can optionally return one of the following:

    None

    RecommendRestart

    RequireLogout

    RequireRestart

    RequireShutdown



Choices file-format:

An XML file that is an array of choiceIdentifiers (as strings) to

toggle. Each choiceIdentifier specified will be toggled in order --

exactly as if a user had clicked on its checkbox in Installer.app's

customization pane.



Examples:

installer -pkg InstallMe.pkg -target CurrentUserHomeDirectory

installer -pkg InstallMe.pkg -target '/Volumes/Macintosh HD2' -lang ja

installer -volinfo -pkg InstallMe.pkg

installer -pkginfo -pkg InstallMe.pkg

installer -query RestartAction -pkg InstallMe.pkg

installer -pkg InstallMe.pkg -target / -showChoicesXML



Installing a Local Content Staging Web Server

A local content staging server allows you to create new revisions to a website without breaking the existing live website. 



If you want to work with large media files and develop content that will eventually be played back from a web server it is very important to do extensive local testing with a copy of your website content and web server tools.



Spending a lot of time to upload and then re-download web site content over-and-over again during your ongoing development and testing phases is often time wasted. 

# Finding Your IP Address

If you don't know the current IP address for your computer you can check in your operating system's "Network" control panel for more details.



# Mac Network Preferences

![[Pipeline Guide.img/mac-network-control-panel.png]]



On macOS you need to click on the System Preferences icon in your Dock. Then open the Network control panel. On the left side of the Network control panel is a listing of each of the network adapters on your computer with entries for things like WiFi, and Ethernet devices.



Select the network adapter you are currently using to access the internet. This network connection will have a green circle icon next to it. With the network adapter selected, the main part of the control panel displays your local IP address next to the words "IP Address:".



You will also see information about this network adapter at the top of the network view next to the words Status: Connected [Device] is currently active and has the IP Address of [address].

# Windows 10 Network Control Panel



![[Pipeline Guide.img/windows-network-settings.png]]



On Windows you need to open the Control Panel > Network and Internet > Network Connections window. Right click on your active network connection. Then select the "Status" item in the popup menu.



A status window will open. Click on the Details... button to find out more information about this network device. Then a "Network Connection Details" window will appear. Your current local IP address is listed next to the IPv4 Address line.

# Linux Network Settings

The easiest way to find out your IP address visually on Linux is to load the Network settings window.



Open the triangle shaped menu at the top right of the screen and select the Settings icon. This will load the "All Settings" window that is used to configure the Linux system.



![[Pipeline Guide.img/linux-menu.png]]



Look in the "All Settings" window for the Hardware section. Then click on the Network icon on the far right side of the window.



![[Pipeline Guide.img/linux-all-settings.png]]



On the left side of the Network settings window is a listing of each of the network adapters on your computer with entries for things like WiFi, Bluetooth, and Wired Ethernet devices.



Select the network adapter you are currently using to access the internet.



This network connection will probably be called "Wired" on a Linux workstation. With the network adapter selected, the main part of the Network window displays your local IP address next to the words "IPv4 Address".



If you have multiple network adapters on your Linux system the active interface will have the word "Connected" displayed next to in the main part of the Network window to the left of the ON/OFF button.



![[Pipeline Guide.img/linux-network-settings.png]]

# Finding your External IP Address Using your Web Browser



A quick and easy way to find out your external ip address is to visit a website like [ipecho.net](https://ipecho.net/) or [whatsmyip.org](https://www.whatsmyip.org/).



This external IP address is only reachable if your computer is directly connected to the internet and your IP address is not hidden by NAT (Network Address Translation) from your computer existing behind a router or hardware firewall.



If you are behind a router that has NAT enabled then you may have to set up a port forward to route port 80 from your cable modem/router and map it to your computer's manually configured local IP address. This is something that your system administrator or ISP (internet service provider) can assist you with.

# Finding your External IP Address on Mac and Linux

Your current external internet facing IP address can be also found out on Mac and Linux systems using this terminal command:

curl ipecho.net/plain; echo



# ifconfig on Mac and Linux

On Mac and Linux systems your local IP address can be found using the ifconfig program from the terminal:

ifconfig



You have to scroll through the output to look for an "en" network entry like: 

net 192.168.0.100 netmask 0xffffff00 broadcast 192.168.0.255

# hostname on Linux

On CentOS 7 and Redhat 7 Linux systems your local IP address can often be found using the hostname program from the terminal:

hostname -i

# ipconfig on Windows

On Windows your local IP address can be found using the ipconfig program from the command prompt:

ipconfig



You have to scroll through the output to look for a network entry like: 

IPv4 Address. . . . . . . . . . . : 192.168.0.100

# get-wmiobject on Windows



On Windows you could also use the get-wmiobject program from the command prompt to look up the local IP address:



powershell -Command "& {get-wmiobject -class Win32_NetworkAdapterConfiguration -Filter IPEnabled=true | select ipaddress}"



This command will return the IP Address and network MAC address details in a long string of text like:



{192.168.0.100, fe80::e5cd:fce8:700d:1b4e, fdb2:2c26:f4e4:0:54d2:4949:9f22:c62b, fdb2:2c26:f4e4:0:e5cd:fce8:700d:1b4e}



The first 192.168.0.100 entry in this block of text is your computer's local network IP address.

# Google WebFonts

[https://www.fonts.com/web-fonts/google](https://www.fonts.com/web-fonts/google)

# Installing nodeJS, npm, electron, and shellJS

[https://nodejs.org/](https://nodejs.org/)

[https://www.electronjs.org/](https://www.electronjs.org/)

[https://www.npmjs.com/package/shelljs](https://www.npmjs.com/package/shelljs)

# Installing MAMP on macOS and Windows

If you are using macOS or Windows the easiest web sharing module to set up and install is MAMP. For local testing the MAMP program is likely all you need and you can skip running MAMP Pro.



No discussion of web sharing programs would be complete without a brief suggestion that you talk with your system administrator about network security and firewalls before enabling an Apache web sharing mode on your system. You may also want to research Apache .htaccess files to learn how to lock down the htdocs sharing folder to only allow access from users with a specific realm login account and password.



Step 1. Start by downloading and installing MAMP.

On Windows MAMP is installed on your hard disk at: 

C:\MAMP\MAMP.exe



On macOS MAMP is installed on your hard disk at: 

/Applications/MAMP/MAMP.app



Step 2. Launch MAMP for the first time. An easy to use GUI will appear.



![[Pipeline Guide.img/mamp-window.png]]



On the right side of the MAMP window is a button with a circular "power" icon that lets you Start and Stop the MAMP server. Click the Start Servers button if the MAMP server is not running yet.



On the left side of the MAMP window is a "Preferences" button that will open up the Apache server controls. Click the Preferences button.



Step 3. The Preferences window allows you to control the Apache server settings without having to manually edit any configuration files.



Enable the "Start Servers when starting MAMP" and "Stop Servers when quitting MAMP" checkboxes in the Start/Stop tab.



Turning on these two controls means you can easily use MAMP when you want to view locally served html content. Then when you have finished with that task you can quit the MAMP GUI, and MAMP will then immediately stop the Apache web sharing background system service.



![[Pipeline Guide.img/mamp-preferences.png]]



There are several other settings in the MAMP preferences window you could adjust if you wanted to.



Step 4. Click on the Ports tab in the MAMP preferences window. The Ports tab allows you to change the default server port settings for the Apache web sharing.



![[Pipeline Guide.img/mamp-preferences-ports.png]]



On Windows the Apache Port is set to 80 by default. This is the typical port used for all HTTP based web servers. The MAMP localhost address for your Windows system would be: http://localhost/



On macOS the Apache Port is set to 8888 by default to avoid conflicts with the macOS built-in web sharing modes. In your web browser a custom port is defined in the URL by typing a colon and then the port number like ":8888" after the website server address. 



The MAMP localhost address for your macOS system would be: [http://localhost:8888/](http://localhost:8888/)



Step 5. Click on the Web Server tab in the MAMP preferences window. 

This tab allows you to change the "Document Root" folder that is shared by the Apache server module. By default this "Document Root" directory path is set to the "htdocs" directory in the MAMP program folder.



![[Pipeline Guide.img/mamp-preferences-webserver.png]]

Unless you have a very specific technical reason to adjust the "Document Root" setting in MAMP it is a good idea to leave this text field at the default value in the MAMP preferences dialog.

# Setting up Apache httpd on Linux

If you are going to be using KartaVR automation scripts on Linux you will also need to install the clipboard tool xclip, along with the Apache (httpd) server modules for web sharing:



yum install xclip httpd



You can start Apache (httpd) using:



systemctl start httpd.service

systemctl enable httpd.service



On CentOS if you want to make the Apache HTTP port 80 accessible external to the machine you can open that port up on the firewall rules:



firewall-cmd --permanent --zone=public --add-service=http

firewall-cmd --reload



On Linux the Apache Port is set to 80 by default. This is the typical port used for all HTTP based web servers. If you need to use an alternative port address you could choose 8080.



The HTTPD (HTTP Daemon) web server's localhost address for your Linux system would be:

http://localhost/



The Apache "Document Root" path is the /var/www/html/ directory. This is where the KartaVR scripts will save the VR webpage preview exports.



Note: You will have to make the "/var/www/html/" folder writable for the users that are running the KartaVR VR preview script. You can either use chmod to change the folder permissions to do this, or you can use chown to add the user to a group with write permissions. The various Apache setup guides on the internet can provide details on this step.

# Installing Windows Subsystem for Linux

-   [Microsoft | What is WSL](https://learn.microsoft.com/en-us/windows/wsl/about)

-   [Microsoft | WSL Docs](https://learn.microsoft.com/en-us/windows/wsl/)


# WinMTR Network Traceroute Utility

[https://sourceforge.net/projects/winmtr/](https://sourceforge.net/projects/winmtr/)

# GitKraken Git GUI Client

This is an open-source cross-platform compatible git client GUI.



[https://www.gitkraken.com](https://www.gitkraken.com/)

# Tower Git GUI Client for macOS/Windows

[https://www.git-tower.com/mac](https://www.git-tower.com/mac)

# Installing Dialog

Dialog is a unix terminal based GUI system that functions over SSH connections and in terminal windows.



# Installing CyberDuck for Windows

[https://cyberduck.io/](https://cyberduck.io/)

# Installing Panic Transmit for macOS

[https://panic.com/transmit/](https://panic.com/transmit/)

# Installing Putty for Windows

[https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

# Installing SSHPass

SSHPass is a command-line utility that dramatically simplifies the process of allowing a shell script to make remote SSH based calls to render nodes. 



[https://www.redhat.com/sysadmin/ssh-automation-sshpass](https://www.redhat.com/sysadmin/ssh-automation-sshpass)



This toolset is something that should only be used inside of a trusted closed LAN network environment, where you are comfortable and have full awareness of the SSH security implications and network access policies. Do not use this tool if you are in a low-trust environment.



Install SSHPass on macOS:

curl -O -L http://downloads.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz && tar xvzf sshpass-1.05.tar.gz

cd sshpass-1.05

./configure

make

sudo make install



Install SSHPass on LINUX:

yum --enablerepo=epel -y install sshpass

## SSHPass Install Location

By default SSHPass is installed to one of the following installation locations.



macOS SSHPass Install Path:

/usr/local/bin/sshpass



CentOS Linux SSHPass Install Path:

/usr/local/bin/sshpass



Ubuntu Linux SSHPass Install Path:

usr/bin/sshpass

## Using SSHPass

Here is an SSHPass shell scripting example that uses ffmpeg to carry out a macOS video capture device based framegrab over an SSH network connection. 



This code snippet assumes an environment variable named "SSHPASS_DIR" exists that defines the sshpass installation location. It also uses the macOS based AVFoundation library to grab an image from a webcam named "Cisco VTCamera3".



echo "[Linux] Network Framegrab"

# Note on macOS the ssh -n -t -t flag helps with redirecting the output for tty password submission



"$SSHPASS_DIR" -p 'correcthorsebatterystaple' ssh -n -t -t vfx@10.20.30.1  'opt/ffmpeg/bin/ffmpeg -y -f avfoundation -framerate 5.000000 -video_size 1600x1200 -pixel_format uyvy422 -vsync 2 -i "Cisco VTCamera3" -f image2 -vcodec mjpeg -vframes 1 -qscale:v 2 /Volumes/Media/screenshot.jpg'

# Installing Zenity / Dialog

Zenity or Dialog are excellent choices for GUI toolkits if you need to create a quick and efficient user interface for a shell script that is run purely from a text-based terminal session or a remote SSH based session.



[https://gitlab.gnome.org/GNOME/zenity](https://gitlab.gnome.org/GNOME/zenity)



If you have used the "dialog" GUI toolkit in the past to create text-based interfaces, you will find zenity is very natural to pick up and use as well.



macOS Homebrew install:

brew install zenity

brew install dialog



Linux YUM Install:

yum install -y zenity

yum install -y dialog



Dialog Usage in a Terminal Window session:

# Display timer dialog window for 180 seconds

dialog --pause "Wake on LAN Timer" 10 30 180



![[Pipeline Guide.img/pause.png]]



A Dialog text-based GUI example that runs the PING command-line utility:

![[Pipeline Guide.img/pingtest-1.png]]![[Pipeline Guide.img/pingtest-2.png]]![[Pipeline Guide.img/pingtest-3.png]]



Save this script to a "Ping-Dialog.command" file:

#!/usr/bin/env bash



# Run ping in a dialog v1 2018-07-01 10.52 AM

# Andrew Hazelden <andrew@andrewhazelden.com>



# The default address to ping

PING_ADDRESS_DEFAULT_FILE="$TMPDIR/ping_address_default.txt"

PING_ADDRESS_FILE="$TMPDIR/ping_address.txt"

echo "www.cbc.ca" > $PING_ADDRESS_DEFAULT_FILE

# open "$TMPDIR/"

# bbedit $PING_ADDRESS_FILE



# Where the output from the ping program is saved

PING_RESULT_FILE="$TMPDIR/ping_result.txt"



# Show the ping dialog window

dialog --backtitle "BucketTime Ping Test" \

--title "Ping" \

--msgbox "Enter the IP/Domain name you would like to ping." 8 40 \

--editbox "$PING_ADDRESS_DEFAULT_FILE" 8 40 2> "$PING_ADDRESS_FILE"



# Save out the IP/Domain name to a textfile

PING_ADDRESS_URL_STRING=`cat "$PING_ADDRESS_FILE"`

# echo $PING_ADDRESS_URL_STRING



# Run the ping terminal program

ping -c 3 -i 0.5 $PING_ADDRESS_URL_STRING > "$PING_RESULT_FILE"

PING_RESULT=`cat "$PING_RESULT_FILE"`

#echo $PING_RESULT



# Show the result in a new dialog window

dialog --backtitle "BucketTime Ping Test" \

--title "Ping" \

--msgbox "$PING_RESULT" 12 65



# Done

clear

# WOL (Wake On Lan) Utilities

WOL (Wake On Lan) is a network management feature that is often built into 10/100/1000 Ethernet cards. It allows you to wake up computers on your local subnet that are in a low-power sleeping or "OFF" state. 



The WOL protocol works by sending a "magic packet" value to a specific computer's ethernet-based IP address/MAC address. The computer then exits from a dormant low-power state and either wakes up from sleep, or does a cold-boot.



If you are working with high-speed networking gear, often a 10GB+ Ethernet-based network device will have a separate management port for WOL usage that runs at a slower 10/1000 Ethernet speed.



The "wolcmd" executable is a handy free command-line tool that allows a command prompt or terminal session to perform WOL operations:



[Wolcmd for Windows](https://www.depicus.com/wake-on-lan/wake-on-lan-cmd)

[Wolcmd for macOS](https://www.depicus.com/wake-on-lan/wake-on-lan-for-apple-mac)



ZSH/Bash Syntax:



# An example of using WOL (wake on lan)

echo "[WOL] Waking up R01"

wolcmd 002590595b16 10.20.30.1 255.255.255.0 4343

# WinRAR Compression

[https://www.rarlab.com/download.htm](https://www.rarlab.com/download.htm)

# WinSCP File Transfer

[https://winscp.net/eng/index.php](https://winscp.net/eng/index.php)

# Rsync Network File Syncing and Transfer

[https://rsync.samba.org](https://rsync.samba.org/)

# Using Notepad++ for Fusion on Windows

There is a highly-customized Resolve/Fusion IDE usage centric version of Notepad++ available from Reactor. It is a 32-bit build of Notepad++ that has the TextFX module installed.



Please hold off doing an automatic-update the moment Notepad++ launches as there are not likely too many features missing from this release that you require. If you accidentally hit the auto-update button you will likely download, and roll-back to a 100% stock build of Notepad++ if you immediately hit the update button. Resist the urge….



[https://notepad-plus-plus.org/](https://notepad-plus-plus.org/)



Notepad++  for Fusion Customization Documentation:

-   [Notepad++ for Fusion Atom package](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39833#p39833)

-   [NPP Atom Package Docs](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.wesuckless.NotepadPlusPlus/Windows/Docs/com.wesuckless.NotepadPlusPlus.md)

-   [Web | Add “Open with Notepad++” to the Right-Click Menu](https://www.winhelponline.com/blog/open-with-notepad-plus-right-click-menu-windows/)

-   [Pixar USD Syntax Highlighter](https://github.com/AndrewHazelden/PIXAR-USD-Syntax-Highlighter)




Notepad++ Related Docs:

-   [Web | Microsoft | Creating Shell Extension Handlers](https://learn.microsoft.com/en-us/windows/win32/shell/handlers?source=recommendations)

-   [Web | Microsoft | Working with Shell Extensions](https://learn.microsoft.com/en-us/windows/win32/shell/shell-exts) 




## The Dark Mode Customized UI

![[Pipeline Guide.img/NPP Fusion UI.png]]



## The Language Menu![[Pipeline Guide.img/NPP Language Menu.png]]



## The Run Menu![[Pipeline Guide.img/NPP Run Menu.png]]

## Right-Click Contextual Menu Items:



### Edit Sub-Menu

![[Pipeline Guide.img/NPP Right Click Edit.png]]



### Search Sub-Menu

![[Pipeline Guide.img/NPP Right Click Search.png]]



### Tools Sub-Menu

![[Pipeline Guide.img/NPP Right Click Tools.png]]

# View Code Snippets

This user interface has pre-made code snippets of UI Manager Lua, UI Manager Python, and BBCode content.



![[Pipeline Guide.img/NPP View Code Snippets.png]]



## Notepad++ Shell Extensions for Windows

Shell; Extensions are a core-Windows feature that allows you to add an entry to the Windows Registry that will insert a new custom Explorer Right-Click contextual menu entry.



A stock "Add Open in Notepad++ Shell Ext Entry.reg" shell extension text-file looks like this before the executable file-path has been revised to a custom installation location:



Windows Registry Editor Version 5.00



[HKEY_CLASSES_ROOT\*\shell\Open with Notepad++]

"Icon"="C:\\Program Files (x86)\\Notepad++\\notepad++.exe"



[HKEY_CLASSES_ROOT\*\shell\Open with Notepad++\command]

@="\"C:\\Program Files (x86)\\Notepad++\\notepad++.exe\" \"%1\""



You can remove this shell extension using the following Windows Registry file named "Remove Notepad++ Shell Ext Entry.reg":



Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\*\shell\Open with Notepad++]

# Using BBEdit on macOS

BBEdit is a very capable programmer's text editor on macOS that is quick to load, easy to customize, and minimalistic in its usage of screen space.



[http://www.barebones.com/products/bbedit/index.html](http://www.barebones.com/products/bbedit/index.html)



For more information about BBedit usage:

-   [FuScript Integration for BBEdit](https://github.com/AndrewHazelden/Fusion-Studio-FuScript-IDE-Tools-and-Pipeline-Scripts)

-   [More TextWrangler and BBEdit Color Schemes](https://github.com/AndrewHazelden/More-TextWrangler-and-BBEdit-Color-Schemes)

-   [BBEdit Syntax Highlighter Page](https://www.barebones.com/support/bbedit/plugin_library.html)

-   [Arnold Syntax Highlighter](https://github.com/AndrewHazelden/Arnold-Syntax-Highlighter/tree/master/BBEdit_and_Textwrangler)

-   [Vray Scene Syntax Highlighter](https://github.com/AndrewHazelden/Vray-Scene-Syntax-Highlighter)

-   [Mental Ray Syntax Highlighter and Apple Scripts](https://github.com/AndrewHazelden/Mental_Ray_Syntax_Highlighter)

-   [Softimage SPDL Codeless Language Module](https://github.com/AndrewHazelden/Softimage-SPDL-Syntax-Highlighter/tree/master/BBEdit_and_Textwrangler)

-   [Fabric Engine KL Codeless Language Module](https://github.com/AndrewHazelden/Fabric_Engine_KL_Syntax_Highlighter/tree/master/BBEdit_and_Textwrangler)

-   [DigitalSky Codeless Language Module](https://github.com/AndrewHazelden/DigitalSky_Syntax_Highlighter/tree/master/BBEdit_and_TextWrangler)

-   [IRIXBASIC Codeless Language Module](https://github.com/AndrewHazelden/IRIXBASIC-Language-Module-for-TextWrangler-and-BBEdit)




## Preview CSS

It is possible to add your own Preview CSS document to the BBEdit preferences folder. This is used in the Markdown preview window to define the CSS tags for the HTML rendered content.



Here is an initial "$HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css" file to get your development efforts underway:



/* Stylesheet for MarkdownPad (http://markdownpad.com) */



/* RESET

=============================================================================*/



html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {

  margin: 0;

  padding: 0;

  border: 0;

}



/* BODY

=============================================================================*/



@font-face {

    font-family: 'Source Sans Pro';

    font-style: normal;

    font-weight: 300;

    src: url('fonts/SourceSansPro-Regular.ttf');

}



@font-face {

    font-family: 'Source Code Pro';

    font-style: normal;

    font-weight: 400;

    src: url('fonts/SourceCodePro-Regular.ttf');

}



@import url("fonts/font-awesome.min.css");



body {

  font-family: "Source Sans Pro", Helvetica, arial, sans-serif;

  font-size: 14px;

  line-height: 1.6;

  color: #333;

  background-color: #1C1C1C;

  padding: 20px;

  max-width: 960px;

  margin: 0 auto;

}



body>*:first-child {

  margin-top: 0 !important;

}



body>*:last-child {

  margin-bottom: 0 !important;

}



/* BLOCKS

=============================================================================*/



p, blockquote, ul, ol, dl, table, pre {

  margin: 15px 0;

  color: #AAAAAA;

  /* color: #7D8686; */

}



/* HEADERS

=============================================================================*/



h1, h2, h3, h4, h5, h6 {

  margin: 20px 0 10px;

  padding: 0;

  font-weight: bold;

  -webkit-font-smoothing: antialiased;

}



h1 tt, h1 code, h2 tt, h2 code, h3 tt, h3 code, h4 tt, h4 code, h5 tt, h5 code, h6 tt, h6 code {

  font-size: inherit;

}



h1 {

  font-size: 28px;

  font-weight: 600;

  color: #FFFFFF;

}



h2 {

  font-size: 24px;

  font-weight: 500;

  border-bottom: 2px solid #D0D0D0;

  color: #D0D0D0;

}



h3 {

  font-size: 18px;

  font-weight: 400;

  color: #D0D0D0;

}



h4 {

  font-size: 16px;

  color: #D0D0D0;

}



h5 {

  font-size: 14px;

  color: #D0D0D0;

}



h6 {

  font-size: 14px;

  color: #D0D0D0;

}



h7 {

  font-size: 14px;

  color: #D0D0D0;

  /* color: #277BA5; */

}



body>h2:first-child, body>h1:first-child, body>h1:first-child+h2, body>h3:first-child, body>h4:first-child, body>h5:first-child, body>h6:first-child {

  margin-top: 0;

  padding-top: 0;

}



a:first-child h1, a:first-child h2, a:first-child h3, a:first-child h4, a:first-child h5, a:first-child h6 {

  margin-top: 0;

  padding-top: 0;

}



h1+p, h2+p, h3+p, h4+p, h5+p, h6+p {

  margin-top: 10px;

}



/* LINKS

=============================================================================*/



a {

  color: #4183C4;

  text-decoration: none;

}



a:hover {

  text-decoration: underline;

}



/* LISTS

=============================================================================*/



ul, ol {

  padding-left: 30px;

  color: #C4C4C4;

}



ul li > :first-child, 

ol li > :first-child, 

ul li ul:first-of-type, 

ol li ol:first-of-type, 

ul li ol:first-of-type, 

ol li ul:first-of-type {

  margin-top: 0px;

}



ul ul, ul ol, ol ol, ol ul {

  margin-bottom: 0;

}



dl {

  padding: 0;

}



dl dt {

  font-size: 14px;

  font-weight: bold;

  font-style: italic;

  padding: 0;

  margin: 15px 0 5px;

}



dl dt:first-child {

  padding: 0;

}



dl dt>:first-child {

  margin-top: 0px;

}



dl dt>:last-child {

  margin-bottom: 0px;

}



dl dd {

  margin: 0 0 15px;

  padding: 0 15px;

}



dl dd>:first-child {

  margin-top: 0px;

}



dl dd>:last-child {

  margin-bottom: 0px;

}



/* CODE

=============================================================================*/



pre, code, tt {

  font-size: 12px;

  font-family: "Source Code Pro", monospace;

}



code, tt {

  margin: 0 0px;

  padding: 0px 0px;

  white-space: nowrap;

  border: 1px solid #262626;

  background-color: #363636;

  color: #D0D0D0;

  border-radius: 3px;

}



pre>code {

  margin: 0;

  padding: 0;

  white-space: pre;

  border: none;

  background: transparent;

}



pre {

  background-color: #363636;

  border: 1px solid #262626;

  font-size: 13px;

  line-height: 19px;

  overflow: auto;

  padding: 6px 10px;

  border-radius: 3px;

}



pre code, pre tt {

  background-color: transparent;

  border: none;

}



kbd {

    -moz-border-bottom-colors: none;

    -moz-border-left-colors: none;

    -moz-border-right-colors: none;

    -moz-border-top-colors: none;

    background-color: #DDDDDD;

    background-image: linear-gradient(#F1F1F1, #DDDDDD);

    background-repeat: repeat-x;

    border-color: #DDDDDD #CCCCCC #CCCCCC #DDDDDD;

    border-image: none;

    border-radius: 2px 2px 2px 2px;

    border-style: solid;

    border-width: 1px;

    font-family: "Source Sans Pro", Helvetica, arial, sans-serif;

    line-height: 10px;

    padding: 1px 4px;

}



/* QUOTES

=============================================================================*/



blockquote {

  border-left: 4px solid #DDD;

  padding: 0 15px;

  color: #777;

}



blockquote>:first-child {

  margin-top: 0px;

}



blockquote>:last-child {

  margin-bottom: 0px;

}



/* HORIZONTAL RULES

=============================================================================*/



hr {

  clear: both;

  margin: 15px 0;

  height: 0px;

  overflow: hidden;

  border: none;

  background: transparent;

  border-bottom: 4px solid #ddd;

  padding: 0;

}



/* TABLES

=============================================================================*/



table th {

  font-weight: bold;

}



table th, table td {

  /* border: 1px solid #ccc; */ 

  /* padding: 6px 13px; */ 

}



table tr {

  /* border-top: 1px solid #ccc; */

  /* background-color: #363636; */

  /* color: #D0D0D0; */

}




/* IMAGES

=============================================================================*/



img {

  max-width: 80%;

  /* max-width: 100%; */

  display: block;

  margin-left: auto;

  margin-right: auto;

}




## BBEdit Script Menu

BBEdit supports the use of custom shell scripts and Apple Scripts via the Script menu. You can bind hotkeys to any of the entries that are added to this menu.



![[Pipeline Guide.img/BBEdit Apple Scripts.png]]



If you select the "Scripts > Open Scripts Folder" menu item you can quickly access the $HOME/Library/Application Support/BBEdit/Scripts/

## BBEdit Script Code Examples

Here are several pre-made BBEdit scripts to get you starred:

### Zoom In Text

An Apple Script named "Zoom In Text.scpt" can be linked to the BBEdit hotkey for "Command + =". The script content is:

-- From: http://bbedit-hints.tumblr.com/

tell application "BBEdit"

tell window 1

set display magnification to display magnification * 1.25

end tell

end tell



### Zoom Out Text

An Apple Script named "Zoom Out Text.scpt" can be linked to the BBEdit hotkey for "Command + -". The script content is:

-- From: http://bbedit-hints.tumblr.com/

tell application "BBEdit"

tell window 1

set display magnification to display magnification / 1.25

end tell

end tell



### Zoom Text 100%

An Apple Script named "Zoom Text 100%.scpt" can be linked to a BBEdit hotkey. The script content is:

-- From: http://bbedit-hints.tumblr.com/

tell application "BBEdit"

set display magnification of window 1 to 1.0 -- displays text at 2x

end tell



### Open the Activity Monitor

An Apple Script named "Open Tool Activity Monitor.scpt" can be used to launch the macOS Activity Monitor program. The script content is:

-- Open Tool Activity Monitor

-- Open up the macOS Activity Monitor program to inspect the running program and the CPU load.



tell application "Activity Monitor"

activate

end tell



### Open the Terminal Window

An Apple Script named "Open Tool Terminal.scpt" can be used to launch the macOS Terminal program. The script content is:

-- Open Tool Terminal

-- Open up the macOS Terminal program.



tell application "Terminal"

activate

end tell



### Open the Console Window

An Apple Script named "Open Tool Console.scpt" can be used to launch the macOS Console program. The script content is:

-- Open Tool Console

-- Open up the macOS Console program to inspect error logs.



tell application "Console"

activate

end tell



### Open the Temp Directory Folder

An Apple Script named "Open Folder $TMPDIR.scpt" can be used to display a Finder based view to the $TEMPDIR environment variable defined filepath location.The script content is:

-- Open Folder $TMPDIR

-- Open up the macOS /private/var/folders/ based temporary folder.



-- Open the shaders folder:

set command to "open \"/${TMPDIR}\""



-- display alert command

set result to do shell script command

-- display alert result



### Open the ZSH .zprofile document

An Apple Script named "Open .zprofile.scpt" can be used to display the current $HOME/.zprofile document in a BBEdit text editing window.The script content is:

-- Open .zprofile

-- Open up the  ~/.zprofile which is used to configure environment variables in zsh



-- Choose where the .zprofile file is stored on disk

set envFileAlias to (path to current user folder as text) & ".zprofile"



-- Touch the file path to make it exist if it wasn't found on disk

set command to "touch " & the quoted form of POSIX path of envFileAlias



-- display alert command

set result to do shell script command

-- display alert result




-- Display the console standard output result

tell application "BBEdit"

try

open {file envFileAlias} with LF translation

on error

set errorMessage to "[BASH] The .zprofile file: " & the the quoted form of POSIX path of envFileAlias & " is was not found. Please edit this Apple Script to customize your current paths."

display dialog the errorMessage buttons {"OK"} default button 1 with icon 1 giving up after 10

end try

end tell



### Open the ZSH .zshenv document

An Apple Script named "Open .zshenv.scpt" can be used to display the current $HOME/.zshenv document in a BBEdit text editing window.The script content is:

-- Open .zshenv

-- Open up the  ~/.zshenv which is used to configure environment variables in zsh



-- Choose where the .zshenv file is stored on disk

set envFileAlias to (path to current user folder as text) & ".zshenv"



-- Touch the file path to make it exist if it wasn't found on disk

set command to "touch " & the quoted form of POSIX path of envFileAlias



-- display alert command

set result to do shell script command

-- display alert result



-- Display the console standard output result

tell application "BBEdit"

try

open {file envFileAlias} with LF translation

on error

set errorMessage to "[BASH] The .zshenv file: " & the the quoted form of POSIX path of envFileAlias & " is was not found. Please edit this Apple Script to customize your current paths."

display dialog the errorMessage buttons {"OK"} default button 1 with icon 1 giving up after 10

end try

end tell

### Get the EXIFTool Help Text

An Apple Script named "EXIFTool Help.script" can be used to export the command-line help info for EXIFTool into a BBEdit text editing document. The script content is:

-- EXIFTool Help



-- Choose where the program is installed

set programPath to quoted form of POSIX path of "/Users/vfx/Reactor/Deploy/Bin/exiftool/exiftool"



-- Define the command line arguments

set programOptions to " -h | /usr/local/bin/bbedit -t \"EXIFTool Help.txt\""

set command to programPath & programOptions

set output to do shell script command



### Get the FFMpeg Help Text

An Apple Script named "FFMpeg Help.script" can be used to export the command-line help info for FFMpeg into a BBEdit text editing document. The script content is:

-- FFmpeg Help



-- Choose where the program is installed

set programPath to quoted form of POSIX path of "/Users/vfx/Reactor/Deploy/Bin/ffmpeg/bin/ffmpeg"




-- Define the command line arguments

set programOptions to " -h | /usr/local/bin/bbedit -t \"FFmpeg Help.txt\""

set command to programPath & programOptions

set output to do shell script command

### Get the Imagemagick Convert Help Text

An Apple Script named "Imagemagick Convert Help.script" can be used to export the command-line help info for the convert utility into a BBEdit text editing document. The script content is:

-- Imagemagick Convert Help



-- Choose where the program is installed

-- set convertPath to quoted form of POSIX path of "/usr/local/bin/convert"

set convertPath to quoted form of POSIX path of "/opt/ImageMagick/bin/convert"



-- Define the command line arguments

set convertOptions to " | /usr/local/bin/bbedit -t \"Imagemagick Convert Help.txt\""

set command to convertPath & convertOptions

set output to do shell script command



### Get the Imagemagick Supported File Formats Text

An Apple Script named "Imagemagick Supported File Formats.script" can be used to export the command-line help info for the convert utility into a BBEdit text editing document. The script content is:

-- Imagemagick Convert Supported File Formats



-- Choose where the program is installed

-- set convertPath to quoted form of POSIX path of "/usr/local/bin/convert"

set convertPath to quoted form of POSIX path of "/opt/ImageMagick/bin/convert"



-- Define the command line arguments

set convertOptions to " -version  | /usr/local/bin/bbedit -t \"Imagemagick Convert Formats.txt\""

set command to convertPath & convertOptions

set output to do shell script command

### Get the V-Ray Server Help Text

An Apple Script named "V-Ray Help.script" can be used to export the command-line help info for V-Ray CLI program into a BBEdit text editing document. The script content is:

-- Vray Standalone Help



-- Choose where the Vray Standalone program is installed

set vrayPath to quoted form of POSIX path of "/Applications/ChaosGroup/V-Ray/Maya2023/vray/bin/vrayserver"



-- Define the Vray Standalone command line arguments

set vrayOptions to " -help"



-- set command to vrayPath & vrayOptions

set command to vrayPath & vrayOptions

set output to do shell script command



-- Target a Worksheet

--tell application "BBEdit"

-- set uws to Unix worksheet window

-- tell uws

-- select insertion point after last character

-- set selection to command & "\n" & output

-- end tell

--end tell



-- Target an new document

tell application "BBEdit"

activate

make new text document

-- make new text document at project window 1

--select insertion point after last character

set selection to command & "

" & output

end tell

### Launch a Lua Love Script from BBedit

A BASH/ZSH shell script named "Lua-Love-Launcher.sh" can be used to run a Lua Love "main.lua" script automatically. The terminal output from Lua Love is sent to a new BBEdit text editing document. The script content is:

#! /bin/sh

# Lua-Love-Launcher.sh

# by Andrew Hazelden

# ---------------------------------------------------------------

# Installation Prep:

# Copy the script file to the "$HOME/Library/Application Support/BBEdit/Scripts/" folder

# chmod -R 777 "$HOME/Library/Application Support/BBEdit/Scripts/Lua-Love-Launcher.sh"



# Run the Love package

{

  LOVE_PATH="/Applications/love.app/Contents/MacOS/love"



  # Base folder for the active document

  BB_DOC_FOLDER="$(dirname ${BB_DOC_PATH})"



  # echo Opening Love Folder: $BB_DOC_FOLDER

  # Launch love with the parent folder for the active main.lua file

  # "$LOVE_PATH" "$BB_DOC_FOLDER"

  "$LOVE_PATH" "$BB_DOC_FOLDER" | BBEdit & 

}

### Generate a Markdown File to HTML Export

A BASH/ZSH shell script named "Markdown Generator.sh" can be used to run the cmark command-line tool automatically. Custom HTML based header and footer content, along with a CSS file are appended to the final HTML file output. The script content is:

#! /bin/sh

# Markdown Docs to HTML Converter

# by Andrew Hazelden



# Generate HTML docs from Markdown files

{

  # ---------------------------------------------------------------

  # Markdown document to convert (without the .md file extension)

  MARKDOWN_DOCUMENT="${BB_DOC_PATH}"

  # Define the output filename

  # HTML_OUTPUT="${MARKDOWN_DOCUMENT}.html"

  HTML_OUTPUT=`echo "${MARKDOWN_DOCUMENT}" | sed "s/\..*$//"`".html"

  # ---------------------------------------------------------------

  # Load the page elements

  MARKDOWN_CSS="$HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css"

  MARKDOWN_HTML_HEADER="$HOME/Markdown/markdown_header.html"

  MARKDOWN_HTML_BODY="$HOME/Markdown/markdown_body.html"

  MARKDOWN_HTML_FOOTER="$HOME/Markdown/Markdown_footer.html"

  # ---------------------------------------------------------------

  # Merge the HTML document

  # Add the base HTML header to the new file

  cat "${MARKDOWN_HTML_HEADER}" > "${HTML_OUTPUT}"

  # Append the CSS

  cat "${MARKDOWN_CSS}" >> "${HTML_OUTPUT}"

  # Add the HTML body tag to the new file

  cat "${MARKDOWN_HTML_BODY}" >> "${HTML_OUTPUT}"

  # Append the Markdown converted text using the cmark command-line tool

  /usr/local/bin/cmark "${MARKDOWN_DOCUMENT}" --to html >> "${HTML_OUTPUT}"

  # Append the HTML footer

  cat "${MARKDOWN_HTML_FOOTER}" >> "${HTML_OUTPUT}"

  # ---------------------------------------------------------------

  # bbedit --language HTML "${HTML_OUTPUT}"

  open "${HTML_OUTPUT}"

}



The cmark "CommonMark" CLI utility can be installed using homebrew:

brew install commonmark



The cmark CLI executable is located on-disk at:

/usr/local/bin/cmark



The cmark man-page can be displayed using:

man cmark



The cmark command-line help output can be displayed using:

cmark --help

Usage:   cmark [FILE*]

Options:

  --to, -t FORMAT  Specify output format (html, xml, man, commonmark, latex)

  --width WIDTH    Specify wrap width (default 0 = nowrap)

  --sourcepos      Include source position attribute

  --hardbreaks     Treat newlines as hard line breaks

  --nobreaks       Render soft line breaks as spaces

  --safe           Suppress raw HTML and dangerous URLs

  --smart          Use smart punctuation

  --normalize      Consolidate adjacent text nodes

  --help, -h       Print usage information

  --version        Print version



DefaultCSS_Markdown.css File Location:

$HOME/Library/Application Support/BBEdit/Preview CSS/DefaultCSS_Markdown.css



markdown_header.html File Contents:

<!DOCTYPE html>

<html>

<head>

<title>Documentation</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">



markdown_body.html File Contents:

</style>

</head>

<body>



markdown_footer.html File Contents:

</body>

</html>

## BBEdit Script Environment Variables

A BBEdit shell script is able to access several handy environment variables. This feature lets your external script know things about the current document that is open "${BB_DOC_PATH}", and what line is selected in the file "${BB_DOC_SELSTART_LINE}".



Here is list of the most common environment variables you can use with BBEdit launched shell scripts:



${BB_DOC_LANGUAGE}        Name of the document's current language (not set if language is "none") BB_DOC_MODE            Emacs mode of the document's current language 

${BB_DOC_NAME}            name of the document 

${BB_DOC_PATH}            path of the document (not set if doc is unsaved) 

${BB_DOC_SELEND}          (zero-based) end of the selection range (not set if not text document) 

${BB_DOC_SELEND_COLUMN}   (one-based) de-tabbed column number of BB_DOC_SELEND 

${BB_DOC_SELEND_LINE}     (one-based) line number of BB_DOC_SELEND 

${BB_DOC_SELSTART}        (zero-based) start of the selection range (not set if not text document) 

${BB_DOC_SELSTART_COLUMN} (one-based) de-tabbed column number of BB_DOC_SELSTART 

${BB_DOC_SELSTART_LINE}   (one-based) line number of BB_DOC_SELSTART

## BBEdit Hotkey Bindings

The BBEdit preferences allow you to bind custom hotkeys to any menu item in the program. Click on the "Menus and Shortcut" entry. This section makes it possible for your custom scripts to feel like a native feature that is integrated in BBEdit.



![[Pipeline Guide.img/BBEdit Hotkey Preferences.png]]



Automation Tools

# Keyboard Maestro on macOS

Keyboard Maestro is a GUI automation tool that allows you to script and control macOS based programs through the use of scripting direct user interface based interactions like mouse cursor moves, mouse clicks, keyboard key presses, menu selections, button pressing, text field typing, and Apple Script code execution.



From a practical perspective, for any process that a human user can do on a macOS system, Keyboard Maestro can be used to automate the same task in a visual fashion.



[https://www.keyboardmaestro.com/main/](https://www.keyboardmaestro.com/main/)



For more information:

-   [Keyboard Maestro Wiki](https://wiki.keyboardmaestro.com/User_Manual)

-   [Keyboard Maestro Forum](https://forum.keyboardmaestro.com/)

-   [KartaLink kvrKeyboardMaestro Fuse](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.KartaLink.KeyboardMaestro/Docs/Kartaverse/KartaLink/com.AndrewHazelden.KartaLink.KeyboardMaestro.md)




Keyboard Maestro offers a free trial version on their website you can use to evaluate the toolset.



![[Pipeline Guide.img/Maestro website.jpg]]



## KartaLink | Keyboard Maestro Node



KartaLink is an effort to provide node-based pipeline automation features to help XR artists tame complex multi-application based post-production workflows.

The new Keyboard Maestro fuses make it possible to run macOS based Keyboard Maestro macros from inside Fusion's node graph. This unlocks node-based GUI automation techniques such as controlling external applications via simulating keyboard and mouse actions.

This fuse requires the installation of "Keyboard Maestro" for macOS:

[https://www.keyboardmaestro.com/main/](https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.keyboardmaestro.com%2Fmain%2F%3Ffbclid%3DIwAR058T1P5zQgtf-IPt8H6wYS_uJYArpw7jBhNEMcBHrapXjncPzwmoNePtw&h=AT1z4qgY_0P7KEbhMe4kZ1oDtPX80tdFUKpAkaeoZwci8lUbGK6qYWZ1G6qFt98PYXwaWjr2zNpJrQ2ILFIiDGKG_CI7KL7Nx0S_NVpKSjh0FCoH6E16KWRNkNXcHn6iRQ0C4j8&__tn__=-UK-R&c[0]=AT1-kEEfRR8kNTHkGkNZA-_fRNLrx_SEXkpqq1T-0ItAmQyiodNa2gIRDD9JSGZZ4q7KUIXpLnKd22aBmr8TS_MxHF6xBdYXn4K9fCATPdLsjaGMBMnHl8xmwihfm5-Q76-pvYpIGOfw7hatxY1GKO2bHsMRz8aP-RMcN7e7Mghh7n0LU0fLr1F6rrVClxiydn6VIa-9vZJ_dYsSG3Z_hO4)



The Reactor Package Manager is used to install the KartaLink collection of tools.



![[Pipeline Guide.img/Keyboard Maestro Reactor.jpg]]



There are two versions of the Keyboard Maestro macros: A version that can be connected to image based input/output connections, and a version that works with text based input/output connections such as the Vonk Ultra "vText" nodes.



![[Pipeline Guide.img/maestro tools menu.jpg]]



The"kvrKeyboardMaestro" fuses have an "Open Keyboard Maestro" button that is found in the Inspector window. This feature makes revising the automation macros a single-click task.



![[Pipeline Guide.img/maestro inspector controls.jpg]]



The Keyboard Maestro Editor is very flexible in how you build your automation macros. You can either run a recorder to track your visual on-screen actions, or you can incrementally build the actions one at a time by hand for more precision and control.



![[Pipeline Guide.img/maestro editor.jpg]]

![[Pipeline Guide.img/maestro editor 2.jpg]]

### Usage:

1. Create a new comp.

2. Add a "kvrKeyboardMaestro" image or text based fuse to the comp.

3. In the Inspector window, enter the name of the Keyboard Maestro macro you want launched into the text field labelled "Macro Name".

4. The first time the macro is run, you need to approve a macOS security message that says:

"Fusion.app" wants access to control "Keyboard Maestro.app". Allowing control will provide access to documents and data in "Keyboard Maestro.app" and to perform actions within that app.

You need to click the "OK" button to continue.

5. In Keyboard Maestro's Editor program create a corresponding macro that will perform the actual GUI automation tasks. Click the "New Action" button in the Editor window to add each step you'd like the macro to carry out. You could also use the "Record" button to save a series of mouse interactions or keyboard button presses.

6. When your macro is complete, switch out of the "Edit" state and then try out the macro.

### Tips:

If you only want Keyboard Maestro launched when a Fusion batch render is occurring, uncheck the "Interactive Render" checkbox.

# Using AppleScript OSAX Scripting from the Terminal

AppleScript is the native macOS scripting architecture that allows for inter-application control via the Apple Scripting Dictionary and Apple Events. AppleScripts are typically created in the macOS Script Editor program. You can also run inline AppleScript code as a block of text from a command-prompt session using the OSAX scripting utility.



For more information:

-   [Apple Mac Automation Scripting Guide](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/HowMacScriptingWorks.html)

-   [KartaLink kvrAppleScript Fuse Docs](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.KartaLink.AppleScript/Docs/Kartaverse/KartaLink/com.AndrewHazelden.KartaLink.AppleScript.md)


## KartaLink | Apple Script Node

Kartaverse's KartaLink tool collection includes a package named "KartaLink | Apple Script". This is available in the Reactor Package Manager for Resolve/Fusion.



![[Pipeline Guide.img/kartalink reactor.jpg]]



Run macOS based Apple Script code snippets from inside a Fusion Studio node-graph. This unlocks node-based automation techniques such as controlling external applications via Apple Events and OSAX (Open Scripting Architecture Extension) scripting.

In only a few moments you can start exploring Apple Script automation techniques inside of Resolve/Fusion. The simplest command to begin with if this is 100% new territory for you is "beep" which plays a chime sound as each frame is rendered. The double dashes on the first line of code is used to add a comment entry that is ignored when the code is run.



![[Pipeline Guide.img/kvrScript Node.jpg]]

Apple Script allows you to automate tasks that can include sending SMS messages via the Apple Messages app.

![[Pipeline Guide.img/Apple Script in Fusion.jpg]]

It's now possible to have progress messages or other info passed from Resolve/Fusion to your cell phone via SMS when you need to find out what's happening on a rendering task.



![[Pipeline Guide.img/SMS Message Sent.jpg]]

The Apple Script Editor dictionary allows you to learn more about the 3rd party scripting capabilities you can tap into on your mac.

![[Pipeline Guide.img/Open Apple Script Editor.jpg]]

## Apple Script Editor

If you want to learn more about Apple scriptable programs, open the Apple Script Editor and then select the "File > Open Dictionary..." menu item. 



![[Pipeline Guide.img/Script Editor Menu.png]]



The "Open Dictionary" window allows you to select Apple Scriptable programs and learn more about their capability.



![[Pipeline Guide.img/Script Editor Dictionary.png]]

This is the Apple Script Dictionary output from the Panic Transmit file transfer program.



![[Pipeline Guide.img/Apple Script Dictionary.jpg]]

You could also use the "Record" button to save a series of interactions into the Apple Script Editor window. 

After you record a task in the Script Editor window, you can then copy/paste this code back into the "kvrAppleScript" fuse's interface in the Resolve/Fusion Inspector view.



![[Pipeline Guide.img/Script Editor Record.png]]

# Auto-IT on Windows

AutoIT is a GUI automation program for Windows. It is the Windows equivalent to Keyboard Maestro.



[https://www.autoitscript.com/site/autoit/](https://www.autoitscript.com/site/autoit/)

# Microsoft Power Automate for Windows

[https://powerautomate.microsoft.com/en-us/](https://powerautomate.microsoft.com/en-us/)



[https://learn.microsoft.com/en-us/power-automate/](https://learn.microsoft.com/en-us/power-automate/)

# PyAutoGui

[https://pypi.org/project/PyAutoGUI/](https://pypi.org/project/PyAutoGUI/)

# Homebrew Package Manager for macOS

If you need to regularly compile and run common open-source software on your macOS system, the odds are good that a brew package already exists for the tool.



[https://brew.sh](https://brew.sh/)



Homebrew can be installed on a fresh macOS system by running the following shell script in the terminal:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# LuaJIT

LuaJIT is a cross-platform scripting environment that runs Lua scripts from a terminal session. As far as interpreted scripting languages go, Lua is fast, efficient, and simple to use.



[https://luajit.org/luajit.html](https://luajit.org/luajit.html)



For more information:

-   [LuaJIT FFI Library](https://luajit.org/ext_ffi.html)

-   [LuaJIT FFI Tutorial](https://luajit.org/ext_ffi_tutorial.html)

-   [LuaJIT FFI API Functions](https://luajit.org/ext_ffi_api.html)


## LuaJIT in Resolve/Fusion

Blackmagic Design's Resolve Studio, and Fusion Studio software, both include a scripting API known as "FuScript". This scripting system has a built-in copy of the LuaJIT interpreter which allows users to run .lua script files. You can also use your own install of Python with the FuScript API.



LuaJIT has advanced features like "[FFI library](https://luajit.org/ext_ffi.html)" access which allows .lua scripts and fuses to access ANSI C API functions provided by external shared libraries like .dll (Windows), .dylib (macOS), and .so (Linux and macOS).

# Lua Rocks Package Manager

Lua Rocks provides a web-based cross-platform compatible package manager that runs from a Terminal session. This approach is the most common way to be able to find and use compiled Lua modules.

[https://luarocks.org/](https://luarocks.org/)



Lua Rock compiled Lua Modules can be used with the LuaJIT FFI interface from Resolve Studio and Fusion Studio.



You may have to customize your macOS Terminal shell session's "LUA_PATH" and "LUA_CPATH" environment variables if you want Fusion to be able to use the Lua Rocks compiled libraries. 



Doing this step means you don't have to copy your Lua Rocks compiled .dll/.so files and .lua files into the Fusion managed LuaModules: PathMap folder.

# Lua Love Real-Time 2D Engine

Lua Love is an lean and efficient open-source real-time 2D engine that uses Lua scripts to create 2D games and immediate mode GUI based graphical tools and utilities.



[https://love2d.org/](https://love2d.org/)



For more information:

-   [Love Wiki](https://love2d.org/wiki/Main_Page)

-   [LÖVE-Nuklear Immediate Mode GUI](https://github.com/keharriso/love-nuklear)




Computer Vision and Machine Learning Tools



# Python Virtual Environment Basics

[Python venv Docs](https://docs.python.org/3/library/venv.html)

# PyTorch

[https://pytorch.org/](https://pytorch.org/)

# Accessing the Dall-E API

The OpenAI Dall-E machine learning based image generation toolset is now available to the public using a web-based API. This makes it possible to quickly create concept images from a simple text-based prompt input syntax.



Dall-E Resources

-   [Dall-E Website](https://openai.com/blog/dall-e-api-now-available-in-public-beta/)

-   [WSL - Dalle-E API Now Available in Public](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42833#p42833) (Fusion Community Forum Thread)

-   [LinkedIn | Using OpenAI DALL·E With the Vonk Data Nodes in Fusion](https://www.linkedin.com/pulse/using-openai-dalle-vonk-data-nodes-fusion-andrew-hazelden/)




A DALL-E demo of the "[Girl with a Pearl Earring](https://openai.com/blog/dall-e-introducing-outpainting/)" painting shows the power of out-painting to extend the canvas larger on an image. In visual effects workflows, this approach would be a big help for digital matte painters who need to extend the border of a frame to provide padding for 2.5D centric pan and tile workflows.

## Using OpenAI DALL·E With the Vonk Data Nodes in Fusion

![[Pipeline Guide.img/Dall-E_Grid.0001.png]]

### Step 1. Account Registry

Start by registering for an [OpenAI account](https://openai.com/api/) to get an API Key. This allows you to access Dall-E as a web service. You get $18 in credits with a new OpenAI account registry.

### Step 2. API Key

Click at the top right corner of the OpenAI webpage on your account name. Then select the menu entry labelled "View API Keys". On the API keys page select the "Create new secret key" option. This will generate a new API key.



![[Pipeline Guide.img/1_API_keys.png]]



After you see the "API key generated" dialog, you will have to save a copy of this code somewhere for later use. This is important as the information is only displayed once in this dialog.



![[Pipeline Guide.img/2_Generated_Key.png]]



On the API Keys view you will see a reduced detail summary of each API key that is active for your account. You can delete old keys by clicking on the trash can icon.




![[Pipeline Guide.img/3_Keys_List.png]]

### Step 3. Environment Variable

Create a new environment variable to hold the API key. Our environment variable will be named "OPENAI_API_KEY" and the variable will hold the contents of the API Key you created in step 2.



![[Pipeline Guide.img/4_Env_Var.png]]



### Step 4. Install Vonk

Install the "Vonk Ultra" atom package for Resolve/Fusion using the WSL Reactor Package Manager. Re-launch Resolve/Fusion once after installing Vonk to activate the new fuses.

### Step 5. Explore the "Vonk Dall-E" Example Comp

Open the provided "Demo Vonk Dall-E.comp" example project in Fusion Studio.



![[Pipeline Guide.img/8_demo_comp.png]]



This example comp uses the sample image generation prompt text of "Blackmagic Design Control Panel, Fusion Reactor, Cooling Tank, Blue Glow Water".



Note: Performance optimizations for this example comp can be implemented in the future that will reduce unneeded Fusion pre-process requests. These are what cause re-downloads of the cURL JSON file to occur on the same frame. As usual, down the road all of this can be wrapped into a single neat-and-tidy fuse node that does all of the processing steps internally. :)

## Common JSON Errors

If an error occurs while generating the image, the technical information about the issue will be written into the JSON file. This allows you to troubleshoot problems and track down the source of the problem.



If you have a valid OpenAI API Key the most common JSON error for a free usage account will be:



{

  "error": {

    "code": null,

    "message": "Rate limit reached for images per minute. Limit: 25/5min. Current: 27/5min. Please visit https://help.openai.com/en/articles/6696591 to learn how to increase your rate limit.",

    "param": null,

    "type": "requests"

  }

}



If you do not have a valid API key then you will see a JSON error of:



{

    "error": {

        "message": "Incorrect API key provided: YOUR_API_KEY. You can find your API key at https://beta.openai.com.",

        "type": "invalid_request_error",

        "param": null,

        "code": "invalid_api_key"

    }

}



If you don't have anything typed into the prompt text-field (meaning the text field content is completely empty) you will see a JSON error of:



{

    "error": {

    "code": null,

    "message": "You must provide a prompt.",

    "param": null,

    "type": "invalid_request_error"

  }

}



If Dall-E could not understand the meaning of your prompt you will see a JSON error of:



{  "error": {

    "code": null,

    "message": "Something went wrong with your generation. You may try again or ask for a different prompt",

    "param": null,

    "type": "server_error"

  }

}



If you hit into the Dall-E safety-rule limitations it means your prompt words are being censored. In those cases you will see an error like this message which was generated by having the words "COVID mask" as part of a prompt:



{

  "error": {

    "code": null,

    "message": "Your request was rejected as a result of our safety system. Your prompt may contain text that is not allowed by our safety system.",

    "param": null,

    "type": "invalid_request_error"

  }

}

## Windows Command Prompt Test

If you want to do a test run of the cURL + OpenAI Key environment variable you can try running this cURL code directly in a command-prompt window:



"curl.exe" -v -H "Content-Type: application/json" -H "Authorization: Bearer %OPENAI_API_KEY%" -d "{\"prompt\": \"Blackmagic Design Control Panel, Fusion Reactor, Cooling Tank, Blue Glow Water\", \"n\": 1, \"size\": \"256x256\"}"  https://api.openai.com/v1/images/generations



The JSON based request result you will get back looks like this:



{

  "created": 1667534341,

  "data": [

    {

      "url": "https://oaidalleapiprodscus.blob.core.windows.net/private/<snip>.png?st=2022-11-04T02%3A59%3A01Z&se=2022-11-04T04%3A59%3A01Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=<snip>&skt=2022-11-04T00%3A59%3A13Z&ske=2022-11-05T00%3A59%3A13Z&sks=b&skv=2021-08-06&sig=<snip>"

    }

  ]

}



When you copy the URL part of the text output from the command prompt window session into your Web browser's address bar, you will then see a new randomly created PNG image. With any luck it will look like something out of a futuristic SciFi movie with moody blue lighting in the results:




![[Pipeline Guide.img/9 results.png]]![[Pipeline Guide.img/10 results.png]]



## Comp Description  (Download from the WSL Dall-E Thread)

The command line version of cURL is used to perform a JSON request with an authorization token. You need to have an OpenAI API Key stored in an environment variable named "OPENAI_API_KEY".



The ML image generator prompt is defined in the "ImagePrompt" node. The number of images generated each time is defined in the "ImageCount" node. The image size for the generated imagery is a square image sized to either 256px, 512px, or 1024px. This value is defined in the "ImageSizePx" node.



The "vTextSubFormatMultiline" node is used to combine the command-line launching string elements together using several text based input connections. Each input on the node matches a token value like input #1 = {1}, input #2 = {2}, Input #3 = [3}, etc... 



The vTextProcessOpen node runs a shell command via popen(). This is how we launch the command line version of cURL to request that OpenAI generates a new image. BTW Windows 10 & 11 include cURL with the OS by default. The vTextViewer node makes it easier to read the shell commands that will be run in the Inspector view.



A temporary .bat/.sh/.command file is written to disk. This holds the current cURL CLI command needed. Doing this avoids one whole level of headaches for the handling of nested quotation symbols in blocks of text used by "popen()".



The vTextSubFormat2 node named "LinkOrder" uses the 1st input connection to replace the data stream from the vTextProcessOpen node with the original filename of the JSON file. This keeps the order of processing inline when rendering the comp.



The "vJSONFromFile1" node reads in the JSON data using the supplied filename. The JSON data downloaded by cURL is then loaded into a ScriptVal based Lua table. The "data.#.url" table element is accessed nodally to extract a URL that points to a specific element index number's PNG image resource.



The PNG image is then displayed in Fusion using a "vImageFromNet" node. 



Finally, a grid of image views are combined into a single horizontal frame layout using the "vImageCreateTiles" node. 



The "Tiles X" parameter on this node is driven based upon the number of elements in the ScriptVal Lua table. This allows the "ImageCount" node to automatically adjust the number of images loaded into the grid view.

## Rescuing Your vImageFromNet Temp Files

The "vImageFromNet" node caches a temporary file to disk for each download request that is processed. The cache location is the "Temp:/Vonk/" PathMap folder which is a directory that is automatically cleared by your operating system on restart.



This is a relevant tip if your latest interactive prompt creation and rendering session resulted in an amazing image being generated... that you are then having a hard time recreating later on. In this type of circumstance you may need to "fish out" that specific asset from the Dall-E processed temporary PNG image files in the cache directory.



If this is the case, you can quickly access this content using the "Script > Vonk Ultra > Open > Show Temp Folder" menu item.



![[Pipeline Guide.img/Vonk Show Temp Folder.png]]

# Dall-E for Fusion

There is now a macro packaged version of the "Dall-E for Fusion" workflow. It bundles all of the Vonk nodes into a single GroupOperator that is streamlined with a minimalistic UI for artists to interact with.



Under the hood this macro uses the Base64 request format option to communicate with the Dall-E API's web service. This requires you to have the most recent version of Vonk Ultra (with the Base64 atom package) installed. :) 



![[Pipeline Guide.img/Dalle Macro.png]]



The "Image Resolution" control defines how large of an image is created. You can choose between "256px", "512px", or "1024px". This will generate either a "256x256 px", "512x512 px", or "1024x1024 px" sized image.



The "Number of Images" control specifies how many images are generated at a single time. These images are then accessible by advancing the Fusion timeline play head frame-by-frame.



The "Prompt" text field is where you enter your text to define what type of image content you want to have generated by Dall-E. Do not use quote symbols in this text-field. When entering text into the prompt, keep the content as a "single line" block of text without adding any newline characters, slashes or quote characters.



The "Show Temp Folder" button allows you to open the "Temp:/Vonk/Dall-E/" PathMap location on-disk. You can browse the cached images saved here if you need to recover a previously generated image.

## Example Comp and Macro (Download from the WSL Dall-E Thread)



![[Pipeline Guide.img/kvrDalle Macro.png]]

### Description

This comp allows you to use the OpenAI "Dall-E" image generator.



In order to use the "kdrDallE" macro you need to have the "Vonk Ultra" package installed from Reactor. You also need to register for an OpenAI API key to access the Dall-E API via the web. This API key should be added to an environment variable on your computer named "OPENAI_API_KEY".

#### Note

I'm still refining the image caching functionality in the macro, especially when the Number of Images control is above 1. 



For the next update I need to learn more from Dall-E's API docs on what their equivalent to a seed value is to see how stable of an output you can get within a short window of time with the exact same prompt request.



# Accessing the Hugging Face API

[https://huggingface.co/inference-api](https://huggingface.co/inference-api)

# Stable Diffusion

Stable Diffusion is an open-source machine learning based "AI" image generator created by [StabilityAI](https://stability.ai/). There is a web-based "DreamStudio" interface that can be explored. It is quite similar to MidjourneyAI and OpenAI's Dall-E technology.



For getting started quickly, Stable Diffusion's "DreamStudio" is an easy-to-use interface for creating images using the recently released Stable Diffusion image generation model. Stable Diffusion is a fast, efficient model for creating images from text which understands the relationships between words and images. It can create high quality images of anything you can imagine in seconds–just type in a text prompt and hit Dream. A safety filter is activated by default.



Already there is a [Photoshop](https://christiancantrell.com/#ai-ml) plugin, several [Blender](https://github.com/carson-katri/dream-textures) plugins, a [Figma](https://twitter.com/RemitNotPaucity/status/1571295016869568513) plugin, and a [Krita](https://github.com/sddebz/stable-diffusion-krita-plugin) plugin. 



[https://github.com/CompVis/stable-diffusion](https://github.com/CompVis/stable-diffusion)



-   [Wikipedia | Stable Diffusion](https://en.wikipedia.org/wiki/Stable_Diffusion)

-   [WSL | [DEV] Kartaverse Stable Diffusion ML Fuse](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42542#p42542)


## Stable Diffusion for Fusion

A Fuse-based implementation of Stable Diffusion bindings are under development for Fusion. Currently this SD for Fusion effort is working on how best to package and deliver the required library dependencies to create a straightforward, easy to use experience for the end user.



![[Pipeline Guide.img/kvrStableDiffusion Fuse 1.png]]![[Pipeline Guide.img/kvrStableDiffusion Fuse 2.png]]![[Pipeline Guide.img/kvrStableDiffusion Fuse 3.png]]![[Pipeline Guide.img/kvrStableDiffusion Fuse 4.png]]![[Pipeline Guide.img/kvrStableDiffusion Fuse 5.png]]![[Pipeline Guide.img/kvrStableDiffusion Fuse 6.png]]

# OpenCV

OpenCV is a popular open-source cross-platform compatible computer vision framework.

[https://opencv.org/](https://opencv.org/)



The OpenCV library makes it possible to carry out advanced image analysis with only a few lines of Python code.

# GluonCV

Gluon makes it easy to perform common computer vision tasks like image classification, object segmentation and more. It is worth trying out even if you have never explored CV workflows beforehand.



[https://cv.gluon.ai/](https://cv.gluon.ai/)



GluonCV Resources:

-   [GluonCV Docs](https://cv.gluon.ai/contents.html)

-   [GluonCV Image Clasifier](https://cv.gluon.ai/build/examples_classification/demo_imagenet.html)


## Installing GluonCV for Windows

Step 1. Perform a base install of GluonCV via Python PIP Package Manager



REM Update Python pip package manager

python.exe -m pip install --upgrade pip



REM Nvidia driver 512.96

REM Cuda 11.7 is written below as "cu117" when adding mxnet



REM Add mxnet

pip install --upgrade mxnet-cu117



REM Add PyTorch

pip install torch==1.12.1 torchvision==0.7.0



REM Update GluonCV

pip install --upgrade gluoncv



Step 2. Start working your way through the GluonCV models and tutorials materials to get comfortable with the library.

# OpenMMLab

[https://github.com/open-mmlab](https://github.com/open-mmlab)

# MediaPipe

[https://mediapipe.dev/](https://mediapipe.dev/)



# FFMpeg

FFMpeg is the ultimate command-line utility for working with video files. It is cross-platform compatible and open-source.



[https://ffmpeg.org/](https://ffmpeg.org/)



# Imagemagick

Imagemagick is a popular command-line image editing and conversion utility that is available for macOS, Linux, and Windows. In addition to the command-line based tools, there are versions of Imagemagick that can be used from inside scripting languages, or as a dynamic library that can be accessed from compiled programming languages.



[https://imagemagick.org/](https://imagemagick.org/)

## Using Imagemagick to Burn in Text Overlays

Here is an Imagemagick shell scripting example that creates a desktop wallpaper image that has a text caption rendered from a text file named "desktop_caption.txt". The output is saved to an image named "Desktop.png":



#!/usr/bin/env bash

# Desktop Pattern Generator



echo "Desktop Pattern Generator"



HOST='R01'

IPADDRESS='10.20.30.1'

MACADDRESS='00:25:90:59:5b:16'

NETSPEED='1000T'

HARDDISK='70 GB HD / 34 GB Free'

OSVERSION='Ubuntu 14.04.05 LTS'



# Generate a text string and write it to disk

printf "${HOST} / ${IPADDRESS}\n${MACADDRESS} ${NETSPEED}\n${HARDDISK}\n${OSVERSION}"> $TMPDIR/desktop_caption.txt



# Create the rendered image from the text file

convert -size 320x100 -density 72 -pointsize 18 -interline-spacing 0 -background black -fill white -font Arial caption:@$TMPDIR/desktop_caption.txt "$HOME/Pictures/Desktop.png"

## Using ImageMagick in 360VR workflows

The Dome2Rect GitHub repository includes a range of .bat shell scripts that use ImageMagick to edit and re-layout cubic panoramic images into different cubic image projections.



[https://github.com/AndrewHazelden/dome2rect](https://github.com/AndrewHazelden/dome2rect)

# EXIFTOOL

The exiftool command-line utility is used to modify EXIF metadata tags in images. This tool allows a terminal (Linux/macOS) or command-prompt (Windows) based shell script to carry out batch operations of reading/writing/editing image metadata on a folder of images.



[https://exiftool.org/](https://exiftool.org/)



When you start writing your own pipeline tools for automating volumetric video or ML workflows, it can be useful to take the time to embed meaningful EXIF metadata into each of the images used in a project folder. 



This is especially relevant if you are working with multi-view content, or need to convert dozens of movies into image sequences and want to add information into each file. The thing to remember with metadata is that when you do things correctly, those records will be passed down-stream to all the other tools in the pipeline, in a seamless manner.

# Hugin Nona

The Hugin panoramic warping toolset includes the "nona" command-line utility. Nona uses the PanoTools "PTStitcher" scripting syntax to apply image projection and lens distortion correction operations.



[https://hugin.sourceforge.io/](https://hugin.sourceforge.io/)



For more information:

-   [Nona Docs](https://hugin.sourceforge.io/docs/manual/Nona.html)


-   [Nona Script Example](https://hugin.sourceforge.io/docs/nona/nona.txt)


-   [PTStitcher Syntax Docs](https://hugin.sourceforge.io/docs/manual/PTStitcher.html)

-   [Scripting PTStitcher](https://wiki.panotools.org/PTStitcher_Readme#Scripting_PTStitcher)


# Enblend and Enfuse

The Enblend command-line utility allows for seamless blending of multi-view images. A companion tool Enfuse allows for command-line based HDRI image bracket merging.



[https://enblend.sourceforge.net/](https://enblend.sourceforge.net/)



For more information:

-   [Enfuse Docs](https://enblend.sourceforge.net/enfuse.doc/enfuse_4.2.xhtml/enfuse.html)

-   [Hugin PTX Users Google Group](https://groups.google.com/g/hugin-ptx?pli=1)




Display Solutions, GPUs, Video Cables, Converters/Adapters

# PCoIP Thin Clients

Remote workers in the enterprise end of the media sector often use thin client systems driven by "PCoIP" hardware like HP branded Teradici remote access terminals.

[https://www.teradici.com](https://www.teradici.com/)

This thin client gear passes USB (keyboard, mouse, graphics tablet), sound, and monitor signals in an encrypted fashion over a conventional high-speed internet connection. The remote employee never has access to raw files over this thin client connection and only sees the visual image on the monitor which makes studios happy for security reasons.

On the data center side of things, the host server system for the thin client session provides hardware accelerated graphics using NVIDIA GRID GPU drivers. Often the system provides more than 4 concurrent user sessions per rack-mounted server case.

# Workstation Reference Hardware

The average visual workstation in the enterprise end of the Film & TV / immersive sector has a NVIDIA CUDA graphics card with an RTX 2000/3000 series GPU hardware for freelancers, and NVIDIA A6000 or newer series GPUs for 3D animators, and game artists inside of large corporate studio settings.



Most workstations have a small dedicated SSD/NVME drive for the OS boot volume. 



Then the artists' programs are run from a shared file server. It is worth mentioning that temp files generated by programs are not commonly written to the boot volume. All user data is read/written from a 10 Gig Ethernet connected network file path that is specific to the current show they are working on.



A separate dedicated computer (that is not the file server) is used as a license server for all of the workstations on a local area network. This license server system will have all the required hardware license dongles attached to it, and floating software licenses are bound to that system's unique hardware IDs as well.



These days some studios require/expect to have the ability to run a license server on a VMWARE vSphere based virtual machine, or on an Amazon AWS EC2 cloud hosted instance. For companies that are going for fully cloud-based workstations, "login based" licensing is common.

# Dummy HDMI Plugs for Headless GPU Render Nodes

When setting up headless render nodes that need to run 24x7 with hardware accelerated GPU rendering tasks it is important to plug a "dummy HDMI plug" dongle-like device into the GPU. These are readily available from marketplaces like OWC, [Amazon](https://www.amazon.com/s?k=dummy+plug), eBay.



This allows the graphics card to correctly auto-sense the EDID resolution parameters so MacOS, Windows, and Linux window managers operate correctly. It also allows screen sharing programs to work more reliably.



Some remote access programs, like Parsec, also benefit from having a spare mouse plugged into the USB port if you want to have a hardware cursor that works on Windows.

# PCIe Riser Ribbon Cables

If you need to get creative with how you build your workstation to be able to fit in multiple GPUs a less common option is to use LinkUP brand PCIe flex cables. Amazon is a good source for them when they are available.



[https://linkup.one/ultra-4-0-pcie-riser-cables/](https://linkup.one/ultra-4-0-pcie-riser-cables/)



The flex cables come in up to 30 cm long lengths while still being able to function on a PCIe Gen 4 bus at 16 lanes of bandwidth. It is possible to "fan out" several large GPUs like NVIDIA RTX 3090s in a wider fashion than the mechanical limits of PCIe motherboard slot spacing with LinkUP cables.



![[Pipeline Guide.img/Linkup Riser Cables 1.jpeg]]



![[Pipeline Guide.img/LinkUp Riser Cables 2.jpeg]]



Note: The "LinkUP flex cables" shown above are not bandwidth-throttled like the commonly available discount cables on Amazon or eBay that come from the more common "cryptocurrency mining" style of single-lane PCIe cables and risers. Discount cables must be avoided at all costs as this format of hardware is not effective for GPU rendering use.

# MSI Afterburner on Windows GPU Performance Tuning

MSI Afterburner allows you to optimize the thermal cooling and performance of your GPU. 



You can improve the stability of GPU rendering workflows by making small changes to the core clock, memory clock, power limit, and fan speed settings.



[https://www.msi.com/Landing/afterburner/graphics-cards](https://www.msi.com/Landing/afterburner/graphics-cards)



![[Pipeline Guide.img/MSI Afterburner.png]]



# Green With Envy on Linux Single GPU Performance Tuning

[https://gitlab.com/leinardi/gwe](https://gitlab.com/leinardi/gwe)



It is possible to persistently enable fan speed control in nvidia-settings using:

Option "Coolbits" "28"



# Toggle the prefs for all GPUs connected:

sudo nvidia-xconfig --enable-all-gpus



# Edit xorg

cp /etc/X11/xorg.conf $HOME/xorg.conf.bak

sudo gedit /etc/X11/xorg.conf



# For a Dual GPU setup paste the following into the xorg.conf file:

# nvidia-xconfig: X configuration file generated by nvidia-xconfig

# nvidia-xconfig:  version 460.73.01



Section "ServerLayout"

    Identifier     "Layout0"

    Screen      0  "Screen0"

    Screen      1  "Screen1" RightOf "Screen0"

    InputDevice    "Keyboard0" "CoreKeyboard"

    InputDevice    "Mouse0" "CorePointer"

EndSection



Section "Files"

EndSection



Section "InputDevice"



    # generated from default

    Identifier     "Mouse0"

    Driver         "mouse"

    Option         "Protocol" "auto"

    Option         "Device" "/dev/input/mice"

    Option         "Emulate3Buttons" "no"

    Option         "ZAxisMapping" "4 5"

EndSection



Section "InputDevice"



    # generated from default

    Identifier     "Keyboard0"

    Driver         "kbd"

EndSection



Section "Monitor"

    Identifier     "Monitor0"

    VendorName     "Unknown"

    ModelName      "Unknown"

    Option         "DPMS"

EndSection



Section "Monitor"

    Identifier     "Monitor1"

    VendorName     "Unknown"

    ModelName      "Unknown"

    Option         "DPMS"

EndSection



Section "Device"

    Identifier     "Device0"

    Driver         "nvidia"

    VendorName     "NVIDIA Corporation"

    BoardName      "GeForce RTX 3090"

    BusID          "PCI:1:0:0"

    Option         "Coolbits" "28"

    Option         "AllowEmptyInitialConfiguration"

EndSection



Section "Device"

    Identifier     "Device1"

    Driver         "nvidia"

    VendorName     "NVIDIA Corporation"

    BoardName      "GeForce RTX 3090"

    BusID          "PCI:33:0:0"

    Option         "Coolbits" "28"

    Option         "AllowEmptyInitialConfiguration"

EndSection



Section "Screen"

    Identifier     "Screen0"

    Device         "Device0"

    Monitor        "Monitor0"

    DefaultDepth    24

    SubSection     "Display"

        Depth       24

    EndSubSection

EndSection



Section "Screen"

    Identifier     "Screen1"

    Device         "Device1"

    Monitor        "Monitor1"

    DefaultDepth    24

    SubSection     "Display"

        Depth       24

    EndSubSection

EndSection



Finally you can check the NVIDIA prefs to see if the preference was defined correctly:

sudo nvidia-settings

# IPMI Remote Management Interface

If you are building a render farm with second-hand "surplus" business and industrial server gear purchased from eBay, you might notice the presence on server systems from vendors like Super-Micro of a low-level device management interface that was known as an IPMI interface. 



This interface allows you to modify BIOS settings remotely via a dedicated ethernet IP network connection that is separate from the server's network interface used by the running operating system.



If the server is an older generation like a quad AMD G34 CPU powered system, you may have to run the IPMI management utility in a virtual machine that runs an older release of Windows ranging from Windows XP, Vista, or 7. This was due to using the common requirement of Internet Explorer 6 and ActiveX controls.



[https://www.supermicro.com/en/solutions/management-software/ipmi-utilities](https://www.supermicro.com/en/solutions/management-software/ipmi-utilities)

# NVME Storage Raid Controller Cards

KartaVR v5's volumetric workflows were developed using a file server that had a High-Point SSD7540 8x NVME raid array controller card. The card is compatible with Windows, Linux, and macOS systems which is excellent.



The disk throughput is quite phenomenal and it reduces the pain of working with large media assets like tons of image sequences and per-frame photogrammetry reconstructed mesh sequences.



![[Pipeline Guide.img/Highpoint_8X_NVME_Raid_Controller_Board.jpg]]



![[Pipeline Guide.img/Highpoint_8X_NVME_Raid_Controller_Heat_Sink.jpg]]



# Networking Gear

![[Pipeline Guide.img/Netgear_24-Port_10G_Ethernet_Switch.jpg]]



Hardware Control Surfaces and HID Devices

# BMD Control Surfaces for Resolve/Fairlight

Blackmagic Design has a wide range of control surfaces to meet the needs of video editors, audio professionals, and colorists.



![[Pipeline Guide.img/Fairlight-Desktop-Audio-Editor-Top.jpg]]



For more information:

-   [Resolve/Fairlight Panels](https://www.blackmagicdesign.com/products/davinciresolve/panels)

-   [Resolve/Fairlight Consoles](https://www.blackmagicdesign.com/products/davinciresolve/consoles)


# Graphics Tablets

Fusion's user interface, including the hotkeys used to navigate the viewport inside the Fusion 3D workspace are optimized for use by artists working with a graphics tablet.



For more information:

-   [Wacom Products](https://www.wacom.com/en-us/products)

-   [Cintiq Products](https://www.wacom.com/en-us/products/pen-displays/wacom-cintiq)

-   [Huion Products](https://www.huion.com/pen_tablet/)




In addition to controlling the mapping of the buttons on the side of a stylus, artists have the option to customize what the extra buttons and control strips on their tablet are used for on a per-application basis. 



This makes it possible to use FuScript based command-line scripting with Resolve/Fusion to allow the extra buttons on your graphics tablet to carry out just about any operation you can imagine including: running scripts, loading media in the viewer windows, adding nodes, bypassing nodes, rendering footage, opening the Fusion Render Manager/Console/Bin windows, or toggling the visibility of views like the Nodes view or Inspector controls.

# Logitech MX-Master Options Mice Driver

For more information:

-   [MX-Master3 Mouse](https://www.logitech.com/en-us/products/mice/mx-master-3s.910-006556.html)

-   [Logitech Unifying Dongle](https://www.logitech.com/en-us/products/mice/unifying-receiver-usb.910-005235.html)


# 3dconnexion SpaceMouse

[https://3dconnexion.com/uk/](https://3dconnexion.com/uk/)



![[Pipeline Guide.img/Space Mouse.png]]



SpaceMouse Dev Resources:

-   [WSL | [DEV] 3dconnexion SpaceMouse Integration Plugin](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=42887#p42887)


# VR/HMD Based Haptic Interfaces

An interesting consideration when re-creating virtual environments, is the existing Meta Quest HMD supports [optical hand-tracking](https://support.oculus.com/articles/headsets-and-accessories/controllers-and-hand-tracking/hand-tracking-quest-2). Hand tracking brings accurate real-time "hand gesture" capture into a virtual world.



Hand-tracking works without the need for any 3rd party plastic VR hand-controller gadgets/nunchucks. One simply reaches out and uses one's own fingers to interact directly with objects existing inside the digital-twin location.



You can touch, pick up, carry and interact with the props, tools, and natural objects in the virtual environment. Forces like gravity act upon the objects so dropping or setting down a prop will kick-off a rigid body dynamics simulation of the settling motion as the object's motion comes to a resting state.



These images show the Meta Quest HMD's hand gesture training content:

![[Pipeline Guide.img/Untitled.gif]]![[Pipeline Guide.img/Untitled_1.gif]]![[Pipeline Guide.img/Untitled_2.gif]]



Installing Hardware Virtualization Tools

If you need to run multiple operating systems on the same hardware you have multiple approaches that can be taken to solve this task. Virtualization is the creation of a "canister" like container that represents something that could be best described as a unique imaginary computer device that is simulated inside your active computer session. Each processor instruction call done inside the virtual machine is injected back into the real CPU processor using an approach called a hypervisor.



This approach allows you to use disk images to store the operating system and files. The virtual machine can support input devices, USB, audio, monitor connections, remote screen sharing, networking with controllable data routing options.  A unique ethernet MAC ID address is assigned for each virtual machine network interface. 



The virtual machine is able to be snapshotted, paused, resumed, reset, and shutdown as needed. The virtual machine session can be hosted locally or in the cloud, and it is even possible to transfer the location of a running virtual machine session between different data centers while it is still running.



One essential feature when working with graphics programs on a virtual machine instance is the support for native graphics rendering calls to the underlying hardware. This is called PCIe hardware passthrough support. It allows a virtualization environment to access native OpenGL, DirectX, OpenCL, CUDA, and Metal features that are able to work at peak performance often with less than 1-3% of a non-virtualized process running on the same hardware.

# Docker Containers

[https://www.docker.com/](https://www.docker.com/)



For more information:

-   [Containers and Virtual Machines](https://www.docker.com/resources/what-container/)


# Install VIRSH + QEMU on Linux

Linux distros have an amazing virtualization environment called [libVirt](https://libvirt.org/) that can access PCIE hardware like GPUs, audio interfaces, and NVME storage via direct hardware passthrough of low-level devices.



It is possible to virtualize operating systems including Linux, Windows, and even macOS using VIRSH.



For more information:

-   [VIRSH](https://www.libvirt.org/manpages/virsh.html)

-   [Red Hat | KVM Migration](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-kvm_live_migration-live_kvm_migration_with_virsh)


# Install VirtualBox on Linux

VirtualBox is open-source virtual machine software developed by Oracle. It allows you to run Windows, Linux, and other operating systems from a disk image.



[https://www.virtualbox.org](https://www.virtualbox.org/)



# Download Virtual Box

sudo dnf install wget

cd $HOME/Downloads/

wget [https://download.virtualbox.org/virtualbox/6.1.32/VirtualBox-6.1-6.1.32_149290_el8-1.x86_64.rpm](https://download.virtualbox.org/virtualbox/6.1.32/VirtualBox-6.1-6.1.32_149290_el8-1.x86_64.rpm)



# Install the RPM package

sudo rpm -Uvh $HOME/Downloads/VirtualBox-6.1-6.1.32_149290_el8-1.x86_64.rpm



# Check for a possible EFI secure boot issue with modprobe and vboxdrv.

# Restart the system. Hold down the delete key to enter BIOS.

# Change the BIOS settings to:

# BIOS > Security > Attempt Secure Boot > Disabled.



# Alternative approach - DNF Package Manager Based VirtualBox install

# install

sudo dnf install VirtualBox-6.1 -y



# Add yourself to the VirtualBox USB port sharing group

sudo usermod -a -G vboxusers Au

# sudo usermod -a -G vboxusers vfx



# Note: Look at adding `whoami` to the usermod string.

## Start VirtualBox

In a terminal window type in:

virtualbox

## Create a new Virtual Machine



Click the "New" button in the VirtualBox toolbar.



Name: "Win10"

Type: "Microsoft Windows"

Version: "Windows 10 (64-bit)"

Click the "Next" button to continue.



Memory Size: 16384 MB

Click the "Next" button to continue.

## Create Virtual Machine Dialog

### Hard Disk

Click the "(x) Create a virtual hard disk now" option.



Then click on the "Create" button to continue.

### Hard disk file type Dialog

Select the "(x) VMDK (Virtual Machine Disk)" option.



Click the "Next" button to continue.

### Storage on physical hard disk

Select the "(x) Dynamically allocated" option.



Click the "Next" button to continue.

### File size location

Type in "256 GB".



Click the "Create" button to continue.



At this point, a new "Win10" disk image will be listed in the "Oracle VM VirtualBox Manager" window.

## Edit the VirtualBox VM Settings

Click the "Settings" button in the VirtualBox toolbar.



In the Win10 Settings dialog, click on the "Storage" icon on the left side of the dialog. 



Select the item named "Empty". On the right side of the Storage tab, is an "Optical Drive" input field.



Click the small optical disc icon, then in the popup dialog select "Choose a disk file...". 



Then select the Windows 10 ISO image named "Win10_21H2_English_International_x64.iso".



Click the "OK" button to continue. This will close the settings dialog.

## Start the New Virtual Machine

Back in the main "Oracle VM VirtualBox Manager" window, press the "Start" button in the toolbar. 



This will launch the new virtual machine with the Windows 10 installation media ISO connected to a virtual optical drive.

## Eject the Windows Installation Media ISO

From the VirtualBox Menu at the top of the Win10 VM window, uncheck the "Devices > Optical Drives > Win10_21H2_EnglishInternational_x64.iso" menu item. 



This will remove the installation media so the disk image is no longer accessible inside the Virtual Machine.



![[Pipeline Guide.img/Untitled_57.png]]

# Let's Create a VirtualBox Disk Snapshot

Let's take a new snapshot of the current state of the virtual machine and it's virtual hard disk.



From the VirtualBox Menu at the top of the Win10 VM window, select the "Machine > Take Snapshot..." menu item.



![[Pipeline Guide.img/Untitled_58.png]]

## Take Snapshot of Virtual Machine Dialog



In the "Take Snapshot of Virtual Machine" dialog enter the following parameters:



Snapshot Name: "Win10"

Snapshot Description: "Fresh Install"



Then click the "OK" button to close this window and save the snapshot to disk.



![[Pipeline Guide.img/Untitled_59.png]]



A new disk snapshot will be saved to the .vmdk file. This can be thought of as something vaguely similar to a Windows "Restore Point" on a conventional PC.



![[Pipeline Guide.img/Untitled_60.png]]

# Backup a VMDK Disk Image to an External Disk or LTO Tape

By default, your VirtualBox disk images are stored in disk at the default folder location of:



/home/vfx/VirtualBox VMs/



The newly created "Win10" disk image can be accessed using the $HOME environment variable as:



$HOME/VirtualBox VMs/Win10/




![[Pipeline Guide.img/Untitled_61.png]]



# Connect the VirtualBox Network Adapter

Enable the "Devices > Network > [x] Connect Network Adapter" option. This will allow Windows to connect to the internet and start downloading drivers and updates.



![[Pipeline Guide.img/Untitled_62.png]]

# Enable the VirtualBox Seamless Desktop Mode

The VirtualBox "View > Seamless Mode" menu item allows you to use Windows and Linux together in a more transparent and user friendly fashion. 



The "Host +L" hotkey for toggling On/OFF the "Seamless Mode" is typically configured as the "Right Control + L" hotkey combination when running with a default keyboard layout in Virtual Box.



![[Pipeline Guide.img/Untitled_63.png]]



At the same time as the "Seamless Mode" is enabled in VirtualBox, it also helps to have a "Shared Folder" enabled in the VirtualBox preferences, too.

# VirtualBox Snapshots Allow Incremental Disk Backups

Use the VirtualBox "Machine > Take Snapshot…" menu item to save a disk snapshot of the current .vmdk file.

## ![[Pipeline Guide.img/Untitled_64.png]]

# VirtualBox Shared Clipboard Copy/Paste Buffer

VirtualBox has a shared clipboard copy/paste feature that helps make the process of using Windows applications like web browsers and text editors seamless inside a Linux host OS based environment.

At the top of the VirtualBox window, select the "Devices > Shared Clipboard > Bidirectional" menu item. This turns on two way copying between Linux and Windows.

![[Pipeline Guide.img/Untitled_65.png]]



You can also access this bidirectional clipboard option using the "Win10 Settings > General > Advanced" tab. In this view, you can set the "Shared Clipboard:" to "Bidirectional". Set the "Drag 'n Drop:" control to "Bidirectional" as well.

# VirtualBox Shared Folders

When you are working with Linux and Windows filesystems on the same host computer, it can be a big help to be able to pass files transparently between the two operating systems.



VirtualBox offers a "Shared Folder" option inside each virtual machine environment. You are able to choose the source folder on the host OS side, and the mount location inside the virtual machine where that content shows up. 



It is also possible to decide if you want that shared folder location to be read-only which is useful in some cases if you don't want to have security risks like data being modified inside a Windows virtual machine used for software testing.



Step 1. Turn off the Windows session using the Windows 10 start menu "Shutdown" feature.



Step 2. In the VirtualBox software, where a "VirtualBox Manager" dialog shows all of the virtual machines, click on the left sidebar entry for "Win10". Then click in the toolbar on the orange colored "Settings" gearwheel icon.



![[Pipeline Guide.img/Untitled_66.png]]




Step 3. This will open up the VirtualBox Settings dialog for that specific virtual machine session. On the left sidebar of this "Win10 - Settings" dialog, select the "Shared Folder" entry. Then click on the far top right corner of the Shared Folder's view on a small icon that shows a "folder with + sign" icon. This is the button used to add a new Linux to Windows shared folder location.



![[Pipeline Guide.img/Untitled_67.png]]



Step 4. An "Add Share" dialog will appear. This is where you set up the folder sharing settings.



Click on the "Folder Path" pop-up menu, and choose the "Other…" option. Navigate to select your Linux home folder path which equates to "$HOME".



![[Pipeline Guide.img/Untitled_68.png]]



In the "Add Share" dialog, set the values to something roughly like this:



Folder Path: \home\vfx

Folder Name: vfx

[x] Auto-mount (enable the checkbox)

Mount Point: F:\



Step 5. Then click the "OK" button to close this dialog. Back in the "Win10 - Settings" dialog, also click the "OK" button to close this dialog.




Step 6. Now you should be back in the "VirtualBox Manager" Window. Click on the Win10 virtual machine. Then press down in the center of the green "Start" button. This will re-launch the Windows 10 session.



![[Pipeline Guide.img/Untitled_69.png]]

# VirtualBox Display Settings

VirtualBox supports a wide range of GPU customizations that will increase the performance of the virtualized graphics. In the default compatibility mode we will use the "Graphics Controller" option of "VBoxSVGA".



In the "Acceleration:" section turn on the "[x] Enable 3D Acceleration" checkbox.



Drag the "Video Memory:" slider all the way to the right to select all the video memory we can allocate. This is typically "256 MB".

# VirtualBox Audio Settings

The "Host Audio Driver" pop-up menu is set to "PulseAudio".



Turn on the "[x] Enable Audio Input" and  "[x] Enable Audio Output" checkboxes.

# VirtualBox USB Settings

Change the VirtualBox settings to enable the "(x) USB 3.0 (xHCI) Controller". 



We can also add any USB hardware we want to have permanently connected to the virtual machine in this window using the "USB Device Filters" list. The "Blue Colored USB plug" Icon on the far right of this window can be used to select each device that should be automatically connected to the VirtualBox instance at boot.



![[Pipeline Guide.img/Untitled_70.png]]



Installing Operating Systems From Scratch

Installing Windows 10 Build 21H2

This part of the guide is here to help if you have an emergency on one of your computer systems and fixing the issue requires you to fully reload the operating system. This process can be scary the first few times you do it, especially if one has never performed a fresh install of Windows 10 on a visual workstation or render node system.

# Windows Setup

Language to install: "English (United Kingdom)"

Change the Keyboard from "United Kingdom" over to "US".



Then click the "Next" button to continue.



![[Pipeline Guide.img/Untitled_71.png]]

## Windows Setup

Click on the "Install Now" button to continue.



## ![[Pipeline Guide.img/Untitled_72.png]]

## Activate Windows

Click on the "[x] I don't have a product key" checkbox.



![[Pipeline Guide.img/Untitled_73.png]]

## Select the operating system you want to install



Choose "Windows 10 Home" from the list.



Click the "Next" button.



![[Pipeline Guide.img/Untitled_74.png]]

## Applicable notices and license terms

Enable the "[x] I accept the license terms" checkbox. Then click the "Next" button.



![[Pipeline Guide.img/Untitled_75.png]]

## What type of installation do you want?

Choose the "Custom install" option to continue.



![[Pipeline Guide.img/Untitled_76.png]]

## Where do you want to install Windows?

Click on the "*New" button that has the orange star icon next to it.



![[Pipeline Guide.img/Untitled_77.png]]



A numerical entry field will appear with an auto- sized value pre-filled in MB (megabytes). Press the "Apply" button to accept this value.



Then click the "Next" button to continue.



![[Pipeline Guide.img/Untitled_78.png]]

## Windows Setup

A dialog with the message text "To ensure that all Windows features work correctly, Windows might create additional partitions for system files." will appear.



Click the "OK" button to continue.



![[Pipeline Guide.img/Untitled_79.png]]

## Where do you want to install Windows?

Click the "Next" button to continue.



![[Pipeline Guide.img/Untitled_80.png]]

## Installing Windows

An installation progress window will appear. At a certain point the installer will restart the computer and transition from running off the Windows installation media ISO image, onto the new Windows install on the local hard disk.



![[Pipeline Guide.img/Untitled_81.png]]



## Access the VirtualBox Menus for the "Win10" VM

Uncheck the "Devices > Network > [ ] Connect Network Adapter" option.



By unchecking the checkbox control, VirtualBox will disable the network connection during the Windows install.



![[Pipeline Guide.img/Untitled_82.png]]

## Let's start with region. Is this correct?

Select the "United Kingdom" option.



![[Pipeline Guide.img/Untitled_83.png]]

## Is this the right keyboard layout?

Select the "US" entry from the list.



![[Pipeline Guide.img/Untitled_84.png]]

## Do you want to add a second keyboard layout?

Click the "Add layout" button.



![[Pipeline Guide.img/Untitled_85.png]]



## Which keyboard layout would you like to use?

Select the "US" entry from the list.



![[Pipeline Guide.img/Untitled_86.png]]

## Let's connect you to a network

Click on the text "I don't have internet" to continue the Win10 install with no internet access connected.



![[Pipeline Guide.img/Untitled_87.png]]

## There is more to discover when you connect to the Internet

Click on the text "Continue with limited setup" 



![[Pipeline Guide.img/Untitled_88.png]]

## Who's going to use this PC?

Name: "vfx"

Click the "Next" button.



![[Pipeline Guide.img/Untitled_89.png]]

## Create a really memorable password

Password: "<Write In Something>"



Click the "Next" button.



![[Pipeline Guide.img/Untitled_90.png]]

## Confirm your password

A textual message will appear: "Type your password one last time".



Password: "<Write In Something>"



Click the "Next" button.



![[Pipeline Guide.img/Untitled_91.png]]

## Create security questions for this account

A textual message will appear of "Just in case you forget your password, choose 3 security questions and make sure your answers are unforgettable".



Your answer: "<Write In Something>"



Click the "Next" button.



![[Pipeline Guide.img/Untitled_92.png]]

## Let Microsoft and apps use your location

Select the "No" option.



Click the "Accept" button.



![[Pipeline Guide.img/Untitled_93.png]]

## Find my device

Select the "No" option.



Then click the "Accept" button.



![[Pipeline Guide.img/Untitled_94.png]]

## Send diagnostic data to Microsoft

Select the "Send Required diagnostic data" entry.



![[Pipeline Guide.img/Untitled_95.png]]

## Improve inking & typing

Select the "No" option.



![[Pipeline Guide.img/Untitled_96.png]]

## Get tailored experiences with diagnostic data

Select the "No" option.



![[Pipeline Guide.img/Untitled_97.png]]

## Let apps use advertising ID

Select the "No" option.



![[Pipeline Guide.img/Untitled_98.png]]

## Let Cortana help you get things done

Click the "Not now" button.



![[Pipeline Guide.img/Untitled_99.png]]



## Windows Setup Progress Messages

Several Windows progress dialog messages will appear over the next few minutes. No user input is required at this point for the installation to complete.



![[Pipeline Guide.img/Untitled_100.png]]



![[Pipeline Guide.img/Untitled_101.png]]



# Windows Setup Complete

When the Windows desktop pattern shows up, with the "Microsoft Edge" and "Recycle Bin" icons present, you have completed the Windows 10 installation process.



![[Pipeline Guide.img/Untitled_102.png]]



Quite a few background tasks will run at this point, such as the Windows Update mechanism which will download quite a few GBs of extra files. Over the course of the next few system reboots you do, a range of hardware drivers will get added for the accessories built-into your current laptop, workstation, or server.

# Windows Desktop Settings

In the Windows explorer folder browsing view, expand the ribbon toolbar using the fold-down disclosure triangle at the top right corner of the window.



Switch the ribbon over to the "View" Tab. Then enable the "[x] File name extensions" checkbox. Also enable the "[x] Hidden Items" checkbox, too.



![[Pipeline Guide.img/Untitled_103.png]]



# Windows Group Policy Editor



If you are running a copy of Windows 10 Pro or Enterprise you have the option to control the Windows OS update cycle. This does not appear to be a feature available in Windows 10 Home.



Option A: Click on the Start menu icon. In the search field type in "Group Policy". Click on the search result entry for the "Edit Group Policy" entry to launch the utility.



![[Pipeline Guide.img/Untitled_104.png]]



Option B: Alternatively, open a  command prompt with the "Run as administrator" mode. Type in "gpedit.msc" to launch the Edit Group Policy utility.



# ![[Pipeline Guide.img/Untitled_105.png]]

## Group Policy | Reduce Notification Area Message Verbosity

To reduce the frequency of the firewall notification messages, it is possible to edit the group policy setting for "Disable Security and Maintenance Notifications".

## Group Policy | Control Windows Update Scheduling

Using the panel on the left side of the "Local Group Policy Editor" window, navigate to the Windows Update folder using the path: 



Computer Configuration > Administrative Templates > Windows Components > Windows Update



Read through the list of settings you can edit until you find a "Configure Automatic Updates" policy. Double-click on the "Configure Automatic Updates" entry. In the dialog that appears, change the setting to "(x) Disabled" to turn off the automatic update feature permanently. To close the window, click on the "Apply" button, followed by the "OK" button to save changes.



Once these changes are saved to disk, your system will no longer download and apply Windows updates automatically, and you are then able to manually check for updates from the Settings. If you want to check the updates manually, then open the Settings app and go in the Update & Security option, then Windows Update.

# Install Office 365 on Windows

When setting up a new workstation using an air gapped process, it works well to install "Microsoft Office 365 Home Personal Edition" using an offline installer file that is downloaded in advance.



Microsoft Office Offline Installer docs:

-   [How to download Office 365 for offline install](https://answers.microsoft.com/en-us/msoffice/forum/all/how-to-download-office-365-for-offline-install/42a19a2b-3b64-44b5-97b3-befa8b0126a9)


-   [Use the Office offline installer](https://support.microsoft.com/en-us/office/use-the-office-offline-installer-f0a85fe7-118f-41cb-a791-d59cef96ad1c?ui=en-us&rs=en-us&ad=us#OfficePlans=signinmsa)


# Windows Start Menu Based Startup Folders

A startup folder based approach is handy if you need to launch a program or command-line script when Windows starts. This is a viable option you might consider using in cases where a system service is not possible such as for tasks that require GPU based hardware acceleration.



The two most often used Windows startup folder locations are:

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\




C:\Users\vfx\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\



Install Rocky Linux 8.5 on a Bare Metal System

This part of the guide is here to help if you have an emergency on one of your computer systems and fixing the issue requires you to fully reload the operating system. This process can be scary the first few times you do it, especially if one has never performed a fresh install of Rocky Linux on a visual workstation or render node system.



In your BIOS settings, make sure USB based media is bootable. The USB boot media needs to be listed at the top of the "Boot Priority" dialog, in advance of the internal hard disk in the list. This allows the computer to start up using the external USB boot media as the primary operating system during the install process.

# Rocky Linux 8 Boot Menu

Select the "Install Rocky Linux 8" menu item. Then press the "Enter" key on the keyboard to continue.



![[Pipeline Guide.img/Untitled_106.png]]

# Welcome to Rocky Linux 8

What language would you like to use during the installation process?



Select the "English > English (United States)" language option.



Click the "Continue" button to proceed to the next screen.



![[Pipeline Guide.img/Untitled_107.png]]

# Installation Summary

The installation summary dialog lets you fully customize the Rocky Linux 8 OS installation parameters.



Note: There is a certain order-of-operations logic needed, where you have to define the network properties in advance, if you want to use any internet connected features in the other parts of the installer.



# ![[Pipeline Guide.img/Untitled_108.png]]

# System

### KDUMP



Rocky Linux has a diagnostics mode called "KDUMP" that can save diagnostic logging information when a crash occurs. For most normal use cases in the VFX and animation sector, like setting up a new render node or a workstation, this KDUMP feature is not required.



Let's disable KDUMP and get 160 MB of extra RAM back in the process. Uncheck the "[ ] Enable kdump" checkbox near the top left of this dialog window. Then press the "Done" button to return to the primary "Installation Summary" installer screen.



![[Pipeline Guide.img/Untitled_109.png]]



# Network & Host Name 

The "Network & Host Name" dialog allows you to bring network interfaces like WiFi connections or Ethernet connections online. This means you can use Rocky Linux Minimal installation media to get the install going, and pull in the remaining packages you might need over the internet from a repository to complete the set up of a visual workstation.



Select your network interface at the top left part of the dialog. In my case I am using an Etherent connection called "Ethernet (enp0s3)". On the far right side of the dialog is an ON/OFF control. To bring the network interface online, toggle the control to the ON state.



The computer's name is defined with the "Host Name:" field at the bottom left corner of a dialog. I will give this system a host name of "R1" to represent render node 1 in my mini on-premise render cluster. Click the "Apply" button after entering a custom host name.

![[Pipeline Guide.img/Untitled_110.png]]



Let's further customize the remaining network settings. Click the "Configure" button.




Network & Host Name > Configure > Ethernet > MTU > 9000 (This setting will turn on Jumbo packets)

Network & Host Name > Configure > General > [x] Connect automatically with priority > 0



Security Policy > Apply Security Policy > OFF



Installation Destination > (Skip customizing it until later on in this guide.)

## Software

#### Software Selection



Base Environment

(x) Server

## Additional software for Selected Environment



-   File and Storage Server

-   GNOME

-   Hardware Monitoring Utilities

-   Network File System Client

-   Network Servers

-   Performance Tools

-   Windows File Server

-   Development Tools

-   Graphical Administration Tools

-   Headless Management

-   Legacy UNIX Compatibility

-   Scientific Support

-   System Tools


## Localization

### Keyboard

"English US"

### Language Support

English (United States)

### Date & Time

Americas/Halifax Timezone

24-Hour Clock

### Network Time

Set the control to "ON"



Note: You have to enable the network settings FIRST in order for the "Date & Time > Network Time" option to be available to be turned on at all.

## User Settings

### Root Password



Type in a secure password, that is possible to be remembered, and possible to be typed in correctly without error, by hand, many times over via an SSH network session.



If the password is deemed too short by the Root Password page, it is possible to click the "Done" button twice to force that shorter password to be retained and used.



### User Creation

Enable the "[x] Make this user administrator" checkbox.

Enable the [x] Require a password to use this account" checkbox.

### Full name:

vfx

### User name:

vfx



For better pipeline and shell scripting compatibility, choose a user name with less than 8 characters, no accented characters, no unicode characters, and pure ASCII alphanumeric digits, and no spaces. Going with lower case letters here isn't a bad thing if you are manually deploying a lot of tools and want faster, easier typing.



The user name you select here becomes your home folder location of:



/home/vfx/

## Installation Destination

### Local Standard Disks



Click on a drive to add a checkmark to indicate the install disk you would like to overwrite.



### Storage Configuration

Select the "(x) Custom" option



### Installation Options Warning Dialog



Your current Rocky Linux software selection requires (GiB) of available space, including (GiB) for software and (GiB) for swap space.



Click the (Reclaim Space) Button.



### Reclaim Disk Space



One has to be very careful when you go to remove pre-existing disk partitions on your destination drive where you are installing Rocky Linux. If you have several additional disks in the system, you need to check the drive make/model and disk capacity to ensure you are targeting the correct drive on the install.



The "sdb" like values hop around a bit when you plug in more internal and external drives so stay very vigilant not to destroy important disks like backup drives at this time.



### Hard Drive Layout

EFI System Partition (EFI System Partition)

/boot/efi (EFI System Partition) 512 MiB

/  (ext4)

## Manual Partitioning

New mount points will use the following partitioning scheme:

Standard Partitioning



Note: When you look through the hard drives shown in the "Unknown" section of the dialog, keep an eye out for any volumes that have an "ISO 9660" file system.



Seeing a USB drive listed as "ISO 9660" at this stage typically indicates this volume is the installation media you booted from that was created from an original ISO disk image. Don't delete this drive, as you are likely running the current Rocky Linux OS installer off that disk/memory card/USB thumbdrive right now!!!

### Create a Disk Partition "One"

Tip: Look at the top right of the manual partitioning window at the entry labelled "Device(s)" to see the hardware brand and drive model information for the partition you are interacting with.



This will be a value like "ATA OWC Mercury Extr…" for a render node with an SSD drive. Other drives will be listed here for laptops, desktops, or server systems.



To add a new partition to the boot volume click the bottom left of the manual portioning window's little "+" shaped button icon.

### Add a new mount point dialog

Desired Capacity:

512 MiB



Mount Point:

/boot/efi



Click the "Add a mount point" button to close the window and apply the settings. This will create a drive partition with an "EFI System Partition" file system.

### Create a Disk Partition "Two"

Click the bottom left of the manual portioning window's little "+" shaped button icon, to add a new partition to the boot volume.

### Add a new mount point dialog

Mount Point:

/



Device Type:

Standard Partition



Desired Capacity:



Leave this input field blank to use all of the remaining space on the hard drive for file storage.



Click the "Add a mount point" button to close the window and apply the settings.



Once the "Add a new mount point" dialog closes and you are back at the "Manual Partitioning" window, you need to click on the "/" based drive partition at the top left part of the window.



Change the "File System" parameter from the default value of "xfs" over to the more flexible option of "ext4". An ext4 based file system can be resized later on once the Linux OS is installed using a partition editing tool like "gparted". 



Note: If your hard disk was prepared with the default Linux setting using an "xfs" partition, it can make the relatively basic task of resizing an internal disk partition smaller, a real challenge later on.

### Summary of changes

Click the "Accept Changes"  button.

## Installation Summary

Click the "Begin Installation" button.



When the install completes, press the "Reboot" button. Remove the install media when the monitor goes black.



Then open the BIOS by pressing "delete" on your keyboard as soon as the system restarts. 



Select the boot drive in the BIOS that holds the Rocky Linux OS install. Press F10 to save the settings and exit BIOS.



Rocky Linux Deployment Essentials



# Add Gnome and enable a graphical desktop.

sudo dnf groupinstall "Workstation"

sudo systemctl set-default graphical



# Restart the system to autoload Gnome next.

sudo reboot



# Turn on auto-login for the rackmounted servers



# This can be done only if the systems are in a secure access location, and you need startup items such as a graphical XPU GPU/CPU based userland application to run. Not all GPU tools can be launched as system services in 2022.

# Firefox

In Firefox, right-click on the bookmark bar area at the top of the window. In the contextual popup menu, select the "[x] Menu Bar" item.



A menu bar should now be visible at the top of the Firefox window.

# Add 3rd Party Repositories

# Add the EPEL software repository.

sudo dnf install epel-release



# Import the signing key for the EPEL repository.

sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org



# Add the EL Repo software repository.

sudo dnf install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm



# Add the kernel headers

sudo dnf --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers -y --allowerasing



# Upgrade the Linux kernel from 4.x to 5.x

# sudo dnf upgrade --refresh -y



# Add the RPM Fusion repository free releases

sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm -y



# Add the RPM Fusion repository non-free releases

sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm -y

# Add Developer Tools

# Add C/C++ compiler tools

sudo dnf install gcc -y



# Add more compiler resources

sudo dnf groupinstall "Development Tools" -y

# Install NVIDIA Drivers on Linux

## NVIDIA Driver Install References

[https://www.linuxcapable.com/how-to-install-or-upgrade-nvidia-drivers-on-rocky-linux-8/](https://www.linuxcapable.com/how-to-install-or-upgrade-nvidia-drivers-on-rocky-linux-8/)

## Uninstall old NVIDIA drivers

sudo dnf remove nvidia-driver

sudo dnf module reset nvidia-driver

## Install NVIDIA Drivers

# Use the NVIDIA repo to source the GTX GPU drivers

sudo dnf update -y



sudo dnf config-manager --add-repo [https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo](https://developer.download.nvidia.com/compute/cuda/repos/rhel8/x86_64/cuda-rhel8.repo) -y



sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) --allowerasing -y



sudo dnf install nvidia-driver nvidia-settings -y

sudo dnf install cuda-driver -y



# Restart the workstation

sudo reboot now

## Troubleshooting Linux GPU Driver Issues

Question: Did the GPU setup get fully borked after the NVIDIA GPU Driver install?



If the NVIDIA driver install has issues, one can change the "Run Level" to a text console input mode to help with the recovery process using:



-   To switch the display over to a "Run Level 5" textual console view press the "Control + Alt + F5" keyboard hotkey.




-   To switch the display over to a "Run Level 6" graphical GNOME view press the "Control + Alt + F6" keyboard hotkey.




# Switch from a terminal session back to a gnome desktop session

startx

## NVIDIA Preferences

After the GPU Drivers are installed you get access to "nvidia-smi" and "nvidia-settings" as command-line tools:



# Check the GPU hardware stats from the terminal

sudo nvidia-smi



![[Pipeline Guide.img/Untitled_6.jpg]]



# Adjust the proprietary NVIDIA GPU driver and display properties

sudo nvidia-settings



![[Pipeline Guide.img/Untitled_7.jpg]]

## X11 / XORG Graphics Preferences

When running the "nvidia-settings" program, you should save the edited xorg settings back to disk at the following file path: "/etc/X11/xorg.conf"



# Create a backup of the current xorg file

sudo cp /etc/X11/xorg.conf  /etc/X11/xorg.conf.bak



# Verify the XORG preference file was backed up successfully

sudo ls -laX /etc/X11/xorg*

# Installing Linux Software

Make sure to check out the site "[pkgs.org](https://www.pkgs.org/)" when hunting for the right package for your current Linux distro. This site is a super efficient time saver when you need to locate the exact version matched with the RedHat .rpm package equivalent to a Ubuntu/Debian .deb package that might be listed in the documentation for a tool you need to install.



# Add disk utilities

sudo dnf install gparted sshpass -y

sudo dnf install sysbench hardinfo -y



# Add NFS storage support

sudo dnf install nfs-utils -y



# Add exfat and ntfs filesystem support

sudo dnf install exfatprogs -y

sudo dnf install exfat-utils -y

sudo dnf install fuse-exfat -y

sudo dnf install ntfs-3g -y



# Add media tools like vlc, ffmpeg, Imagemagick, and hugin

sudo dnf install vlc -y

sudo dnf install ffmpeg --skip-broken --allowerasing -y

sudo dnf install ImageMagick -y



# Add network file transfer clients

sudo dnf install filezilla -y



# Add the thunderbird email client

sudo dnf install thunderbird -y



# Add sshpass which is a Bash scripting friendly remote access tool

sudo dnf install sshpass -y



# Add dialog curl wget unzip zip unrar nano for shell scripting



# Add LuaJIT for scripting

sudo dnf install luajit -y



# Add xclip for clipboard copy/paste



# Add virtual environment tools:

# pip, py virtual environment, anaconda, rez



# Add nodejs, electron, shelljs, and moment



# Add OpenCV, GluonCV, OpenMMLab, MediaPipe, PyTorch, OpenColorIO, OpenImageIO, and Jupyter Notebook



# Add the NVIDIA GPU control software "Green With Envy" for memory timing, core clock speed, and fan control.



# Add the Intel OpenCL ICD Driver.

# Rocky Linux Control Panels



-   Users > Auto Login

-   Sound output

-   Unlink the Super/meta key so it doesn't affect Gnome.


-   Customize the desktop pattern.

-   Change the windows background color from a bright white shade to a neutral grey or dark theme


## Privacy Settings | Screen Lock

If you are in a shared office like working environment it can be useful to have the "Privacy" setting for "Screen Lock" enabled.



![[Pipeline Guide.img/Untitled_111.png]]



You can fully customize the Screen Lock features timer value using the "Lock screen after blank for X minutes" control.

### Screen Lock OFF



It's possible to select a very permissive value of Screen Lock "OFF" which could possibly be of use in a work-from-home based "home office" environment if you are doing XPU based GPU rendering and have physical access security for the workstations or render nodes.



![[Pipeline Guide.img/Untitled_112.png]]



### Screen Lock ON



If you are in a co-working space or traditional VFX Studio or a Design Boutique like shared office environment, you might go for a Screen Lock value of somewhere between 5 minutes to 30 minutes.



![[Pipeline Guide.img/Untitled_113.png]]

## Details > Users Settings | Automatic Login

If your XPU based render nodes are running in a locked "limited physical access" secured location, or a home-office environment, you might find some workflow benefits from enabling "Automatic Login".



This is relevant if some of your GPU rendering and image-based-modeling tools don't work particularly well when launched via a headless system service approach.



Needless to say, if you are in a large office-like environment with many people present, this is not a viable approach to even think about… 🤪



Once again, if your computer gear is in a limited access location then you might consider the following approach as possibly relevant to your pipeline needs:



Open the Rocky Linux "Settings > Details > Users" view. 



Then unlock the panel and turn on "Automatic Login".



![[Pipeline Guide.img/Untitled_114.png]]

# Linux Networking

# Disable SE Linux

# Open the /etc/selinux/config file and set the SELINUX mode to disabled.



sudo nano /etc/selinux/config



# Disable the firewall

sudo systemctl disable firewalld

sudo systemctl stop firewalld

sudo systemctl status firewalld



# Needs some work to update from Centos v7.9 to Rocky Linux v8.5

{

sudo systemctl enable rpcbind

sudo systemctl enable nfs-server

sudo systemctl enable nfs-lock

sudo systemctl enable nfs-idmap

sudo systemctl start rpcbind

sudo systemctl start nfs-server

sudo systemctl start nfs-lock

sudo systemctl start nfs-idmap

sudo systemctl restart nfs-server

}

# Gedit Text Editor

-   Gedit Preferences > View:

-   [x] Display line numbers

-   Gedit Preferences > View > Highlighting


-   [x] Highlight current line

-   [x] Highlight matching brackets


-   Gedit Preferences > Editor > Tap Stops > 2

-   Gedit Preferences > Fonts & Colors


-   Oblivion


-   [ ] use the system fixed width font (Monospace 11)

-   Editor font: Monospace Regular 18

-   Gedit Preferences > Plugins


-   [x] External Tools

-   [x] Python Console

-   [x] Quick Open

-   [x] Snippets

-   [x] Sort


# Linux Terminal App

Terminal > preferences > Colors > Text and Background Color



Built-in schemes: 

Green on black

# "Top" Process Viewer CLI App

## Set up the Top "IRIX" mode customizations

Launch top from the command-line using:

top



-   Press "z" for color

-   Press "E" for memory scale to GB

-   Press "e" several times to show memory of tasks as gb.

-   Press "i" for Irix mode - shorter list of active tasks - not used this time...

-   Press "d" 0.5 for faster updates

-   Press "t" 3 times to hide the top line tasks summary and show a progress bar

-   Press "f" to adjust sort order and columns

-   Sort by %CPU = select it by pressing right arrow and then press the s key on the keyboard


        %CPU

        %MEM

        RES

        PID

        USER

        COMMAND

-   Unselect items with spacebar for any remaining category

-   Press "q" to exit column order editing

-   Press "Shift + W" to write the prefs to disk


# Fix Folder Permissions:

If you are using the Rocky Linux system as a single-user visual workstation the following two commands can help fix headaches while you finish installing your core tools. Once the software you use day-to-day is configured you can then roll the permissions back to "755" or whatever value you feel is appropriate.



sudo chmod -R 777 $HOME

sudo chmod -R 777 /opt/

# Linux User Account Tweaks

# Login via a localhost based SSH shell connection as the user "root"

ssh root@localhost



# Login as the user "root"

sudo -u root -i



# Login as the user "vfx"

sudo -u vfx -i



# list the current folder path aka "put working directory":

pwd



# navigate to the "root" user's home folder

cd /root/



# Navigate to the "vfx" user's home folder

cd /home/vfx/



# Navigate to the current user's home folder (inside /home/) using the $HOME environment variable

cd $HOME/



# list the current folder contents

ls



# list folder contents

ls



# Install a specific RPM package (in this case named "SomePackage.rpm") that is found in the current folder

sudo rpm -Uvh SomePackage.rpm



# Install all of the RPM file files in the current folder

sudo rpm -Uvh *.rpm



# Alternative way to Install all of the RPM file files in the current folder

sudo rpm -i *.rpm



# Run "Visudo" to edit the Sudoers list so you can add new users to the list of admin accounts capable of running "sudo" in the terminal

sudo visudo



# Edit the Sudoer's list

# You need to start by pressing the "i" key to enable the VIM "insert mode" in the text editor to be able to add new lines of text to the document. Navigation is done by the up/down cursor keys. Add the following text, near the bottom part of the sudoers text file, to add a user account named "vfx" to the sudoers list:



vfx            ALL = (ALL) ALL



# The Visudo utility is VIM text editor based, so you will need to use some funky keypresses to save and exit visudo…



# Press the "Esc (escape)" hotkey. Then type in ":wq" to write the changes to disk, and quit the active Visudo (VIM) editing session. Then press the "Enter" hotkey to return to the Terminal.



# Install CentOS Linux 7.9 on a Bare Metal System

This part of the guide is here to help if you have an emergency on one of your computer systems and fixing the issue requires you to fully reload the operating system. This process can be scary the first few times you do it, especially if one has never performed a fresh install of CentOS Linux on a visual workstation or render node system.



In your BIOS settings, make sure USB based media is bootable. The USB boot media needs to be listed at the top of the "Boot Priority" dialog, in advance of the internal hard disk in the list. This allows the computer to start up using the external USB boot media as the primary operating system during the install process.

# Hard Drive Layout

EFI System Partition (EFI System Partition)

/boot/efi (EFI System Partition) 512 MiB

/  (ext4)

## Manual Partitioning

(x) I will configure partitioning



Click on the hard disk icon



Clicking on the (done) button will show partitioning options



Switch from "LVM" to the "Standard Partition" Type



(Click here to create partitions)



Remove the "Home" and "Swap" partitions with the "-" minus icon.



File System: EXT4



Click the "Done" button.



In the Summary of Changes window click "Accept Changes"

## User Account Creation

During the CentOS install process you are given the option to create an admin user account for the Linux system.



Add User: 

vfx



Enable the checkbox for the control labelled:

 "[x] make this user an admin"



Enable Automatic Login

sudo nano /etc/gdm/custom.conf



Overwrite the custom.conf file contents with:

# GDM configuration storage



[daemon]

AutomaticLogin=linuxconfig

AutomaticLoginEnable=True



[security]



[xdmcp]



[chooser]



[debug]

# Uncomment the line below to turn on debugging

#Enable=true

## Add 3rd Party Repositories

# Update CentOS:

sudo yum update



# Add the EPEL repository:

sudo yum install epel-release

sudo yum update



# Add the Nux repository:

sudo rpm -v --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro

sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm



# Add the elrepo repository for Linux hardware drivers:

sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

sudo rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm



# If you want to be able to read an ExFat  formatted USB drive you will need to add:

sudo yum install exfat-utils fuse-exfat

## Adjust the Security Settings

If you are running a render node system inside a LAN you will likely want to adjust the firewall rules and disable SELinux.



# Open the "/etc/selinux/config" file:

sudo nano /etc/selinux/config



# Set the SELINUX mode to disabled by changing the following SELinux line in the config file to read:

SELINUX=disabled



# Disable the firewall:

sudo systemctl disable firewalld

sudo systemctl stop firewalld

sudo systemctl status firewalld

## Change the Host Name

# Change the host name in Centos 7:

sudo gedit /etc/hostname



# You can also update the host name using:

sudo gedit /etc/sysconfig/network



# Look in the text file for the entry: 

localhost.localdomain



# Change this line to edit the host name value to something like:

R1



# Print the current host name:

echo The current host name is: uname -n



# Edit the hosts file:

sudo gedit /etc/hosts

127.0.0.1 R1 localhost

::1       R1 localhost localhost.localdomain localhost6 localhost6.localdomain6

## Add Developer Tools

# Add the GCC compiler

sudo yum install gcc



# The NVIDIA installer requires the GCC compiler tools

sudo yum -y groupinstall "Development Tools"



# NVIDIA installer requires kernel source files

sudo yum install kernel-devel



# Install more libraries to satisfy the NVIDIA installer

sudo yum install pkgconfig libglvnd-devel



# The dkms package package will ensure continuous NVIDIA kernel module compilation and installation in the event of new Linux kernel update.

sudo yum -y install dkms

## Install the Cinnamon Window Manager

# Install the GTK theme engine Murrine that is used by gedit, and the installers for Maya / V-Ray

sudo yum install gtk-murrine-engine



# Install lshw

sudo yum install lshw



# Install Cinnamon

sudo yum --enablerepo=epel -y install cinnamon*



# Add Cinnamon to your rc file

echo "exec /usr/bin/cinnamon-session" >> ~/.xinitrc



# Start the X Desktop session

startx



To change the active Linux window manager, you need to log out of the current user account session. 



On the login window, set Cinnamon as your active window manager by clicking on the "gear wheel" icon and selecting Cinnamon.



Log back into your user account.



## Install the NVIDIA Drivers for CentOS Linux



NVIDIA RTX 3090 Linux CentOS Driver webpage:

[https://www.nvidia.com/Download/driverResults.aspx/172376/en-us](https://www.nvidia.com/Download/driverResults.aspx/172376/en-us)



# Direct Driver Download Link:

cd $HOME

wget https://us.download.nvidia.com/XFree86/Linux-x86_64/460.73.01/NVIDIA-Linux-x86_64-460.73.01.run



# The Nvidia drivers must be installed while the xorg server is stopped. Switch to text mode, or run this via ssh:



systemctl isolate multi-user.target



# Alternatively you can terminate the xserver session which is the hard core route



sudo killall /usr/bin/X



# You can start linux in a text console using the Control + Alt + F2 hotkey after you have logged out of the user session



# Install the drivers (the name of the executable would have to line up with the exact driver version you downloaded)



cd $HOME

sudo sh ./NVIDIA-Linux-x86_64-460.73.01.run



The NVIDIA installer options you want to select are:



DMKS (yes)



The NVIDIA installer asks if you want to install 32 bit libraries (yes)



The NVIDIA installer asks about libglvnd (install and overwrite existing)



The NVIDIA installer asks about auto update X configuration file? (yes)




If you are running the default Nouveau graphics drivers on CentOS when you run the NVIDIA installer, you will likely see a message that says:



ERROR: The Nouveau kernel driver is currently in use by your system.  This driver is incompatible with the NVIDIA driver, and must be disabled before proceeding. Please consult the NVIDIA driver README and your Linux distribution's documentation for details on how to correctly disable the Nouveau kernel driver.



# You can then disable nouveau driver by changing the configuration "/etc/default/grub" file. Add the entry "nouveau.modeset=0" to the line starting with GRUB_CMDLINE_LINUX. 



sudo nano /etc/default/grub



# Below you can find example of grub configuration file reflecting the previously suggested change: 



GRUB_TIMEOUT=5

GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"

GRUB_DEFAULT=saved

GRUB_DISABLE_SUBMENU=true

GRUB_TERMINAL_OUTPUT="console"

GRUB_CMDLINE_LINUX="rhgb quiet nouveau.modeset=0"

GRUB_DISABLE_RECOVERY="true"



# You can optionally remove the "quiet" entry on "GRUB_CMDLINE_LINUX" to be able to see startup messages for issues like missing drive automounts.



# The GRUB changes ensure that the open-source nouveau graphics driver is disabled the next time you boot your CentOS 7 Linux system. Once ready execute the following command to apply the new GRUB configuration change: 



# If you are running a legacy BIOS system:

sudo grub2-mkconfig -o /boot/grub2/grub.cfg



# If you are running an EFI based system:

sudo grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg



# Reboot your CentOS 7 Linux System.

sudo reboot



# Once the boot is finished confirm that the nouveau open-source graphics driver is no longer in use:



lshw -numeric -C display



# WARNING: you should run this program as super-user.

#   *-display UNCLAIMED       

#        description: VGA compatible controller

#        product: GK208B [GeForce GT 710] [10DE:128B]

#        vendor: NVIDIA Corporation [10DE]

#        physical id: 0

#        bus info: pci@0000:01:00.0

#        version: a1

#        width: 64 bits

#        clock: 33MHz

#        capabilities: vga_controller bus_master cap_list

#        configuration: latency=0

#        resources: iomemory:6970-696f iomemory:6970-696f memory:ca000000-caffffff memory:69738000000-6973fffffff memory:69740000000-69741ffffff ioport:3000(size=128) memory:cb000000-cb07ffff

# WARNING: output may be incomplete or inaccurate, you should run this program as super-user.




# Install the Mesa utils package if you want to be able to run the glxgears and glxinfo programs.

sudo yum install mesa-demos.x86_64



# If you would like to have OpenCL v1.2 you will need to add extra repos before you can install the following package

sudo yum install ocl-icd ocl-icd-devel



# To make OpenCL run with programs like Blackmagic Fusion Studio happy, you might need to create this symlink

sudo ln -s /usr/lib64/libOpenCL.so.1 /usr/lib/libOpenCL.so



# Get the OpenGL info (No info is shown when run via ssh with no display)

glxinfo | less

## Green With Envy GPU Utility

The "Green with Envy" utility can be used to help control the GPU fan speed, and the memory/core timing. This will ensure you get reliable performance when GPU rendering. 



This utility works best in systems with only a single NVIDIA GPU installed. The Cinnamon window manager can sometimes freak out with Linux "kernel panic" system lockups if you have multiple GPUs active.



# Toggle the prefs for all GPUs connected:

sudo nvidia-xconfig --enable-all-gpus

## Gnome Settings

-   Disable Screensaver

-   Enable Automatic Login


## Gnome Hotkeys

To allow the Autodesk Maya user interface to function correctly, we need to unbind the ALT key in GNOME. This makes it possible to move windows and interact with views in a consistent fashion.



Open the "System Settings >  Window > Behaviour" tab. Change the "special key to move and resize windows" setting so it is disabled.



It is handy to add a "Control + Alt + t" shortcut that will display a new terminal window.



Go to "System Settings > keyboard > Shortcuts tab > Custom Shortcuts"



Click on the "+" button.



Name: Terminal Shortcut

Command: gnome-terminal



Now a new shortcut is added with status "disabled". Click on the "disabled" word and assign your shortcut.



I prefer "Control + Alt + t" to run Terminal but you can customize this hotkey binding to meet your needs.

## Common Linux Utilities

At this point you could add several extra Linux utilities.



# As a quick tip, this is how you install an RPM package file via the terminal window:

sudo rpm -ivh example.rpm



# Add the nano text editor if it is missing on a minimal install of Centos 7

sudo yum -y install nano



# Add disk management / filesytem packages

sudo yum install -y gparted nfs-utils exfat-utils.x86_64 fuse-exfat.x86_64 kmod-hfsplus.x86_64 kmod-hfs.x86_64



# Add network packages

sudo yum install -y sshpass filezilla tigervnc



# Add general utilities

sudo yum install -y sysbench hardinfo

sudo yum install -y ImageMagick hugin wget vlc mplayer

sudo yum install -y xclip unzip 



# Add Redhat compatibility libraries

sudo yum install -y redhat-lsb-core



# Add the X11 utils and fonts

sudo yum -y install libXp xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi liberation-mono-fonts liberation-fonts-common liberation-sans-fonts liberation-serif-fonts



# Add and enable the NFS server package

sudo yum install -y nfs-utils

sudo systemctl enable rpcbind

sudo systemctl enable nfs-server

sudo systemctl enable nfs-lock

sudo systemctl enable nfs-idmap

sudo systemctl start rpcbind

sudo systemctl start nfs-server

sudo systemctl start nfs-lock

sudo systemctl start nfs-idmap

sudo systemctl restart nfs-server



# Add libraries to support media tools

sudo yum install -y mesa-libGLw libXp gamin audiofile audiofile-devel e2fsprogs-libs tcsh xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi liberation-mono-fonts liberation-fonts-common liberation-sans-fonts liberation-serif-fonts glx-utils libpng12 mesa-libGLU libXpm libtiff libXcomposite gstreamer1 gstreamer-plugins-base gstreamer1-plugins-base ffmpeg



sudo yum install -y libXScrnSaver

## Solve Package Manager Issues on CentOS



# Clean up after a cancelled yum -y install:

yum-complete-transaction --cleanup-only



# Check the repos folder

sudo nautilus /etc/yum.repos.d/



# Clear the yum cache:

sudo nautilus /var/cache/yum/



# Clear any missing repo files

sudo rpm -Va --nofiles --nodigest

sudo yum -y update --skip-broken



Installing Data Backup and Disaster Recovery Tools





# Balena Etcher

A cross-platform compatible bootable Linux OS disk image cloning tool.

[https://etcherofficial.com/](https://etcherofficial.com/)



# ![[Pipeline Guide.img/Balena Etcher.png]]Rescuezilla Bare Metal Disk Imaging, Backups and Restores

## Install Rescuezilla

Step 1. Go to the [Rescuezilla](https://rescuezilla.com/download) download page, and download the "rescuezilla-2.3.1-64bit.impish.iso" file to disk.



Step 2. Download and Install [Balena Etcher](https://www.balena.io/etcher/), or a similar disk image recording tool.



Step 3. Use Balena Etcher to record the "rescuezilla-2.3.1-64bit.impish.iso" to an external USB thumbstick or memory card.

## Disk to Disk Clone

A 500gb NVME can be copied disk to disk in 5 minutes with [Rescuezilla](https://rescuezilla.com/). This tool is a GUI and mouse driven version of the earlier text console based [Clonezilla](https://clonezilla.org/clonezilla-live.php) bootable disk management and backup utility.



Boot windows once and then choose restart to switch over to rescuezilla. This removes the windows hibernation file.



In gparted, if a small partition is spaced out at the far end of the disk you need to use the "move partition" function to bring the selected disk partition inwards, towards the left of the active disk partitions, to be able to fully shrink down a large ext4 or NTFS formatted NVME's storage space usage. This allows you to clone the data onto a smaller hard disk.



You can't resize a partition larger if the "free space" zone is sandwiched on the opposite side of another partition block. In that case, you can slide/move the partition you don't need to make larger, out of the way, to the far right end of a disk.

### Rescuezilla Workflow Essentials

-   Move the server to a workbench.

-   Insert the Rescuezilla usb thumbdrive media.

-   Turn on the render node.

-   Press F11 to switch the OS selection over to boot Windows. Restart immediately to Linux Rescuezilla so there is no hibernation image

-   Press F11 at boot to switch the boot OS to Rescuezilla.

-   Select "English" language

-   Select "Graphical Fallback Mode"

-   Using gparted, move the blocking partitions out of the way, then resize the data partitions smaller to fit on a smaller drive.

-   Rescuezilla - clone big disk to smaller disk

-   Using gparted, expand the data partition on cloned drive

-   Shutdown the render node and remove the large NVME, and the Rescuezilla USB thumbdrive media.

-   Turn on the render node

-   Press delete at BIOS and set the boot volume to the 500 GB NVME system.

-   Wait 1 minute from power on for the 10G ethernet to power up and for the OS to finish booting.

-   Restart Windows once to check everything is working as expected.

-   Power off the server and insert the HDMI dummy video adapter dongle.

-   Redeploy the server back to regular operations in the rack.




# Linux BootRepair Utility

If you have issues after installing, upgrading, or cloning a BIOS or UEFI based Linux GRUB bootloader setup you might need to use the BootRepair utility to help fix broken Linux boot configurations. It is available in most Linux Software Manager utilities. 



Yes, it is also possible to carry out the same commands fully from a terminal session, but sometimes late in the night between midnight to 2AM when GRUB most often fails on you, it might be nice to have a Live Image of a Linux distro on a USB thumbdrive along with a Boot-Repair GUI available to try and fix things.



![[Pipeline Guide.img/BootRepair.png]]

# Installing the Canister LTO Backup Tool

Hedge Canister is a macOS based LTO tape backup program that makes creating long-term offline backups easy and reliable. It works with SAS + Thunderbolt connected tape drives on macOS Intel and ARM64 compatible systems.



[https://hedge.video/canister](https://hedge.video/canister)



![[Pipeline Guide.img/Canister LTO Backup.png]]



This is what a typical LTO SAS tape drive looks like. This unit is an HP Enterprise Ultrium drive in an external enclosure. It has SAS connectors on the back that are used to connect to a file server. 



![[Pipeline Guide.img/Ultrium_Tape_Drive_1.jpg]]



When choosing hardware, it is handy to know that Apple macMini systems make a very affordable macOS based host for an LTO drive. You will want to add 10Gb Ethernet to the macMini via a Thunderbolt solution if the computer doesn't natively have 10Gb Ethernet onboard.



If you need to connect a SAS based LTO tape drive to a macOS based host system you can use an OWC Mercury Helios 3 Thunderbolt 3 PCIe enclosure to host an ATTO SAS based PCIe card. It takes a bit of research to gather all the required cabling and SAS adapters if you haven't used gear with the SAS protocol before.



![[Pipeline Guide.img/Ultrium_Tape_Drive_2.jpg]]



LTO Tapes have a long archival shelf-life if stored according to manufacturer's instructions in the proper environmental conditions. LTO tapes are typically ordered in box sizes of 5-tape cartridges at a time.



![[Pipeline Guide.img/LTO_Tapes_in_Boxes.jpg]]



System Admin Resources

# System Admin Community Sites

The system admin and pipeline TD staff in the entertainment sector monitor the Slack channels of the following two sites:

StudioSysAdmins

[http://www.studiosysadmins.com](http://www.studiosysadmins.com/)

Academy Software Foundation (ASWF)

[https://www.aswf.io](https://www.aswf.io/)

[https://www.aswf.io/join/](https://www.aswf.io/join/) (Slack Channel Signup)

# Security Policies

Any studio that is an MPAA (Motion Picture Association) member will have signed onto the TPN (Trusted Partner Network) agreement. This process defines the best practices and security policies for all companies and vendors in the entertainment sector.

[https://www.ttpn.org](https://www.ttpn.org/)

# VFX Reference Platform

Film & TV industry focused post-production software tries to match the software library dependency requirements set out in the "VFX reference platform" document which is aligned to a specific calendar year.

[http://vfxplatform.com](http://vfxplatform.com/)

This guide is prepared and maintained by the VES (Visual Effects Society).

[https://www.vesglobal.org](https://www.vesglobal.org/)

What the VFX reference platform does is spell out the compatibility needs (primarily relevant for Linux releases) of entertainment industry tools so they can be used inside a larger production environment without "clashes occurring" between each of the apps.

This reference platform guide spells out very specific requirements for the precise host OS and library versions used to compile software.

Closing Thoughts

By the time you reach this point in the pipeline integration guide, you should have a better understanding of the many tools, technologies, and customization options available to freelancers and small studios working in the media creation and post-production space.



If you set up an efficient workflow for your projects from the beginning, you will be able to maintain your team’s productivity and get the most out of the hardware and software resources available to you.

**