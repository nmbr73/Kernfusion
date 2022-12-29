---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

HDRI (High Dynamic Range Imagery) is able to represent a wider range of visual information through the storage and use of floating point values.

These RGB formatted high-dynamic range pixel samples exceed the typical 8-bit style 0-255 / 0-1 range of color information stored in a JPEG, BMP, or MP4 like file format that is often shown on a traditional computer monitor or mobile phone screen.

HDRI imagery can be created from RAW image data, by merging bracketed photos taken across a wide range of exposure levels, or from 3D renderings. Common file formats for floating-point HDRI image data include EXR, HDR, and TIFF.

In an HDRI image the center region of a super-white "sun" disc shape might read out as an RGB floating point value like 16+ when selected with a color picker. In an 8-bit image this sun disc RGB color value would typically be clamped at an integer value of 255, or a floating point value of 1.0.

### HDRsoft Photomatix Pro

HDRsoft Photomatix Pro

Photomatix Pro is an easy to use HDR image bracket merging tool that features a batch automation interface that allows you to quickly process a large collection of exposure-bracketed images into HDRI media.

With Photomatix's batch processing interface EXR format image output is supported which is an excellent choice for visual effects workflows.

<https://www.hdrsoft.com/resources/photomatix-pro-features-highlights.html>

#### Photomatix Batch Processing Workflows

Photomatix Batch Processing Workflows

These two screenshots show common settings for batch processing operations.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image380.png]]

![[Kartaverse/Immersive Pipeline Integration Guide/img/image298.png]]

### DxO Optics PhotoLab

DxO Optics PhotoLab

PhotoLab is the continuation of the earlier Nikon RAW photo processing tools. This suite of tools is useful for photogrammetry applications that need to maximize image quality.

Few people have discovered that PhotoLab has a "generally undocumented" command-line interface that can allow for batch image processing.

<https://www.dxo.com/dxo-photolab/>

#### DxO PhotoLab Command-Line Settings

DxO PhotoLab Command-Line Settings

DxO PhotoLab has a CLI module called DopCor (DxO Correction Engine) which allows you to batch process DNG/RAW footage, and apply color correction presets. This is handy for pre-processing media before running photogrammetry workflows such as adding micro-contrast, reducing JPEG/MPEG compression artifacts, or fine tuning color correction settings.

#### PhotoLab Program Paths

PhotoLab Program Paths

PhotoLab v3

Windows:

    C:\Program Files\DxO\DxO PhotoLab 3\DopCor.exe

macOS:

    /Applications/DXOPhotoLab3.app/Contents/XPCServices/XPCCor12.xpc/Contents/MacOS/XPCCor12

PhotoLab v2

Windows:

    C:\Program Files\DxO\DxO PhotoLab 2\DopCor.exe

macOS:

    /Applications/DXOPhotoLab3.app/Contents/XPCServices/XPCCor12.xpc/Contents/MacOS/XPCCor12

#### DopCor Usage Summary

DopCor Usage Summary

Step 1. Create the DxO PhotoLab temp working folder

    mkdir "%TEMP%\DxO\"

A logfile named "`%TEMP%\DxO\DxO_Output_Log.txt`" is written to disk. Make sure the folder named "`%TEMP%\DxO`" exists in advance by creating the "DxO" sub-folder inside the temporary files folder using the Windows Command Prompt.

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

A)  Edit the '`--img="%TEMP%\DxO\Cam01.0001.jpg" ^`' entry to define the actual image you want to convert. Make sure this filename is unique and doesn't already exist on-disk.

B)  Also define the DxO preset you want to use by editing the entry. (You will need to write in your own custom preset saved to disk from the PhotoLab GUI.)

    '--sidecar="%USERPROFILE%`\AppData`{=tex}`\Local`{=tex}`\DxO`{=tex}`\DxO `{=tex}PhotoLab 3`\Presets`{=tex}\\2 - Neutral colors.preset" \^'.

#### Photolab Command-Line Usage Notes

PhotoLab Command-Line Usage Notes

Note 1: You need to port the DxO PhotoLab "Export to disk" dialog generated macOS .plist formatted "`OutputSettings.plist`" preference file into a Windows based pure XML document for DopCor.exe on Windows to run successfully. This requires you to extract inline encoded XML "blob" data and then save it to an external document.

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

#### OutputSettings.xml file contents:

OutputSettings.xml file contents:

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

Note 2: The Windows Command Prompt window supports the use of the "\^" carat character as a "line-continuing" symbol. If you place this at the the end of each line of text, it allows you to use multi-line text submission that has a carriage return placed after each command. This is far easier to manage in Notepad++ compared to typing in one super long line of text. When the text block that uses the "\^" carat is pasted into the Command Prompt window, the text with "\^" carat character at the end of each line is treated as a single, super long, block of text and the new line characters are ignored. Always copy/paste a final trailing blank (empty) line of text when you run this type of text in the Command Prompt.

Note 3: The DxO DopCor error message "`[DopCor|Error] Parameters file doesn't exist or is not a valid sidecar`" is caused by an invalid `.preset` file being linked into the `--sidecar` parameter. As far as I can tell a `.preset` file is wanted for this attribute, not the typical .dop sidecar file that would be named something like "`image.ext.dop`".

Note 4: DopCor runs with a single stream socket via an XPC remote port connection. So don't try to queue multiple concurrent image streams at the same time on one system as they are handled FIFO (First In, First Out) so you won't see a performance improvement.

DxO uses a tool called "XPCCor" to do remote procedure calls between its app for lower-level image conversions than the CLI offers:

<https://en.wikipedia.org/wiki/Remote_procedure_call>

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

#### DopCor Standalone CLI Syntax

DopCor Standalone CLI Syntax

    Usage:
        DopCor [OPTIONS]+

    General switches:

    Command line options:
    -h, -help   Display help and exit
    -l, --listening Server mode (Use -l --help for related help)
    --debug Increase verbosity

    Command line switches:
    -c, --cafsdir=PATH  [Required] {PATH} to directory containing DxO Modules
    -d, --cafsdb=PATH   [Required] {PATH} to DxO Modules database
    -k, --oclcache=PATH [Required] {PATH} to Open Clcachefile (ocl64.cache)
    -i, --img=PATH  [Required] {PATH} to input image files
    -s, --sidecar=PATH  [Required] {PATH} to Preset file
    -o, --output=PATH   [Required] {PATH} to output settings file
    -p, --outputpath=PATH   [Required] {PATH} to folder where to write processed image
    -f, --outputsuffix=SUFFIX   to append to the name of processed image
    -t, --threads=VALUE     Max number of threads (default: 32)

    -cl, --opencl Enable OpenCL acceleration
    -tim, --tilemanager=VALUE Enable TileManager
    -tip1, --tilememorysize=VALUE Tile pool size. The value must be a power of 2, expressed in MB (default: 1024 MB).


    Server mode switches:
    Tip: Use -l --help to list the Server mode switches

    -p, --port=PORT The PORT for Server mode (default: 9875)
    -d, --timeout=TIMEOOUT  The TIMEOUT for server shutdown without connection (defaut 60: seconds)

    Possible Spare Option:
    /Start

#### DopCor CLI Exit Code States:

DopCor CLI Exit Code States:

0 = Success

-1 = Error

#### DopCor CLI returned status message strings:

DopCor CLI returned status message strings:

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

### Canon Digital Photo Professional

Canon Digital Photo Professional

<https://en.canon-cna.com/support/consumer_products/software/digital-photo-professional.html>