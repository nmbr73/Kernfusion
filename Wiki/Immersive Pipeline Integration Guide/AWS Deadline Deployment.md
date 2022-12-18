![[image364.png]]

Deadline is a render manager and job scheduling tool that is distributed by Amazon AWS Thinkbox. Deadline has Win/Linux/macOS cross platform support and can run on-premise or in the cloud via Amazon AWS EC2.

Amazon AWS Thinkbox provides a very accessible 50,000 render nodes for free licensing option which allows companies to get comfortable with the toolset before committing to it as their core tool.

<https://www.awsthinkbox.com>

### Deadline Monitor

Deadline Monitor

Rendering jobs in Deadline are managed using the "Monitor" program which can be run on artist workstations, and on render node systems, too.

![[image129.png]]

### Deadline Configuration

Deadline Configuration

Configure Monitor Options

Monitor Options

Task List

Rendering Task Double-Click Behaviour - Connect to Worker log

Tools \> Super User Mode

Monitor Options

Misc

\[x\] Start in Super user mode

Tools

Configure Repository Options

\- Client Setup

\- Remote Control

\[x\] Remote Administration

(x) Disable the allow list

Performance Settings

\- (Auto Adjust) button

5 workers

Mapped Paths

(might be required later)

Usage Based Licensing

\[ \] Use Cloud License Server

\[ \] Use dynamic licensing mode

\[ \] Autodetect 3rd party Usage based license consumption

Tools

\- Manage Pools

The Manage Pools window is where you configure the individual groups of render nodes that have certain collections of software installed and licensed, or that are running a similar operating system, or hardware configuration.

This interface allows you to segment job tasks you want to run based upon the best fit for the available hardware, GPU, OS, or software needs.

![[image73.png]]

Pools:

maya

vray

fusion

houdini

ptgui

Assigned Pools

R1 - vray, fusion, houdini, ptgui

R2 - maya, vray, fusion, houdini, ptgui

R3 - vray, fusion, houdini, ptgui

R4 - vray, fusion, houdini, ptgui

R5 - maya, vray, fusion, houdini, ptgui

### Configure Script Menus

Configure Script Menus

Use shift-select to highlight the tools you aren't using. The "Edit Selection" button has an "\[x\] Enable" checkbox you can turn off to hide a tool from the Submit menus.

![[image42.png]]

2D Comp

Fusion

3D

Houdini

Maya

V-Ray

Misc

Command Line

Command Script

Python

Processing

DJV

FFmpeg

Mistika VR

VDenoise

### Submitters

Submitters

Deadline uses a "submitter" tool to define how a new job task is created. This is the interface where you specify all the parameters for the program you want to launch and the type of data you want to process.

Fusion

The highest "Version" is currently "16". We need to add "18".

Houdini

The highest "Version" is currently "19". We need to add "19.5".

Maya

Supports "Version" 2023 by default.

Editing Worker "Render Node" Attributes.

If you would like to edit a Deadline worker system's attributes you can right-click on a worker. In the contextual menu select "Worker Properties".

Then navigate in the dialog to "General \> Worker Description". Enter a value that clearly defines what type of computer system is used for the current render node like:

Threadripper 3990X

Deadline Submitter Installers

F:\\Deadline\\DeadlineRepository10\\submission\\Maya\\Installers

F:\\Deadline\\DeadlineRepository10\\submission\\Houdini\\Installers

F:\\Deadline\\DeadlineRepository10\\submission\\Fusion\\Installers

### Configure Plugins

Configure Plugins

The "Configure Plugins" window is where you set up the individual programs you want Deadline to control, and specify the installation location for each version of the apps you

want to launch on render nodes.

![[image293.png]]

Configure Plugins \> MayaBatch - Done by default

Configure Plugins \> MayaCmd - Done by default

Configure Plugins \> Fusion

C:\\Program Files\\Blackmagic Design\\Fusion Render Node 18\\FusionRenderNode.exe

C:\\Program Files\\Blackmagic Design\\Fusion 18\\Fusion.exe

/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode

/opt/BlackmagicDesign/Fusion18/Fusion

/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node

/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Configure Plugins \> FusionCmd

C:\\Program Files\\Blackmagic Design\\Fusion Render Node 18\\FusionRenderNode.exe

C:\\Program Files\\Blackmagic Design\\Fusion 18\\Fusion.exe

/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode

/opt/BlackmagicDesign/Fusion18/Fusion

/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node

/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Configure Plugins \> Vray

C:\\Program Files\\Chaos Group\\V-Ray\\Maya 2023 for x64\\maya_vray\\bin\\vray.exe

Configure Plugins \> vdenoise

C:\\Program Files\\Chaos Group\\V-Ray\\Maya 2023 for x64\\vray\\bin\\vdenoise.exe

Configure Plugins \> Houdini

Houdini has its own bundled version of the Python scripting utilities called "Hython" aka. "Houdini Python".

Houdini 19.5 Hython Executable

C:\\Program Files\\Side Effects Software\\Houdini 19.5.368\\bin\\hython.exe

/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/bin/hython

/opt/hfs19.5.368/bin/hython

Houdini 19.5 Sim Tracker File

C:\\Program Files\\Side Effects Software\\Houdini 19.5.368\\houdini\\python3.7libs\\simtracker.py

/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.0/Resources/houdini/python3.7libs/simtracker.py

/opt/hfs19.5.368/houdini/python3.7libs/simtracker.py

#### Deadline Plugins Patching

Deadline Plugins Patching

In order to get the most out of Amazon AWS Deadline software, you will likely need to edit a few of the submitters and configuration files by hand in a programmer's text editor like "Notepad++", "BBEdit", or "gedit". This step is relevant in cases where you are using the Deadline toolset in the license-free mode, and are working without a paid AWS Thinkbox support contract.

The "Submit Fusion Job To Deadline" scripted GUI looks like this image below. It has been modified to add newer Fusion Render Node version support than currently comes in a stock release of Deadline. Instructions below cover this process.

![[image363.png]]

We need to start by adding a revised set of "Fusion.ico" / "FusionCmd.ico" image resources to match our use of BMD Fusion Studio v18.

The following items listed below are listings of the individual text files you need to manually open up in your text editor. Also included are the sections of the text file you need to find in the document and then edit by hand.

#### Fusion plugin

Fusion plugin

Edit File

plugins\\Fusion\\Fusion.options

Changes

Default=18

Content to Edit

\[Version\]

Type=string

Label=Version

Category=Fusion Version

Description=The Fusion version to render with

Required=true

DisableIfBlank=false

Default=18

Edit File

plugins\\Fusion\\Fusion.param

Content to Add

\[Fusion17RenderExecutable\]

Type=multilinemultifilename

Label=Fusion 17 Render Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=0

Default=C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\FusionRenderNode.exe;C:\\Program Files\\Blackmagic Design\\Fusion 17\\Fusion.exe;/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode;/opt/BlackmagicDesign/Fusion17/Fusion;/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 17/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 17 Render Node executable used for rendering. Enter alternative paths on separate lines.

\[Fusion17WaitForExecutable\]

Type=string

Label=Fusion 17 Wait For Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=1

Default=

Description=If you use a proxy FusionRenderNode.exe, set this to the name of the renamed original. For example, it might be set to FusionRenderNode_original.exe.

\[Fusion17VersionToEnforce\]

Type=string

Label=Fusion 17 Version To Enforce

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=2

Default=

Description=Deadline will only render Fusion 17 jobs on Workers running this version of Fusion 17. Use a ; to separate alternative versions. Leave blank to disable this feature.

\[Fusion17SlavePreferenceFile\]

Type=filename

Label=Fusion 17 Node Preference File

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=3

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render. Leave blank to disable this feature.

\[Fusion18RenderExecutable\]

Type=multilinemultifilename

Label=Fusion 18 Render Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=0

Default=C:\\Program Files\\Blackmagic Design\\Fusion Render Node 18\\FusionRenderNode.exe;C:\\Program Files\\Blackmagic Design\\Fusion 18\\Fusion.exe;/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode;/opt/BlackmagicDesign/Fusion18/Fusion;/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 18 Render Node executable used for rendering. Enter alternative paths on separate lines.

\[Fusion18WaitForExecutable\]

Type=string

Label=Fusion 18 Wait For Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=1

Default=

Description=If you use a proxy FusionRenderNode.exe, set this to the name of the renamed original. For example, it might be set to FusionRenderNode_original.exe.

\[Fusion18VersionToEnforce\]

Type=string

Label=Fusion 18 Version To Enforce

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=2

Default=

Description=Deadline will only render Fusion 18 jobs on Workers running this version of Fusion 18. Use a ; to separate alternative versions. Leave blank to disable this feature.

\[Fusion18SlavePreferenceFile\]

Type=filename

Label=Fusion 18 Node Preference File

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=3

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render. Leave blank to disable this feature.

#### FusionCmd plugin

FusionCmd plugin

Added a revised FusionCmd.ico for Fusion v18.

Edit File

plugins\\FusionCmd\\FusionCmd.options

Content Edit

\[Version\]

Type=string

Label=Version

Category=Fusion Version

Description=The Fusion version to render with

Required=true

DisableIfBlank=false

Default=18

Edit File

FusionCmd.param

Content to Add

\[Fusion17RenderExecutable\]

Type=multilinemultifilename

Label=Fusion 17 Render Executable

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=0

Default=C:\\Program Files\\Blackmagic Design\\Fusion Render Node 17\\FusionRenderNode.exe;/opt/BlackmagicDesign/FusionRenderNode17/FusionRenderNode;/opt/BlackmagicDesign/Fusion17/Fusion;/Applications/Blackmagic Fusion 17 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 17/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 17 Console Node executable used for rendering. Enter alternative paths on separate lines.

\[Fusion17SlavePreferenceFile\]

Type=filename

Label=Fusion 17 Render Node Preference File

Category=Fusion 17 Options

CategoryOrder=6

CategoryIndex=1

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render Node. Leave blank to disable this feature.

\[Fusion18RenderExecutable\]

Type=multilinemultifilename

Label=Fusion 18 Render Executable

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=0

Default=C:\\Program Files\\Blackmagic Design\\Fusion Render Node 18\\FusionRenderNode.exe;/opt/BlackmagicDesign/FusionRenderNode18/FusionRenderNode;/opt/BlackmagicDesign/Fusion18/Fusion;/Applications/Blackmagic Fusion 18 Render Node/Fusion Render Node.app/Contents/MacOS/Fusion Render Node;/Applications/Blackmagic Fusion 18/Fusion.app/Contents/MacOS/Fusion

Description=The path to the Fusion 18 Console Node executable used for rendering. Enter alternative paths on separate lines.

\[Fusion18SlavePreferenceFile\]

Type=filename

Label=Fusion 18 Render Node Preference File

Category=Fusion 18 Options

CategoryOrder=7

CategoryIndex=1

Default=

Description=The path to a global RenderSlave.prefs preference file that is copied over before starting the Render Node. Leave blank to disable this feature.

Edit File

F:\\Deadline\\DeadlineRepository10\\scripts\\Submission\\FusionSubmission.py

Content to Edit

scriptDialog.AddControlToGrid( "VersionLabel", "LabelControl", "Version", 5, 0, "The version of Fusion to render with.", False )

scriptDialog.AddComboControlToGrid( "VersionBox", "ComboControl", "18", \["5","6","7","8", "9", "16", "17", "18"\], 5, 1 )

commandLineModeBox = scriptDialog.AddSelectionControlToGrid( "CommandLineModeBox", "CheckBoxControl", False, "Command Line Mode", 5, 2, "Enable to render in command line mode using the FusionCmd plugin (this disables some features)." )

commandLineModeBox.ValueModified.connect(CommandLineModeChanged)

scriptDialog.AddControlToGrid( "BuildLabel", "LabelControl", "Build", 6, 0, "", False )

scriptDialog.AddComboControlToGrid( "BuildBox", "ComboControl", "None", ("None","32bit","64bit"), 6, 1 )

scriptDialog.AddSelectionControlToGrid("SubmitSceneBox", "CheckBoxControl", True, "Submit Comp File", 6, 2, "If this option is enabled, the flow/comp file will be submitted with the job, and then copied locally to the Worker machine during rendering.")

scriptDialog.EndGrid()

Edit File

F:\\Deadline\\DeadlineRepository10\\scripts\\Submission\\HoudiniSubmission.py

Content to Edit

HOU_VERSIONS = ("9.0", "10.0", "11.0", "12.0", "13.0", "14.0", "15.0", "15.5", "16.0", "16.5", "17.0", "17.5", "18.0", "18.5", "19.0", "19.5")

Edit File

F:\\Deadline\\DeadlineRepository10\\plugins\\Houdini\\Houdini.param

Content to Edit

\[Houdini19_5\_Hython_Executable\]

Label=Houdini 19.5 Hython Executable

Category=Render Executables

CategoryOrder=0

Type=multilinemultifilename

Index=14

Default=C:\\Program Files\\Side Effects Software\\Houdini 19.5.368\\bin\\hython.exe;/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/bin/hython;/opt/hfs19.5/bin/hython

Description=The path to the hython executable. It can be found in the Houdini bin folder.

\[Houdini19_5\_SimTracker\]

Label=Houdini 19.5 Sim Tracker File

Category=HQueue Simulation Job Options

CategoryOrder=1

Type=multilinemultifilename

Index=10

Default=C:\\Program Files\\Side Effects Software\\Houdini 19.5.368\\houdini\\python3.7libs\\simtracker.py;/Applications/Houdini/Houdini19.5.368/Frameworks/Houdini.framework/Versions/19.5/Resources/houdini/python3.7libs/simtracker.py;/opt/hfs19.5/houdini/python3.7libs/simtracker.py

Description=The path to the simtracker.py file that is used when distributing HQueue sim jobs. This file can be found in the Houdini install.

Edit File

F:\\Deadline\\DeadlineRepository10\\plugins\\Houdini\\Houdini.options

Content to Edit

\[Version\]

Type=label

Label=Version

Category=Houdini Version

CategoryOrder=1

Description=The version of Houdini to use for rendering.

Required=false

DisableIfBlank=true

Default=14

### Deadline Worker

Deadline Worker

Options Menu

\[x\] Hide When Minimized

\[x\] Minimize on Startup

### Deadline Todos

Deadline Todos

Document how to solve the issue with the Deadline sanity check function when submitting Fusion comps that lack a Saver node, when the "Command-Line Mode" checkbox is disabled.

This default sanity checking feature of Deadline's for pre-flight inspecting the contents of a .comp file can interfere with the rendering of composites that use fuses like ExternalMatteSaver, LiveSaver, pioSaver, or Vonk data nodes to save media directly to disk.