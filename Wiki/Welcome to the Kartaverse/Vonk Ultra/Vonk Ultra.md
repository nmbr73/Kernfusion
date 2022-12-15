Title: Welcome to the Kartaverse  
Author:

Kartaverse \| Vonk Ultra Data Nodes

Created 2022-05-09 Last Updated 2022-11-02 10.26 AM UTC -4

Docs By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

Overview

Vonk Ultra is a collection of data nodes for Blackmagic Design Resolve/Fusion. Vonk can be thought of as node-based modifiers that live in the flow. These node-based operations provide a no-code alternative to using expressions or custom scripts. Data nodes are tools that allow you to interconnect nodes together by supporting more data types for the input and output connections such as numbers, text, spreadsheets, CSV, JSON, XML, YAML, metadata, arrays, matrices, and more.

These data node-based techniques encourage a more seamless interchange of information between DCC tools by reducing the loss of important metadata, removing manual data entry steps that can be error-prone, and keep data flowing through a pipeline in a more organized and consistent way.

The long-term hope of Vonk's developers is to help encourage artists and TDs to adopt "data node" concepts across a full production pipeline. These approaches are beneficial for teams working on cutting-edge projects in the motion graphics, VFX, XR, computer vision, machine learning, video/photogrammetry, and digital production/VP space.

Vonk's wide range of nodes include the newly added "vFileSystem" fuses which make it possible for a comp/pipeline TD to port the conceptual ideas found in a typical pipeline shell-script (.bat/.sh) into a fully node-based "Visual Shell Scripting'' paradigm that can run cross-platform inside of Resolve/Fusion/Fusion Render Node. This is effective if it's late at night, your brain focus is fading fast, and you need to quickly whip up in 15 minutes or less a general purpose data processing tool to solve an immediate production challenge.

If you would like to provide feedback on the evolution of the Vonk data nodes, please check out the [development thread on the Steakunderwater forum](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=41165#p41165).

The Vonk Ultra visual scripting nodes are installed using the Fusion community created [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067). There is a separate [Vonk GitLab repository](https://gitlab.com/AndrewHazelden/Vonk) if you need to quickly grab a resource.

The Vonk Ultra documentation (you are reading now) is accessible on [Google Docs](https://docs.google.com/document/d/1U9WfdHlE1AZHdU6_ZQCB1I2nSa5I7TyHG2vKMi2I7v8/edit?usp=sharing). Local PDF formatted Vonk documentation can be read on disk at the following PathMap location:

Reactor:/Deploy/Docs/Kartaverse/Vonk Ultra/Vonk Ultra Data Nodes.pdf

If you enjoy the Vonk data nodes, you might also like to check out a companion guide that explains how to automate Fusion and Resolve workflows with the help of Houdini's TOPS task operators.

Software Required

To run Vonk based workflows on your system you will need the following tools:

* ![][image23] [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) (Free)
* ![][image411]BMD [Resolve](https://www.blackmagicdesign.com/products/davinciresolve/) (Free) / [Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/)
* ![][image170]BMD [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/)
* ![][image32] [Imagemagick](https://imagemagick.org/index.php) (Free) Optional
* ![][image285] [FFMpeg](https://ffmpeg.org/) (Free) Optional

Acknowledgements

The original Spicy Acorn Vonk toolset was created by:

* Kristof Indeherberge
* Cédric Duriau

The Vonk Ultra fork is maintained by:

* Andrew Hazelden

Install Vonk

The Vonk Ultra toolset is installed using the [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) for Resolve/Fusion.

![][image373]

After you have Reactor installed and open, select the "Kartaverse \> Vonk Ultra" category on the left sidebar. Click on the package named "Vonk Ultra" and then press the "Install" button.

![][image169]

Once the installation is complete, restart Resolve or Fusion standalone. This will load the fuses.

Fusion Render Node Customization

After installing Vonk using Reactor, a custom "LuaModules:" PathMap entry is required in the Fusion Render Node app preferences to avoid Fusion Render Manager errors when batch rendering comps that use Vonk data nodes.

1\. Open the Fusion Render Node program and select the "Preferences..." menu item.

2\. Click on the "Global Settings \> Path Map" category on the left side of the Preferences window.

3\. At the bottom of the window click on the "New" button to add a new entry to the "User" section of the "Path Map" view.

4\. Enter the following settings **From: LuaModules:** and **To: UserPaths:Modules/Lua**. Click the "Save" button to retain these settings.

5\. If you don't have Reactor Path Map entries added to Fusion Render Node already, then you might have to further customize the preferences to add values like:

Windows:

**From: Reactor:** and **To: C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\**

macOS:

**From: Reactor:** and **To: /Library/Application Support/Blackmagic Design/Fusion/Reactor/**

Linux:

**From: Reactor:** and **To: /var/BlackmagicDesign/Fusion/Reactor/**

Also you would need to edit the pre-existing UserPaths PathMap entry:

**From: UserPaths:** and **To: UserData:;AllData:;Fusion:;Reactor:Deploy**

6\. Restart Fusion Render Manager to lock in these values.

Note: If the LuaModules PathMap entries were not added to Fusion Render Node's preferences, a typical error message in Fusion Render Node would look a bit like this:

14/Apr/22 16:12:50: .../Fusion/Fuses/Vonk Ultra/Text/Create/vTextFromArray.fuse:5: module 'vjsonutils' not found:

no field package.preload\['vjsonutils'\]

no file 'LuaModules:vjsonutils.lua'

no file 'LuaModules:vjsonutils/init.lua'

no file 'LuaModules:vjsonutils.so'

Adding Data Nodes to a Composite

In the Resolve Fusion page you have several ways to access the newly installed Vonk nodes:

Select Tools Dialog

Pressing the Shift + Space hotkey will display the "Select Tools" dialog.  You can also type in a partial name match like "Text" or "Number" if you know the type of Vonk node you require in advance.

It is helpful to know that the Vonk nodes all start with the letter "v" as a prefix. This helps cluster the nodes together alphabetically.

![][image310]

Nodes View Contextual Menu

The Vonk nodes can be browsed in a hierarchical fashion using the Nodes view. Right-click to display a contextual pop-up menu system. At the top of this menu is the "Add Tools \>" entry. Navigate to the "Kartaverse \> Vonk Ultra" sub-menus.

![][image347]

Effects Library Tab

The "Effects Library" tab at the top of the Resolve user interface can be used to browse Vonk nodes.

![][image211]

Tools Menu

Fusion Studio has a "Tools" menu in the main menu bar that can be used to add nodes to a composite as well.

![][image27]

Vonk Essentials

Vonk nodes are modifiers that live in the node-graph. You can connect Vonk nodes together if they pass a common supported data type like text, numbers, etc.

![][image72]

If you right-click on an attribute in the Inspector window, the "Connect To" contextual pop-up menu appears. This technique allows you to directly link an existing Vonk node's output connection to a specific channel attribute that doesn't have an input connection exposed in the node graph.

![][image262]

When viewing Text or Number data types in the Fusion viewer windows, you may have to use the "Fit" or "100%" view resizing options to make the text visible. The text is anchored to the top left origin of the window.

If you want to see text with line wrapping enabled, try connecting a "vTextViewer" node to the text output connection on your node. This will render the active text data stream into the Inspector view.

Working With Text Data

![][image167]

The vTextCreate node is used to create the initial starting point for a text based data node graph. There are several varieties of text create nodes to choose from:

The regular vTextCreate node has a simple unformatted text field.

The vTextCreateBrowse node makes it easier to select files, and enter file paths with the addition of a "Browse" button that displays a file picker dialog.

The vTextCreateMultiline node supports line wrapping. It is useful for entering longer blocks of text that contain indented text, tabs, carriage return, and newline characters.

The vTextCreatePlatform node will vary what text is specified based upon the current operating system platform. The vTextCreateArch node will vary the output based upon the current CPU architecture.

Multiple text create nodes can be appended together to create a custom string using the vTextSubFormat node. Each input connection on the vTextSubFormat node can be placed exactly where it's needed using a token approach. A token value is entered using curly braces that surround an integer number like "\{1\}" or "\{2\}" that represent an input connection number on the node.

The vTextSubFormat node makes it easy to create strings that combine external number counters with the connection of a vTextFromNumber conversion node, or a vTextFromNumberPadded node that makes it quick to create a leading zero padded number counter.

There is an alternative version of the vTextSubFormat node named vTextSubFormatMultiline which is handy if you want to create a longer block of text with templated values inserted across multiple lines of text.

There is a vTextMerge node that directly concatenates separate strings together into a single output stream. This is useful if you are working with elements like external text files. The Separator control allows you to define what symbol is inserted between each of the combined string elements. Besides adding the usual separators like spaces, or semicolons, you could add newline characters with "\\n", return characters with "\\r", and tab characters with "\\t".

It is possible to break apart absolute filepaths or relative PathMap based file names with the help of the vTextParseFilename node. You can then access each component of the filename like the file extension, image sequence frame number, the base filename, and the parent folder name.

If you need to perform a find and replace operation on a string the text substring manipulation nodes are the right tool for the job. The vTextSubReplace node uses Lua Patterns to allow you to dynamically define what to search for. The 2nd field allows you to specify the new content you want to use in place of the original source text.

The FileSystem fuses allow you to list the contents of a folder, check a file size, look to see if a file exists on disk, create a new folder, or copy a file. You can also expand a relative PathMap into an absolute file path.

If you want to create an IFL (image file list) document to help with accessing arbitrarily named files in a Loader or Saver node, you can combine a vTextSubFormat node that builds the formatted image sequence filename, with a vTextAccumulator node that iterates over a timeline frame range to append the strings into a multi-line block of text. The vTextAccumulator node's Start Frame value could be driven via a vNumberCompRenderStart node, and the End Frame value could be driven via a vNumberCompRenderEnd node. Finally, a vTextToFile node allows you to write that block of text to disk.

The vTextSortLines node is handy for re-ordering multi-line blocks of text into alphabetical order. The node has built-in controls to help remove duplicate entries in a list.

If you have file names that include alternating forward and backslash characters the vTextNormalizeSlashes node can be used to unify the slash direction by setting the Slash Direction to either "Windows" or "Linux". The node can also help with removing doubled up slashes with the "Remove Duplicate Slashes" control.

If your compositing project needs to include batch scripting tasks, the vTextProcessOpen node is able to run a shell task via popen() using the string of text that is supplied as the input. The standard I/O response from the shell is then passed through to the output connection port on the node. This allows you to use substring editing approaches on the popen() shell output to carry out secondary operations like opening a resulting image, or grabbing a filename result from inside a longer text block.

The vTextEnv node makes it possible to read environment variables. This is helpful if you are working inside a pipeline that launches the current compositing session via a virtual environment with custom site, show, and shot based environment variables.

If you want to vary what strings are passed downstream in a comp, there is a vTextSwitch node that can act as a dynamic router. An integer number entered in the Which field specifies what text input connection port number is passed downstream via the output port. 

If you are using a logical comparison as the basis of switching the output you may have to offset a 0-1 number value "up by one" number to represent a 1-2 switching index value. This is done with a vNumberAdd node adding literally a value of 1 to the input connection value.

![][image31]

Fusion Data Types

The Fusion node-graph supports the following data types for node-to-node connections: (Some of the data types are accessible via the Fuse API, and others are only accessible via the Fusion Plugin SDK which is C++ based.)

3D

Audio

BSplinePolyline

CardinalSplinePolyline

Clip

ColorCurves

DataType3D

DisplayList

FlowClip

FuID

Gradient

Histogram

Image

LookUpTable

LookUpTable3D

Mask

Matrix

Mesh

MtlGraph3D

MultiClip

Number

NURBSPolyline

Particles

Point

Polyline

ScriptVal

StyledText

Text

TransformMatrix

UniformBSplinePolyline

Vonk Node Categories

The Vonk data nodes are separated into the following categories and sub-categories based upon what data types they work with, and the function they perform:

	3D
		Flow
			v3DSwitch
		IO
			v3DToFile
		Script
			v3DProcessOpen
			v3DSlashCommand
		Utility
			v3DDelay
	Array
		Create
			vArrayFromCSV
			vArrayFromDataWindow
			vArrayFromLuaTable
			vArrayFromMediaIn
			vArrayFromMetadata
			vArrayFromXML
			vArrayFromYAML
		KeyValue
			vArrayGet
			vArrayGetIndex
			vArrayGetKey
			vArrayKeys
		Substring
			vArraySubReturn
		Utility
			vArrayConcatenate
			vArrayJoin
			vArrayMatch
			vArraySize
			vArraySlice
	Base64
		Decode
			vBase64DecodeFromText
			vBase64DecodeImageFromFile
			vBase64DecodeImageFromText
		Encode
			vBase64EncodeFromFile
			vBase64EncodeFromText
		Utility
			vBase64ToHTML
	Color
		vColorJuggler
		vColorPermutations
		vColorSet
	FileSystem
		vFileSystemChmod
		vFileSystemCreateDir
		vFileSystemDirExists
		vFileSystemFileCopy
		vFileSystemFileExists
		vFileSystemFileOpen
		vFileSystemFileSize
		vFileSystemListFiles
		vFileSystemMapPath
		vFileSystemRemoveDir
		vFileSystemRemoveFile
		vFileSystemRename
		vFileSystemSymlink
		vFileSystemTouch
		vFileSystemURLOpen
	Image
		Create
			vImageCreateTiles
		Flow
			vImageHook
			vImageSwitch
			vImageWireless
		IO
			vImageEXRFromFile
			vImageEXRToFile
			vImageFromClipboard
			vImageFromColor
			vImageFromFile
			vImageFromNet
			vImageFromZip
			vImageToFile
		Matte
			vCryptomatte
		Script
			vImageProcessOpen
			vImageSlashCommand
		Shape
			vImageCreateLine
		Utility
			vImageDelay
	JSON
		IO
			vJSONFromFile
			vJSONFromNet
			vJSONToFile
		KeyValue
			vJSONGet
			vJSONGetElement
			vJSONSet
		Utility
			vJSONCountElement
	Matrix
		Array
			vMatrixFromArray
		Color
			vMatrixColorTransform
		Create
			vCreateMatrix4x4
		Flow
			vMatrixLink
		Operators
			vMatrixDeterminant
			vMatrixDivide
			vMatrixDivideNumber
			vMatrixInvert
			vMatrixMultiply
		Transform
			vEulerFromMatrix
			vMatrixFromRotation
			vMatrixFromScale
			vMatrixFromTranslation
			vMatrixToRotation
			vMatrixToScale
			vMatrixToTranslation
			vMatrixTranspose
		Utility
			vMatrixConcatenateHorizontal
			vMatrixConcatenateVertical
			vMatrixSlice
	Meta
		vMetadataFromMediaIn
		vMetadataFromText
		vMetadataToText
	Number
		Array
			vNumberFromArray
		Comp
			vNumberCompCurrentTime
			vNumberCompFPS
			vNumberCompFrameFormat
			vNumberCompGlobalEnd
			vNumberCompGlobalStart
			vNumberCompProxy
			vNumberCompProxyScale
			vNumberCompRenderEnd
			vNumberCompRenderStart
			vNumberCompReqTime
		Create
			vNumberCreate
			vNumberCreateArch
			vNumberCreateBool
			vNumberCreatePlatform
			vNumberCreateRandom
			vNumberIntegerCreate
			vNumberRange
		Flow
			vNumberSwitch
			vNumberWireless
		Logic
			vNumberAnd
			vNumberEqual
			vNumberGreater
			vNumberGreaterEqual
			vNumberLess
			vNumberLessEqual
			vNumberNot
			vNumberNotEqual
			vNumberOr
			vNumberTernary
		Matrix
			vNumberFromMatrix
			vNumberToMatrix
		Operators
			vNumberAbsolute
			vNumberAdd
			vNumberCeil
			vNumberClamp
			vNumberDivide
			vNumberEase
			vNumberFactorial
			vNumberFloor
			vNumberFractional
			vNumberIntegral
			vNumberMax
			vNumberMin
			vNumberMix
			vNumberModulus
			vNumberMultiply
			vNumberPartialPermutation
			vNumberPower
			vNumberReciprocal
			vNumberSign
			vNumberSmoothstep
			vNumberSquareRoot
			vNumberStep
			vNumberSubtract
		Resolve
			vNumberResolvePID
			vNumberResolveTimelineFPS
		Script
			vNumberProcessOpen
			vNumberSlashCommand
		Temporal
			vNumberTimeSpeed
			vNumberTimeStretch
			vNumberXSheet
	Text
		vNumberFromCSV
		vNumberFromText
		Trigonometry
			vNumberArcCosine
			vNumberArcSine
			vNumberArcTangent
			vNumberArcTangent2
			vNumberCosine
			vNumberDegreesToRadians
			vNumberHyperbolicCosine
			vNumberHyperbolicSine
			vNumberHyperbolicTangent
			vNumberRadiansToDegrees
			vNumberSine
			vNumberTangent
		Utility
			vNumberDelay
			vNumberEndPID
		Vector
			vNumberFromVector
	Point
		Create
			vPointCreate
			vPointCreateImage
		vPointCreateRandom
			vPointFromMousePos
		Flow
			vPointSwitch
			vPointWireless
		Number
			vPointFromNumber
			vPointToNumber
		Operators
		vPointAbsolute
			vPointAdd
			vPointClamp
			vPointDivide
		vPointMix
			vPointModulus
			vPointMultiply
		vPointPower
			vPointSubtract
		Temporal
		vPointTimeSpeed
		vPointTimeStretch
		Text
		vPointFromText
		vPointToText
		Utility
			vPointAngle
		vPointDelay
			vPointLength
	ScriptVal
		Array
			vScriptValFromArray
			vScriptValToArray
		Create
			vScriptValCreate
			vScriptValFromApp
			vScriptValFromDate
			vScriptValFromListFiles
			vScriptValFromListFonts
			vScriptValFromPingHosts
			vScriptValFromPrefs
			vScriptValFromRegistry
			vScriptValFromXML
		CustomData
			vScriptValFromCustomData
			vScriptValToCustomData
		Flow
			vScriptValSwitch
			vScriptValWireless
		Font
			vScriptValFontMetrics
			vScriptValFromListFonts
		Image
			vScriptValFromEXRFile
		IO
			vScriptValFromFile
			vScriptValToFile
			vScriptValFromBinaryFile
			vScriptValToBinaryFile
		JSON
			vScriptValFromJSON
			vScriptValToJSON
		KeyValue
			vScriptValGetElementToTable
			vScriptValGetElementToText
			vScriptValGetToNumber
			vScriptValGetToTable
			vScriptValGetToText
			vScriptValKeysToTable
			vScriptValKeysToText
			vScriptValRemoveElement
			vScriptValTrimElement
		Meta
			vScriptValFromMetadata
			vScriptValToMetadata
		Number
			vScriptValFromNumber
			vScriptValToNumber
		Point
			vScriptValFromPoint
			vScriptValToPoint
		Script
			vScriptValDoFile
			vScriptValDoString
		Shape
			vScriptValCreatePolyline
		Temporal
			vScriptValAccumulator	
			vScriptValTimeSpeed
			vScriptValTimeStretch
		Text
			vScriptValFromText
			vScriptValToText
		Utility
			vScriptValCount
			vScriptValDump
			vScriptValMerge
		YAML
			vScriptValFromYAML
	Shape
		Flow
			vShapeSwitch
			vShapeWireless
	Text
		Case
			vTextCaseAlternate
			vTextCaseInvert
			vTextCaseLower
			vTextCaseRandom
			vTextCaseSentence
			vTextCaseTitle
			vTextCaseUpper
		Comp
			vTextCompAppUUID
			vTextCompCurrentTime
			vTextCompFilename
			vTextCompName
			vTextCompReqTime
		Create
			vTextCreate
			vTextCreateArch
			vTextCreateBrowse
			vTextCreateMultiline
			vTextCreateMultilineCode
			vTextCreatePlatform
			vTextCreatePlatformBrowse
			vTextDate
			vTextEnv
			vTextFromArray
			vTextFromASCII
			vTextFromCSV
			vTextFromHex
			vTextFromNumber
			vTextFromNumberPadded
			vTextToHex
			vTextUUID
			vTextUUIDStatic
		Decode
			vTextDecodeUrl
		Encode
			vTextEncodeUrl
		Flow
			vTextSwitch
			vTextWireless
		Font
			vTextFontMetrics
		IO
			vTextFromClipboard
			vTextFromComp
			vTextFromFile
			vTextFromNet
			vTextFromZip
			vTextToFile
		Logic
			vTextEqual
			vTextNotEqual
			vTextTernary
		Order
			vTextOrderReverse
			vTextOrderShuffle
		Resolve
			vTextResolvePID
			vTextResolveProjectName

		Script
			vTextDoAction
			vTextDoString
			vTextExecute
			vTextProcessOpen
			vTextRenderComp
			vTextRunScript
			vTextShellBG
			vTextSlashCommand
		Substring
			vTextMerge
			vTextSubFormat
			vTextSubFormatMultiline
			vTextSubJoin
			vTextSubReplace
			vTextSubReturn
			vTextSubSplit
			vTextSubStripLeft
			vTextSubStripRight
		Temporal
			vTextAccumulator
			vTextTimeSpeed
			vTextTimeStretch
		Utility
			vTextDelay
			vTextDump
			vTextLength
			vTextLineCount
			vTextNormalizeSlashes
			vTextParseFilename
			vTextParseFilenameOutputs
			vTextReadLine
			vTextSortLines
			vTextViewer
	Vector
		Array
			vVectorFromArray
		Create
			vVectorCreate
		Operators
			vVectorAdd
			vVectorCrossProduct
			vVectorDivideNumber
			vVectorDotProduct
			vVectorMultiplyNumber
			vVectorNormalize
			vVectorSlice
			vVectorSubtract
		Point
			vPointToVector
			vVectorFromPoint
			vVectorToPoint
		Utility
			vVectorLength

Vonk Scripts

Comp Scripts

Vonk includes several comp scripts that can be located on disk at:

Scripts:/Comp/Vonk Ultra/

Render Selected

The "Render Selected" script will launch a GUI based rendering of the currently active node in the Nodes view. This will re-cook the upstream node branches that lead into the selected node.

Vonk Open Sub-Folder

The "Open" folder of scripts are used to quickly access Vonk resources.

![][image275]

Show Comps Folder

The "Show Comps Folder" menu item opens up the "Reactor:/Deploy/Comps/Kartaverse/Vonk Ultra/" folder in a Finder/Explorer/Nautilus window.

Show Docs Local

The "Show Docs Local" menu item opens up the "Reactor:/Deploy/Docs/Kartaverse/Vonk Ultra/Vonk Ultra Data Nodes.pdf" documentation in your operating systems' default PDF viewing tool. This is a local on-disk version of the Vonk documentation guide you are currently reading now.

Show Docs Online

The "Show Docs Online" menu item displays a Google Docs based online version of the Vonk documentation guide you are currently reading now.

Show Fuses Folder

The "Show Fuses Folder" menu item opens up the  "Fuses:/Kartaverse/Vonk Ultra/" folder in a Finder/Explorer/Nautilus window.

Show Lua Modules Folder

The "Show Lua Modules Folder" menu item opens up the "Macros:/Kartaverse/Vonk Ultra/" folder in a Finder/Explorer/Nautilus window.

Show Macros Folder

The "Show Macros Folder" menu item opens up the "Reactor:/Deploy/Modules/Lua/" folder in a Finder/Explorer/Nautilus window.

Show Temp Folder

The "Show Temp Folder" menu item opens up the "Temp:/Vonk/" folder in a Finder/Explorer/Nautilus window.

Vonk Tools Sub-Folder

The "Tools" folder is used to carry out Vonk centric utility tasks.![][image324]

Create All Data Nodes

The "Create All Data Nodes" menu item adds every single Vonk node to the currently open composite. This is useful if you want to browse visually through the GUIs of the nodes to familiarize yourself with the large collection of fuses.

Tool Scripts

Vonk includes several tool scripts that can be located on disk at:

Scripts:/Tool/Vonk Ultra/

These nodes are accessible when you have a node selected in the Nodes view area. Right-clicking on a node will display a pop-up contextual menu. Navigating to the "Script \> Vonk Ultra" menu entry will provide access to Vonk centric scripts that can be run on the active node selection. 

You can have one, or more nodes selected when running a Tool script. The Tool script will be launched individually for each item in the selection list. Inside a Tool script a global variable named "tool" will exist that provides the name of the active node.

![][image186]

Render Selected

The "Render Selected" script will launch a GUI based rendering of the currently active node in the Nodes view. This will re-cook the upstream node branches that lead into the selected node.

Vonk Node Reference Guide

3D Nodes

v3DToFile

Writes PointCloud3D data from the Fusion 3D node-graph to a file.

Connect a PointCloud3D node's output connection directly to the v3DToFile node:

PointCloud3D.Output -\> v3DToFile.Input

The "Input 3D" connection accepts a wireless link style drag-and-drop attachment of a PointCloud3D node. 

Clicking the "Show 3D Source" button will select the connected upstream node in the Nodes view, which displays the node in the Inspector view.

The "Point Cloud Format" ComboControl allows you to select the export format used. Options include:  "XYZ ASCII (.xyz)", "PLY ASCII (.ply)", and "PIXAR USDA ASCII (.usda)".

The "Filename" text field supports Vonk vText based connections. This allows you to dynamically generate a filename via data node approaches. 

The Filename field contents can include relative PathMap values like "Comp:/" that will be expanded at render time. 

If a sub-folder is specified in the filename field, and it is missing at render time, the sub-folders will be re-created automatically when the file is saved to disk. This is helpful if you want to use per--timeline-frame numbered folders in the output filepath.

![][image94]

v3DSwitch

Switch between Fusion 3D objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a v3DSwitch node's Which input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.

The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image142]

v3DProcessOpen

Launch a command-line process via popen.

The "Input 3D" field is used to connect 3D nodes that interact with Fusion's 3D workspace.

The "Text" field is used to define the executable program name and the command-line arguments you want to run from a shell session.

Typically a vTextSubFormat node is used to build the executable command line string that is supplied to the Text input on a vImageProcessOpen node.

If you need cross-platform support, you can use a vTextCreatePlatform or vTextCreatePlatformBrowse node to automatically define the per-OS specific elements like the executable program name and its file extension (.exe, .app, .bat, .sh, .command).

![][image326]

v3DSlashCommand

Run a Console Fuse SlashCommand as a node

v3DDelay

Creates a delay while passing a Fusion 3D object.

The "Input 3D" field is used to connect 3D nodes that interact with Fusion's 3D workspace.

The delay effect is measured in seconds. This node is implemented internally using the "bmd.wait()" function.

Among several use cases one can find for a tool that can momentarily pause rendering; it can be used to simulate a slow to render comp task when testing a render farm program. It also has applications when running a command line task via the Vonk 3DProcessOpen node the system requires a momentary pause to work reliably.

![][image179]

Array Nodes

vArraySubReturn

Concatenates an array

![][image164]

vArrayKeys

Returns the keys present in an array

![][image119]

vArrayGetKey

Gets the value of a key in an array

![][image198]

vArrayGet

Gets the value of a key in an array

![][image370]

vArrayGetIndex

Creates Text from an array

![][image17]

vArrayFromLuaTable

Casts a Lua Table to an array

A Lua table structure is used as the underlying format for Fusion .comp files, Fusion macro/effects template .setting files, Reactor .atom packages, Fusion preference .prefs, and for Lua metadata table results.

![][image306]

vArrayFromMetadata

Casts metadata to an array

This node translates metadata records into a JSON based array structure. This supports tasks like parsing EXR formatted image metadata to extract Cryptomatte matte manifest records.

![][image265]

vArrayFromMediaIn

Casts a Resolve MediaIn MediaProps to an array

This makes it possible to read MediaPool/Edit page timeline information provided by a MediaIn node.

![][image372]

vArrayFromCSV

Creates a JSON array from a CSV row or column

The "Array Mode" control provides two options: "Extract Row", and "Extract Column". This makes it easy to select which axis of CSV data you would like to grab a sample from.

The "Ignore Header Row" checkbox will offset the first index position to start at line 2 in the CSV file. This will skip over a labelled header row in the source document to avoid that information being accessed as part of the ingested data.

![][image117]

The output from vArrayFromCSV is typically connected to an vArrayGetIndex node. This makes it possible to select an individual cell of data.

vArrayFromXML

Creates a JSON array from XML

The vArrayFromXML node works with XML formatted plain-text data. The XML data is read from a "vTextFromFile", "vTextFromNet", or "vTextFromZip" node.

The output from the vArrayFromXML node is a text data type. The XML records are converted on-the-fly and stored in a JSON based array structure. 

This JSON array formatted data can be navigated and extracted using the Vonk provided "vArray" nodes along with the "vJSONGetElement" node.

![][image401]

vArrayFromYAML

Creates a JSON array from YAML

Technology Note: [YAML](https://yaml.org/) is used as part of Film & TV production lens metadata workflows by Cine lenses with sensors and encoders like the [Cooke Optics /i Technology](https://cookeoptics.com/i-technology/) metadata system. YAML metadata exchange is also starting to be used by other Cine lens manufacturers, in match-moving and tracking packages like [SynthEyes](https://www.ssontech.com/) and PFTrack, and as part of data exchange approaches like [OpenTimelineIO](https://github.com/reinecke/otio-cookelensmetadata), too.

Blackmagic BRAW media filmed on a [BMD URSA Mini Pro 12K](https://www.blackmagicdesign.com/products/blackmagicursaminipro) camera with a Cooke Optics PL-mount lens is capable of holding this YAML metadata recorded lens information internally. This is useful for supporting better data interchange between VP (Virtual Production) onset ICVFX (In-Camera VFX) departments and subsequent post-production workflows carried out by external vendors.

![][image116]

vArrayFromDataWindow

Casts DataWindow to an array

![][image349]

vArrayConcatenate

Concatenates an array

![][image148]

vArraySlice

Creates Text from an array

![][image111]

vArraySize

Gets the size of an array

![][image171]

vArrayJoin

Gets the value of a key in an array

![][image365]

vArrayMatch

Gets the value of a key in an array

The "Pattern" text field uses [Lua Patterns](http://lua-users.org/wiki/PatternsTutorial) to isolate values from a JSON based Array object. Additional information about patterns can be read in the [Lua manual](https://www.lua.org/manual/5.3/manual.html#6.4.1).

"cryptomatte/\[a-z0-9\]+/manifest" is a vArrayMatch Pattern that can be used to access Cryptomatte manifest image metadata. This information can be read from an EXR image via a Loader -\> vArrayFromMetadata -\> vArrayMatch node graph connection process.

![][image63]

Color Nodes

vColorJuggler


![][image20]

vColorSet

This node was created by Chad Capeland.

The "Palette Array" field allows you to use HTML hex style RGB color values to fill in the background of image elements with the format of "RRGGBB" color values. 

A hex number range includes the digits from 0-9 then it continues along to include the extra characters A-F as a representation of a single value.

Palette Array Sample Colors:

"FFFFFF" = White

"000000" = Black

"404040" = 25% Grey

"808080" = 50% Grey

"BFBFBF" = 75% Grey

"FF0000" = Red

"00FF00" = Green

"0000FF" = Blue

"00FFFF" = Cyan

"FF00FF" = Magenta

"FFFF00" = Yellow

The "Preserve Alpha" checkbox is used to retain the alpha channel input data.

The "Multiply by Alpha" checkbox is used to perform pre-multiplication math on the imagery. This control will make the transparent areas in the image, as defined by the source alpha channel data, turn black in the RGB channels.

The "Affect Canvas" checkbox is used to extend the color fill operation beyond the current DoD (Domain of Definition) region in the viewer window. When this checkbox is enabled,  the background canvas color is pre-defined, if you ever expand the image larger than its original dimensions using a Crop node.

![][image5]

vColorPermutations


![][image38]

Base64 Nodes

vBase64EncodeFromText

Base64 encodes text into a Fusion Text object.

This node converts a block of ASCII text into a Base64 format.

The "Text" input field is used to specify the source ASCII string to process.

![][image274]

vBase64EncodeFromFile

Base64 encodes a file into a Fusion Text object.

This node converts the contents of an external file into a Base64 format. This can help with tasks like creating PNG format imagery that can be embedded inside a Fuse GUI as a block of base64 encoded data.

The "File" input field is used to specify the filepath to a document.

![][image307]

vBase64DecodeImageFromFile

Base64 decodes an image into a file.

A Base64 encoded image is extracted from an external file, and converted into an image data type that can be displayed in the Fusion viewer window context.

The "Input" field is used to specify the filepath to an image that is currently Base64 encoded.

![][image34]

vBase64DecodeFromText

Base64 decodes text from a Fusion Text object.

A Base64 formatted block of text is converted back into plain ASCII text that can be passed downstream via a text data type.

The "Text" field is used to specify a block of text that is currently Base64 encoded. 

The "Show Input" checkbox allows you to source the Text information from an external Text based data node connection.

 

![][image279]

vBase64DecodeImageFromText

Base64 decodes an image from a Fusion Text object.

This node extracts a Base64 encoded image resource. A Base64 formatted image is extracted from a block of text, and converted into an image data type that can be displayed in the Fusion viewer window context.

The "Text" field is used to specify a block of text that holds Base64 encoded image data. 

The "Show Input" checkbox allows you to source the Text information from an external Text based data node connection.

![][image385]

vBase64ToHTML

Converts a Base64 encoded PNG image into an inline HTML \<IMG\> embed.

![][image180]

This node is useful to help prepare an inline Base64 encoded PNG image block. The most common use case for this node is to help fuse coders prepare new icons for use in a fuse's LabelControl element. This supports building Inspector view based icons for your custom fuses or macros.

In your fuse the base64 encoded image element would be placed into a variable that is linked into the LabelControl like this:

BrandLogo = \[\[

\<center\>\<img width="160" height="75" src='data:image/png;base64,...'/\>\</center\>

\]\]

InLabel = self:AddInput(BrandLogo, "Label",\{

LINKID\_DataType = "Text",

INPID\_InputControl = "LabelControl",

LBLC\_MultiLine = true,

INP\_External = false,

INP\_Passive = true,

IC\_ControlPage = -1,

IC\_NoLabel = true,

IC\_NoReset = true,

\})

The "IC\_ControlPage = -1," tag will move the UI element above the Control Page tabs which makes the same icon visible as you switch between Control Pages.

The end result from adding the Base64 icon to a LabelControl is the ability to create a more polished UI for your fuse:

![][image173]

Metadata Nodes

vMetadataToText

Creates a Fusion Text object from metadata

This node is similar to the GetMetadata.fuse with the addition of a "Key" input connection on the node that accepts a Text data type.

The "Key" field is used to specify the metadata record. 

An example of an image metadata record "Key" entry would be the Loader node added attribute of "Filename".

![][image127]

vMetadataFromText

Creates a Fusion image with metadata added from text

This node is similar to the SetMetadata.fuse with the addition of input connections on the node that accepts a Text data type for the "Field Name", and "Field Value".

![][image18]

A metadata example for Fusion Viewer based Stereo3D "Over/Under" image content is:

Field Name: Stereo

Field Value: \{Method  = "vstack"\}

A metadata example for Fusion Viewer based Stereo3D "Side by Side" image content is:

Field Name: Stereo

Field Value: \{Method  = "hstack"\}

A metadata example for Fusion Viewer window based 360VR "Latitude/Longitude" image projection content is:

Field Name: Pano

Field Value: \{Format = "LatLong"\}

vMetadataFromMediaIn

Creates a Fusion image with MediaIn MediaProps metadata

This node is connected directly to a MediaIn node. It extracts the MediaProps record from a MediaIn node and places that data into the image's metadata Lua table.

![][image205]

The MediaProps based Metadata Lua table output is formatted like:

\{

"MEDIA\_FORMAT\_TYPE":"PNG",

"MEDIA\_HEIGHT":64,

"MEDIA\_IS\_SOURCE\_RES":true,

"MEDIA\_LAYER\_DESC":\[\],

"MEDIA\_MARK\_IN":0,

"MEDIA\_MARK\_OUT":0,

"MEDIA\_NAME":"Fusion-Logo.png"

"MEDIA\_NUM\_FRAMES":1,

"MEDIA\_NUM\_LAYERS":0,

"MEDIA\_PAR":1,

"MEDIA\_PATH":"/Users/vfx/Reactor/Deploy/Comps/Kartaverse/Vonk Ultra/Media/Fusion-Logo.png",

"MEDIA\_SRC\_FRAME\_RATE":24,

"MEDIA\_START\_FRAME":0,

"MEDIA\_WIDTH":64,

\}

Filesystem Nodes

vFileSystemChmod

Change a file/folder's access permissions

The "File" textfield is used to specify a file or folder path.

The "Mode" control is used to specify the file mode (access permission) as an integer number. This is typically an octal value like "777", "755", etc.

The "Recursive" checkbox allows you to apply the access permission changes to items inside a folder.

Note: This node works on macOS and Linux systems only due to the use of the UNIX "chmod" utility.

![][image183]



vFileSystemCreateDir

Creates a new directory

This node will create a new directory. The "Text" field is used to define the desired folder path. Any required intermediate subfolders are created at the same time.

When enabled, the "\[x\] Use Parent Directory" checkbox allows you to enter a filepath into the "Text" field. The base folder path for the specified file will be used for the directory creation task.

![][image412]

vFileSystemDirExists

Check if a directory exists

![][image22]

vFileSystemFileCopy

Copies a file

This node allows you to define a "Source File" that will be copied to the disk-based filepath defined in the "Destination File" field.

The "Create Destination Directory" checkbox is useful if you need to dynamically create the output folder at the same time.

![][image315]

vFileSystemFileExists

Checks if a file exists

This node reads a filepath defined in the "Text" field and checks if the document exists on disk. The output is the number 0 if the file does not exist, and the number 1 if the file does exist.

If you want to connect this node to a Switch node's "Which" field, you will have to use a vNumberAdd node to offset the value up by one to go from a 0-1 range to a 1-2 range.

![][image11]

vFileSystemFileOpen

Opens a file

This node will open the "Source File" using the operating system's default file handler. The exact program launched is defined by the file extension.

![][image43]

vFileSystemFileSize

Returns the file size

This node takes a single filename as a text based input. It checks the file size of the document and returns the value in the unit of measure you specify.

![][image74]

The Unit field supports a wide range of file size output scales including:

"Byte (B)", "Kilobyte (KB)", "Kibibyte (KiB)", "Megabyte (MB)", "Mebibyte (MiB)", "Gigabyte (GB)", "Gibibyte (GiB)", "Terabyte (TB)", and "Tebibyte (TiB)".

![][image255]

The node has two output connections labelled "Output" and "OutputUnit". The "OutputUnit'' connection is handy if you need to create a visual overlay with a Text+ node of file size and want to indicate the scale of measure.

vFileSystemListFiles

Creates a Fusion Text object with a list of the folder contents

This node scans the contents of a folder path defined in the "Text" field. The output is created as a text based multi-line list of files or folders.

The "Pattern" field is used to enter part of the filename that you would like to match in the output. An asterisk character is supported as a wildcard symbol to help with partial filename entry. The Pattern field is typically used to help find files by their extension by entering a value like "\*.exr", "\*.png", "\*.mov", "\*.mp4", etc.

The Mode control can be set to "List Files" or "List Directories". This allows you to filter the output.

If you enable the "Export Fullpath" checkbox the full absolute filepath for each item is returned. If the checkbox is disabled, only the filename of the resource is returned without any folder path elements included.

The "Expand PathMaps" checkbox will automatically convert any relative filepaths into absolute filepaths on the output.

The "Skip Hidden Files" checkbox is used to ignore hidden files like ".DS\_Store" and "Thumbs.db" documents, along with UNIX style filenames that start with a period. This helps reduce clutter on file listing based outputs.

![][image4]

vFileSystemMapPath

Expands a PathMap

This node automatically converts a relative filepath into an absolute filepath on the output.

This is useful if you want to supply an executable program name, or a filename to an operation like the ProcessOpen node that carries out command-line tasks.

![][image162]

vFileSystemRemoveDir

Remove a directory

![][image158]

vFileSystemRemoveFile

Rename a file or folder

![][image87]

vFileSystemRename

Rename a file or folder

![][image304]

vFileSystemSymlink

Create a Symbolic Link to a file or folder on macOS, Linux, and Windows

A Symlink (also known as a Symbolic link) can be thought of as a fancier (and far more posh) Linux file system style version of a Windows shortcut, or a macOS alias. This node creates Symlinks that are known as "soft-links".

If you are working with locally stored and managed temp files on a render node, instead of copying an image sequence, and doubling disk space usage, you can Symlink the files and save your storage for new data. Be sure to document in your workflow notes that these files are interim scratch files that are to be automatically cleaned up/removed, and not to be backed up or managed as assets.

Symlinks can be an attractive technique to use if you are copying a large quantity of files on disk, merely for the purpose of renaming the files temporarily in order to unify the naming convention of an image sequence. This happens when you are trying to manage original "camera named" footage into something tidy and symmetrical. This type of operation is typically done for convenience when doing data processing in a temp folder where you need to separate the intermediate files, and your output files from the source media.

![][image281]

How to tell a file is a Symlink

macOS / Linux

If you are looking at files on disk and trying to tell if it is a symlink or not, you can type "ls -la" into a Terminal window on macOS/Linux and you will see a file is indicated as a soft-link with an arrow listed next to the filename in the output like this:

% ls -la

CameraA-Link.0001.jpg -\> /Users/vfx/Reactor/Deploy/Comps/KartaVR/WarpStitch/WarpStitch Under the Bridge/Media/CameraA.0001.jpg

In the macOS Finder folder browsing window a symlinked file has an "arrow icon" overlaid over the document icon:

![][image35]

Windows

If you are looking at files on disk and trying to tell if it is a symlink or not, you can type "dir" into a Command Prompt window on Windows and you will see a file is indicated as a soft-link with the word "\<SYMLINK\>" in the directory contents listing output like this:

![][image189]

dir

Volume in drive C has no label.

Volume Serial Number is X00X-XX00

Directory of C:\\Users\\vfx\\AppData\\Local\\Temp\\Vonk\\0001

08/20/2022  10:51 PM	\<DIR\>      	.

08/20/2022  10:51 PM	\<DIR\>      	..

08/20/2022  10:51 PM	\<SYMLINK\>  	CameraA-Link.0001.jpg \[C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\Deploy\\Comps\\KartaVR\\WarpStitch\\WarpStitch Under the Bridge\\Media\\CameraA.0001.jpg\]

1 File(s)          	0 bytes

2 Dir(s)  277,488,435,200 bytes free


In the Windows Explorer folder browsing window a symlinked file has an "arrow icon" overlaid over the document icon as well:

![][image311]

Windows and Symlink Based File Permissions

If you want to create a symlink without using Administrator permissions on Windows systems, you need to open the Windows operating system "Settings \> Privacy & security \> For developers" preference to enable the "Developer Mode".

![][image160]

vFileSystemTouch

Touch a file/folder's creation and modification dates on macOS and Linux

![][image323]

vFileSystemURLOpen

Opens a file

This node opens a URL in an external web-browser. This is useful if you need to display reference material, or assist a user in checking out an asset from a web-based content management system.

![][image300]

Image Nodes

vImageCreateLine

Creates a Line Shape object

![][image359]

vImageDelay

Creates a Delay while passing a Fusion Image object

![][image193]

The delay effect is measured in seconds. This node is implemented internally using the "bmd.wait()" function.

Among several use cases one can find for a tool that can momentarily pause rendering; it can be used to simulate a slow to render comp task when testing a render farm program. It also has applications when running a command line task via the Vonk ProcessOpen node and the system requires a momentary pause.

vImageToFile

Saves a jpg/exr/png/bmp/raw/fusepic image sequence to disk

The "File" control can be driven externally by a Text data type connection to the node.

![][image42]

vImageEXRToFile

Saves an EXR image to disk

The "Filename" control can be driven externally by a Text data type connection to the node.

![][image227]

vImageFromColor

Creates an image from a color

This node can act as a fuse based alternative to a Background node if you need to create a fixed size image and fill the image canvas with a flat color.

![][image250]

vImageEXRFromFile

Reads an EXR image from a file

The "Filename" control is used to define the image filename to load. It can be driven externally by a Text data type connection to the node.

The "EXR Part Number" control allows you to select another part element from a multi-part image document. This control can be a bit temperamental so make sure to save the comp document first before changing this value to avoid any loss of time and productivity.

The "Time Mode" control allows you to adjust how the frame number for image sequences is processed.

![][image380]

vImageFromClipboard

Grabs, saves, then loads the current clipboard image

The "Grab" button is used to capture the clipboard contents. It is a handy way to quickly load an image into the compositing node graph without needing to worry about the filename.

This node was designed to work with Fusion Standalone v9 on Windows.

![][image66]

vImageFromFile

Reads an Image object from a file

The "Input" control is used to define the image filename to load. It can be driven externally by a Text data type connection to the node.

The "Time Mode" control allows you to adjust how the frame number for image sequences is processed.

![][image178]

vImageFromNet

Reads an Image object from a network URL

The "Input" control is used to define the image URL such as an http://, https://, or file:/// based resource. The URL can be driven externally by a Text data type connection to the node.

The "File Type" ComboBox control helps Fusion decode the exact type of content being downloaded when the media is loaded into the Fusion viewer window context.

An example image you can use to test this node is an Eastern Canada weather satellite URL:

<https://weather.gc.ca/data/satellite/goes_ecan_1070_100.jpg>

![][image353]

vImageFromZip

Reads an Image object from a zip archive

This node accesses an image resource that is stored inside a Zip archive using the Fusion v16+/Resolve v15+ based ZipIO library.

The "Zip File" field is used to define the filename of the zip archive.

The "Extract Image" field is used to define the image resource that is stored inside the zip archive.

Both attributes can be driven externally by a Text data type connection to the node.

![][image375]

vCryptomatte

This node is a version of the Cryptomatte fuse that supports an exposed Text data type based input connection to the "Matte List".

This is handy if you want to use the Vonk JSON + Metadata + Array features to create technical animations that browse through every matte element stored in the image's manifest records.

![][image154]

vImageProcessOpen

Launches a command-line process via popen

The "Text" field is used to define the executable program name and the command-line arguments you want to run from a shell session.

Typically a vTextSubFormat node is used to build the executable command line string that is supplied to the Text input on a vImageProcessOpen node.

If you need cross-platform support, you can use a vTextCreatePlatform or vTextCreatePlatformBrowse node to automatically define the per-OS specific elements like the executable program name and its file extension (.exe, .app, .bat, .sh, .command).

![][image165]

vImageSlashCommand

Run a Console Fuse SlashCommand as a node

vImageCreateTiles

Creates an image grid layout from an image sequence

This node makes it easy to create tiled "texture atlas" like grid layouts. If you need the imagery to be scaled down to a specific size, attach a resize or scale node to the image stream before you connect it to the vImageCreateTiles node.

The "Tiles X" control specifies how many images are stacked horizontally.

The "Tiles Y" control specifies how many images are stacked vertically.

The "Reverse X Order" and "Reverse Y Order" checkboxes are used to provide control over the image placement ordering when the grid layout is built. This allows you to start frame 1 at either of the 4 corners of the frame border.

![][image59]

vImageHook

![][image174]

vImageWireless

The vImageWireless node allows you to connect to other image based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

![][image317]

vImageSwitch

Switches between Fusion Image objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a vNumberSwitch node's Which input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.

The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image225]

Number Nodes

vNumberTimeSpeed

Time based operation on numbers

![][image290]

vNumberXSheet

Time based operation on numbers

![][image28]

vNumberTimeStretch

Time based operation on numbers

![][image73]

vNumberDelay

Creates a Delay while passing a Fusion Number object

![][image190]

The delay effect is measured in seconds. This node is implemented internally using the "bmd.wait()" function.

Among several use cases one can find for a tool that can momentarily pause rendering; it can be used to simulate a slow to render comp task when testing a render farm program. It also has applications when running a command line task via the Vonk ProcessOpen node and the system requires a momentary pause.

vNumberEndPID

Quit a program using its PID (Process ID) on macOS and Linux

![][image62]

It is possible to use the following terminal command to list a specific program's PID value:

ps aux \| grep writeInSomeProgramNameHere

A sample output from this usage of the ps aux + grep command is:

% ps aux \| grep safari

vfx          	10239   0.0  0.0 408637584   1760 s000  S+	4:21PM   0:00.00 grep safari


You can see a list of running programs and their PID values in the terminal using the "top" utility:

% top

Processes: 540 total, 3 running, 537 sleeping, 2455 threads                   	16:24:24

Load Avg: 1.05, 1.09, 1.17  CPU usage: 2.1% user, 2.48% sys, 95.50% idle

SharedLibs: 670M resident, 122M data, 71M linkedit.

MemRegions: 79919 total, 3430M resident, 570M private, 2089M shared.

PhysMem: 15G used (2487M wired), 204M unused.

VM: 204T vsize, 3823M framework vsize, 0(0) swapins, 0(0) swapouts.

Networks: packets: 14481172/7542M in, 10866206/9338M out.

Disks: 1618664/32G read, 799320/24G written.

PID	COMMAND  	%CPU TIME 	\#TH   \#WQ  \#PORT MEM	PURG   CMPRS  PGRP  PPID

171	WindowServer 6.5  47:39.13 17	3	1775- 220M-  9600K- 7792K  171   1

10555  top      	5.2  00:00.58 1/1   0	27+   6545K  0B 	0B 	10555 10519

466	Terminal 	2.0  00:03.48 6/1   1	258+  44M	15M	1664K  466   1

**10239  Safari   	1.4  00:31.49 6 	2	514   62M	0B 	0B 	10239 1**

It is also possible to see programs and their PID values in the macOS "Activity Monitor.app" utility. In the top right corner of the Activity Monitor window you can type in the name of the program in the search field to filter the results in the view down to what matters.

![][image348]

vNumberResolvePID

Returns the Resolve/Fusion PID (Process ID)

A PID value is an integer style number that is used by the operating system to track a running executable. 

Often PID values are the identifier used to tell an external program to gracefully quit. A PID number can also be used by the "renice" terminal utility to help balance the compute load on a system by scaling back the resource hogging level of a single dominant program that is reducing the overall interactivity of the host computer.

![][image83]

vNumberResolveTimelineFPS

Returns the Resolve Timeline frame rate

This node is useful if you need to perform math operations that need to be informed of the Resolve project's current frame rate value.

![][image85]

vNumberSlashCommand

Run a Console Fuse SlashCommand as a node

vNumberProcessOpen

Launch a command-line process via popen

vNumberAbsolute

Returns the absolute value of a number

This node is handy if you need to remove the negative sign (-) element from a value so you only have the positive component of the number remaining.

![][image354]

vNumberMax

Returns the maximum of two numbers

![][image357]

vNumberStep

Generates a step function by comparing two values

![][image329]

vNumberSquareRoot

Returns the square root of a number

![][image276]

vNumberDivide

Returns the quotient of two numbers

![][image91]

vNumberMin

Returns the minimum of two numbers

![][image99]

vNumberModulus

Returns the remainder of the division of x by y that rounds the quotient towards zero

If a vNumberCompReqTime or vNumberCompCurrentTime node is piped into the "Dividend" input connection, you can use the modulus operator to create a looping number range with the Divisor control.

For example, a Divisor value of 10 will cause the output from modulus to cycle from 0-9 in loops 5 times as the playhead advances through a render start/end frame range of 0 - 50.

![][image136]

vNumberReciprocal

Returns the reciprocal of a number

![][image374]

vNumberClamp

Clamps a number to specific boundaries

![][image175]

vNumberFractional

Returns the fractional part of a number

![][image258]

vNumberSubtract

Returns the difference of two numbers

![][image260]

vNumberCeil

Returns the integer no greater than a number

This provides a way to round a floating point number to a whole number (an integer value) by rounding upwards to remove the digits to the right of the decimal place.

Ceil (ceiling) is the counterpoint to the floor rounding method.

![][image92]

vNumberPower

Returns the power of a number

![][image229]

vNumberFloor

Returns the integer no less than a number

This provides a way to round a floating point number to a whole number (an integer value) by rounding downwards to remove the digits to the right of the decimal place.

![][image236]

vNumberEase

Performs a specific interpolation between two numbers during a defined time duration

![][image369]

vNumberSign

Returns the sign of a number

The output from the node will be either "-1", "0", or "1".

![][image388]

vNumberIntegral

Returns the integral part of a number

![][image280]

vNumberSmoothstep

Generates a smoothstep function

![][image387]

vNumberMultiply

Returns the product of two numbers

![][image214]

vNumberMix

Performs a linear interpolation between two numbers

![][image322]

vNumberAdd

Returns the sum of two numbers

![][image394]

vNumberPartialPermutation

Returns the sum of two numbers

![][image396]

vNumberFactorial

Returns the product of all positive integers less than or equal to InNumber

![][image203]

vNumberCosine

Returns the cosine for a number in radians

![][image120]

vNumberArcTangent

Returns the inverse tangent for a number in radians

![][image289]

vNumberSine

Returns the sine for a number in radians

![][image192]

vNumberArcCosine

Returns the inverse cosine for a number in radians

![][image25]

vNumberHyperbolicSine

Returns the hyperbolic sine of a number in radians

![][image191]

vNumberHyperbolicTangent

Returns the hyperbolic tangent of a number in radians

![][image182]

vNumberHyperbolicCosine

Returns the hyperbolic cosine for a number in radians

![][image100]

vNumberDegreesToRadians

Returns the radian value as a number in degrees

![][image217]

vNumberTwoArgumentArcTangent

Returns the arc tangent of y/x (in radians) but uses the signs of both parameters to find the quadrant of the result

![][image288]

vNumberArcSine

Returns the inverse sine for a number in radians

![][image192-1]

vNumberRadiansToDegrees

Returns the degree value as a number in radians

![][image75]

vNumberTangent

Returns the tangent for a number in radians

![][image291]

vNumberFromArray

Creates a Number from an array

The "Index" control allows you to select the array item (cell) to return as a number based value.

![][image382]

vNumberAnd

Performs a logical AND operation on two numbers

![][image82]

vNumberOr

Performs a logical OR operation on two numbers

![][image308]

vNumberTernary

Compare a value and return one of two possible results

![][image420]

vNumberNotEqual

Compares two numbers to see if they are not equal

A zero (false) or one (true) based number is returned from the comparator operation.

![][image219]

vNumberEqual

Compares two numbers to see if they are equal

A zero (false) or one (true) based number is returned from the comparator operation.

![][image319]

vNumberNot

Performs a logical NOT operation on a number

![][image8]

vNumberGreater

Compares two numbers to see if Term 1 is greater than Term 2

A zero (false) or one (true) based number is returned from the comparator operation.

![][image415]

vNumberGreaterEqual

Compares two numbers to see if Term 1 is greater than or equal to Term 2

A zero (false) or one (true) based number is returned from the comparator operation.

![][image90]

vNumberLessEqual

Compares two numbers to see if Term 1 is less than or equal to Term 2

A zero (false) or one (true) based number is returned from the comparator operation.


![][image414]

vNumberLess

Compares two numbers to see if Term 1 is less than Term 2

A zero (false) or one (true) based number is returned from the comparator operation.

![][image237]

vNumberCompCurrentTime

Returns the comp's Current Time

The current time represents the point where the timeline playhead is positioned regardless of any temporal effects that might be happening.

![][image70]

vNumberCompProxy

Returns the comp's Proxy state

The True and False inputs on the node let you define a custom value that is returned for the Proxy logic state.

Setting the True and False inputs to a value of "True = 2" & "False = 1" makes it easier to directly connect the vNumberCompProxy output to a Switch node's Which input that starts the first switchable input connection as "Which = 1".

Note: There is a slight instability that can occur with this node if you rapidly toggle the "Prx" state On/Off while playing back footage in the Fusion timeline with the vNumberCompProxy node active. A solution to this issue is being explored.

![][image421]

vNumberCompProxyScale

Returns the comp's Proxy Scale

![][image56]

vNumberCompGlobalEnd

Returns the comp's Global End

This is the last frame of the full Fusion timeline range. This number is not always set to the same range as the render end timeline control.

![][image155]

vNumberCompRenderEnd

Returns the comp's Render End

This is the last renderable frame when a batch render is carried out.

![][image81]

vNumberCompReqTime

Returns the comp's request time

This is the currently requested frame that is being processed at render time. It supports temporal effects like the vTextAccumulator node that iterates over a frame duration.

![][image194]

vNumberCompFrameformat

Returns the comp's frame format

This node outputs a Width and Height parameter derived from the current comp's FrameFormat settings.

![][image77]

vNumberCompRenderStart

Returns the comp's Render Start

This is the first renderable frame when a batch render is carried out.

![][image30]

vNumberCompFPS

Returns the comp's frame rate

![][image379]

vNumberCompGlobalStart

Returns the comp's Global Start

This is the first frame of the full Fusion timeline range. This number is not always set to the same range as the render start timeline control.

![][image144]

vNumberFromText

Returns a number from a Fusion Text object

This node converts an ASCII text based string that holds numerical content like "5" into an actual number data type that can have math operations performed on the value. This is a useful step if you need to connect a numerical value to an Inspector based attribute on another node.

![][image123]

vNumberFromCSV

Creates a Fusion Number object by extracting a single cell from a CSV formatted block of text

The "Row" control is used to define the CSV line number to read.

The "Column" control is used to increment through each set of comma separated entries on a single line of CSV input data.

The "Ignore Header Row" checkbox will offset the first index position to start at line 2 in the CSV file. This will skip over a labelled header row in the source document to avoid that information being accessed as part of the ingested data.

![][image188]

vNumberRange

Creates a Fusion Number object

The range node creates a list of numbers that vary between the "From" and "To" values. The "Step" control increases the incremental rate of change in the output.

If the "From" value was set to 0, and the "To" value was set to 5 the output from the node would be formatted like:

\[0,1,2,3,4,5\]

![][image54]

vNumberIntegerCreate

Creates an integer Fusion Number object

This node creates whole number based values with no floating point decimal based component. This node is an excellent choice if you want to drive the "Which" attribute on any of the Switch nodes available in Vonk.

![][image89]

vNumberCreateArch

Creates a unique Fusion Number object per CPU architecture

If the fuse is rendered on a 32-bit Intel/AMD CPU based system a value of 1 is returned. (Note: Fusion Studio v8+ were only released as 64-bit builds so it is of low likelihood you are going to see an x86 value returned from this node.)

If the fuse is rendered on a 64-bit Intel/AMD CPU based system a value of 2 is returned.

If the fuse is rendered on an ARM 64-bit system, like an Apple Silicon CPU, a value of 3 is returned.

![][image383]

vNumberCreateBool

Returns a 0-1 range integer Fusion Number object

This node uses a checkbox control to output a true (1) or false (0) logic state. 

![][image422]

Usage tip: This node's boolean like checkbox value can be used to drive a Switch node's "Which" control. This checkbox control makes it a single click operation in a macro node (MacroOperator or GroupOperator) to be able to toggle between an input1 / input2 connection. To do this you simply have to insert an vNumberAdd node, (that is set to increment the value up by 1), between the vNumberCreate node's output (0-1) logic state, and the Switch node:

vNumberCreateBool.Output \> vNumberAdd.Term1 \> Switch.Which

Node setting to change:

vNumberAdd.Term2 = 1

vNumberCreatePlatform

Creates a unique Fusion Number object per OS platform

If the fuse is rendered on a macOS system a value of 1 is returned.

If the fuse is rendered on a Windows system a value of 2 is returned.

If the fuse is rendered on a Linux system a value of 3 is returned.

![][image93]

vNumberCreateRandom

Creates a Fusion Number object

This node uses a pseudo-random number generator to create a number that fits within the upper and lower range that is defined. If you animate the seed value, the number will change on each frame.

![][image152]

vNumberCreate

Creates a Fusion Number object

This node is the starting point for most number data type based node graphs. The output is a floating point number that can go up to "1e+38".

![][image360]

vNumberFromVector

Returns a number from a vector

![][image233]

vNumberToMatrix

Returns a matrix from a number

![][image408]

vNumberFromMatrix

Returns a number from a matrix

![][image166]

vNumberWireless

The vNumberWireless node allows you to connect to other number based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

![][image252]

vNumberSwitch

Switches between Fusion Number objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a vNumberSwitch node's "Which" input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.

The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image156]

Point Nodes

vPointCreate

Create a Fusion Point object

![][image314]

vPointCreateImage

Create a Fusion Point object with an image visible in the background



![][image346]

The "Add Metadata" checkbox creates image output metadata entries for the point coordinates formatted as:

XOffset = 0.5

YOffset = 0.5

If you enable the viewer window's "Metadata" sub-viewer entry you can quickly see the information that is appended to the image output stream.

![][image206]

![][image409]

vPointFromMousePos

Return a Fusion Point object that holds the current mouse X & Y cursor position

![][image98]

Coord Mode

The "Coord Mode" multi-button control allows you to define the units used when reporting the mouse position. The "Native" option will return the original unmodified "raw" cursor position coordinates. The "Normalized" option will return a 0-1 range value for the X/Y cursor position. 

Screen Dimensions

The normalization process can be carried out using either the "Manual Entry" option which is based upon manually entered screen width and height parameters along with a screen ui size scaling parameter, or through using the "Fu Prefs" option which is based upon the existence of a Fusion preferences "Layout" page based saved window size value.

If no Fusion preferences based window sizing parameters are found you will see an error reported to the Console window when the "Fu Prefs" option is enabled. The message reported is:

\[Error\] The Fusion window size preference is undefined. Please save an initial window position in the Layout Preference section.

Note: Make sure to load the vPointFromMousePos node's output into the left or right viewer window before displaying a downstream node like a b-spline shape and a Transform node that is driven by the mouse position value via a "Connect To" approach. 

Failure to view the vPointFromMousePos node before displaying the downstream node will likely lead to lockups in Fusion v18.

vPointFromNumber

Return a Fusion Point object from two numbers

![][image172]

vPointToNumber

Return a pair of numbers from a Fusion Point object

If you want a quick way to be able to view the individual number outputs from this node in the viewer window, try adding a pair of pipe-routers to the output connections.

![][image364]

vPointCreateRandom

Create a Fusion Point object with a random position

![][image187]

vPointAbsolute

Returns a Fusion Point object with an absolute value

![][image313]

vPointMix

Performs linear interpolation between two Fusion Point objects

![][image1]

vPointPower

Returns the power of a Fusion Point object

![][image76]

vPointTimeStretch

Time based operations on a Fusion Point object

![][image195]

vPointTimeSpeed

Time based operations on a Fusion Point object

![][image197]

vPointDelay

Creates a Delay while passing a Fusion Point object

![][image29]

vPointFromText

Returns a Fusion Point object from two Text inputs

![][image343]

vPointToText

Return a pair of Text objects from a Fusion Point object

![][image246]

vPointAdd

Returns the sum of two Fusion Point objects

This node can be used to apply a positive offset to the origin of the 1st point by the 2nd point's displacement distance.

![][image84]

vPointClamp

Clamp a Fusion Point object to specific boundaries

This acts as a hard limiter on the range of numbers that can pass through the Point control. Numbers that exist below the minimum range, or above the maximum range are clipped to those boundaries.

![][image403]

vPointDivide

Returns the quotient of two Fusion Point objects

This node can be used to apply a scale reducing effect to the origin of the 1st point by the 2nd point's displacement distance.

![][image259]

vPointModulus

Returns the remainder of the division of a Fusion Point object that rounds the quotient towards zero

The "Divisor X" and "Divisor Y" controls make it possible to create a looping effect that wraps the Point locator on each axis of motion so it stays within a range of 0 to (one less than the Divisor value).

![][image278]

vPointMultiply

Returns the product of two Fusion Point objects

This node can be used to apply a scale enlargement effect to the origin of the 1st point by the 2nd point's displacement distance.

![][image168]

vPointSubtract

Returns the difference of two Fusion Point objects

This node can be used to apply a negative offset to the origin of the 1st point by the 2nd point's displacement distance.

![][image220]

vPointAngle

Measure the angle in degrees between two Fusion Point objects

The output from this node is a Number datatype that reports the angle between Point1 and Point2.

![][image71]

vPointLength

Measure the distance between two Fusion Point objects

The output from this node is a Number datatype that reports the distance between Point1 and Point2.

![][image295]

If you have an image loaded in the viewer window, and then select the vPointLength node to edit its attributes in the Inspector tab, you will see the Point1 and Point2 locator handle overlays onscreen.

![][image397]

vPointSwitch

Switch between Fusion Point objects

![][image325]

vPointWireless

The vPointWireless node allows you to connect to other 2D Point datatype based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

![][image110]

ScriptVal Nodes

vScriptValCreate

Create a Fusion ScriptVal object

The ScriptVal datatype in Fusion is used to pass Lua tables that hold arbitrary data between nodes. This makes it possible to create custom c-code struct like records that travel through the node graph in a seamless fashion.

An example of Lua table formatted information is:

\{

num = 3.14,

foo = "Hello",

snafu = \{

tarfu = "Fuse",

\},

bar = "World",

\}

![][image390]

vScriptValFromApp

Create a Fusion ScriptVal object from the Resolve/Fusion application and comp UserData

This node explores the output from Resolve() and Fusion(), along with the current composition attributes via GetAttrs(). The result of this process is a very detailed memory dump of the active parameters users typically interface with. 

In Resolve it is possible to see a report of the Project Manager, Project, Media Pool, Clips, Folders, Markers, and Timelines.

![][image344]

Sample "vScriptValFromApp" output from Fusion Studio:

![][image131]

Sample "vScriptValFromApp" output from Resolve Studio:

![][image297]![][image106]

vScriptValFromArray

Casts a JSON array into a ScriptVal object

This node takes a Text datatype based JSON array as the input which is translated into a ScriptVal based output.

The "Sort List" checkbox will alphabetically sort the Lua table formatted results generated by the node.

![][image157]

vScriptValToArray

Casts a ScriptVal object into a JSON array

This node takes a ScriptVal datatype as the input which is translated into a Text based JSON array output.

![][image299]

vScriptValFromDate

Create a Fusion ScriptVal object from the Lua os.date() table output


![][image303]

vScriptValFromListFiles

Create a Fusion ScriptVal object from a bmd.readdir() listing of files

![][image69]

vScriptValFromListFonts

Create a Fusion ScriptVal object from a listing of fonts

Sample output from the "vScriptValFromListFonts" node when formatted as text based Lua table output looks like:

\{

"Academy Engraved LET",

"Al Bayan",

"Al Nile",

"Al Tarikh",

"American Typewriter",

"Andale Mono",

"Apple Braille",

"Apple Chancery",

"Apple SD Gothic Neo",

"Apple Symbols",

"AppleGothic",

"AppleMyungjo",

"Arial",

"Arial Black",

"...",

\}

![][image284]

vScriptValFontMetrics

Return font measurements as a Fusion ScriptVal object

Sample output from the "vScriptValFontMetrics" node when formatted as text based Lua table output looks like:

\{

FontMetrics = \{

TypeName = "TextStyleFontMetrics",

CharWidthAverage = 0,

UnderlineThickness = 123,

TextExternalLeading = 0,

TextInternalLeading = 0.0232686980609418,

TypeNamePtr = "TextStyleFontMetrics\*",

TextDescent = 0.0175623268698061,

Scale = 3610,

TextAscent = 0.0624376731301939,

FontSize = 0.1,

CharWidthSpace = 0.0189196675900277

\},

Font = "Arial Black",

Text = "Hello",

Style = "Regular",

Size = 0.1

\}


![][image15]

vScriptValFromEXRFile

Convert OpenEXR header, part, and channel data into a ScriptVal

This node is useful for generating a listing of the channel and part data from an EXR image without having to load the pixel data into a frame buffer.

Sample output from the "vScriptValFromEXRFile" node when formatted as text based Lua table output looks like:

\{

Source = "/Volumes/Farm/Houdini Karma.exr",

Filename = "Houdini Karma.exr"

Ext = ".exr",

Type = "EXRPart",

Parts = \{

\{

Name = "C",

Width = 3840,

Height = 1600,

PixelAspectRatio = 1,

CenterX = 0,

CenterY = 0,

Channels = \{

\{

XSampling = 1,

YSampling = 1,

PLinear = false,

Name = "A",

Type = 1

\},

\{

XSampling = 1,

YSampling = 1,

PLinear = false,

Name = "B",

Type = 1

\},

\{

XSampling = 1,

YSampling = 1,

PLinear = false,

Name = "G",

Type = 1

\},

\{

XSampling = 1,

YSampling = 1,

PLinear = false,

Name = "R",

Type = 1

\}

\}

\},

\},

\}

![][image130]

vScriptValFromMetadata

Casts image metadata to a Fusion ScriptVal object

This node takes an image as the input. The output is the image metadata encoded in a ScriptVal object format.

![][image224]

vScriptValToMetadata

Creates a Fusion image with metadata added from a ScriptVal object

This node has two input connections which are used for connecting an image and a ScriptVal data type. The output from the node is the image with metadata added.

![][image282]

vScriptValFromPoint

Creates a ScriptVal from a point

The ScriptVal formatted Lua table output of an X/Y 2D Point looks like this:

\{

0.5,

0.5

\}

![][image228]

vScriptValToPoint

Return a Fusion Point object from a ScriptVal

![][image139]

vScriptValFromPingHosts

Create a Fusion ScriptVal object from a Fusion ping hosts subnet scan


![][image320]

vScriptValFromPrefs

Create a Fusion ScriptVal object from the Fusion preferences

The ScriptVal formatted Lua table output looks like this:

\{

\{

Platform = "Windows",

Version = "18.0",

Hosts = \{

"FusionServer",

"Fusion",

"Fusion",

"Fusion"

\},

HostName = "R1",

IP = "10.20.30.1",

UserName = "R1$"

\},

\}


![][image21]

vScriptValFromRegistry

Create a Fusion ScriptVal object from the Fusion registry

![][image407]

vScriptValFromXML

Creates a ScriptVal object from XML

This node accepts a text based input in an XML format. The result is translated into a ScriptVal object on the output.

![][image184]

vScriptValFromCustomData

Create a Fusion ScriptVal object from Custom Data

The "Text" control is used to specify the key used for the CustomData record. CustomData entries use a dot syntax for the hierarchy. If you define a lower level name it will return the full Lua table structure with multiple preference items at the same time.

The "Context" control reads the CustomData from either the Fusion scope, or the Comp scope.

![][image33]

Fusion Scope

The Fusion scope CustomData entries are stored on disk at the PathMap location of:

Profiles:/Default/Fusion.prefs

In the "Fusion.pref" file Lua table, the Fusion scope CustomData entries are found under:

Global.Script.GlobalData = \{\}

Using Lua you can save a CustomData setting into Fusion:

-- Fusion Scope

fusion:SetData("Vonk.Version", 1)

Comp Scope

When using Comp scope CustomData entries, this is what the Lua table formatted CustomData records look like in a .comp file:

Composition \{

CustomData = \{

Vonk = \{

Date = \{

hour = 18,

min = 39,

wday = 7,

day = 24,

month = 9,

yday = 267,

sec = 44,

year = 2022,

isdst = true

\},

Version = 1,

UUID = "86cb495e-36ea-43eb-8761-7e27cf7ea947"

\}

\},

\}

Using Lua you can save a CustomData setting into a comp:

-- Comp Scope

comp:SetData("Vonk.Version", 1)

vScriptValToCustomData

Save a Fusion ScriptVal object to Custom Data

The "Text" control is used to specify the key used for the CustomData record. CustomData entries use a dot syntax for the hierarchy. If you define a lower level name it will return the full Lua table structure with multiple preference items at the same time.

The "Context" control writes the CustomData to either the Fusion scope, or the Comp scope.

![][image7]

vScriptValFromFile

Reads a Fusion ScriptVal object from a file

This node reads a text formatted version of a Lua table structure from disk. The result is translated into a ScriptVal object on the output.

![][image3]

vScriptValToFile

Writes a Fusion ScriptVal object to a file

This node writes a text formatted version of a Lua table structure to disk.

![][image216]

vScriptValFromText

Convert a Fusion Text object into a ScriptVal

This node expects a text formatted version of a Lua table structure as the input. The result is translated into a ScriptVal object on the output.

![][image316]

vScriptValFromBinaryFile

Reads a Fusion ScriptVal blob encoded object from a binary file

The binary file data is Base64 encoded and placed in a Lua table structure. A sample output from this encoding process looks like:

\{

Base64 = "SGVsbG8gV29ybGQh",

Base64Size = 16,

BinarySize = 12,

Ext = ".txt",

Filename = "Hello.txt"

Source = "/Users/vfx/Desktop/Hello.txt",

Type = "File",

\}

![][image400]

vScriptValToBinaryFile

Writes a Fusion ScriptVal blob encoded object to a binary file

![][image163]

vScriptValFromJSON

Casts JSON text into a ScriptVal object

This node takes a Text datatype based JSON as the input which is translated into a ScriptVal datatype based output.

The "Sort List" checkbox will alphabetically sort the Lua table formatted results generated by the node.

![][image232]

vScriptValToJSON

Casts a ScriptVal object into JSON text

This node takes a ScriptVal datatype as the input which is translated into a JSON Text datatype based output.

The "Sort List" checkbox will alphabetically sort the Lua table formatted results generated by the node.

![][image392]

vScriptValToText

Convert a Fusion ScriptVal object into Text

The Text based multi-line output from this node can be displayed in the Inspector view with the vTextViewer node.

![][image102]

vScriptValGetToText

Gets the value of a ScriptVal key

![][image389]

vScriptValGetElementToText

Gets an element from a ScriptVal array

An example of array like elements in a Lua table would look like this:

\{

"1",

"2",

"3",

"4",

"5",

"6",

"7",

"8",

"9",

"10",

\}

The "Index" control is used to access individual entries from a ScriptVal array like object. The first item is accessed at Index position 1.

The output from the vScriptValGetElementToText node is a text based data type. It is possible to translate the text based output from this node into numerical values via the vNumberFromText node.

![][image350]

vScriptValGetToNumber

Gets the value of a ScriptVal key as a Fusion Number

The output from the vScriptValGetToNumber node is a Number based data type that can be used to drive number based controls in the Inspector view like transforms, rotations, scale, angle, or other parameters. You can also use the Number based output from the vScriptValGetToNumber node to carry out further node-based math operations with nodes like vNumberAdd, vNumberSubtract, vNumberMultiply, vNumberDivide, etc..

![][image140]

vScriptValGetToTable

Gets the value of a ScriptVal key as a table

The output from the vScriptValGetToTable node is a ScriptVal based data type.

![][image402]

vScriptValGetElementToTable

Gets an element from a ScriptVal array as a table

The "Index" control is used to access individual entries from a ScriptVal array like object. The first item is accessed at Index position 1.

The output from the vScriptValGetElementToTable node is a ScriptVal based data type.

![][image143]

vScriptValKeysToText

Returns the keys present in a ScriptVal object

![][image330]

vScriptValKeysToTable

Returns the keys present in a ScriptVal object as a table

![][image226]

vScriptValToNumber

Convert a Fusion ScriptVal object into a Number

![][image331]

vScriptValFromNumber

Convert a Fusion Number object into a ScriptVal

![][image302]

vScriptValRemoveElement

Removes an element from a ScriptVal array using its index position

![][image50]

vScriptValTrimElement

Extract a range of elements from a ScriptVal array as a table

This node is useful for creating animated vector graphics that are revealed over time when your 2D point data is encoded into a ScriptVal Lua table structure that represents a polyline shape.

![][image147]

vScriptValDoFile

Return a ScriptVal object from running an external Lua script

![][image261]

vScriptValDoString

Return a ScriptVal object from running a string of Lua code

The ScriptVal based input connection on the node can be accessed in the script using a Lua table variable named "tbl".

The ScriptVal based output connection on the node receives the data that is defined by the "return" command.

The "Script Header Wire" input is used to specify a text datatype connection of code that is appended to the top of the Lua Script field contents when run. The script content connected to the Script Header Wire field is typically sourced from a vTextCreateMultiline or vTextFromFile node.

The vScriptValMerge node can be used to combine multiple ScriptVal objects before they are passed into the vScriptValDoString node.

In your Lua Script code you can iterate through each record in the Lua table data using:

for i, v in ipairs(tbl) do

end

If you need to temporarily troubleshoot the internals of what your code is doing in the vScriptValDoString node there are two diagnostic checkbox controls labelled "Show Code" and "Show Dump". The output from those options is displayed in the Console window. For performance reasons you probably want to leave those options turned off most of the time when rendering long sequences in Fusion to reduce the Console logging overhead.

![][image410]

vScriptValCreatePolyline

Create a polygon line shape from a ScriptVal based Lua table of XY point pairs

An example of 2D point like elements in a Lua table would look like this:

\{

\{

0.382075787528567,

0.534720150858805

\},

\{

0.436349336750095,

0.490753326992875

\},

\{

0.486955559603984,

0.440547877640415

\},

\{

0.531495059415565,

0.386469304121596

\},

\{

0.568050230127849,

0.331244047492371

\},

\{

0.595285357663032,

0.277804252649087

\},

\{

0.612508622697929,

0.229116724236359

\},

\{

0.619692622456641,

0.188006456120492

\}

\}

![][image105]

vScriptValAccumulator

Temporally concatenateScriptVal elements into one table

![][image213]

This node can be thought of as a ScriptVal based merge node that works across a time range. It can be used to create Lua Table based array elements that are built over time from dynamically generated tables of data.

The "Start Frame" control will often be driven by a vNumberCompRenderStart or vNumberCompGlobalStart node.

The "End Frame" control will often be driven by a vNumberCompRenderEnd or vNumberCompGlobalEnd node.

The "Step" control allows for frame skipping to occur.

The "Sort List" checkbox works on a line-by-line basis to alphabetically sort the results generated by the node.

If you want to stop a vScriptValAccumulator node from re-rendering on subsequent frames in the Fusion timeline, you can add a "vScriptValTimeSpeed" node right afterwards and set the Speed to 0 and the Delay to 0.

The data combined together by a vScriptValAccumulator node can be separated again into individual items using the vScriptValGetElementToTable node.

vScriptValTimeSpeed

Time based operation on ScriptVal objects

![][image273]

vScriptValTimeStretch

Time based operation on ScriptVal objects

![][image335]

vScriptValCount

Count the number of items in a Fusion ScriptVal object

This node returns a number data type that indicates how many array elements exist at this level in a ScriptVal hierarchy. This return value could be used to drive a vTextAccumulator node's EndFrame attribute if you wanted to increment through each of the array elements.

![][image358]

vScriptValDump

Dump the contents of a Fusion ScriptVal object to the Console

![][image376]

vScriptValMerge

Dynamically join ScriptVal elements into one table

![][image145]

vScriptValFromYAML

Casts YAML text into a ScriptVal object

Technology Note: [YAML](https://yaml.org/) is used as part of Film & TV production lens metadata workflows by Cine lenses with sensors and encoders like the [Cooke Optics /i Technology](https://cookeoptics.com/i-technology/) metadata system. YAML metadata exchange is also starting to be used by other Cine lens manufacturers, in match-moving and tracking packages like [SynthEyes](https://www.ssontech.com/) and PFTrack, and as part of data exchange approaches like [OpenTimelineIO](https://github.com/reinecke/otio-cookelensmetadata), too.

Blackmagic BRAW media filmed on a [BMD URSA Mini Pro 12K](https://www.blackmagicdesign.com/products/blackmagicursaminipro) camera with a Cooke Optics PL-mount lens is capable of holding this YAML metadata recorded lens information internally. This is useful for supporting better data interchange between VP (Virtual Production) onset ICVFX (In-Camera VFX) departments and subsequent post-production workflows carried out by external vendors.


![][image107]

vScriptValSwitch

Switch between Fusion ScriptVal objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a vScriptValSwitch node's Which input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.

The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image361]

vScriptValWireless

Wirelessly link to ScriptVal nodes

The vScriptValWireless node allows you to connect to other ScriptVal based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

![][image234]

Shape Tree Nodes

vShapeSwitch

Switch between Fusion ShapeTree objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a vShapeSwitch node's Which input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.


The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image334]

*Note: A Fusion ShapeTree datatype accessibility bug was reported to BMD at the end of July 2022. This bug affects the usability of all ShapeTree based fuses in Fusion v17-v18.0.x. Hopefully a bugfix from BMD will solve an issue where a connected sRender nodes' input is rendered as a transparent canvas if a Fuse is placed upstream in the toolchain.*

vShapeWireless

Create wireless links to Fusion ShapeTree objects

The vShapeWireless node allows you to connect to other shape based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

*Note: A Fusion ShapeTree datatype accessibility bug was reported to BMD at the end of July 2022. This bug affects the usability of all ShapeTree based fuses in Fusion v17-v18.0.x. Hopefully a bugfix from BMD will solve an issue where a connected sRender nodes' input is rendered as a transparent canvas if a Fuse is placed upstream in the toolchain.*


![][image413]

JSON Nodes

vJSONToFile

Writes a JSON string into a file

The "File" text field is used to specify the filename of the JSON document to be written to disk.

The JSON file will be saved when the node is viewed/rendered. The contents of the JSON file is sourced from the text based input connection on the node.

![][image210]

vJSONFromNet

Reads a JSON string from a network URL

The network-based JSON resource downloading functionality provided by this node makes it possible to drive a composite from an external cloud based datasource. 

This means IoT (Internet of Things) electronic sensors, sports statistics, financial data, or any other web enabled datasource can be used on-the-fly to supply Text, Number, Matrix, Array, or other values to nodes in the comp.

![][image49]

vJSONFromFile

Reads a JSON string from a file

The "Input" text field is used to specify the disk-based filename of the JSON document to be read.

The JSON file will be loaded when the node is viewed/rendered. The contents of the JSON file is returned via a text based data type output connection on the node.

![][image355]

vJSONGet

Gets the value of a JSON key

The "Key" text-field is used to select and isolate a specific entry from a JSON file.

The output from the vJSONGet node is a text based data type. 

You can stack several vJSONGet nodes in a row to browse upwards in the hierarchy of a nested JSON structure.

It is possible to translate this text based output from this node into numerical values via the vNumberFromText node. This is a useful step if you want to perform math operations downstream of this node, or if you need to connect a numerical value to an Inspector based attribute on another node.

![][image245]

vJSONGetElement

Gets the element of a JSON array

The "Index" control is used to access individual entries from a JSON array type of object.

The node expects a text based JSON array object as the input.

The output from the vJSONGetElement node is a text based data type. It is possible to translate the text based output from this node into numerical values via the vNumberFromText node.

The first item is accessed at Index position 1.

![][image104]

vJSONSet

Sets a new key value pair in a JSON table

The "Key" text-field lets you enter the name of the JSON element to be modified/inserted. The 2nd text field is used for the "Value" field which holds the actual data you want to store.

The vJSONSet node makes it possible to create new JSON data structures that can be saved to disk using a vJSONToFile node.

![][image68]

vJSONCountElement

Counts the elements in a JSON array

The node expects a text based JSON array object as the input.

This node returns a number data type that indicates how many array elements exist at this level in a JSON hierarchy. This return value could be used to drive a vTextAccumulator node's EndFrame attribute if you wanted to increment through each of the array elements.

![][image113]

Text Nodes

vTextAccumulator

Temporally concatenates a text string over a frame range

This node can be thought of as a text based merge node that works across a time range. It can be used to create IFL (image file lists) or other types of results that are built over time by dynamically generated strings of text.

The "Start Frame" control will often be driven by a vNumberCompRenderStart or vNumberCompGlobalStart node.

The "End Frame" control will often be driven by a vNumberCompRenderEnd or vNumberCompGlobalEnd node.

The "Step" control allows for frame skipping to occur.

The "Separator" text field is used to define the character placed between each text element that is concatenated (merged) together. You might want to use a separator like a space, a comma, a semicolon, or a newline (\\n), return (\\r), or a tab (\\t).

The "Sort List" checkbox works on a line-by-line basis to alphabetically sort the results generated by the node.

The "Remove Duplicates" checkbox can be used to remove any lines that have an identical output that pre-exists in the results.

The counterpoint to the vTextAccumulator node is the vTextReadLine node that can break apart a multi-line text block into single line elements.

If you want to stop a vTextAccumulator node from re-rendering on subsequent frames in the Fusion timeline, you can add a "vTextTimeSpeed" node right afterwards and set the Speed to 0 and the Delay to 0.

![][image196]

vTextTimeSpeed

Time based operation on text

![][image351]

vTextTimeStretch

Time based operation on text

![][image207]

vTextOrderShuffle

Shuffles the order of a Fusion Text object

The "Text" field contents will be output with a randomized order. This is done using an approach known as a [Fisher--Yates](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle) shuffle.

If you typed in "Hello Shuffle World!" the output would be "Wdool uhSffod rlHoe!".

![][image199]

vTextOrderReverse

Reverses the order of a Fusion Text object

The "Text" field contents will be output letter-by-letter in a right-to-left mirrored fashion that reverses the text's placement. 

If you typed in "Hello Shuffle World!" the output would be "!dlroW elffuhS olleH".

![][image150]

vTextResolvePID

Returns the Resolve/Fusion PID (Process ID)

A PID value is an integer style number that is used by the operating system to track a running executable. 

Often PID values are the identifier used to tell an external program to gracefully quit. A PID number can also be used by the "renice" terminal utility to help balance the compute load on a system by scaling back the resource hogging level of a single dominant program that is reducing the overall interactivity of the host computer.

![][image327]

vTextResolveProjectName

Returns the current Resolve project name

This node outputs a Text based string that holds the name of the current Resolve editing project as listed in the Resolve "Project Manager" window.

![][image418]

vTextToFile

Writes a Text string to a file

The "Input" text-field holds the textual content that is saved to disk.

The "File" text-field specifies the filename for the document.

Both of these controls can be driven externally by enabling the "Show Input" checkbox. You would then connect vTextCreate or vTextSubFormat like text based data nodes to the input connections on the vTextToFile node.

![][image9]

vTextFromZip

Reads a Text string from a zip archive

This node accesses a plain-text formatted resource that is stored inside a Zip archive using the Fusion v16+/Resolve v15+ based ZipIO library.

The "Zip File" field is used to define the filename of the zip archive.

The "Extract File" field is used to define the resource that is stored inside the zip archive.

Both attributes can be driven externally by a Text data type connection to the node.

![][image114]

vTextFromNet

Reads a Text string from a network URL

The "Input" text-field is used to supply the http://, https://, or file:// based URL.

The network-based text resource downloading functionality provided by this node makes it possible to drive a composite from an external cloud based datasource like a CSV (Comma Separated Value), TSV (Tab Separated Value), SVG (Scalable Vector Graphics), Fusion Macro .setting, Fusion .comp, etc.

This means IoT (Internet of Things) electronic sensors, sports statistics, financial data, or any other web enabled datasource can be used on-the-fly to supply Text, Number, Matrix, Array, or other values to nodes in the comp.

![][image386]

vTextFromComp

Reads text strings from a Fusion .comp file

This node tunnels inside of an external Fusion .comp file on disk and extracts string elements. These text strings are typically filepaths.

The "File" text field specifies which .comp file should be parsed.

The "Match" text field helps sort the content returned to filter the results.

The "File Exists" checkbox lets you further filter the results by looking on disk to see if the text string lines up with an actual file that exists.

The "Expand PathMaps" checkbox will automatically convert any relative filepaths into absolute filepaths on the output.

The "Sort List" checkbox works on a line-by-line basis to alphabetically sort the results generated by the node.

The "Remove Duplicates" checkbox is used to remove any line entry that is a duplicate entry, meaning the content is not unique.

![][image221]

vTextFromFile

Reads a Text string from a file

This node is used to access a block of text from a plain-text format style of document stored on disk. This is useful for accessing CSV (Comma Separated Value), TSV (Tab Separated Value), IFL (Image File Lists), or other external data resources.

The "Input" text field is used to specify the disk-based filename of the plain-text document to be read.

The "Remove Non-Printable Characters" checkbox is used to remove ASCII invisible control characters from the text stream. This allows the node to be used to extract ASCII strings from binary files.

The output from this node is a text data type.

![][image263]

vTextFromClipboard

Grabs the current clipboard text

The "Sort List" checkbox works on a line-by-line basis to alphabetically sort the results generated by the node.

The "Remove Quotes" checkbox is used to strip out any quote symbols found in the clipboard text. This is useful if you are trying to make an IFL like list and the source text was added to the clipboard buffer using the Windows "File Explorer" right-click based "Copy as path" contextual menu item.

This node works on Windows, macOS, and Linux.

![][image345]

vTextNotEqual

Compares two strings to see if they are not equal

The result is a false/true based number result of 0-1.

![][image238]

vTextEqual

Compares two strings to see if they are equal

The result is a false/true based number result of 0-1.

![][image393]

vTextTernary

Compare a value and return one of two possible strings as the result

![][image272]

vTextEncodeUrl

URL-encodes a Fusion Text object

![][image65]

vTextCompName

Returns the name of the comp

An example output from this node would be the base filename for the currently open .comp file like: "Demo Text.comp"

If the currently open composite is an unsaved document the node would output a string like:

"Composition1"

![][image161]

vTextCompCurrentTime

Returns the comp's current time value

The current time represents the point where the timeline playhead is positioned regardless of any temporal effects that might be happening.

![][image40]

vTextCompFilename

Returns the full path of a comp

An example output from this node would be an absolute filepath based string like:

"C:/ProgramData/Blackmagic Design/Fusion/Reactor/Deploy/Comps/Kartaverse/Vonk Ultra/Demo Text/Demo Text.comp"

![][image46]

vTextCompReqTime

Returns the comp's request time 

This is the currently requested frame that is being processed at render time. It supports temporal effects like the vTextAccumulate node that iterates over a frame duration.

![][image256]

vTextCompAppUUID

Returns the Fusion application process UUID

A UUID value is formatted like: 11625315-7785-4eb4-8b2f-d6dca235c42

This node is powered by the Lua function "bmd.getappuuid()".

![][image201]

vTextDoString

Return a Text object from running a string of Lua code

The node automatically creates new text input connections as needed.

The text based input data can be accessed in the script using a Lua table variable named "tbl".

The text based output connection on the node receives the data that is defined by the "return" command.

The "Script Header Wire" input is used to specify a text datatype connection of code that is appended to the top of the Lua Script field contents when run. The script content connected to the Script Header Wire field is typically sourced from a vTextCreateMultiline or vTextFromFile node.

In your Lua Script code you can iterate through each record in the Lua table data using:

for i, v in ipairs(tbl) do

end

If you need to temporarily troubleshoot the internals of what your code is doing in the vTextDoString node there are two diagnostic checkbox controls labelled "Show Code" and "Show Dump". The output from those options is displayed in the Console window. For performance reasons you probably want to leave those options turned off most of the time when rendering long sequences in Fusion to reduce the Console logging overhead.

![][image41]

vTextRunScript

Runs an external Lua script

The "File" text-field is used to specify an external .lua script file.

This node is powered by the Lua "dofile()" function.

Note: This node is effectively deprecated please use vTextDoString Instead.

![][image230]

vTextShellBG

Launch a command-line shell task in the background via bmd.executebg()

The "Wait" checkbox can be used to make the node act in a blocking fashion that will pause the rendering of this branch of the comp until the launched process has completed and exited.

![][image141]

Note: Make sure to write in the absolute filepath for the executable program you want to run. You can discover this by typing "which SomeProgramName" into the Terminal window on macOS/Linux:

which open

/usr/bin/open

Also, the vTextShellBG node is used to launch a program with its command line arguments specified. It is not a full terminal environment so shell redirection approaches and expanding environment variable tokens in the command string are not supported. If you need those extended command line scripting features, write out a temporary .bat/.sh/.command file to disk then use vTextShellBG to run the script.

vTextSlashCommand

Run a Console Fuse SlashCommand as a node

A SlashCommand is a type of Lua or Python script in Fusion that is normally launched from the Console window by prefacing a command with a leading "/" character.

![][image185]

SlashCommand Examples:

/for (selected\|visible\|all) \[tooltype\[,tooltype...\]\] \[where \<condition\>\] \<command\> \[ & \<command\>...\]

Supported commands:

animate \<input\> \[(with \<modifier\>\|remove)\] \[force\]

color \[tile \<color\>\] \[text \<color\>\] \[fill \<color\>\]

select \[(add\|remove)\]

set \<input\> (\[at \<time\>\] to \<value\>\|expression \<exp\>)

/footage list

Check out the Vonk Node Cookbook topic "SlashCommands" for more details about features and usage.

vTextDoAction

Executes Fusion actions

The "Action Name" text field is where the action you want to run is entered.

The "Action Params" text field contents are placed inside a Lua table like element \{\}. This information is used to specify any extra attributes you would like to pass along to the action when it is run.

The "Wrap Lines" checkbox makes it possible to enable/disable line wrapping in the text preview area.

![][image417]

DoAction is launched via the "self.Comp:Execute()" function so it is run asynchronously.

The [Action Listener](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Listener.lua) script provided by the Reactor Package manager's "UI Manager Lua & Python Examples" atom package for Fusion/Resolve is a great way to see actions at work from inside of your compositing application. It's possible to print out a list of the actions present inside of Fusion with the handy "[Action Printout](https://gitlab.com/WeSuckLess/Reactor/-/blob/master/Atoms/com.AndrewHazelden.UIManagerLuaExamples/Scripts/Comp/UI%20Manager/Action%20Printout.lua)" script.

If you want to peek into the Actions that are connected to the default hotkeys in Fusion take a look at the "[The Ultimate Listicle of Actions and Hotkeys](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=39238&fbclid=IwAR0X6aVCmAgTo2DGKef07Pzi7aVBJDbKcgEwSGo25XUvEObetcBeNCYJwRo#p39238)" post on the WSL forum.

The standard actions available in Resolve's Fusion page include:

Bin\_New\_Reel

Bin\_New\_Folder

Bin\_New\_Item

Bin\_Icon\_Size

Bin\_Show\_Checker

Bin\_View\_Mode

Effects\_ShowSearch

Effects\_Search

Flow\_Add\_Bookmark

Flow\_Go\_To\_Bookmark

Flow\_Manage\_Bookmarks

GraphView\_ZoomToFit

GraphView\_SortMenu

GraphView\_ZoomX

KeyframeView\_ZoomY

GraphView\_ZoomY

Player\_Item\_Next

Player\_Item\_Prev

Player\_Play

Player\_Play\_Forward

Player\_Play\_Reverse

Player\_Seek\_By

Player\_Seek\_To

Player\_Seek\_Start

Player\_Seek\_End

Player\_Seek\_Prev

Player\_Seek\_Next

Player\_Set\_Loop

Player\_Trim\_Set\_In

Player\_Trim\_Set\_Out

Player\_Gamma

Player\_Gain

Player\_Set\_FPS

Player\_Set\_Time

Player\_Guide\_Enable

Player\_Guide\_Select

Player\_Channel

Player\_Show\_Metadata

Player\_Sync\_Mode

Player\_Loop\_Set\_In

Player\_Loop\_Set\_Out

Player\_Loop\_Reset

Player\_Loop\_Set\_Shot

Player\_Device\_DeckLink

Fusion\_Screen\_Mode

Fusion\_View\_Show

Fusion\_Zone\_Expand

Fusion\_Time\_Set

Fusion\_Time\_Get

ACTION\_GET\_TEMPLATES\_LIST

ACTION\_GET\_UI\_LAYOUT

ACTION\_SET\_UI\_LAYOUT

ACTION\_SHOW\_CONSOLE

ACTION\_PRINT\_CONSOLE

ACTION\_CLOSE\_COMP

ACTION\_INSTALL\_FILE

No\_Action

Viewer\_Checker\_Enable

Viewer\_ROI\_Enable

Viewer\_ROI\_Auto

Viewer\_ROI\_Lock

Viewer\_ROI\_Set

Viewer\_ROI\_Reset

Viewer\_DOD\_Enable

Viewer\_3D\_Lighting

Viewer\_3D\_Wireframe

Viewer\_3D\_Solid

Viewer\_3D\_Lights

Viewer\_3D\_Shadows

Viewer\_3D\_Transparency

Frame\_Activate\_SubWnd

Frame\_Activate\_Frame

Frame\_Activate\_Next

Frame\_Activate\_Prev

Comp\_Choose\_Tool

Comp\_Choose\_Action

Execute

Comp\_New

Comp\_Open

Comp\_Save

Comp\_SaveVersion

AddTool

AddLUT

RunScript

AddSetting

Layout\_Switch

Prefs\_Show

App\_Exit

Comp\_BackgroundRender

Comp\_Undo

Comp\_Redo

Comp\_ShowTimeCode

Comp\_TimeCodeFormat

App\_About

App\_NewImageView

Comp\_NewTabbedFrame

Comp\_NewFloatFrame

App\_Help

App\_OnlyActiveComp

App\_ShowUI

App\_CustomizeToolBars

App\_CustomizeHotkeys

App\_Cut

App\_Copy

App\_Paste

App\_Delete

App\_SelectAll

App\_DeselectAll

App\_PasteSettings

View\_Show

Comp\_Close

Comp\_SaveAs

Comp\_SaveCopyAs

Script\_Edit

Layout\_Load

Layout\_Save

Layout\_Reset

Comp\_Recent\_Open

Comp\_Recent\_Clear

Utility\_Show

Tool\_ViewOn

Tool\_ViewClear

Bins\_Play

Bins\_Stop

Bins\_Delete

Bins\_Rename

Bins\_Refresh

Bins\_SelectAll

Time\_Step\_Forward

Time\_Step\_Back

Time\_Step\_NextKey

Time\_Step\_PrevKey

Time\_Goto\_GlobalStart

Time\_Goto\_GlobalEnd

Time\_Goto\_RenderStart

Time\_Goto\_RenderEnd

Time\_Set

Tool\_Settings\_Activate

Tool\_Settings\_Store

Viewer\_SubView\_Enable

Viewer\_Lock

Viewer\_QuadView

Viewer\_Scale\_Rel

Viewer\_Scale\_Abs

Viewer\_Buffer

Viewer\_Reset

Viewer\_SubView\_Swap

Viewer\_Tools\_Disable

Viewer\_Unview\_All

Viewer\_LUT\_Enable

Viewer\_Show\_GainGamma

Viewer\_LUT\_Edit

Viewer\_Channel

Viewer\_Guides\_Show

Viewer\_Controls\_Show

Viewer\_3D\_CentreSelected

Viewer\_3D\_FitSelected

Viewer\_3D\_FitAll

View\_Zoom\_In

View\_Zoom\_Out

View\_Zoom\_Fit

View\_Zoom\_Rectangle

Time\_Goto\_Key\_Next

Time\_Goto\_Key\_Prev

Playback\_Mode

Playback\_Seek

Playback\_Seek\_Start

Playback\_Seek\_End

NetRender\_Allow

Comp\_Render\_Frame

Comp\_Render\_End

Comp\_Activate\_Tool

Comp\_Set\_Active

Comp\_StartRender

Comp\_Start\_Render

Comp\_Render

Comp\_Abort

Comp\_Opened

Drag\_Drop

Comp\_High\_Quality

Comp\_Motion\_Blur

Comp\_Proxy

Comp\_Auto\_Proxy

Comp\_Play\_Loop

Comp\_Play\_PingPong

Reel\_Delete\_Selected

Target\_Show\_Menu

Target\_Show\_Scripts

Console\_Show

Comp\_Reset

Expose\_Tool\_Name\_Mode

vTextProcessOpen

Launches a command-line process via popen

The "Text" field is used to define the executable program name and the command-line arguments you want to run from a shell session. The output from the shell session is returned to the node's output connection as a text data type result.

Typically a vTextSubFormat node is used to build the executable command line string that is supplied to the Text input on a vTextProcessOpen node. If you need cross-platform support you can use a vTextCreatePlatform or vTextCreatePlatformBrowse node to automatically define the per-OS specific elements like the program name to run.

If you need to access more complex automation techniques, or dynamically define custom environment variables, it is possible to use a vTextToFile node to export a dynamically created .bat (Windows), .sh (Linux), .command (macOS) script file to the TEMP folder on disk. Then the vTextProcessOpen node could be used to execute this document by specifying in the "Text" field both the shell interpreter to use, like "/bin/zsh" or "/bin/zsh", and the external script file to run:

"Text" field contents:

"/bin/zsh"  "/tmp/Vonk\_Temp\_Script.command"

"Vonk\_Temp\_Script.command" File Contents:

\#!/bin/zsh

say Hello Vonk World!

![][image286]

vTextRenderComp

Launches a command-line Fusion Render Node based .comp or .dfq process via popen

This node currently works on macOS and Linux. Windows support is a WIP task that is yet to be completed.

![][image176]

The Fusion composite specified in the "Comp File" field will be batch rendered in the background by the Fusion Render Node executable.

The "Render Mode" control allows you to adjust how the composite will be rendered. 

![][image159]

If "Current Frame" is selected, the parent comp's current frame will be passed to the Fusion Render Node program as the frame to render in the child comp.

If "Comp Frame Range" is selected, the parent comp's Render Start - Render End frame range will be sent to the Fusion Render Node program as the frame range to render in the child comp.

If "Comp Frame Range" is selected, the parent comp's Render Start - Render End frame range will be sent to the Fusion Render Node program as the frame range to render in the child comp.

If "Custom Frame Range" is selected, a set of numerical input controls will be displayed. These controls allow you to manually drive the frame range used by the Fusion Render Node program on the fly.

![][image305]

The "Render Node Version" control allows you to choose the exact Fusion Render Node executable version number you would like to launch when the .comp file is rendered. This allows you the flexibility to target a different Fusion Render node release than you are using to run the GUI session inside of Fusion Studio.

vTextExecute

Executes code sourced from a Fusion Text object

The "Script Language" control is used to define if you want to use Lua or Python code in the text input field. This code is executed asynchronously by the Fusion API function "self.Comp:Execute()".

In the code block you can return a value from the executed script to the node graph with the function "OutText()". An example of that would be 'OutText("Hello World")'. The output from the vTextExcute node is a text based filepath that holds any results you might have written to disk using the function "OutText()".

![][image268]

vTextMerge

Dynamically joins strings into one

Merge together several strings that are connected to the node's text based input connections. The combined strings are joined with the addition of a user defined separator character.

![][image52]

vTextSubReplace

Replaces substrings of a string

The "Pattern" text field uses [Lua Patterns](http://lua-users.org/wiki/PatternsTutorial) to parse the string. Additional information about patterns can be read in the [Lua manual](https://www.lua.org/manual/5.3/manual.html#6.4.1).

The 2nd text field represents the "Replace" text that will be substituted.

![][image138]

vTextSubFormat

Formats a template string with input values

Each input connection on the vTextSubFormat node can be placed exactly where it is needed using a token approach. A token value is entered using curly braces that surround an integer number like "\{1\}" or "\{2\}" that represent an input connection number on the node.

![][image423]

vTextSubFormatMultiline

Formats a multi-line template string with input values

Each input connection on the vTextSubFormat node can be placed exactly where it is needed using a token approach. A token value is entered using curly braces that surround an integer number like "\{1\}" or "\{2\}" that represent an input connection number on the node.

![][image267]

vTextSubJoin

Dynamically joins strings into one

![][image270]

vTextSubReturn

Returns a substring of a string

This node is used to shorten a string by using the Start and End numeric fields to define the number of characters to remove.

A positive number entered in the number input fields is used to define the removal of characters by starting the counting process at the left side of the input string. A negative number in the number input fields is used to define the removal of characters starting on the right side of the input string. 

This added complexity makes it easier to remove elements like a 3 letter file extension using the negative number input ability to trim off characters starting from the end (right side) of a variable length text string in a precise fashion.

![][image362]

vTextSubStripLeft

Strips a leading substring of a string

The "Strip" text field is used to define the text you would like to remove from the (left side) of the input text data that is connected to the node. This type of text editing would sometimes be called removing a leading prefix element from a string.

![][image86]

vTextSubStripRight

Strips a trailing substring of a string

The "Strip" text field is used to define the text you would like to remove from the (right side) of the input text data that is connected to the node. This type of text editing would sometimes be called removing a trailing postfix element from a string.

![][image112]

vTextSubSplit

Returns a substring of a string

The "Pattern" text field uses [Lua Patterns](http://lua-users.org/wiki/PatternsTutorial) to parse the string into a JSON like Array object. Additional information about patterns can be read in the [Lua manual](https://www.lua.org/manual/5.3/manual.html#6.4.1).

The portion of the pattern you want to return should be placed inside a pair of parentheses characters "(" and ")". 

If you wanted to return all of the characters from the input string you would use a Pattern of: (.\*)

If you had a list of single word objects that were comma separated like: Apple;Orange,Pear,Mango

Then you could break the text down into individual objects using a Pattern of: (%a+),-

The output would be formatted as: \{"size":4,"array":\["Apple","Orange","Pear","Mango"\]\}

If you had a string with an IPv4 style IP address in it like "192.168.1.1", you could break the text down into individual digits groupings using a Pattern of: (%d+)

The output would be formatted as: \{"size":4,"array":\["192","168","1","1"\]\}

![][image202]

vTextDecodeUrl

URL-decodes a Fusion Text object

![][image253]

vTextCaseInvert

Inverts the case of a Fusion Text object

A Text based input of "Hello World!" would be converted to "hELLO wORLD!". Every uppercase letter in the output becomes lower case, and every lowercase letter becomes an uppercase letter.

![][image381]

vTextCaseSentence

Converts the case of a Fusion Text object to sentence

A Text based input of "hello world!" would be converted to "Hello world!" with the initial letter in each sentence having a capitalized letter.

![][image363]

vTextCaseAlternate

Alternates the case of a Fusion Text object

A Text based input of "hello world!" would be converted to "hElLo wOrLd!" where every 2nd letter is formatted as a capital letter.

![][image391]

vTextCaseLower

Converts the case of a Fusion Text object to lower

A Text based input of "Hello World!" would be converted to "hello world!".

![][image218]

vTextCaseTitle

Converts the case of a Fusion Text object to title

A Text based input of "hello world!" would be converted to "Hello World!".

![][image337]

vTextCaseRandom

Changes the case of a Fusion Text object in a random fashion

A Text based input of "hello world!" would be converted to an output like "hellO WoRlD!".

![][image79]

vTextCaseUpper

Converts the case of a Fusion Text object to upper

A Text based input of "hello world!" would be converted to "HELLO WORLD!".

![][image109]

vTextFontMetrics

Return font measurements as Fusion Number objects

![][image277]

vTextFromHex

Converts a Base16 Hex encoded string to ASCII text

The "Input" field is used to supply the block of HEX encoded content.

The "Separator" text field allows you to enter a value like a space, a tab, a dash, a semicolon, or other character that is present between the Base16 encoded number groups. This user supplied separator information is then used to guide the decoding process.

The "Remove Non-Printable Characters" control will automatically remove any ASCII characters that are control characters. In software like the macOS based BBEdit text editor, a non-printable character in a text file would be described as a "Gremlin" and this process would be called "Zapping Gremlins".

A sample Hex string that says "Hello World!" is "48656C6C6F20576F726C6421".

![][image366]

vTextCreate

Creates a Fusion Text object

This is the standard starting point for generating new Text data type based content.

![][image118]

vTextCreateBrowse

Creates a Fusion Text object with a file browser dialog

This node is used to create filepath based Text data type content. The Browse button displays a file picker dialog.

![][image404]

vTextCreateMultiline

Creates a multi-line Fusion Text object

The "Text" field supports entering multi-line text blocks that can include indentation, tabs, newlines, returns and other plain-text formatting variations.

If you need to view this multi-line text based content downstream in the comp, try the vTextViewer node.

This node is especially useful if you needed to create the original textual contents used for a shell script that you would save to disk using the vTextToFile node, and then run with a vTextProcessOpen node.

![][image101]

vTextCreateMultilineCode

Create a multi-line Fusion Text object with syntax highlighting

![][image146]

vTextCreateArch

Creates a unique Fusion Text object per CPU architecture

This node provides a series of text fields that allow you to enter three different string values. The correct string that matches the current CPU architecture will be returned when the comp is rendered.

![][image378]

vTextCreatePlatform

Creates a unique Fusion Text object per OS platform

This node provides a series of text fields that allow you to enter three different string values. The correct string that matches the current operating system platform will be returned when the comp is rendered. 

This node is a handy way to define the correct parameters to use with a vTextSubFormat or ProcessOpen node.

![][image137]

vTextCreatePlatformBrowse

Creates a unique Fusion Text object per OS platform

This node provides a series of Browse buttons and text fields that allow you to enter three different string values. The correct string that matches the current operating system platform will be returned when the comp is rendered. 

This node is a handy way to define the correct parameters to use with a vTextSubFormat or ProcessOpen node.

![][image97]

vTextFromASCII

Converts an ASCII code number to text

The "Number" control is used to enter an ASCII code value. The result is a single character placed inside a text data type based output.

![][image339]

vTextFromCSV

Creates a Fusion Text object by extracting a single cell from a CSV formatted block of text

The "Row" control is used to define the CSV line number to read.

The "Column" control is used to increment through each set of comma separated entries on a single line of CSV input data.

The "Ignore Header Row" checkbox will offset the first index position to start at line 2 in the CSV file. This will skip over a labelled header row in the source document to avoid that information being accessed as part of the ingested data.

![][image247]

vTextDate

Creates a date and time based Fusion Text object

The "Text" field is used to enter the string formatting pattern used to generate a date based output. The default value is "%Y-%m-%d" which creates a result like "2022-05-24".

The Lua documentation on the [Date function](https://www.lua.org/pil/22.1.html) provides more details about the supported values you can enter into the Text field in this node.

![][image309]

vTextEnv

Creates an environment variable based Fusion Text object

This node will read an environment variable and return the result as a string. This is useful if you need to access a value like a SITE, SHOW, or SHOT env variable inside your composite.

The "Text" field is used to enter the environment variable name like "PATH", "HOME", "USER", etc...

If you need to troubleshoot the active environment variables on your Windows system using the Command Prompt you can type in "set". In the macOS/Linux terminal program you can type in "env \| sort" to see an alphabetically sorted list of the active environment variables.

![][image416]

vTextFromNumber

Converts a number to text

This node takes a number based input value that is converted automatically into a Text data type on the output. This makes it possible to supply a numerical value to a node like vTextSubFormat that only works with Text based inputs.

The "Number" field holds the source numerical value. 

If the "Show Input" checkbox is enabled, the Number field based value can come from an external source.

![][image177]

vTextUUID

Creates a UUID Fusion Text object

A per-frame (Universally Unique IDentifier) value is generated by this node. This value can be used to help with naming temporary items on disk, or for other tasks where an incrementing index based identifier is not appropriate.

A UUID value is formatted like: 11625315-7785-4eb4-8b2f-d6dca235c424

![][image301]

vTextToHex

Converts a string into Base16 Hex encoded text

The "Separator" text field allows you to enter a value like a space, a tab, a dash, a semicolon, or other character you want to use between the Base16 encoded output number groups.

The "Remove Non-Printable Characters" control will automatically remove any ASCII characters that are control characters.

![][image95]

vTextFromNumberPadded

Converts a number to a leading zero padded text

This node is excellent for creating fixed length numbers thanks to the built-in "Padding" control.

![][image338]

vTextUUIDStatic

Creates a UUID Fusion Text object

A static non-animated UUID (Universally Unique IDentifier) value is generated by this node. This value can be used to help with naming temporary items on disk, or for other tasks where an incrementing index based identifier is not appropriate.

A UUID value is formatted like: 11625315-7785-4eb4-8b2f-d6dca235c424

![][image13]

vTextFromArray

Creates Text from an array

The "Index" control is used to extract an individual element from a JSON based array. The output is a text based data type.

![][image257]

vTextSortLines

Sorts a multi-line block of text

The "Sort List" checkbox will break apart a multi-line block of text and alphabetically sort the content on a line-by-line basis.

The "Remove Duplicates" checkbox is used to remove any line entry that is a duplicate entry, meaning the content is not unique.

![][image287]

vTextNormalizeSlashes

Unifies the slash direction on filepaths

The "Slash Direction" multi-button control allows you to choose if you want Windows (\\) or Linux (/) style slashes for your output text.

The "Remove Duplicate Slashes" checkbox will replace any occurrence for two adjacent slashes with a single slash. This option is something you might not want to use if UNC file paths are common in filenames used in your pipeline.

![][image367]

vTextParseFilename

Creates a Fusion Text object by parsing a filepath

The "Text" input field supports a filepath style of string that contains absolute or relative filepaths (including the use of Fusion PathMaps).

![][image126]

The "Parse" ComboControl entries include: 

"FullPath", "FullPathMap", "Path", "PathMap", "FullName", "Name", "CleanName", "SNum", "Number", "Extension", "Padding", "UNC", and "Path + Name".

![][image2]

vTextParseFilenameOutputs

Creates a Fusion Text object by parsing a disk based filepath

This node is a multi-output connection based variation on the more commonly used vTextParseFilename node. Each output port exports a separate part of the extracted filename components.

The use of this multi-output node is fairly rare but it does a good job of showing that multiple output connections are possible in a fuse node.

![][image129]

vTextDelay

Creates a Delay while passing a Fusion Text object

The delay effect is measured in seconds. This node is implemented internally using the "bmd.wait()" function.

Among several use cases one can find for a tool that can momentarily pause rendering; it can be used to simulate a slow to render comp task when testing a render farm program. It also has applications when running a command line task via the Vonk ProcessOpen node and the system requires a momentary pause.

![][image208]

vTextDump

Dump the contents of a Fusion Text object to the Console window

The vTextDump node is handy for printing diagnostic logging information to the Console during a complex workflow. This could include status results, frame counts, or any other information. You can see this output text in the Console view, or for a job that is sent to be processed by Fusion Render Node the terminal/command prompt output will show the log results.

If you want to build an elaborate block of text to be output by the "vTextDump" node, you can assemble the compound string using the "vTextSubFormatMultiline" node where each input connection is able to be sourced from separate data nodes.

Vonk number datatype content can be translated into a text format using the "vTextFromNumber" node. If you require leading zero based frame padding, look at the "vTextFromNumberPadded" node. The "vTextCompCurrentTime1" node returns the current timeline frame number in a format that can be used directly with the input connections on a "vTextSubFormatMultiline" node.

![][image215]

The "Shift + 0" hotkey is useful if you need to quickly toggle the visibility of the Console window in Resolve or Fusion Studio. Alternatively, clicking on the "Console" tab button at the top left of the Fusion Studio user interface will carry out a similar task.

![][image128]

vTextLength

Returns the length of a string

The vTextLength node counts the number of characters present in a string. It returns the text length value as an integer based Number data type.

If the text "Hello" was input to the vTextLength node, the output would be a string length measurement of the number 5.

![][image45]

vTextViewer

Displays the Fusion Text object contents in the Inspector

The vTextViewer node is a handy way to view multi-line text based data type content using the Inspector.

The "Display Lines" control is used to adjust how many visible lines of text are shown in the preview area at once. This number can be lowered if you want to have the vTextViewer node shortened to reduce the amount of vertical screen space used in the Inspector.

The "Wrap Lines" checkbox makes it possible to enable/disable line wrapping in the text preview area.

![][image235]

vTextLineCount

Returns the line count of a multi-line string

This node is especially useful if you are working with IFL (Image File Lists), or CSV (Comma Separated Value) / TSV (Tab Separated Value) text files. It gives you a quick indication of how many rows of text are in the supplied multi-line block of text.

The output from the node is a Number data type that indicates the total line count. If the text file had ten lines of text supplied to the input connection, then the output from the node would be the number 10.

![][image271]

vTextReadLine

Creates a Fusion Text object by extracting a single line of text from a multi-line text block

The "Index" control accepts integer based number input connections. Typically a vNumberCompReqTime or vNumberCompCurrentTime node will be used to scan through the text input contents one frame at a time.

If your timeline start frame is not frame 1, you can use a vNumberAdd / vNumberSubtract node to shift the frame incrementing value that is fed into the "Index" control. This allows your starting frame of either frame 0, frame 1000, or frame 1001 to be accessed effortlessly as an index value of 1 (meaning line one).

The counterpoint to the vTextReadLine node is the vTextAccumulator node that combines single line elements of text into a multi-line text block of text.

The "Display Lines" control is used to adjust how many visible lines of text are shown in the preview area at once. This number can be lowered if you want to have the vTextViewer node shortened to reduce the amount of vertical screen space used in the Inspector.

The "Wrap Lines" checkbox makes it possible to enable/disable line wrapping in the Input field preview area.

![][image321]

vTextWireless

The vTextWireless node allows you to connect to other text based nodes in your comp without drawing the connection wirelines visually in the Flow/Nodes view. This can be helpful if you need to reduce clutter.

![][image254]

vTextSwitch

Switches between Fusion Text objects

The "Which" control uses an integer number that starts at 1 and counts upwards to define the input connection port that is passed through to the output connection.

If you are using a logical comparator that works on a false/true based 0-1 number range and want to connect it to a vTextSwitch node's Which input connection, that works on a 1+ number range, simply insert a vNumberAdd node set to increment the number upwards by 1.

The "Show Which Input" checkbox is used to hide the Number datatype based input connection for the Which parameter in the Nodes view.

The "Show Active Input" checkbox is used as a visualization and diagnostics mode. When enabled, this control automatically toggles the visibility off for the inactive connection wirelines fed into the switch node. This approach makes it possible to visually see in a quick glance the source comp branch that is selected as the input and used by the Which control. All other inputs will be turned into hidden wireless inputs when not in use.

![][image153]

Vector Nodes

vVectorMultiplyNumber

Multiplies a vector by a number

![][image48]

vVectorNormalize

Normalizes a vector

![][image47]

vVectorDivideNumber

Divides a vector by a number

![][image134]

vVectorSubtract

Subtracts two vectors

![][image39]

vVectorSlice

Slices a vector

![][image60]

vVectorDotProduct

Adds two vectors

![][image181]

vVectorAdd

Adds two vectors

![][image318]

vVectorCrossProduct

Adds two vectors

![][image67]

vVectorFromArray

Creates a vector from an array

![][image36]

vPointToVector

Creates a vector from a point

![][image294]

vVectorToPoint

Creates a point from a vector

![][image53]

vVectorFromPoint

Creates a vector from a point

![][image242]

vVectorCreate

Creates a vector from an array

![][image296]

vVectorLength

Calculates the length of a vector

![][image405]

Matrix Nodes

vMatrixDivide

Divides two matrices


![][image204]

vMatrixInvert

Inverts a matrix

![][image58]

vMatrixDeterminant

Calculates the determinant of a matrix

![][image371]

vMatrixMultiply

Multiplies two matrices

![][image377]

vMatrixDivideNumber

Divides a matrix by a number

![][image212]

vMatrixFromArray

Creates a matrix from an array

![][image6]

vMatrixColorTransform

Animatible/Modifiable ColorMatrix

![][image12]

vCreateMatrix4x4

Creates a 4x4 matrix

![][image88]

vMatrixToTranslation

Decomposes translation from a matrix

![][image24]

vMatrixTranspose

Transposes a matrix

![][image368]

vMatrixToRotation

Decomposes a rotation from a matrix in [Euler angles](https://en.wikipedia.org/wiki/Euler_angles)


![][image132]

vMatrixFromRotation

Creates a rotation matrix

![][image14]

vMatrixToScale

Decomposes scale from a matrix

![][image124]

vMatrixFromTranslation

Creates a translation matrix


![][image124-1]

vEulerFromMatrix

Converts a matrix to [Euler angles](https://en.wikipedia.org/wiki/Euler_angles)

![][image244]

vMatrixFromScale

Creates a scale matrix


![][image96]

vMatrixSlice

Slices a matrix

![][image200]

vMatrixConcatenateHorizontal

Concatenates two matrices horizontally

![][image26]

vMatrixConcatenateVertical

Concatenates two matrices vertically

![][image240]

vMatrixLink

Links to a matrix

![][image264]

Vonk Node Cookbook

Iterating Over Files in a Directory

A typical node graph that lists a folder's contents, and then iterates per-timeline-frame over the individual files in the list is built like this:

![][image384]

The "vFileSystemListFiles" node generates a list of files. This multi-line block of text is fed into a "vTextReadLine" node that breaks the list down, into one line of data per frame.

The "vNumberCompReqTime" node is preferable to use as the iterator node that increments the "vTextReadLine" output through each line of text in the list of filepaths. 

The vNumberCompReqTime" node is typically a better choice than a stock "vNumberCompCurrentTime" node since a request time based tool is capable of advancing on both the current timeline frame, or working with temporal based fuses that would modify the time value when running in a loop.

For visualizing the Text based output in the Inspector tab, a "vTextViewer" node is connected.

Node Connections:

vFileSystemListFiles.Output -\> vTextReadLine.Input

vNumberCompReqTime.Output -\> vTextReadLine.Index

vTextReadLine.Output -\> vTextViewer.Input

Check if a File Exists

A node graph that checks if a file exists on disk, then varies the resulting text based output with a Switch node is built like this:

![][image31-1]

Node Connections:

vFileSystemFileExists.Output -\> vNumberAdd.Term1

vNumberAdd.Output -\> vTextSwitch.Which

vTextCreate1.Output -\> vTextSwitch.Input1

vTextCreate2.Output  -\> vTextSwitch.Input2

Node Settings:

vNumberAdd.Term2 = 1

Node Screenshots

The vFileSystemExists node is used to check if a file exists on disk. The false/true logic based output is a 0-1 number range.

The vNumberAdd node's "Term2" control is set to a value of "1". This addition process offsets the "Term1" input connection range of a 0-1 number returned by a false/true logical comparison into a 1-2 number range that is suitable for use with the vTextSwitch node.

![][image283]

The vTextSwitch node's "Which" control performs the input switching action. 

The output from the vNumberAdd node is connected to the "Which" control by right-clicking on the attribute in the Inspector view. In the popup contextual menu item select the "Connect To \> vNumberAdd \> Output" entry.

![][image293]

Finally, you can now connect any pair of TextCreate nodes you want to the vTextSwitch node's Input1 and Input2 connections. The Input1 node will be used for the file does not exist (Which = 1) logic state. The Input2 node will be used for the file exists (Which = 2) logic state.

This node structure is effectively simulating a traditional programming language's "Ternary" operator.

Create an IFL (Image File List)

An IFL (Image File List) is a text file that places one filename per line in the document. This approach creates a file that can be used in a Fusion Loader or Saver node as a way to work with image sequences that have unusual naming structures.

A node graph that creates a new an IFL sequence based multi-line text file is built like this:

![][image209]

Node Connections:

vTextCompReqTime.Output -\> vTextSubFormat.Input1

vTextSubFormat.Output -\> vTextAccumulator.Text

vNumberCompRenderStart.Output -\> vTextAccumulator.StartFrame

vNumberCompRenderEnd.Output -\> vTextAccumulator.EndFrame

vTextAccumulator.Output -\> TextToFile.Input

Node Settings:

vTextCompReqTime.Padding = 4

vTextSubFormat.Format = "Image.\{1\}.exr"

vTextAccumulator.Separator = "\\n"

vTextToFile.File = "Comp:/Sequence.ifl"

Node Screenshots

The vTextCompReqTime node is a quick and convenient way to create a frame padded number that represents the current requested time value when the comp is rendered.

If you wanted to, alternatively, you could use a vNumberCompReqTime node connected to a vNumberAdd node to offset the starting frame number to a value like 1000, or 1001. The  vNumberAdd node would then be connected to a vTextFromNumberPadded node to convert the integer value into a leading zero padded based text output format. 

(vNumberCompReqTime -\> vNumberAdd -\> vTextFromNumberPadded -\> vTextSubFormat)

![][image222]

The vTextSubFormat node allows us to insert a token, in this case "\{1\}", to indicate the exact placement in the filename string we wish to add to the frame number component. The "\{1\}" token in the Format text field represents the text based input connection that is wired into the "Input1" slot on the vTextSubFormat node.

![][image243]

The vTextAccumulator node is used to turn the single line text input into a multi-line block of text by iterating over the start frame to end frame range using temporal effects. 

The temporal operations carried out by the vTextAccumulator node are the main reason why we chose to use the "request time" functionality of the vTextCompReqTime node instead of reading the current timeline value of where the playhead is at this exact moment.

![][image340]

The vTextToFile node is used to write the multi-line IFL document to disk.

![][image16]

Create a Frame-Based Number Cycle Using Modulus

The vNumberModulus operator is an efficient way to create a looping number cycle that continuously counts up to a certain predefined value.

![][image57]

The vNumberIntegerCreate node is used to specify the frame duration of the looping cycle.

A Modulus operator causes a looping effect that runs from a starting point of the number zero, upwards to one number less than the value entered in the Divisor field.

If we want the cycle to start at the number one, and run up to the exact value specified in the Divisor field, we can achieve this result with the use of a vNumberAdd node that is used to add the number one to the output value returned by the Modulus node.

Node Connections:

vNumberCompReqTime.Output -\> vNumberModulus.Dividend

vNumberIntegerCreate.Output -\> vNumberModulus.Divisor

vNumberModulus.Output -\> vNumberAdd.Term1

Node Settings:

vNumberIntegerCreate.Integer = 10

vNumberAdd.Term2 = 1

Read a CSV (Comma Separated Value) File

CSV (Comma Separated Value) and TSV (Tab Separated Value) files are common ways to transfer spreadsheet exported data between programs.

Being able to parse a CSV file inside of Fusion's node graph is something of a "holy grail" like thing for comp automation, (in addition to JSON reading support), as it allows for interesting capabilities like having external data sources drive fully templated compositing processes from media loading, node based operations, all the way to final media export.

The Easy Approach to CSV Parsing

There are now Vonk custom purpose CSV parsing nodes that can simplify operations. These nodes are named "vTextFromCSV", "vNumberFromCSV", and "vArrayFromCSV".

Let's look at the minimal node based connections required to work with CSV data.

![][image61]

Node Connections:

vTextFromFile.Output -\> vTextFromCSV.Input

vNumberCompReqTime.Output -\> vTextFromCSV.Row

Node Settings:

vTextFromCSV.IgnoreHeaderRow = 1

The "IgnoreHeaderRow" checkbox allows us to start the CSV line reading process at the 2nd row in the text file so the header text is ignored.

The Low Level Approach to CSV Parsing

![][image251]

Node Connections:

vTextFromFile.Output -\> vTextReadLine.Input

vNumberCompReqTime.Output -\> vNumberAdd.Term1

vNumberAdd.Output -\> vTextReadLine.Index

vTextReadLine.Output -\> vTextSubSplit.Text

vTextSubSplit.Output -\> vTextFromArray.Input

Node Settings:

vNumberAdd.Term2 = 1

vTextSubSplit.Pattern = (.-),

Node Screenshots

An initial CSV header row might look a bit like this:

Shot,Filename,Caption,Image,Duration,Comments

The vNumberAdd node's Term2 control is used to shift the initial starting line for the vTextReadLine Index value. This makes it possible to "scroll" the first row read from the external datafile "downwards" past the typical CSV initial text header row entries to output the next data record row in the file.

![][image342]

The vTextReadLine node is used to iterate line by line through the CSV file. This process is typically controlled by syncing the Fusion comp's timeline frame number as the incrementer used to access a specific index value. 

If required, you can shift over to using a pair of "NumberIntegerCreate" nodes to target the exact row/column numbers you want to extract from a CSV file. This is handy if you are trying to grab a specific spreadsheet cell to act as the source value that drives custom math formula based operations.

![][image419]

A vTextSubSplit node makes quick work of splitting the CSV document at each comma based separator character.

A Pattern value of "(.-)," is a good starting point to use for a general purpose CSV parser.

If you require extracting TSV (Tab Separated Value) items, or dealing with quoted entries, those options are all possible with a few small tweaks to the Pattern field contents.

![][image269]

The output from the vTextSubSplit node is formatted as an Array object which can then be iterated over to extract an exact column item in the next step.

A CSV formatted line entry that is input to the vTextSubSplit node looks like this:

2,Title02.0001.exr,Take Off,2\_Take\_Off.0001.exr,12,

The extracted array line entry output from the vTextSubSplit node looks like this:

\{"size":5,"array":\["2","Title02.0001.exr","Take Off","2\_Take\_Off.0001.exr","12"\]\}

The final step of extracting column based values from a CSV formatted spreadsheet is carried out with the "vTextFromArray" node. The "Index" control lets you grab a specific item from the multi-element Array structure. 

In this case an "Index" value of 4 would grab the record "2\_Take\_Off.0001.exr".

It is worth noting that the "Index" value starts counting upwards from a value of 1 (not zero). Sometimes you might have an off-by-one counting error in your logic if you forget this fact and come from a longtime C-code programming background. 

![][image333]

If you need to grab a Number based value from a CSV file, you can swap out the usage of a "vTextFromArray" node for a "vNumberFromArray" node. Or alternatively you could use a "vNumberFromText" node to convert the data type as needed.

Further CSV Usage Concepts

If you want to get fancy with CSV parsing techniques it is possible to automatically link an individual .comp file to the external resource on-the-fly. This is best done through the use of SxS (Side by Side) concepts where the base filename for the .comp file and the .csv file are the same. 

This is very similar to Fusion Studio/Fusion Render Node's handling of SxS (Side by Side) named .comp and .lua script files. 

A SxS + CSV technique allows the comp file to find its matching resource file as soon as it is opened. This approach can be achieved in Vonk through the use of a "vTextCompFilename" node that provides the active comp filename to the node graph. 

![][image103]

A "vTextSubReplace" node can swap the file extension by looking for the Pattern ".comp" and replacing it with the ".csv" file extension. 

![][image133]

The absolute filepath for the SxS .csv file is then supplied to the initial "vTextFromFile" node.

Read a JSON File

[JSON](https://en.wikipedia.org/wiki/JSON) (JavaScript Object Notation) files provide a common way to export data between programs. JSON file parsing use cases in a compositing package are generally comparable to what an XML or CSV files might be used to hold.

JSON files can be used to carry out comp automation, as it allows for interesting capabilities like having external data sources drive fully templated compositing processes from media loading, node based operations, all the way to final media export.

Let's look at the minimal node based connections required to work with JSON data that has JSON array elements present.

![][image406]

Node Connections:

vJSONFromFile1.Output -\> vJSONGet1.Input

vJSONGet1.Output -\> vJSONGetElement1.Input

vNumberCompReqTime1.Output -\> vJSONGetElement1.Input

vJSONGetElement1.Output -\> vJSONGet2.Input

vJSONGet2.Output -\> vTextAccumulator1.Text

vJSONGet1.Output -\> vJSONCountElement1.Input

vJSONCountElement1.Output -\> vTextAccumulator1.EndFrame

Node Settings:

vJSONFromFile1.Input = "Comp:/transforms.json"

vJSONGet1.Key = "frames"

vJSONGet2.Key = "file\_path"

vTextAccumulator1.StartFrame = 1

vTextAccumulator1.Sort = 1

vTextAccumulator1.RemoveDuplicates = 1

Node Screenshots

The JSON sample data used is a [NVIDIA "Instant NGP" based NeRF camera alignment sample file](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit?usp=sharing). It has the metadata for 36 camera views present in the text file.

vJSONFromFile1

The JSON text file is accessed on-the-fly by the comp via the "vJSONFromFile1" node. The data is returned as a text data type to the vJSONFromFile1 node's output connection port.

Fusion relative PathMaps like "Comp:/" can be used in the "Input" field when entering JSON filenames. This makes the Fusion .comp files more portable if you are working with other artists since it avoids using baked-in absolute filepaths.

![][image78]

This is what is shown in the Fusion viewer window when the "vJSONFromFile1" node output is displayed in the Fusion viewer window:

![][image223]

vJSONGet1

The "vJSONGet1" node is used to access a Key named "frames". For the JSON sample file being used in this example, the result is a JSON array object.

![][image231]

This is the viewer window output from the "vJSONGet1" node. Each JSON array element is grouped inside its own set of curly braces:

![][image249]

vJSONCountElement1

The "vJSONCountElement1" node returns the total number of JSON array elements present at the current level of the JSON hierarchy.

![][image399]

For this JSON file reading example there are 36 array values returned, which lines up precisely to 36 camera views.

![][image292]

vNumberCompReqTime1

The "vNumberCompReqTime1" node returns the comp's current "request time" value which is the frame being processed. This node is used as the incrementor for the "vJSONGetElement1" node's "Index" control. 

![][image55]

When the comp is rendered or viewed, the "vNumberCompReqTime1" node is able to cycle through the global time range of frame 1 to frame 36 to grab each JSON array "Index" item, one value at a time.

![][image332]

vJSONGetElement1

The "vJSONGetElement1" node is used to scan through a JSON array object and extract a single element from a series of objects. The "Index" control is animated via a Vonk data node connection to parse each of the elements present in the file automatically.

![][image356]

The output from the "vJSONGetElement1" node looks like this:

![][image121]

vJSONGet2

The "vJSONGet2" node is used to access the Key called "file\_path". In our sample JSON file this will return a string that holds the name of a specific camera alignment image.

![][image298]

vTextAccumulator1

The "vTextAccumulator1" node allows us to temporally concatenate the output. This builds a list of image filenames from each of the JSON array elements as Fusion scans through the Start Frame to End Frame range values on the node.

![][image125]

The "Sort List" checkbox will alphabetically sort the output. This is handy as JSON files are not guaranteed to be accessed in a consistent order when parsed.

The "End Frame" attribute is connected to the "vJSONCountElement1" node. This causes Fusion to automatically increment through each of the JSON array elements and not miss out on any of the records.

The "Separator" control defaults to "\\n". This represents a newline character that will be inserted on each frame that is temporally accumulated by the node into a multi-line block of text.

This is the viewer window output from the "vTextAccumulator1" node:

![][image239]

JSON Samples

When working with ASCII encoded JSON files, there are several different data types you will come across frequently when parsing files. The most common are listed below.

JSON records can hold numbers. A number is entered without any quotes around the value:

"size": 596,

JSON records can hold strings. A string is entered with double quotes around the textual content:

"filename": "Media/CameraA.0001.jpg",

JSON records can hold multiple numbers in an array. Square brackets are used to indicate the start and end of an array:

"size": \[2700,2700\],

"outputcrop": \[0,0,1,1\],

JSON records can also hold a series of parameters in an array such as per-frame data when working with metadata for image sequences. It is possible to nest an array inside another array, along with strings and number values, too:

		"frames": [
	   	 {
	   		 "file_path": "images/lion.0001.jpg",
	   		 "sharpness": 426.40289615279244,
	   		 "transform_matrix": [
	   			 [
	   				 -0.3837311354109413,
	   				 0.18139391420079445,
	   				 -0.9054538439920087,
	   				 -3.489564789981506
	   			 ],
	   			 [
	   				 -0.9107712071674372,
	   				 -0.23623269970342953,
	   				 0.33865900222128514,
	   				 1.2114282762117232
	   			 ],
	   			 [
	   				 -0.15246712403082568,
	   				 0.9546152939665091,
	   				 0.25585819628787304,
	   				 1.0404015326771352
	   			 ],
	   			 [
	   				 0.0,
	   				 0.0,
	   				 0.0,
	   				 1.0
	   			 ]
	   		 ]
	   	 },

Creating 3D Materials from Live Web Images

![][image398]

An exciting element that can be added to data based graphics in Fusion are "live" internet sourced visuals. This includes just about any media resource you can connect to using an http://, https://, or file:// based URL such as live frame-grabbed webcam imagery, traffic cam views, satellite weather graphics, or any other image resource from the web.

![][image135]

An important step if you are connecting a vImageFromNet created image context to a 3D workspace based polygon model is to add a surface material to the mesh first. Otherwise Fusion might instant-quit on you if you try to direct-connect the 2D image texture straight onto the mesh node.

Node Connections:

vTextCreate.Output -\> vImageFromNet.Input

vImageFromNet.Output -\> Texture2D.Input

Texture2D.MaterialOutput -\> Blinn.Diffuse.Color.Material

Blinn.MaterialOutput -\> Shape3D.MaterialInput

Node Settings:

vTextCreate.Text = <https://weather.gc.ca/data/satellite/goes_ecan_1070_100.jpg>

vImageFromNet.FileType = "JPEG"

Shape3D.Shape = "Plane"

Node Screenshots

The "vTextCreate" node is handy as it allows us to customize the image URL outside of the node that does the image downloading process.

The sample image we are loading is an Eastern Canada weather satellite image from this URL:

<https://weather.gc.ca/data/satellite/goes_ecan_1070_100.jpg>

Note: If you wanted to create the URL string dynamically from a series of separate elements like the website domain name address, a custom user login or password, any sub-folders, the filename, or a series of custom request tokens, you could build this path using multiple text based inputs to a vTextSubFormat node instead.

![][image10]

The "vImageFromNet" node carries out the actual image resource downloading process. 

Don't forget to customize the "File Type" setting on the node to give Fusion a hint of the actual image format you are downloading.

![][image149]

The "Texture2D" node provides controls that help with texture placement such as UV coordinate driven scaling and UV translation.

![][image341]

The Blinn node is a general purpose surface material.

![][image312]

Fusion also supports the use of the CookTorrance (PBR) material, Phong material, Ward Material, and finally the Reflect material which is used for environmental reflections.

![][image115]

If you require examples of how to render models using a PBR material shader you can start out with the CookTorrance node and the sample shaders provided by the Reactor Package Manager's "KickAss ShaderZ" collection.

![][image266]

If you need even more surface material features you could explore the (paid) [LearnNowFX AccuShaders PBR shading plugin](https://learnnowfx.com/accushader.html) for Resolve Studio/Fusion Studio v17.1+. If you are working on programmable shaders for Fusion Studio v9 on Windows then [Chad Capeland's CustomShader3D](https://indicated.gumroad.com/l/uPahJ) plugin might be of interest.

![][image241]

The "Shape3D" node is used to create the stand-in geometry the texture is applied to. A variety of platonic solid geometry types are supported.

![][image108]

Note: If you need more control over the mesh, it is possible to switch from a Shape3D node over to using an AlembicMesh3D node to load in .abc format models, or an FBXMesh3D node to load in .fbx or .obj models.

SlashCommands

Vonk has the ability to evaluate and run SlashCommands. When you enter a block of text in a node like "vTextSlashCommand" you are able to apply persistent changes to the Fusion comp.

A SlashCommand is a type of Lua or Python script in Fusion that is normally launched from the Console window by prefacing a command with a leading "/" character.

![][image185-1]

Installing SlashCommands

The SlashCommand items are typically installed via the Reactor Package Manager and live on disk at the PathMap location of either:

Scripts:/SlashCommand/

or

Reactor:/Deploy/Scripts/SlashCommand/

![][image44]

Using SlashCommands

Here is an example of the "SlashFootage" expression syntax:

/footage list

The most interesting SlashCommand from a usability perspective is "SlashFor". The "/for" slash-command is used to quickly and easily apply changes across a number of tools.

![][image328]

Here are examples of the "SlashFor" expression syntax:

Usage 

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

SlashFor Syntax Examples

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

/for selected Merge,Transform set Size to value\*2.0 

Select all FastNoise tools: 

/for all FastNoise select

Add all tools where Size \> 1 to the selection: 

/for all where Size \> 1.0 select add

Remove all Merge tools where Angle \< 0 from the selection: 

/for all Merge where Angle \< 0 select remove

Loader Node

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

MediaIn Node

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

Animate

Animate Size of all selected tools with default modifier (BezierSpline): 

/for selected animate Size 

Animate Size of all visible tools (ie not modifiers) with CubicSpline 

/for visible animate Size with CubicSpline 

Animate Size of all selected tools, replacing any already animated ones: 

/for selected animate Size force 

Animate Seethe of all FastNoise tools, creating a ramp from 1.0 to 5.0 over 100 frames: 

/for all FastNoise animate Seethe & set Seethe at 0 to 1.0 & set Seethe at 100 to 5.0 

Remove animation from Size of all selected tools: 

/for selected animate Size remove

Expressions

/for can be limited to a subset of tools using where \<expression\>:

Set the Size of all selected tools to 1.0, if it's already \> 1.0: 

/for selected where Size \> 1 set Size to 1.0 

Set is also able to set actual expressions on node inputs:

Set a Seethe expression on selected FastNoise tools: 

/for selected FastNoise set Seethe expression time/10.0

Select

The 'select' command changes the active selection of nodes in the Nodes view area:

Select all FastNoise tools: 

/for all FastNoise select

Add all tools where Size \> 1 to the selection: 

/for all where Size \> 1.0 select add

Remove all Merge tools where Angle \< 0 from the selection: 

/for all Merge where Angle \< 0 select remove

Color

The 'color' command is used to modify node colors in the Node view.

Set the tile color to red for selected tools: 

/for selected color tile 1,0,0

Set the text color to green for selected FastNoise tools with a non-zero SeetheRate: 

/for selected FastNoise where SeetheRate \~= 0 color text 0,1,0

Set Name

Rename a node:

/for selected Loader setname to "MyLoader"

/for selected Saver setname to "MySaver"

/for selected Fuse.vTextCreate setname to "Txt"

/for selected Fuse.vNumberCreate setname to "Num"

Set Clip Filenames

Set a Loader node's Clip filename:

/for all Loader setclip to "Comp:/Import.0000.exr"

Set a Saver node's Clip filename:

/for all Saver setclip to "Comp:/Export.0000.exr"

Set Clip Version

If a Loader or Saver node has a version tag added to the clip filename like "V001" or "v001" then the /for versioning features will be your new best friend.

![][image248]

Set Loader or Saver Node Filename Version Tags

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

Set Attributes

Turn ON the passthrough option for the selected Loader nodes:

/for selected Loader setattrs TOOLB\_PassThrough to true

Turn OFF the passthrough option for the selected Loader nodes:

/for selected Loader setattrs TOOLB\_PassThrough to false

Get Attributes

Read a node's attributes:

/for all getattrs TOOLS\_RegID

/for all getattrs TOOLST\_Clip\_Name

/for all getattrs TOOLB\_PassThrough

Read the most recent render time for the selected nodes:

/for selected getattrs TOOLN\_LastFrameTime

Get Input Values 

Read a node's inputs:

/for all Transform get Aspect

/for all get StyledText

/for all get Font

/for all get Center

Modify 3D Meshes

FBX/OBJ 3D Meshes

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

/for selected SurfaceFBXMesh set ImportFile to "Macros:/KartaVR/Images/roller\_coaster\_track.fbx"

Alembic 3D Meshes

Rename the node:

/for selected SurfaceAlembicMesh setname to "pCubeABC"

ABC - Modify the object name selected from the 3D model hierarchy:

/for selected SurfaceAlembicMesh set ObjName to "Mesh/pCube"

ABC - Clear the object name selected from the 3D model hierarchy:

/for selected SurfaceAlembicMesh set ObjName to ""

ABC - Modify the imported file name:

/for selected SurfaceAlembicMesh set ImportFile to "Comp:/Media/pCube.abc"

OFX and Fuses

OFX plugins and Fuses can be targeted by SlashFor if you know their node type via the Registry ID value:

/for all ofx.com.frischluft.openFX.DepthOfField select

/for all Fuse.Wireless select

/for all Fuse.vImageWireless select

/for all Fuse.vTextCreate select

Render

Render Selected Nodes:

/for selected render

Render Selected nodes step by 25 frames at a time:

/for selected render step 25

Render all Saver nodes:

/for all Saver render

Render all Saver nodes step by 100 frames at a time:

/for all Saver render step 100

SlashFor Development

On the Steakunderwater forms [Reactor Submissions thread for SlashFor](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=14260#p14260) there is an ongoing effort to evolve the feature set. If you have an idea for a must-have feature. Post it on that thread.

Script to add all Vonk Nodes to a Comp

The following Lua code snippet will add all of the currently installed Vonk fuse nodes to the foreground Fusion composite:

	-- Based upon Cedric's "Create All Nodes" Lua Script:
	-- <https://gist.github.com/cedricduriau/125cd3b84ab72cc1afc85ebfe943193c#file-fusion_createallnodes-lua>

	print("[Create All Vonk Nodes]")
	reg_map = fusion:GetRegList()  -- dict[int, Registry]
	for _i, reg in ipairs(reg_map) do
	    if reg.ID:match("^Fuse.v")  then
	   	 print("[" .. _i .. "]", reg.ID)
	   	 comp:AddTool(reg.ID)
		end
	end

Vonk Example Projects

Vonk Mission Control

The "Mission Control" Vonk data node example simulates a small propellor-powered aircraft's cockpit dashboard by rendering a mix of digital and analog style gauges. The logic for the controls is wired together using Vonk Number and Text data types.

![][image64]

This example is available for installation using the Reactor Package Manager. Navigate to the "Kartaverse/Vonk Ultra" category on the left side of the Reactor window to locate the atom package named "Vonk Example \| Mission Control".

![][image122]

Vonk Tips

Customize the Control Range

When you place Vonk data nodes, or any other type of Fusion node in a composite, you have the option of opening the Inspector and using the right-click "Edit Controls..." dialog to remap the default control range for any parameter to fit the natural range for the attribute you are adjusting.

![][image51]

If you need a value to be adjusted by default for a slider or screw control so the range of motion would go from 0-10, 0-100, -100 to 100, 0 - 255, 0 - 1000, etc you can customize the "Range" parameters two attributes to work on that range that feels comfortable. 

This makes the user experience better so an artist gets the desired control responsiveness needed when they drag the slider fully to the left or right.

![][image80]

It is also possible to apply hard limits to the valid minimum/maximum number you can enter in the number fields, too. This is done with the "Allowed" number fields in the Edit Control dialog.. Normally a lot of numbers in Fusion's own native tools look like they are limited to 1 million. If you enter the allowed range as "-1e+38" and "1e+38" you can fully unlock the maximum numerical size allowed in a floating-point 32 bit number representation.

Applying UserControls on a Node

![][image336]

Listed below is a macro ".settings" snippet of code for a vNumberCreate node that has a UserControls based customization applied. The Number input is displayed as a SliderControl type, and the slider goes from 0 - 100. The number is set to increment as an integer, and the default for the control is 0.

	{
	    Tools = ordered() {
	   	 vNumberCreate1 = Fuse.vNumberCreate {
	   		 CtrlWZoom = false,
	   		 ViewInfo = OperatorInfo { Pos = { 327.333, 115.848 } },
	   		 UserControls = ordered() {
	   			 Number = {
	   				 LINKS_Name = "Number",
	   				 LINKID_DataType = "Number",
	   				 INPID_InputControl = "SliderControl",
	   				 INP_Default = 0,
	   				 INP_Integer = true,
	   				 INP_MinScale = 0,
	   				 INP_MaxScale = 100,
	   				 INP_MinAllowed = -1e+38,
	   				 INP_MaxAllowed = 1e+38,
	   				 ICD_Center = 50,
	   				 IC_Steps = 10,
	   				 ICS_ControlPage = "Controls"
	   			 }
	   		 }
	   	 }
	    },
	    ActiveTool = "vNumberCreate1"
	}

Clamping Number Values

One other final process that can be done to keep values sane when user inputs allow an artist to enter whatever they want, is to add a vNumberClamp node after several math operations are carried out. The vNumberClamp node gives you a parametric governor / limiter result. The clamp node input connections can live update on what is a valid Minimum/Maximum range as well with their own vNumber datatype connections on the clamp node. 

This means the node graph can self-limit the minimum and maximum vNumber range allowed at that point in the comp niode-graph. This limiting process can be fed with values like the current array size, or JSON element count, a text file's total line number count, or the global/render start and end frame ranges. 

Taking this step to keep the numbers from overshooting a realistic value keeps macros and automated templates you build from breaking by accidental out-of-bounds user input.

![][image352]

Vonk Known Issues

Fusion Timeline

The Fusion timeline is limited to 1 million frames in maximum duration. This can be an issue if rendering Fusion comps that process multi-hour long action camera footage at 60 FPS.

Lua Patterns

When carrying out sub-string operations like find & replace edits with Vonk data nodes you can come across the need to escape Lua pattern special characters. This can typically be done by prefacing a character with a % sign like "%%". 

This approach can be used with the "vTextSubFormat" node when trying to pass through an element like "\{1\}" by escaping the curly braces like this "%\{1%\}" if you are trying to place a string inside another string in a nested vTextSubFormat node usage fashion.

vNumber

Prior to Vonk v1.10 the Number DataTypes had the Fusion default clamped value limit of 1 million (1e+06). This limitation was removed by adding the following attributes on the fuse vNumber inputs:

INP\_MinAllowed = -1e+38,

INP\_MaxAllowed = 1e+38,

Several of the vNumber nodes in the "Comp" sub-category will cache their values and not update when the user changes parameters. This means you will likely need to close and re-open the comp file in the Fusion Studio GUI if you change the Fusion timeline's Global/Render based start/end frame range values and want to see that value reflected in the Vonk "Comp" node outputs. This is due to the following fuse parameters being commented out for performance reasons:

--REG\_TimeVariant = true, -- required to disable caching of the current time parameter

--REGB\_Temporal = true, -- ensures reliability in Resolve 15

vText

Vonk Text DataType based outputs that contain certain non-printable ASCII control characters embedded in the output stream can have the content terminated prematurely. This is a Fusion API limitation. Passing the information down the flow can be achieved either through passing a reference to a filename on disk as the text output, or by encoding the string in a format like Base64 text so the control characters are encapsulated.

The Fusion viewer window context doesn't render text blocks with newline characters precisely. Feeding the text content into a vTextViewer node will give more precise previews for display of multi-line textual content.

JSON key/value pair data has an indeterminate reading order when re-imported several times. Possible solutions to this issue is to sort the results alphabetically if you are building a multi-line based list of textual results.

The "vTextAccumulator" node generates out-of-sequence results in the concatenated output if the "start\_frame" control's value is changed from a "normal-ish" render start frame range value of frame 0 or 1 over to a VFX industry style of start frame value of frame 1000 or 1001. The issue is still being explored.

The "vTextProcessOpen" node does not return standard error messages on the text output connection. You will have to redirect the shell's standard output and standard error streams together in the command string being run if you need to troubleshoot issues. This is done by appending the following text, while omitting the quotes " 2\>&1" to the end of the command being run.

An example of a macOS or Linux string that would generate a shell error that you would not otherwise see would be "mkdir "/hello" 2\>&1". By adding the STDERR to STDOUT redirection we can now see the error message text "mkdir: /hello: Read-only file system".


The "vTextRenderComp" node works on macOS and Linux. The Fusion Render Node executable on Windows does not function correctly when launched internally by the vTextRenderComp node. A work-around for Windows users looking for the same functionality would be to use the Fusion built-in RunCommand node to carry out a similar nested rendering task.

The "vTextExecute" node runs asynchronously from the main rendering task. This is due to the use of the function "self.Comp:Execute()". This means the output is returned in a thread separate from the order of the comp branch rendering operation.

The cURL based Vonk nodes will not follow HTTP redirection commands returned by web servers hidden behind CloudFlare and other CDNs. You can explore workarounds like using a vProcessOpen node to run cURL from the command-prompt to be able to use Vonk in these types of situations. Note: Windows now includes the cURL executable by default with the OS so you can reasonably expect cURL to be present on all platforms. Note: If you need to specify the full absolute path to cURL for each OS platform, you can use the Vonk vTextCreatePlatformBrowse node to assist.

vArray

The "vArrayFromMediaIn" node requires you to be in a Fusion page compositing context and have the source footage loaded in the viewer before the MediaIn based metadata is accessible to downstream nodes.

The "vArrayFromXML" node is experimental. There appears to be a memory leak in the array structure size that results in duplicate array elements being created and appended to the xml2lua based Lua table record over concurrently rendered timeline frames. 

This vArrayFromXML node based issue is visible when a downstream "vJSONGetElement" node is rendered for the first time while accessing an array index value. In this situation a console error is output, while subsequent re-renderings succeed further along in the timeline sequence. A solution to this issue is being investigated.

vMeta

The "vMetadataFromMediaIn" node requires you to be in a Fusion page compositing context and have the source footage loaded in the viewer before the MediaIn based metadata is accessible to downstream nodes.

vImage

The "vImageFromClipboard" node only works on Windows since it uses a supporting executable called "Clipboard2bmp.exe". There appears to be an issue running this node in Fusion Studio v18 that is being investigated.

The "vCryptomatte" node cannot access EXR based multi-part elements. This node is designed to work with multi-channel EXR images. It is possible down the road to update the Cryptomatte fuses to access multi-part image elements (from renderers like Houdini KARMA) with the Fuse based EXRIO library but the required API documentation to do this has not been publicly released by BMD yet.

The "vCryptomatte" node relies on the Lua Metadata based "Filename" record when loading cryptomatte channel data. This means the node works successfully with a Loader node as it provides the Filename record. A Resolve based MediaIn node does not provide this Filename record information, so you would need to either switch over to using a Loader node, or append the Filename record to MediaIn node's output stream using a SetMetadata fuse or the vMetadataFromText fuse.

The "vImageCreateTiles" works by appending temporally a series of images fed into the node to create a grid layout. If you aren't paying attention you can get rendering error messages by exhausting the available frame range that Fusion can query. Each image that is combined together in the grid layout is loaded by querying the timeline's render start frame - global end frame range. If you want to render a single tiled grid image output that is 1 frame long but has 100 tiles compacted together (Tiles X = 10, Tiles Y = 10) then you could set the Render Start Frame = 1, the Render End Frame = 1, and the Global Start Frame =1, and Global End Frame = 100.

The "vImageFromFile" node needs special care when used as a source texture on a Fusion 3D workspace based surface material. Look at the Vonk Cookbook topic for the "Creating 3D Materials from Live Web Images" example to see how to hook a 2D image to a Texture2D node, then a surface material like Blinn before connecting the image data to a mesh.

The "vImageEXRFromFile" node's "EXR Part Number" control is experimental and should be left alone. Adjusting this parameter on a single part-based image will likely result in Fusion crashing due to an out of bounds exception like error.

The "vImageEXRToFile" node saves out RGBA channels from the input image frame buffer. If you require more control over the exported imagery look at the Reactor provided "pioSaver" or "LifeSaver" nodes.

The "vImageToFile" node requires Fusion v16.x+ or higher due to the reliance on the Fuse API based "clip:Open()" function and the clip:PutFrame() function.

vScriptVal

A ScriptVal node's output is typically an encoded Lua table structure. If you want to work effectively and preview the live data outputs you will need to wire in a vScriptValDump node, or a combination of the vScriptValToText + vTextViewer nodes.

The vScriptValDump node writes the Lua table structure to the Console window. 

The vScriptValToText + vTextViewer node approach makes the output selectable in the Inspector tab. This makes it easier to copy a "Key" from the output text and use it in a subsequent vScriptValGetToTable node.

vPoint

Make sure to load the vPointFromMousePos node's output into the left or right viewer window before displaying a downstream node like a b-spline shape and a Transform node that is driven by the mouse position value via a "Connect To" approach. 

Failure to view the vPointFromMousePos node before displaying the downstream node will likely lead to lockups in Fusion v18.

ShapeTree DataType

A Fusion ShapeTree datatype accessibility bug was reported to BMD at the end of July 2022 and the issue was confirmed. This bug affects the usability of all ShapeTree based fuses in Fusion v17-v18.0.x. Hopefully a bugfix from BMD will solve an issue where a connected sRender nodes' input is rendered as a transparent canvas if a Fuse is placed upstream in the toolchain.

YAML Parsing Libraries

The initial implementation of the Vonk YAML nodes like "vArrayFromYAML" and "vScriptValFromYAML" are powered by a Lua Module called "Exosite LuaYAML" which is written in pure Lua code.

There is an effort underway to allow users to select from a variety of drop-in compatible YAML parsers so you could optionally access c-code compiled libraries like LibYAML. This will extend the supported YAML syntax, and features, available in Vonk while also improving the performance when processing large YAML data files. LibYAML will make it possible to support YAML data export.

Fusion() and Resolve() Connections from a Fuse

Several Vonk nodes connect to the Fusion() and Resolve() functions from inside the Process part of the fuses. In these types of situations, typically having multiple copies of the host program active at the same time on the host system would cause issues with the remote FuScript binding processes.

In Vonk Ultra v1.124 the following changes were made to ensure the correct FuScript connection is made automatically:

local fusion = Fusion("localhost", 0, bmd.getappuuid())

local resolve = Resolve("localhost", 0, bmd.getappuuid())

Data Nodes in Macros

It has been occasionally noticed during Vonk development work that MacroOperator and GroupOperator encapsulations of Text datatype input connections can have the input  "triangle-shaped" connection points mangled on a larger combined macro node group object. This bug still has to be troubleshooted and reported to BMD once the root cause has been determined.

You will notice this issue has happened to you when you expand the GroupOperator in the Nodes view area. When you look inside the group node's working area, the input connection wire goes off to the top/left corner zone "outwards and upwards" to a near infinity of panning the view. Strange stuff.

A temporary workaround solution to this issue is to place a vTextWireless link node inside your macro. Expose the wireless node's "ImageControl" attribute in the Inspector GUI for the macro and use that as the way to make connections to data nodes packaged inside this Macro object.

![][image395]

FWIW, if your end goal was to create a data node that could be used in a Resolve Edit page Effects Template, you are going to have to pass only image data on the macro's input and output connections in the end anyway. This means data nodes inside the macro group should be accessed via wireless links, or the Inspector view's right-click "ConnectTo" pop-up contextual menu by outside nodes.

Another alternative would be to skip the GroupOperator "shell" on the macro, and for intermediate/advanced users simply expose the Vonk nodes placed inside an Underlay object. Then let the user always have access to the nodes for customization/reworking. 

This Group node based input connection linking bug will likely be solved in time, but currently this is the situation faced today (2022-08-05).

 




[image23]: image23.png width=45px height=45px

[image411]: image411.png width=53px height=53px

[image170]: image170.png width=52px height=52px

[image32]: image32.png width=43px height=37px

[image285]: image285.png width=35px height=34px

[image373]: image373.png width=451px height=154px

[image169]: image169.png width=451px height=247px

[image310]: image310.png width=182px height=379px

[image347]: image347.png width=451px height=350px

[image211]: image211.png width=451px height=520px

[image27]: image27.png width=451px height=371px

[image72]: image72.png width=451px height=84px

[image262]: image262.png width=363px height=123px

[image167]: image167.png width=434px height=408px

[image31]: image31.png width=451px height=242px

[image275]: image275.png width=451px height=134px

[image324]: image324.png width=451px height=95px

[image186]: image186.png width=451px height=153px

[image94]: image94.png width=391px height=262px

[image142]: image142.png width=312px height=164px

[image326]: image326.png width=316px height=164px

[image179]: image179.png width=316px height=164px

[image164]: image164.png width=315px height=159px

[image119]: image119.png width=315px height=99px

[image198]: image198.png width=315px height=140px

[image370]: image370.png width=315px height=140px

[image17]: image17.png width=315px height=140px

[image306]: image306.png width=315px height=119px

[image265]: image265.png width=315px height=99px

[image372]: image372.png width=315px height=139px

[image117]: image117.png width=372px height=350px

[image401]: image401.png width=365px height=106px

[image116]: image116.png width=312px height=104px

[image349]: image349.png width=315px height=119px

[image148]: image148.png width=315px height=119px

[image111]: image111.png width=315px height=159px

[image171]: image171.png width=315px height=121px

[image365]: image365.png width=315px height=140px

[image63]: image63.png width=315px height=140px

[image20]: image20.png width=344px height=177px

[image5]: image5.png width=344px height=195px

[image38]: image38.png width=344px height=177px

[image274]: image274.png width=344px height=195px

[image307]: image307.png width=344px height=195px

[image34]: image34.png width=315px height=158px

[image279]: image279.png width=315px height=195px

[image385]: image385.png width=344px height=195px

[image180]: image180.png width=344px height=98px

[image173]: image173.png width=387px height=158px

[image127]: image127.png width=338px height=140px

[image18]: image18.png width=338px height=159px

[image205]: image205.png width=338px height=140px

[image183]: image183.png width=312px height=199px

[image412]: image412.png width=312px height=182px

[image22]: image22.png width=316px height=144px

[image315]: image315.png width=344px height=215px

[image11]: image11.png width=344px height=120px

[image43]: image43.png width=344px height=158px

[image74]: image74.png width=344px height=139px

[image255]: image255.png width=147px height=199px

[image4]: image4.png width=344px height=252px

[image162]: image162.png width=344px height=140px

[image158]: image158.png width=316px height=164px

[image87]: image87.png width=316px height=164px

[image304]: image304.png width=316px height=220px

[image281]: image281.png width=312px height=218px

[image35]: image35.png width=164px height=193px

[image189]: image189.png width=451px height=76px

[image311]: image311.png width=196px height=233px

[image160]: image160.png width=451px height=183px

[image323]: image323.png width=316px height=164px

[image300]: image300.png width=344px height=158px

[image359]: image359.png width=344px height=272px

[image193]: image193.png width=311px height=144px

[image42]: image42.png width=338px height=158px

[image227]: image227.png width=338px height=121px

[image250]: image250.png width=338px height=214px

[image380]: image380.png width=314px height=237px

[image66]: image66.png width=338px height=121px

[image178]: image178.png width=314px height=234px

[image353]: image353.png width=338px height=194px

[image375]: image375.png width=338px height=176px

[image154]: image154.png width=344px height=401px

[image165]: image165.png width=338px height=139px

[image59]: image59.png width=390px height=158px

[image174]: image174.png width=338px height=139px

[image317]: image317.png width=338px height=196px

[image225]: image225.png width=312px height=164px

[image290]: image290.png width=338px height=158px

[image28]: image28.png width=338px height=551px

[image73]: image73.png width=338px height=140px

[image190]: image190.png width=313px height=142px

[image62]: image62.png width=316px height=145px

[image348]: image348.png width=451px height=167px

[image83]: image83.png width=316px height=103px

[image85]: image85.png width=338px height=98px

[image354]: image354.png width=338px height=140px

[image357]: image357.png width=338px height=158px

[image329]: image329.png width=338px height=158px

[image276]: image276.png width=338px height=140px

[image91]: image91.png width=338px height=167px

[image99]: image99.png width=338px height=158px

[image136]: image136.png width=338px height=158px

[image374]: image374.png width=338px height=139px

[image175]: image175.png width=338px height=176px

[image258]: image258.png width=338px height=140px

[image260]: image260.png width=338px height=167px

[image92]: image92.png width=338px height=140px

[image229]: image229.png width=338px height=158px

[image236]: image236.png width=338px height=140px

[image369]: image369.png width=338px height=195px

[image388]: image388.png width=338px height=138px

[image280]: image280.png width=338px height=138px

[image387]: image387.png width=338px height=176px

[image214]: image214.png width=338px height=167px

[image322]: image322.png width=338px height=177px

[image394]: image394.png width=338px height=167px

[image396]: image396.png width=338px height=158px

[image203]: image203.png width=338px height=140px

[image120]: image120.png width=338px height=140px

[image289]: image289.png width=338px height=140px

[image192]: image192.png width=338px height=140px

[image25]: image25.png width=338px height=140px

[image191]: image191.png width=338px height=139px

[image182]: image182.png width=338px height=139px

[image100]: image100.png width=338px height=139px

[image217]: image217.png width=338px height=140px

[image288]: image288.png width=338px height=158px

[image192-1]: image192.png width=338px height=140px

[image75]: image75.png width=338px height=139px

[image291]: image291.png width=338px height=140px

[image382]: image382.png width=338px height=119px

[image82]: image82.png width=338px height=167px

[image308]: image308.png width=338px height=167px

[image420]: image420.png width=372px height=182px

[image219]: image219.png width=338px height=167px

[image319]: image319.png width=338px height=167px

[image8]: image8.png width=338px height=148px

[image415]: image415.png width=338px height=167px

[image90]: image90.png width=338px height=167px

[image414]: image414.png width=338px height=166px

[image237]: image237.png width=338px height=166px

[image70]: image70.png width=338px height=101px

[image421]: image421.png width=315px height=162px

[image56]: image56.png width=338px height=98px

[image155]: image155.png width=338px height=99px

[image81]: image81.png width=338px height=98px

[image194]: image194.png width=338px height=98px

[image77]: image77.png width=338px height=140px

[image30]: image30.png width=338px height=98px

[image379]: image379.png width=338px height=101px

[image144]: image144.png width=338px height=120px

[image123]: image123.png width=338px height=232px

[image188]: image188.png width=372px height=350px

[image54]: image54.png width=338px height=176px

[image89]: image89.png width=338px height=121px

[image383]: image383.png width=338px height=131px

[image422]: image422.png width=316px height=128px

[image93]: image93.png width=338px height=131px

[image152]: image152.png width=338px height=176px

[image360]: image360.png width=338px height=121px

[image233]: image233.png width=338px height=251px

[image408]: image408.png width=338px height=288px

[image166]: image166.png width=338px height=270px

[image252]: image252.png width=338px height=195px

[image156]: image156.png width=312px height=164px

[image314]: image314.png width=314px height=149px

[image346]: image346.png width=314px height=185px

[image206]: image206.png width=233px height=212px

[image409]: image409.png width=339px height=202px

[image98]: image98.png width=314px height=146px

[image172]: image172.png width=314px height=166px

[image364]: image364.png width=314px height=148px

[image187]: image187.png width=315px height=177px

[image313]: image313.png width=314px height=137px

[image1]: image1.png width=315px height=184px

[image76]: image76.png width=315px height=163px

[image195]: image195.png width=317px height=161px

[image197]: image197.png width=316px height=181px

[image29]: image29.png width=315px height=167px

[image343]: image343.png width=314px height=167px

[image246]: image246.png width=315px height=146px

[image84]: image84.png width=314px height=166px

[image403]: image403.png width=314px height=184px

[image259]: image259.png width=314px height=166px

[image278]: image278.png width=314px height=185px

[image168]: image168.png width=314px height=166px

[image220]: image220.png width=314px height=166px

[image71]: image71.png width=314px height=167px

[image295]: image295.png width=314px height=166px

[image397]: image397.png width=410px height=235px

[image325]: image325.png width=314px height=167px

[image110]: image110.png width=314px height=203px

[image390]: image390.png width=315px height=469px

[image344]: image344.png width=314px height=107px

[image131]: image131.png width=451px height=593px

[image297]: image297.png width=336px height=455px

[image106]: image106.png width=317px height=614px

[image157]: image157.png width=314px height=124px

[image299]: image299.png width=314px height=104px

[image303]: image303.png width=316px height=131px

[image69]: image69.png width=316px height=182px

[image284]: image284.png width=315px height=104px

[image15]: image15.png width=314px height=302px

[image130]: image130.png width=314px height=159px

[image224]: image224.png width=315px height=101px

[image282]: image282.png width=316px height=104px

[image228]: image228.png width=317px height=131px

[image139]: image139.png width=317px height=102px

[image320]: image320.png width=316px height=107px

[image21]: image21.png width=315px height=103px

[image407]: image407.png width=315px height=103px

[image184]: image184.png width=315px height=107px

[image33]: image33.png width=312px height=164px

[image7]: image7.png width=312px height=164px

[image3]: image3.png width=315px height=161px

[image216]: image216.png width=315px height=161px

[image316]: image316.png width=315px height=124px

[image400]: image400.png width=315px height=164px

[image163]: image163.png width=315px height=164px

[image232]: image232.png width=314px height=122px

[image392]: image392.png width=314px height=122px

[image102]: image102.png width=315px height=124px

[image389]: image389.png width=314px height=143px

[image350]: image350.png width=314px height=143px

[image140]: image140.png width=316px height=146px

[image402]: image402.png width=315px height=142px

[image143]: image143.png width=315px height=142px

[image330]: image330.png width=314px height=101px

[image226]: image226.png width=314px height=103px

[image331]: image331.png width=315px height=147px

[image302]: image302.png width=314px height=144px

[image50]: image50.png width=315px height=146px

[image147]: image147.png width=314px height=179px

[image261]: image261.png width=317px height=142px

[image410]: image410.png width=316px height=576px

[image105]: image105.png width=317px height=254px

[image213]: image213.png width=314px height=205px

[image273]: image273.png width=315px height=159px

[image335]: image335.png width=315px height=141px

[image358]: image358.png width=315px height=102px

[image376]: image376.png width=316px height=104px

[image145]: image145.png width=315px height=126px

[image107]: image107.png width=312px height=128px

[image361]: image361.png width=312px height=164px

[image234]: image234.png width=315px height=199px

[image334]: image334.png width=312px height=164px

[image413]: image413.png width=316px height=202px

[image210]: image210.png width=338px height=139px

[image49]: image49.png width=338px height=158px

[image355]: image355.png width=338px height=158px

[image245]: image245.png width=338px height=139px

[image104]: image104.png width=390px height=146px

[image68]: image68.png width=312px height=146px

[image113]: image113.png width=390px height=106px

[image196]: image196.png width=338px height=233px

[image351]: image351.png width=338px height=158px

[image207]: image207.png width=338px height=140px

[image199]: image199.png width=338px height=139px

[image150]: image150.png width=338px height=139px

[image327]: image327.png width=316px height=104px

[image418]: image418.png width=338px height=98px

[image9]: image9.png width=338px height=295px

[image114]: image114.png width=338px height=176px

[image386]: image386.png width=338px height=158px

[image221]: image221.png width=338px height=233px

[image263]: image263.png width=336px height=192px

[image345]: image345.png width=338px height=140px

[image238]: image238.png width=338px height=167px

[image393]: image393.png width=338px height=167px

[image272]: image272.png width=372px height=328px

[image65]: image65.png width=338px height=140px

[image161]: image161.png width=338px height=99px

[image40]: image40.png width=338px height=140px

[image46]: image46.png width=338px height=99px

[image256]: image256.png width=338px height=140px

[image201]: image201.png width=338px height=99px

[image41]: image41.png width=314px height=601px

[image230]: image230.png width=338px height=139px

[image141]: image141.png width=338px height=173px

[image185]: image185.png width=422px height=344px

[image417]: image417.png width=338px height=186px

[image286]: image286.png width=338px height=139px

[image176]: image176.png width=392px height=198px

[image159]: image159.png width=137px height=100px

[image305]: image305.png width=248px height=80px

[image268]: image268.png width=338px height=504px

[image52]: image52.png width=338px height=139px

[image138]: image138.png width=338px height=140px

[image423]: image423.png width=338px height=140px

[image267]: image267.png width=338px height=486px

[image270]: image270.png width=338px height=121px

[image362]: image362.png width=338px height=158px

[image86]: image86.png width=338px height=140px

[image112]: image112.png width=338px height=140px

[image202]: image202.png width=338px height=140px

[image253]: image253.png width=338px height=139px

[image381]: image381.png width=338px height=140px

[image363]: image363.png width=338px height=140px

[image391]: image391.png width=338px height=140px

[image218]: image218.png width=338px height=140px

[image337]: image337.png width=338px height=140px

[image79]: image79.png width=338px height=140px

[image109]: image109.png width=338px height=140px

[image277]: image277.png width=338px height=296px

[image366]: image366.png width=338px height=206px

[image118]: image118.png width=338px height=120px

[image404]: image404.png width=338px height=158px

[image101]: image101.png width=338px height=467px

[image146]: image146.png width=314px height=491px

[image378]: image378.png width=338px height=158px

[image137]: image137.png width=338px height=177px

[image97]: image97.png width=338px height=233px

[image339]: image339.png width=338px height=140px

[image247]: image247.png width=372px height=350px

[image309]: image309.png width=338px height=120px

[image416]: image416.png width=338px height=140px

[image177]: image177.png width=338px height=139px

[image301]: image301.png width=338px height=98px

[image95]: image95.png width=338px height=206px

[image338]: image338.png width=338px height=157px

[image13]: image13.png width=338px height=98px

[image257]: image257.png width=338px height=140px

[image287]: image287.png width=338px height=158px

[image367]: image367.png width=338px height=139px

[image126]: image126.png width=338px height=176px

[image2]: image2.png width=149px height=266px

[image129]: image129.png width=338px height=139px

[image208]: image208.png width=338px height=139px

[image215]: image215.png width=313px height=123px

[image128]: image128.png width=266px height=71px

[image45]: image45.png width=338px height=98px

[image235]: image235.png width=338px height=469px

[image271]: image271.png width=338px height=98px

[image321]: image321.png width=338px height=314px

[image254]: image254.png width=338px height=196px

[image153]: image153.png width=312px height=164px

[image48]: image48.png width=338px height=251px

[image47]: image47.png width=338px height=232px

[image134]: image134.png width=338px height=251px

[image39]: image39.png width=338px height=344px

[image60]: image60.png width=338px height=251px

[image181]: image181.png width=338px height=345px

[image318]: image318.png width=338px height=344px

[image67]: image67.png width=338px height=344px

[image36]: image36.png width=338px height=158px

[image294]: image294.png width=338px height=120px

[image53]: image53.png width=338px height=233px

[image242]: image242.png width=338px height=158px

[image296]: image296.png width=338px height=231px

[image405]: image405.png width=338px height=233px

[image204]: image204.png width=338px height=345px

[image58]: image58.png width=338px height=233px

[image371]: image371.png width=338px height=233px

[image377]: image377.png width=338px height=344px

[image212]: image212.png width=338px height=251px

[image6]: image6.png width=338px height=177px

[image12]: image12.png width=338px height=287px

[image88]: image88.png width=344px height=195px

[image24]: image24.png width=338px height=314px

[image368]: image368.png width=338px height=233px

[image132]: image132.png width=338px height=314px

[image14]: image14.png width=338px height=222px

[image124]: image124.png width=338px height=314px

[image124-1]: image124.png width=338px height=314px

[image244]: image244.png width=344px height=314px

[image96]: image96.png width=338px height=203px

[image200]: image200.png width=338px height=271px

[image26]: image26.png width=338px height=345px

[image240]: image240.png width=338px height=345px

[image264]: image264.png width=338px height=159px

[image384]: image384.png width=451px height=108px

[image31-1]: image31.png width=451px height=242px

[image283]: image283.png width=329px height=170px

[image293]: image293.png width=326px height=323px

[image209]: image209.png width=451px height=119px

[image222]: image222.png width=326px height=147px

[image243]: image243.png width=332px height=145px

[image340]: image340.png width=330px height=236px

[image16]: image16.png width=329px height=299px

[image57]: image57.png width=451px height=139px

[image61]: image61.png width=451px height=196px

[image251]: image251.png width=451px height=146px

[image342]: image342.png width=393px height=171px

[image419]: image419.png width=392px height=315px

[image269]: image269.png width=392px height=139px

[image333]: image333.png width=389px height=142px

[image103]: image103.png width=451px height=74px

[image133]: image133.png width=392px height=140px

[image406]: image406.png width=451px height=148px

[image78]: image78.png width=370px height=161px

[image223]: image223.png width=258px height=305px

[image231]: image231.png width=365px height=144px

[image249]: image249.png width=451px height=168px

[image399]: image399.png width=365px height=107px

[image292]: image292.png width=155px height=30px

[image55]: image55.png width=365px height=103px

[image332]: image332.png width=410px height=44px

[image356]: image356.png width=365px height=146px

[image121]: image121.png width=451px height=14px

[image298]: image298.png width=365px height=146px

[image125]: image125.png width=365px height=236px

[image239]: image239.png width=194px height=301px

[image398]: image398.png width=451px height=350px

[image135]: image135.png width=451px height=78px

[image10]: image10.png width=392px height=122px

[image149]: image149.png width=390px height=194px

[image341]: image341.png width=390px height=234px

[image312]: image312.png width=389px height=315px

[image115]: image115.png width=113px height=129px

[image266]: image266.png width=451px height=235px

[image241]: image241.png width=388px height=303px

[image108]: image108.png width=312px height=150px

[image185-1]: image185.png width=422px height=344px

[image44]: image44.png width=451px height=256px

[image328]: image328.png width=451px height=161px

[image248]: image248.png width=451px height=368px

[image64]: image64.png width=451px height=356px

[image122]: image122.png width=451px height=254px

[image51]: image51.png width=311px height=454px

[image80]: image80.png width=451px height=205px

[image336]: image336.png width=318px height=124px

[image352]: image352.png width=317px height=185px

[image395]: image395.png width=451px height=119px