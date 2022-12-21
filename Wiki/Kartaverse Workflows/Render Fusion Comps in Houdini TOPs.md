---
tags: [export, export-scrivener, revise]
xself: 'Render Fusion Comps in Houdini TOPs'
xhead: 'Kartaverse Workflows'
xtail: 'KickAss ShaderZ for Fusion'
xprev: 'Creating ST Maps'
xnext: 'SketchFab in VR Via QuestLink'
---

Created 2021-11-12 Last Updated 2022-08-01 10.47 PM UTC -4

By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

### Overview {#ref1}

Overview

The following guide lists the essential steps required to set up a new [Houdini TOPs](https://www.sidefx.com/products/pdg/) "Task" that renders a folder of Fusion .comp files. This rendering process is done using command-line approaches that rely on Blackmagic Design's Fusion Studio and the included Fusion Render Node executable.

Houdini [TOPs](https://www.sidefx.com/docs/houdini/tops/intro.html) based node graphs provide an exciting new way to tame complex workflows that require multiple linked dependent tasks. This approach has the potential to be the ultimate workflow automation "glue" to unify post-production tasks for processes running across artist workstations, local render farms, cloud computing systems, and even for assisting with general purpose task scheduling.

### Software Required {#ref2}

Software Required

To follow along with this workflow you need to have the following programs installed:

-   ![[Kartaverse Workflows.img/image36__DOCFIX3.png]]SideFX Houdini (Apprentice/Indie/Core/FX)

-   ![[Kartaverse Workflows.img/image30__DOCFIX3.png]]BMD Fusion Studio/Fusion Render Node

### TOPs Workflow

TOPs Workflow

#### Part 1

Part 2

Overview

Part 2 will expand on the initial concepts presented, and explain at an overview level, how it is possible to create several more TOPs nodes that will remotely control a Fusion Studio compositing session using FuScript and the "fusion:DoAction()" and "comp:DoAction()" functions. This is an interesting concept as it allows you to run Fusion actions external to the app.

![[Kartaverse Workflows.img/image20.png]]

The TOP nodes in this example use a Fusion Studio GUI session to create a new Fusion comp, add a NyanCat macro (provided by the Reactor package manager), add a Saver node and define the Clip Filename, then the .comp file is saved to disk.

Next the composite is rendered in the background using the Fusion Render Node executable from the command-line via a Generic Generator TOPs node.

![[Kartaverse Workflows.img/image32.png]]

Nodes, Connections, and Attributes

To make this process happen, first a Comp_New action is run to create the new empty Fusion composite session.

This was created like all of the other "DoAction" TOPs described below via a custom subnet. The subnet exposes two elements in the GUI that an artist/TD can interact with called "Action Name" and "Action Parameters".

This specific subnet was customized to use "fusion:DoAction()" so it ran the Comp_New command in the Fusion wide scope, instead of targeting a comp specific scope like the other action based subnets do below.

![[Kartaverse Workflows.img/image2__DOCFIX1.png]]

To run an action inside of Fusion Studio the following custom TOPs subnet was created using a combination of an "[Attribute Create](https://www.sidefx.com/docs/houdini/nodes/top/attributecreate.html)" node to define our own set of ActionName and ActionParams attributes, along with a "[Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html)" node that makes use of these attributes when talking with Fusion Studio:

![[Kartaverse Workflows.img/image24.png]]

The "Generic Generator" node is used to pass the previously defined \`@ActionName\` and \`@ActionParams\` attributes into the command-line based [FuScript executable session](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964).

[FuScript allows you to bind](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498) locally, or over a LAN network connection to BMD tools like Fusion Studio, Fusion Render Node, Fusion Render Manager, Resolve, and Generation.

![[Kartaverse Workflows.img/image3.png]]

The AddSetting action was used to specify the name of a Fusion Macro .setting file that will be added to the current Fusion Studio session. PathMaps can be used in the Filename attribute here and they will be expanded by Fusion automatically to the full filepath required.

![[Kartaverse Workflows.img/image18__DOCFIX1.png]]

📝**Note:** Using Pathmaps, where possible, makes Fusion scripting tasks cross-platform compatible with low effort.

📝**Note:** Enter the following text into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fuscript.exe" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for macOS):**

"/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

In the next step, the selected node is loaded into Fusion Studio's Viewer 1 context using the Tool_ViewOn action.

In this case the NyanCat macro will be shown on screen.

![[Kartaverse Workflows.img/image17__DOCFIX1.png]]

Next the Execute action will be used to lock the comp viewer session so file dialogs won't be shown by running a snippet of Lua code inside of Fusion Studio. One small detail is that you need to grab the current comp context when using the Execute action or you will otherwise see an error printed out in the results.

![[Kartaverse Workflows.img/image11.png]]

The AddTool action is used to add a Saver node to the comp. The previous step locked the viewer window so the Saver node's empty Filename field won't spawn a file dialog that would need direct user interaction to occur.

![[Kartaverse Workflows.img/image26.png]]

Now the viewer window is unlocked with another Execute action. This allows Fusion's file dialogs to work as expected during the rest of the compositing session. This will make the Fusion GUI session easier to use when testing and debugging code you are running.

![[Kartaverse Workflows.img/image7.png]]

Finally an Execute action is used to rename the Filename attribute for the currently selected node, which in this case is the Saver node.

📝**Note:** With the Create Attribute node it's possible to use Houdini environment variables and have them expanded automatically when they are evaluated and passed over to Fusion Studio via FuScript.

In this case the \`\$HIP\` token dynamically gives us the base Houdini project folder path on disk, which can be combined as a string with the "render" folder name, where Fusion will save the comp's rendered imagery too.

![[Kartaverse Workflows.img/image1__DOCFIX2.png]]

We are using the \`\$HIP\` environment variable again to tell Fusion Studio where the current foreground Fusion .comp file should be saved to.

This composite saving task is done using the Comp_Save action along with manually defining the name parameter.

![[Kartaverse Workflows.img/image6.png]]

In this next step, we are reusing the FusionRenderNode based command-line TOPs rendering approach that was first shown in Part 1 of the "Render Fusion Comps in Houdini TOPs" guide.

The only major difference here from what was shown in Part 1, is that these nodes were put into a subnet, and the File Pattern node's "Value" parameter was exposed in the Houdini UI.

These exposed controls make it easier to interact with the FusionRenderNode subnet in a more modular fashion.

![[Kartaverse Workflows.img/image5.png]]

A final "Wait for All" TOPs node was used at the end of the TOPs node graph to keep the ordering of the work unit tasks tidy.

![[Kartaverse Workflows.img/image23__DOCFIX2.png]]

This is a cropped view of what the final TOPs node graph looks like after it is cooked (rendered). If the process was successful, then green check-marks are shown next to each stage.

![[Kartaverse Workflows.img/image22__DOCFIX1.png]]

Well, that was something of an interesting, yet geeky, ride through the world of TOPs network creation and interconnecting Fusion into the mix.

Resolve Studio FuScript Linking Tips

📝**Note:** The same base concepts presented here to control Fusion Studio centric workflows can also be used to automate Resolve Studio workflows from Houdini TOPs via FuScript too.

This can be done by specifying the Resolve SubType when connecting to the app using FuScript, which also provides a way to have direct access to the built-in Resolve API functions via Lua or Python scripting.

📝**Note:** If you want to configure a "Generic Generator" TOP node so it connects to a Resolve Studio instance to access Resolve API functions, while being able to send "DoAction" tasks to the Resolve Fusion page, then the following text should be used as a starting point for your learning efforts. Enter one of the strings below into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\DaVinci Resolve\\fuscript.exe" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for macOS):**

"/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

\*If you explore this approach IRL, at some point you may have to peek into the "[Fusion Comp Link](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.FusionCompLink/Scripts/Comp/Andrew%20Hazelden/Fusion%20Comp%20Link.lua)" Lua script for more [FuScript SubType](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828) parameter insight for an Interactive vs Fusion vs Resolve session. You can also specify a timeout value, a unique UUID value for the copy of Resolve/Fusion that is running, and even a remote host's IP address to connect to, if the other Resolve/Fusion system is connected on your local LAN network, too.

📝**Note:** You also have to make sure that you are running a copy of Resolve Studio, as a copy of Resolve Free doesn't provide command-line access to FuScript and the Resolve process. The next step is to verify that you adjusted the "Resolve Preferences \> System \> General \> External scripting using" preference so it is set to the "Network" option.

(By default external scripting access is disabled on a fresh Resolve install... which typically results in a lot of wasted time spent troubleshooting issues when you first start to explore command-line based Resolve automation techniques.)

![[Kartaverse Workflows.img/image35__DOCFIX1.png]]

Fusion Action/Event Scripting Resources

📝**Note:** The [Action Listener](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Listener.lua) script provided by the Reactor Package manager's "UI Manager Lua & Python Examples" atom package for Fusion/Resolve is a great way to see actions at work from inside of your compositing application.

It's possible to print out a list of the actions present inside of Fusion with the handy "[Action Printout](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Printout.lua)" script.

You can also learn a lot about the Fusion API from the "[Fusion Script Help Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/FusionScript%20Help%20Browser.lua)" example. Additionally, Roger Magnusson's "[Class Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.RogerMagnusson.ClassBrowser/Scripts/Comp/Roger%20Magnusson/Class%20Browser.lua)" is another essential scripting tool for Fusion/Resolve.

📝**Note:** If you want to peek into the Actions that are connected to the default hotkeys in Fusion take a look at the "[The Ultimate Listicle of Actions and Hotkeys](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39238&fbclid=IwAR0X6aVCmAgTo2DGKef07Pzi7aVBJDbKcgEwSGo25XUvEObetcBeNCYJwRo#p39238)" post on the WSL forum.

📝**Note:** A general introduction to Actions and Events can be found on the following WSL forum scripting posts:

-   [Events/Callbacks in Python](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25533#p25533)
-   [Running Python Code in an Event](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25577#p25577)
-   [Common Variables Found in a .fu Event Execute Scope](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25596#p25596)
-   [Using AddNotify() in Fusion to Respond to Actions](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11029#p11029)
-   [FusionCompEvents.fu](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=13820#p13820)
-   [RandomizeNodeColors.fu Event Example](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12443#p12443)
-   [Automatically Display the Selected Node in the Viewer Window](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17494#p17494)
-   [.fu Based Contextual Menus - Python Print Attributes](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25590#p25590)
-   [Using a Script to Add Macros to a Comp](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17822#p17822)
-   [Resolve Scripting Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=15578#p15578)
-   [Python Script Snippets for Fusion TDs](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11955#p11955)
-   [Running Python Scripts in FuScript](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964)
-   [Running UI Manager GUIs from a Terminal FuScript Session](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498)
-   [Menu configuration in Fusion 8.1](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11921#p11921)
-   [FuScript Subtype Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828)
-   [Fusion Comp Link Atom](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=16996#p16996)
-   [Hypertext Compositor - An Interactive Documentation & Walkthrough Tool for Compers](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=23827#p23827)

##### Step 1.

Step 1.

Create a new Houdini project folder.

![[Kartaverse Workflows.img/image15__DOCFIX6.png]]

##### Step 2.

Step 2.

Place several Fusion .comp files inside the Houdini project folder's "comp" sub-folder. For this example I've created two comp files in Fusion Studio that are named "Fusion1.comp" and "Fusion2.comp".

![[Kartaverse Workflows.img/image13__DOCFIX4.png]]

📝**Note:** Don't forget to customize your Fusion .comp files so the Saver nodes will render the media into the current Houdini project folder's "render" sub-folder.

##### Step 3.

Step 3.

Create a new Houdini .hip/.hiplc/.hipnc file for this exercise.

Use the Houdini desktop manager menu item (found at the top of the Houdini UI next to the menu bar) to change the desktop mode to "TOPs". This will modify the view layout for a TOPs optimized working environment.

![[Kartaverse Workflows.img/image28__DOCFIX1.png]]

##### Step 4.

Step 4.

Press the **Tab** key in the Tasks context, and start typing the node name. A list of the [TOP nodes](https://www.sidefx.com/docs/houdini/nodes/top/index.html) that are available will be displayed.

![[Kartaverse Workflows.img/image33__DOCFIX2.png]]

For this project you will need to individually create each of the following TOP nodes listed below. The required parameters that have to be customized are also listed below, too.

After you add the nodes, you will need to connect each node to the subsequent node that follows immediately after it. Doing this will create a single vertical branch of nodes. This node graph represents your first Fusion-centric Houdini TOP network.

![[Kartaverse Workflows.img/image14__DOCFIX2.png]]

Add the Node: [File Pattern](https://www.sidefx.com/docs/houdini/nodes/top/filepattern.html) (Rename it to: ListComps)

![[Kartaverse Workflows.img/image29__DOCFIX2.png]]

**File Types:**

Files Only

**Pattern:**

\$HIP/comp/\*.comp

**Work Item:**

\[ **\] Include Extension in Filename Attribute**

**\[x\] Split Files into separate items**

**\[x\] Output File Tag:**

filename

📝**Note:** The "filename" tag we defined here can be accessed in downstream nodes by adding the parameter name \`@filename\` to any text field.

📝**Note:** We unchecked the "Include Extension in Filename Attribute" so the individual .comp files would be listed without the file extension. This made it easier to write out a per-task render log file with a customized filename in the Generic Generator node.

Add the Node: [Environment Edit](https://www.sidefx.com/docs/houdini/nodes/top/environmentedit.html) (Rename it to: NoPy)

![[Kartaverse Workflows.img/image21__DOCFIX2.png]]

\[x\] **Variable Name:**

PYTHONHOME

**Variable Type:**

String

**Existing Name:**

Replace Existing Variable

**Value:**

(Leave this field blank with nothing typed in the text field.)

\[x\] **Variable Name:**

PYTHONPATH

**Variable Type:**

String

**Existing Name:**

Replace Existing Variable

**Value:**

(Leave this field blank with nothing typed in the text field.)

📝**Note:** The EnvironmentEdit node is useful for clearing out the pre-existing Python 2.7 based Hython shell env variables so the FusionRenderNode process will be happy.

If you don't add an EnvironmentEdit node before the Generic Generator, you would need to prefix the Fusion Render Node launching Generic Generator command string with: set PYTHONHOME= & set PYTHONHOME= &

Add the Node: [Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html) (Rename it to: FusionRenderNode)

![[Kartaverse Workflows.img/image27__DOCFIX1.png]]

\[x\] **Sequential**

**Item Count:**

1

**Specify Using:**

Custom String

**Command (for Windows):**

    "C:\Program Files\Blackmagic Design\Fusion Render Node 17\FusionRenderNode.exe" "$HIP/comp/`@filename`.comp" /render /log "$HIP/comp/`@filename`_log.txt" /cleanlog /verbose /status /quit

**Command (for macOS):**

    "/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node" "$HIP/comp/`@filename`.comp" -render -log "$HIP/comp/`@filename`_log.txt" -cleanlog -verbose -status -quit

**Command (for Linux):**

    "/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode" "$HIP/comp/`@filename`.comp" -render -log "$HIP/comp/`@filename`_log.txt" -cleanlog -verbose -status -quit

\[x\] **Run Command in System Shell**

📝**Note:** It looks like the "Run Command in System Shell" checkbox needs to be enabled if you want the "@filename" parameter to be parsed correctly inside the Command string.

📝**Note:** You can limit a render to a specific frame range using "start" and "end" flags when launching the Fusion Render Node executable. This is done by appending this text to the middle of your Command string:

**Render a single frame:**

/render /start 0 /end 0

**Render a 144 frame long sequence:**

/render /start 1 /end 144

📝**Note:** Fusion Render Node supports the following command line flags:

(*On Windows the flags are defined with slashes, while on Linux and macOS you can use dashes in place of the slashes for each flag you specify.*)

![[Kartaverse Workflows.img/image16__DOCFIX1.png]]

Add the Node: [Environment Edit](https://www.sidefx.com/docs/houdini/nodes/top/environmentedit.html) (Rename it to: ResetPy)

![[Kartaverse Workflows.img/image31__DOCFIX4.png]]

\[x\] **Reset Environment**

📝**Note:** This node is used to restore the default environment variable settings.

In the previous step, we had overridden the PYTHONHOME and PYTHONHOME entries to blank them out. This node will help us revert the values of those modified environment variables back to their standard setting.

Add the Node: [Wait For All](https://www.sidefx.com/docs/houdini/nodes/top/waitforall.html)

![[Kartaverse Workflows.img/image19__DOCFIX2.png]]

📝**Note:** This node is useful as it will pause any additional downstream tasks until all of the Fusion comps are rendered to disk.

##### Step 5.

Step 5.

Enable the orange colored "Output" parameter which is on the right side of the "Wait For All" node shape. The "Output" parameter makes this node the final output stage for the current Tasks rendering process.

![[Kartaverse Workflows.img/image12__DOCFIX1.png]]

At the top of the tasks view, there is a triangle-shaped "play" button with a little orange colored block next to it. Press that button to cook (render) the current TOPs node graph. This will batch render the node tree you have created.

![[Kartaverse Workflows.img/image34__DOCFIX3.png]]

Alternatively, you can right-click on a node and select the "**Dirty and Cook This Node**" menu item to re-process it. This action has a keyboard shortcut of **Shift+V**.

![[Kartaverse Workflows.img/image9__DOCFIX2.png]]

Once the TOPs network has been generated and cooked, the Task Graph Table will show diagnostics information about the whole rendering process. The Task Graph Table is visible at the bottom right of the TOPs view layout.

![[Kartaverse Workflows.img/image25__DOCFIX1.png]]

##### Step 6.

Step 6.

In the Task Graph Table you can double-click on the "Cooked" heading entry in the tree list to see debugging information about each node's output. This can help you diagnose issues and see the individual pieces of information, like the Generic Generator node's command-line feedback results in the log section.

![[Kartaverse Workflows.img/image8__DOCFIX4.png]]

Also, if you click the small green circles shown on any TOPs node in the topnet graph, it will filter the results displayed in the Task Graph Table to show you the output for a specific work unit.

![[Kartaverse Workflows.img/image4__DOCFIX8.png]]

Step 7.

Since we have cooked the TOPs graph, and each of the specified Fusion comps have been rendered to disk, we can now review the Fusion Render Node verbose logging information saved for each comp file.

![[Kartaverse Workflows.img/image10__DOCFIX3.png]]

This information was exported to disk because the Generic Generator node had the following flags present as part of the Command string:

/log "\$HIP/comp/\`@filename\`\_log.txt" /cleanlog /verbose

This logging flag results in two text files being created for our Fusion comps:

\$HIP/comp/Fusion1_log.txt

\$HIP/comp/Fusion2_log.txt

An example copy of the log file output is included below. This logging information can help you spot issues like Fusion plugins not loading, GPU rendering headaches, or other error states which could cause a render to fail.

------------------------------------------------------------------------

Starting Fusion Render Node 17.4.1 at 12/Nov/21 13:53:02

C:/Program Files/Blackmagic Design/Fusion Render Node 17\\FusionRenderNode.exe

------------------------------------------------------------------------

Loading Plugins

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Creating GPU context on CUDA device: GeForce RTX 3090

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fusionoperators.dll

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fusionformats.dll

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\CinemaRaw\\cinemaraw.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\alembic.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\directshow.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\dimension.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\dds.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\bins.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\3d.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\fbx.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\mxf.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\fuses.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\paint.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\opencolorio.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\openfx.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\particles.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\quicktime.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\text.plugin

Loading plugin C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\Plugins\\Blackmagic\\utilities.plugin

Checking for licenses...

Adding Global App Events

Initialising all geometry caches

Initialising GLTools

Initialising Texture Manager

Starting GraphicsThread

Loading Comp at E:\\Projects\\Houdini_TOP\\comp\\Fusion1.comp

Rendering Comp, frames 0, step 1

Showing Status

Render started at Fri 1:53PM (Range: 0.0 to 0.0)

Rendered frame 0 (1 of 1), took 0.270316 secs

Render completed successfully at Fri 1:53PM - Total Time: 0h 0m 0.27s, Average: 3.70 frames/second

Auto-exiting with errcode 0

Cleanup licenses

##### Process Complete

Process Complete

Congrats for making it this far into the tutorial! This topic can be intimidating for artists new to Houdini TOPs usage but with a little practice you can come up with novel use cases for a hybrid Houdini + Fusion centric workflow.

Example workflows you could explore with TOPs approaches might include using Houdini to automatically slice and render a voxel based VDB volumetric dataset into a "contact sheet" like tiled grid image layout which can then be used inside Fusion's VolumeFog node.

#### Part 2

Part 2

##### Overview {#ref3}

Overview

Part 2 will expand on the initial concepts presented, and explain at an overview level, how it is possible to create several more TOPs nodes that will remotely control a Fusion Studio compositing session using FuScript and the "fusion:DoAction()" and "comp:DoAction()" functions. This is an interesting concept as it allows you to run Fusion actions external to the app.

![[Kartaverse Workflows.img/image20.png]]

The TOP nodes in this example use a Fusion Studio GUI session to create a new Fusion comp, add a NyanCat macro (provided by the Reactor package manager), add a Saver node and define the Clip Filename, then the .comp file is saved to disk.

Next the composite is rendered in the background using the Fusion Render Node executable from the command-line via a Generic Generator TOPs node.

![[Kartaverse Workflows.img/image32.png]]

##### Nodes, Connections, and Attributes

Nodes, Connections, and Attributes

To make this process happen, first a Comp_New action is run to create the new empty Fusion composite session.

This was created like all of the other "DoAction" TOPs described below via a custom subnet. The subnet exposes two elements in the GUI that an artist/TD can interact with called "Action Name" and "Action Parameters".

This specific subnet was customized to use "fusion:DoAction()" so it ran the Comp_New command in the Fusion wide scope, instead of targeting a comp specific scope like the other action based subnets do below.

![[Kartaverse Workflows.img/image2__DOCFIX7.png]]

To run an action inside of Fusion Studio the following custom TOPs subnet was created using a combination of an "[Attribute Create](https://www.sidefx.com/docs/houdini/nodes/top/attributecreate.html)" node to define our own set of ActionName and ActionParams attributes, along with a "[Generic Generator](https://www.sidefx.com/docs/houdini/nodes/top/genericgenerator.html)" node that makes use of these attributes when talking with Fusion Studio:

![[Kartaverse Workflows.img/image24.png]]

The "Generic Generator" node is used to pass the previously defined \`@ActionName\` and \`@ActionParams\` attributes into the command-line based [FuScript executable session](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964).

[FuScript allows you to bind](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498) locally, or over a LAN network connection to BMD tools like Fusion Studio, Fusion Render Node, Fusion Render Manager, Resolve, and Generation.

![[Kartaverse Workflows.img/image3.png]]

The AddSetting action was used to specify the name of a Fusion Macro .setting file that will be added to the current Fusion Studio session. PathMaps can be used in the Filename attribute here and they will be expanded by Fusion automatically to the full filepath required.

![[Kartaverse Workflows.img/image18__DOCFIX5.png]]

📝**Note:** Using Pathmaps, where possible, makes Fusion scripting tasks cross-platform compatible with low effort.

📝**Note:** Enter the following text into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\fuscript.exe" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for macOS):**

"/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Fusion Studio GUI before cooking this node.') end"

In the next step, the selected node is loaded into Fusion Studio's Viewer 1 context using the Tool_ViewOn action.

In this case the NyanCat macro will be shown on screen.

![[Kartaverse Workflows.img/image17__DOCFIX3.png]]

Next the Execute action will be used to lock the comp viewer session so file dialogs won't be shown by running a snippet of Lua code inside of Fusion Studio. One small detail is that you need to grab the current comp context when using the Execute action or you will otherwise see an error printed out in the results.

![[Kartaverse Workflows.img/image11.png]]

The AddTool action is used to add a Saver node to the comp. The previous step locked the viewer window so the Saver node's empty Filename field won't spawn a file dialog that would need direct user interaction to occur.

![[Kartaverse Workflows.img/image26.png]]

Now the viewer window is unlocked with another Execute action. This allows Fusion's file dialogs to work as expected during the rest of the compositing session. This will make the Fusion GUI session easier to use when testing and debugging code you are running.

![[Kartaverse Workflows.img/image7.png]]

Finally an Execute action is used to rename the Filename attribute for the currently selected node, which in this case is the Saver node.

📝**Note:** With the Create Attribute node it's possible to use Houdini environment variables and have them expanded automatically when they are evaluated and passed over to Fusion Studio via FuScript.

In this case the \`\$HIP\` token dynamically gives us the base Houdini project folder path on disk, which can be combined as a string with the "render" folder name, where Fusion will save the comp's rendered imagery too.

![[Kartaverse Workflows.img/image1__DOCFIX7.png]]

We are using the \`\$HIP\` environment variable again to tell Fusion Studio where the current foreground Fusion .comp file should be saved to.

This composite saving task is done using the Comp_Save action along with manually defining the name parameter.

![[Kartaverse Workflows.img/image6.png]]

In this next step, we are reusing the FusionRenderNode based command-line TOPs rendering approach that was first shown in Part 1 of the "Render Fusion Comps in Houdini TOPs" guide.

The only major difference here from what was shown in Part 1, is that these nodes were put into a subnet, and the File Pattern node's "Value" parameter was exposed in the Houdini UI.

These exposed controls make it easier to interact with the FusionRenderNode subnet in a more modular fashion.

![[Kartaverse Workflows.img/image5.png]]

A final "Wait for All" TOPs node was used at the end of the TOPs node graph to keep the ordering of the work unit tasks tidy.

![[Kartaverse Workflows.img/image23__DOCFIX4.png]]

This is a cropped view of what the final TOPs node graph looks like after it is cooked (rendered). If the process was successful, then green check-marks are shown next to each stage.

![[Kartaverse Workflows.img/image22__DOCFIX6.png]]

Well, that was something of an interesting, yet geeky, ride through the world of TOPs network creation and interconnecting Fusion into the mix.

##### Resolve Studio FuScript Linking Tips

Resolve Studio FuScript Linking Tips

📝**Note:** The same base concepts presented here to control Fusion Studio centric workflows can also be used to automate Resolve Studio workflows from Houdini TOPs via FuScript too.

This can be done by specifying the Resolve SubType when connecting to the app using FuScript, which also provides a way to have direct access to the built-in Resolve API functions via Lua or Python scripting.

📝**Note:** If you want to configure a "Generic Generator" TOP node so it connects to a Resolve Studio instance to access Resolve API functions, while being able to send "DoAction" tasks to the Resolve Fusion page, then the following text should be used as a starting point for your learning efforts. Enter one of the strings below into the Generic Generator node's Command text-field:

**Command (for Windows):**

"C:\\Program Files\\Blackmagic Design\\DaVinci Resolve\\fuscript.exe" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for macOS):**

"/Applications/DaVinci Resolve/DaVinci Resolve.app/Contents/Libraries/Fusion/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

**Command (for Linux):**

"/opt/BlackmagicDesign/FusionRenderNode17/fuscript" -x "resolve = bmd.scriptapp(\[\[Resolve\]\], \[\[localhost\]\]);if resolve \~= nil then res = resolve;else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;fusion = bmd.scriptapp(\[\[Fusion\]\], \[\[localhost\]\], 0.0, 0, \[\[Resolve\]\]);if fusion \~= nil then fu = fusion;app = fu;composition = fu.CurrentComp;comp = composition;SetActiveComp(comp);comp:DoAction(\[\[\`@ActionName\`\]\], {\`@ActionParams\`}) else print('\[FuScript Error\] Please open up the Resolve Studio GUI before cooking this node.') end;"

\*If you explore this approach IRL, at some point you may have to peek into the "[Fusion Comp Link](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.FusionCompLink/Scripts/Comp/Andrew%20Hazelden/Fusion%20Comp%20Link.lua)" Lua script for more [FuScript SubType](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828) parameter insight for an Interactive vs Fusion vs Resolve session. You can also specify a timeout value, a unique UUID value for the copy of Resolve/Fusion that is running, and even a remote host's IP address to connect to, if the other Resolve/Fusion system is connected on your local LAN network, too.

📝**Note:** You also have to make sure that you are running a copy of Resolve Studio, as a copy of Resolve Free doesn't provide command-line access to FuScript and the Resolve process. The next step is to verify that you adjusted the "Resolve Preferences \> System \> General \> External scripting using" preference so it is set to the "Network" option.

(By default external scripting access is disabled on a fresh Resolve install... which typically results in a lot of wasted time spent troubleshooting issues when you first start to explore command-line based Resolve automation techniques.)

![[Kartaverse Workflows.img/image35__DOCFIX6.png]]

##### Fusion Action/Event Scripting Resources

Fusion Action/Event Scripting Resources

📝**Note:** The [Action Listener](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Listener.lua) script provided by the Reactor Package manager's "UI Manager Lua & Python Examples" atom package for Fusion/Resolve is a great way to see actions at work from inside of your compositing application.

It's possible to print out a list of the actions present inside of Fusion with the handy "[Action Printout](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Printout.lua)" script.

You can also learn a lot about the Fusion API from the "[Fusion Script Help Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/FusionScript%20Help%20Browser.lua)" example. Additionally, Roger Magnusson's "[Class Browser](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.RogerMagnusson.ClassBrowser/Scripts/Comp/Roger%20Magnusson/Class%20Browser.lua)" is another essential scripting tool for Fusion/Resolve.

📝**Note:** If you want to peek into the Actions that are connected to the default hotkeys in Fusion take a look at the "[The Ultimate Listicle of Actions and Hotkeys](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39238&fbclid=IwAR0X6aVCmAgTo2DGKef07Pzi7aVBJDbKcgEwSGo25XUvEObetcBeNCYJwRo#p39238)" post on the WSL forum.

📝**Note:** A general introduction to Actions and Events can be found on the following WSL forum scripting posts:

-   [Events/Callbacks in Python](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25533#p25533)
-   [Running Python Code in an Event](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25577#p25577)
-   [Common Variables Found in a .fu Event Execute Scope](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25596#p25596)
-   [Using AddNotify() in Fusion to Respond to Actions](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11029#p11029)
-   [FusionCompEvents.fu](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=13820#p13820)
-   [RandomizeNodeColors.fu Event Example](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=12443#p12443)
-   [Automatically Display the Selected Node in the Viewer Window](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17494#p17494)
-   [.fu Based Contextual Menus - Python Print Attributes](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=25590#p25590)
-   [Using a Script to Add Macros to a Comp](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=17822#p17822)
-   [Resolve Scripting Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=15578#p15578)
-   [Python Script Snippets for Fusion TDs](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11955#p11955)
-   [Running Python Scripts in FuScript](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11964#p11964)
-   [Running UI Manager GUIs from a Terminal FuScript Session](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=6&t=1411&p=11498#p11498)
-   [Menu configuration in Fusion 8.1](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=11921#p11921)
-   [FuScript Subtype Essentials](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=20828#p20828)
-   [Fusion Comp Link Atom](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=16996#p16996)
-   [Hypertext Compositor - An Interactive Documentation & Walkthrough Tool for Compers](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=23827#p23827)