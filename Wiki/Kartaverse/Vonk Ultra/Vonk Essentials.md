---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

Vonk nodes are modifiers that live in the node-graph. You can connect Vonk nodes together if they pass a common supported data type like text, numbers, etc.

![[image72.png]]

If you right-click on an attribute in the Inspector window, the "Connect To" contextual pop-up menu appears. This technique allows you to directly link an existing Vonk node's output connection to a specific channel attribute that doesn't have an input connection exposed in the node graph.

![[Kartaverse/Vonk Ultra/img/image262.png]]

When viewing Text or Number data types in the Fusion viewer windows, you may have to use the "Fit" or "100%" view resizing options to make the text visible. The text is anchored to the top left origin of the window.

If you want to see text with line wrapping enabled, try connecting a "vTextViewer" node to the text output connection on your node. This will render the active text data stream into the Inspector view.

### Working With Text Data

Working With Text Data

![[image167__fix1.png]]

The vTextCreate node is used to create the initial starting point for a text based data node graph. There are several varieties of text create nodes to choose from:

The regular vTextCreate node has a simple unformatted text field.

The vTextCreateBrowse node makes it easier to select files, and enter file paths with the addition of a "Browse" button that displays a file picker dialog.

The vTextCreateMultiline node supports line wrapping. It is useful for entering longer blocks of text that contain indented text, tabs, carriage return, and newline characters.

The vTextCreatePlatform node will vary what text is specified based upon the current operating system platform. The vTextCreateArch node will vary the output based upon the current CPU architecture.

Multiple text create nodes can be appended together to create a custom string using the vTextSubFormat node. Each input connection on the vTextSubFormat node can be placed exactly where it's needed using a token approach. A token value is entered using curly braces that surround an integer number like "{1}" or "{2}" that represent an input connection number on the node.

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

![[image31__fix2.png]]

### Fusion Data Types

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

### Vonk Node Categories

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