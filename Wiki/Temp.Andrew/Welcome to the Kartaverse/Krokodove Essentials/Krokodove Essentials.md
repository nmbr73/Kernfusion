Title: Welcome to the Kartaverse  
Author:

Krokodove Essentials

Created 2022-06-08 Last Updated 2022-06-12 11.06 PM UTC -4

Docs By [Andrew Hazelden \<andrew@andrewhazelden.com\>](mailto:andrew@andrewhazelden.com)

KKD Plugin By [Raf Schoenmaekers info@komkomdoorn.com](mailto:info@komkomdoorn.com)

Overview

Krokodove (KKD) is a cross-platform compatible plugin for Fusion Studio and DaVinci Resolve Studio. It includes 100+ free Fusion tools. Krokodove was created by Raf Schoenmaekers of [Komkom Doorn](http://komkomdoorn.com).

The KKD shape tools allow you to create animatable vector artwork which is excellent for node-based motion graphics projects.

The KKD data tools support workflows similar to Houdini CHOPS through the processing of lists, and sets of arrays.

Resources

Krokodove Vimeo Channel:

<https://vimeo.com/channels/krokodove>

Krokodove Email Contact:

[info@komkomdoorn.com](mailto:info@komkomdoorn.com)

License

Krokodove is distributed for free.

Compatibility

Please note that KKD is a compiled Fusion plugin that was created with the FusionSDK. The KKD tools will not work in Fusion Standalone (free) or Resolve (free). A paid copy of either Fusion Studio or DaVinci Resolve Studio is required to run this plugin.

Software Required

To run Krokodove on your system you will need the following tools:

* ![][image157] [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) (Free)
* ![][image284]BMD [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/) (Paid)
* ![][image170]BMD [Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/) (Paid)

Install KKD

The Krokodove plugin can be installed using the [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) for Resolve Studio/Fusion Studio.

![][image146]

After you have Reactor installed and open, select the "Tools \> Plugins" category on the left sidebar. Click on the package named "Krokodove for Fusion/Resolve Studio 17" and then press the "Install" button.

![][image165]

Once the installation is complete, restart Resolve Studio or Fusion Studio standalone. This will load the KKD plugin.

Accessing the KKD Nodes

Once Fusion Studio has finished loading you will have access to a new "Tools \> Krokodove" set of menu items.

![][image249]

You can also right-click in the Nodes view area, and select the "Add Tool \> Krokodove" contextual menu item to access the KKD tools.

![][image177]

In Resolve Studio you can access KKD nodes using the Effects Library tab at the top left of the user interface. Expand the "Tools \> Krokodove" hierarchy to view the nodes.

![][image97]

KKD Example Comps

![][image194]

There is a collection of KKD example .comp files that can also be installed using Reactor.

Select the "Comps \> Krokodove" category on the left sidebar. Click on the package named "Krokodove Showcase" and then press the "Install" button.

![][image136]

To access the installed KKD example comps, navigate to the "Reactor \> Tools \> Show Comps Folder" menu item in Fusion Studio. 

This will open up a folder browsing window using Explorer (Windows) or Finder (macOS).

The folder window displays the contents of the PathMap based location of "Reactor:/Deploy/Comps/". 

Double-click on the folder labeled "Krokodove" to open it. 

Inside this location you will have access to 35 example comps that use a variety of KKD tools. These examples are stored in categorized sub-folders for quick access.

![][image202]

Here is a screenshot of the "Reactor:/Deploy/Comps/Krokodove/Pack/Pack\_A\_001.comp" project file:

![][image243]

KKD Node Categories

The Krokodove nodes are separated into the following categories and sub-categories based upon what data types they work with, and the function they perform:

3D

* Align 3D
* Connect 3D
* Cut 3D
* Data Duplicate 3D
* Kill 3D
* Mapped Duplicate 3D
* Objectify 3D
* Poly Play 3D
* Retime 3D
* Tool 3D
* Vertex Play 3D

3D Create

* Data Create 3D
* Fold Create 3D
* Heightfield Create 3D
* Object Create 3D
* Tube Create 3D
* World Position Create 3D

3D Region

* rCube
* rImage
* rMerge
* rModify
* rNoise
* rPlane
* rShape
* rSphere
* rTransform

Data

* dCopy
* dDelete
* dGrow
* dInfo
* dMath
* dMerge
* dRemap
* dSelect
* dSet Constant
* dSet Manual
* dSet Ramp
* dSet Random
* dSort
* dTool
* dTransform

Data Create

* dChannels Create
* dFrom Image Analyzer Create
* dFrom Image Create
* dFrom Image Pack Create
* dFrom Region Create
* dLoader Create
* dPattern Create

Image

* Analyzer
* Blur in Space
* Bounding Box
* Connect
* Dither
* Extend
* Find
* Flur
* Fragments
* Grow
* Grow Color
* Microwaves
* Pack
* Painterly
* Rasterize
* Smart Field Strobe
* Spiral
* Switcher
* Time Mapper
* Wireless Link
* Wireless Linky
* Worm

Image Color

* Color
* Hue/Saturation
* Invert
* Match Color
* Replace Color
* Threshold
* Image Create

Image Create

* Blob
* Lines
* Pattern
* Shapes

Image Pixel

* Average
* Beams
* Bevel
* Border
* Canvas
* Channel Shifter
* Clean Edges
* Combine
* Crop Monsieur
* Cut and Bleed
* Deflicker
* Duplicate
* Eat
* Extrude
* Map Filter
* Matte Cleaner
* Merge and Bone
* Noise
* Pixel Region
* Planes
* Plastic
* Positioner
* Push
* Reassemble
* Rest
* Seamless Loop
* Smear
* Sort

Image Position

* Contour
* Gradient
* Shade by Sample

Image Vector

* Vector Blur
* Vector Field
* Vector Motion
* Vector Time
* Vector Visualization

Image Warp

* Blend
* Directional Scale
* Kaleidoscope
* Lens Distortion
* Mirror
* Morph
* Offset
* Radial
* Relative Transform
* Ramp
* Segment Transform
* Shear
* Shuffle
* Spherize
* Stretch
* Transform

Shape

* sBoolean
* sKill
* sMerge
* sOffset
* sRender
* sResample
* sShading
* sSmooth
* sTools
* sTransform
* sTriangulate
* sWriteOn
* sZigZag

Shape Create

* sChart Create
* sPrimitive Create
* sSpiral Create
* sTrace Create

Modifiers

* Color Switcher
* Beat
* Formula
* From File
* Juggle
* Random
* Write

KKD Node Reference Guide

Align 3D

Align an object relative to

![][image172]

Connect 3D

Connect vertices...

![][image269]

Cut 3D

Cuts off an object

![][image38]

Data Duplicate 3D

Create duplicates, fully controlled by data channels.

![][image280]

Kill 3D

Kills (part of) an object

![][image126]

Mapped Duplicate 3D

Create duplicates, fully controlled by image maps.

![][image234]

Objectify 3D

Manipulates objects as a whole

![][image112]

Poly Play 3D

Manipulate objects on a poly level.

![][image55]

Retime 3D

A 3D retiming tool

![][image44]

Tool 3D

Tools to manipulate an object![][image261]

Vertex Play 3D

Manipulate objects on a vertex level.

![][image156]![][image193]

Data Create 3D

Creates a height field from a map

![][image84]![][image20]![][image26]![][image56]

Fold Create 3D

Creates a foldable object

![][image162]![][image142]![][image73]![][image149]

Heightfield Create 3D

Creates a height field from a map

![][image230]![][image48]

Object Create 3D

Creates an object

![][image199]

Shape Create 3D

Creates a 3D object from a shape

![][image244]

Tube Create 3D

Creates some tubes

![][image35]![][image196]![][image65]![][image214]![][image164]![][image260]

World Position Create 3D

Creates a plane with based on world space coordinates

![][image190]

rCube

Region 3D Cube

![][image110]![][image43]

rImage

Region 3D Image

![][image91]

rMerge

Region 3D Merge

![][image83]

The "Combine" control can be set to "Union", "Intersect", "Add", "Subtract", or "Exclusive".

![][image180]

rModify

Region 3D Modify

![][image25]

rNoise

Region 3D Noise

![][image282]

rPlane

Region 3D Plane

![][image227]

rShape

Region 3D Shape

![][image263]

The Mapping control can be set to "Planar", "Spherical", or "Cylindrical".

rSphere

Region 3D Sphere

![][image10]

rTransform

Region 3D Transform

![][image114]

The "Region Transform" control page has a single checkbox labelled "Invert".

The "Transform" control page can be used to adjust the XYZ Position, Rotation, and Scale attributes.

![][image96]

dCopy

Copy data channels

![][image238]

The "Type In" and "Type Out" controls can be set to "Any", "Bool", "Integer", "Float", "Vector2", "Vector3", or "Color".

![][image255]

dDelete

Data Delete

![][image154]

dGrow

Data Grow

![][image24]

dInfo

Data Info

![][image205]

dMath

Data Math

![][image111]

The Operation control can be set to "None", "Add", "Subtr", "Mult", "Div", "Power", or "Mod".

![][image270]

dMerge

Data Merge

![][image143]

The data merge node has 8 initial input connections named "Data \[1-8\] (in)".

![][image116]

dRemap

Data Remap

![][image32]

dSelect

Data Select

![][image155]

The Operation control can be set to "None", "Add", "Subtr", "Mult", "Div", "Power", or "Mod".

![][image270-1]

dSet Constant

Set Constant Data

![][image78]

dSet Manual

Set Data Manually, one by one

![][image217]

dSet Ramp

Set data to follow a ramp or gradient between 2 values

![][image235]

dSet Random

Set/add random data

![][image248]

dSort

Data Sorting

![][image239]

The "Vector Sort1" control can be set to "By X", "By Y", "By Z", or "Distance".

![][image160]

dTool

Data Tools

![][image222]

By default the "Limit Count Start" and "Limit Count End" controls have an initial control range of 0-100.

dTransform

Data Transform

![][image189]

dChannels Create

Create data channels

![][image23]![][image50]![][image161]![][image64]![][image178]![][image251]![][image86]

dFrom Image Analyzer Create

Sample image and format data

![][image5]![][image132]![][image49]

dFrom Image Create

Sample Image

![][image213]

dFrom Image Pack Create

Sample image using packing method

![][image171]

dFrom Region Create

Sample Region

![][image54]

The "Replace Type" control can be set to "Replace in Range" or "Replace All".

dLoader Create

Load data

![][image18]

The "Channels Direction" control can be set to "By Row" or "By Column".

The "First Row" control can be set to "Automatic", "Channel Names", or "Channel Data".

The "First Column" control can be set to "Automatic", "Channel Names", or "Channel Data".

dPattern Create

Create a pattern

![][image181]

The "Pattern Type" control can be set to "Grid" or "Ring".

The "Ring Count Type" control can be set to "By Number", "By Distance", or "By Angle".

Analyzer

Image analysis

![][image1]![][image37]![][image89]

The "Scale" control on the Guides control page can be set to "0.0 ... 1.0", "0 ... 255", "0 ... 1023", or "0 ... 65535".

![][image201]

Blur in Space

A mere re-packaging of two basic Fusion tools: color space swapping and blur

![][image125]

The "Blur Filter" control can be set to "Box", "Soften", "Bartlett", "Gaussian", or "Sharpen"

![][image103]

Bounding Box

Bounding Box

![][image275]

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or  "Lumin.".

The "Threshold" control has a default input control range of 0 - 1.

The "Lock" control can be set to "All Sides", "Vert./Horiz.", or "None".

The "Extend" control has a default input control range of -0.05 to 0.1. The initial value is 0.0.

Connect

Connect points with lines or splines

![][image15]![][image279]![][image283]

Dither

Reduces the number of bits for each color channel and creates a 'logical noise' doing it

![][image218]

The "Dither method" control can be set to "None", "Ordered", "Simple error distribution", or "Floyd & Steinberg".

![][image129]

Extend

![][image101]

The "Direction" control can be set to "Horizontal" or "Vertical".

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", "Lumin.", or "Each".

![][image79]

The "Hold" control can be set to "Within range", "Minimum", or "Maximum". 

![][image173]

Find

![][image212]

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or "Lumin.".

The "Result" control can be set to "Analytic" or "Clean".

Flur

![][image277]

The "Shape" control can be set to "Square", "Round", or "Axial".

Fragments

![][image203]

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or "Lumin.".

![][image33]

The "Range Curve" control can be set to "Linear", "Ease In", "Ease Out", or "Ease In/Out".

![][image109]

Grow

![][image215]![][image76]

Grow Color

Fill transparent parts by extending the edge color

![][image179]

Microwaves![][image41]

Pack

![][image137]![][image66]![][image3]

Painterly

Painterly effects

![][image106]

Rasterize

Half-tone style rasterize

![][image254]![][image197]![][image140]

Smart Field Strobe

Smart Field Strobe tries to detect motion and only removes fields where there is.

![][image123]![][image27]

Spiral

![][image183]![][image163]![][image152]

Switcher

![][image29]

Time Mapper

![][image69]

Wireless Link

![][image259]

Wireless Linky

![][image192]

Worm

![][image88]![][image166]![][image102]

Color

Simple tool for easy fading to a certain color

![][image274]

Hue/Saturation

A simple color correcting tool, operating in HLS color space

![][image16]

Invert

Invert color, luminance or hue

![][image28]

The "Type" control can be set to "Color", "Luminance", or "Hue".

![][image9]

Match Color

Color matching

![][image87]

The "Number of colors" control can be set to "Single", "Low and High", or "Low, Mid && High".

![][image145]

The "Shadows match" control can be set to "Full color", "Color tint", or "Luminance".

![][image6]

The "Highlights match" control can be set to "Full color", "Color tint", or "Luminance".

![][image57]

Replace Color

This color correcting tool replaces a certain color range with another

![][image67]![][image147]

Threshold

Clips the color in reference to the threshold

![][image94]

Blobs

Create metaball like blob shapes

![][image223]![][image127]

Lines

Line patterns

![][image208]![][image11]![][image232]![][image256]

Pattern

Creation of a wild collection of patterns (assuming you think grids are wild)

The "Type" control can be set to "Triangles", "Grid", or "Honeycomb".

![][image121]![][image139]

Shapes

Shape patterns; circles, squares, ...

![][image182]![][image184]![][image92]

Average

![][image257]

The "Main Time" control can be set to "Flow Time", or "Time Speed", or "Time Stretch".

The "Non-existing frames" control can be set to "Black" or "Ignore".

Beams

![][image17]![][image281]

Bevel

![][image8]![][image175]![][image53]

Border

![][image141]

Canvas

![][image167]

Channel Shifter

![][image253]![][image31]![][image258]![][image188]![][image45]![][image115]

Clean Edges

![][image224]

Combine

![][image265]

Crop Monsieur

Makes multiple copies of an image

![][image158]

Cut and Bleed

![][image4]

Deflicker

![][image131]![][image207]

The "Reference" control can be set to "Fixed Time", "Time Steps", "Average", or "External".

Duplicate

![][image130]![][image120]![][image59]

Eat

Eats out the edges of an image

![][image262]

Extrude

![][image34]![][image204]

The "Perspective type" control can be set to "Parallel" or "Radial".

The "Color type" control can be set to "Solid" or "Original".

Map Filter

![][image229]

Matte Cleaner

![][image245]![][image80]

Merge and Bone

![][image117]![][image104]![][image148]

Noise

![][image128]

Pixel Region

![][image231]

Planes

![][image271]![][image226]

Plastic

Put a plastic film over your image

![][image42]![][image75]![][image74]

Positioner

![][image187]

The "Type of positioner" control can be set to "One point", "Two point",  "Three point", or "Four point".

![][image144]

Push

![][image133]

Reassemble

![][image82]

Rest

![][image252]

Seamless Loop

Create seamlessly looping sequences easily

![][image266]

The "Fade type" control can be set to either "Linear" or "Smooth".

Smear

Smears the image horizontally or vertically

![][image98]![][image276]

Sort

![][image22]

Contour

Draws a nice, anti-aliased contour around an image

![][image105]

Gradient

Creation of gradients: linear, radial and spotlight shapes can be created an combined with the background image

![][image62]![][image107]

Shade by Sample

Shade an image based on the normals

![][image119]

Vector Blur

![][image135]

Vector Field

![][image108]

Vector Motion

![][image7]

The "Motion analysis direction" control can be set to "Backward", "Both", or "Forward".

Vector Time

![][image68]

The "Adjust" control can be set to "Not", "Time Speed", "Time Stretch".

Vector Visualization

![][image247]

The "Vizualize vector field" control can be set to "Grid" or "Edges".

The "Line Color" control can be set to "Solid" or "Image".

Blend

Directional Scale

![][image221]

Kaleidoscope

![][image12]![][image90]

The "Type" control can be set to "Classic" or "Fancy".

Lens Distortion

![][image118]

The "Type" control can be set to "Distort" or "Restore".

If you have "K1" and "K2" lens distortion parameters provided by an external lens calibration tool, those values are entered in the "Kappa1" and "Kappa2" number-fields.

Mirror

![][image71]

Morph

![][image236]

The "Warp Type" control can be set to "Field" or "Radial".

Offset

![][image185]

Radial

![][image273]

Relative Transform

![][image267]

The "Center Type" control can be set to "Bounding Box" or "Weighted Pixels".

The "Size Type" control can be set to "Size X and Size Y" or "Size and Aspect".

Remap

![][image176]


Segment Transform

![][image138]

Shear

![][image206]

The "Input Type" control can be set to "By value" or "By angle".

Shuffle

![][image211]

The "Type" control can be set to "Slide" or "Swap".

Spherize

![][image99]

The "Type" control can be set to "Horizontal", "Vertical", "Sphere", or "Rectangle".

![][image228]

The "Algorithm" control can be set to "Spherize", "Soft in/out", "Smooth", or "Sinusoid".

![][image21]

Stretch

![][image122]

The "Type" control can be set to "Source and Destination", or "Source and Offset".

Transform

![][image100]

The "Size Type" control can be set to "Size X and Size Y" or "Size and Aspect".

sBoolean

Combines shapes by union, difference or intersection

![][image169]

The "Type" control can be set to "Intersect", "Union", "Difference", or "Xor".

The "Fill Type" can be set to "Even Odd" or "Non Zero".

sKill

Shape Kill

![][image210]

sMerge

Shape Merge

![][image95]

The sMerge node has two input connections named "Shape1" and "Shape2".

sOffset

Shape Offset

![][image219]

The "Join Type" control can be set to "Miter", "Bevel", or "Rounded".

The "Sides" control can be set to "Both", "Inside", or "Outside".

sRender

Render out the shape to an image

![][image2]![][image151]

The "Winding" can be set to "Even/Odd" or "Non-Zero".

The "Image" control page can be used to define the dimensions of the rendered image.

sResample

Shape Resample

![][image150]

sShading

Apply Shading to shape

![][image240]

The "Pen Line Type" control can be set to "Solid", "Dashed", "Dotted", or "Custom".

![][image241]

sSmooth

Shape Smooth

![][image93]

sTools

Shape Tools

![][image40]

The "Open Close" control can be set to "Keep", "Close All", "Open All", or "Swap".

![][image186]

sTransform

Shape Transform

![][image85]

sTriangulate

Shape Triangulate

![][image13]

The "Type" control can be set to "Type 1" or "Type 2".

sWriteOn

Shape WriteOn

![][image113]

The "Level" control can be set to "Global", "Shape", or "Element".

sZigZag

Shape ZigZag

![][image72]

The "Type" control can be set to "By Segment", or "By distance".

sChart Create

Shape Chart Create

![][image242]![][image134]![][image168]![][image225]

sPrimitive Create

Shape Primitive Create

![][image233]![][image51]![][image209]![][image52]

The "Shape Primitive Create" control page has a "Type" control that can be set to "Cross", "Polygon", "Rectangle", or "Star".

![][image174]

sSpiral Create

Shape Spiral Create

![][image264]![][image272]![][image30]

The "Shape Spiral Create" control page has an "Angle End Type" control that can be set to "None", "Type 1", or "Type 2".

sTrace Create

Shape Trace Create

![][image250]![][image47]![][image58]

KKD Modifier Reference Guide

Beat

Pulse your animation in sync with the beat of your music

![][image46]![][image200]

Color Switcher

A modifier that switches color values

![][image36]![][image19]![][image268]

Formula

Text formula allows numeric values to be used within text fields, or combines several texts (such as timecode, flow name, ...)

![][image60]![][image198]![][image278]![][image77]

From File

Retrieve text from file

![][image159]

Source

The "Source" control allows you to input your data from an external text file, or by entering the content in the "Text" input field on the modifier node itself.

![][image216]

The "Format" control options are "Each line a frame",  "Startframe and text", and "Line on frame".

Line on Frame

Setting the "Format" control to the "Line on Frame" option exposes an additional "Line" slider element which can be used to directly select the exact line number from the text file that is displayed.

![][image63]

Each line a frame

Setting the "Format" control to the default "Each line a frame" option syncs the line being read from the external text file with the current frame number in the timeline. 

![][image191]

The "Loop" checkbox allows you to replay the contents of the external text file, line by line, once the end of the document is reached.

The "Hold frames" control allows you to delay the start of the text file playback for a user specified amount of frames.

Startframe and text

![][image246]

Setting the "Format" control to the "Startframe and text" option allows you to customize your timing with very tight precision for pre-defined frame ranges.

Each row in the document starts with either a single frame number, or a frame range written with a dash like "30-60", followed by a whitespace character, then the text to display. To display an initial message for 120 frames, then to display another message for a subsequent 120 frame duration you would write in:

1-120 Hello World!

121-240 To Be Continued...

Juggle

Juggle text (characters, words, lines) around

![][image14]

The "Juggle Characters" slider can be adjusted from 0 (no effect) to 1.0 (all characters juggled).

If you entered "Hello World" into the "Text" field of the modifier and set the Juggle Characters control to 1.0 you would get a result of "llroeHdl Wo".

Random

Random Number

![][image237]

The Random Modifier is applied to Number input field based values. The randomized number value is animated across the timeline frame range.

The "Minimum value" control is used to adjust the lowest part of the spline curve generated.

The "Maximum value" control is used to adjust the highest part of the spline curve generated.

If you lift both the minimum and maximum ranges at the same time you can offset the range of values created.

It is also possible to split the min/max value range instead of being 0 to 1 to have a min/max value range of -1 to 1, or -0.5 to 0.5 if you need both negative and positive random numbers generated.

The "Seed" control is used to shift the initial random number starting point. Changing the seed value will result in a different sequence of numbers being generated.

New value for every field/frame

Unchecking the "\[x\] New value for every field/frame" checkbox will display two additional UI elements that provide more control over the frequency of change for the random number generation.

![][image220]

The additional UI controls are labeled "New value every ... frames", along with an "Interpolation" control.

The "New value every ... frames" control lets you define how fast the random number generator output is refreshed. The control unit of measure is in timeline frames.

The "Interpolation" control options are "Step", "Linear", and "Ease-in, Ease-out".

Step Interpolation

If you were to set the "New value every ... frames" control to 30 (frames), and the "Interpolation" control to "Step", the resulting number output when displayed in the Splines view would have flat plateau like tangents, positioned at random heights:

![][image39]

Linear Interpolation

Selecting "Linear" interpolation creates a randomized sawtooth like Spline view result:

![][image124]

Ease-in, Ease-out interpolation

Selecting "Ease-in, Ease-out" interpolation creates a slightly smoothed top and bottom "cap" on the peaks of the randomized sawtooth like Spline view result:

![][image81]

Random Number Use Cases

The Random number generator is quite versatile. It could help with adding jitter to 2D or 3D transform attributes, or could add an organic feeling of chaos to blurs, glows, exposure, and other filter effects. 

This could be the missing element needed to make a more lively lightsaber that pulses over time, or it could add a bit of uniqueness to simulated analog onscreen motion graphics composited onto an old CRT monitor that has characteristics like snow, static, glitching effects and lots of glow/flicker.

Write

Easy writing of text

![][image153]

The Write modifier acts much like an old VT100 text terminal character generator. This effect will typically be applied on a Text+ node. The font size of the text generated by the Write modifier is inherited from the base "Size" control on the Text+ node.

As you animate the "Write" slider control from 0 to 1, the letters entered in the "Text" field will be printed on screen, one character at a time.

The "Cursor" element is placed to the right of the most recently entered letter.

The "Prefix" element is placed at the start of the line.

If you entered the text "Hello World" in the Write modifier, enabled the "\[x\] Prefix Show" checkbox, and set the "Write" control to 0.45, you would see the output text:

//Hello\_

The Write modifier can be applied to any Text based attributes in Fusion. This includes the Fusion 3D workspace based "Text3D" node, or the 3rd party Vonk "vText" class of nodes like "vTextCreateMultiline".

![][image70]

![][image195]

KKD Node Cookbook

A collection of Fusion node-graph recipes for common KKD techniques.

Content TBD.



[image157]: image157.png width=45px height=45px

[image284]: image284.png width=52px height=52px

[image170]: image170.png width=53px height=53px

[image146]: image146.png width=451px height=154px

[image165]: image165.png width=451px height=228px

[image249]: image249.png width=451px height=431px

[image177]: image177.png width=451px height=425px

[image97]: image97.png width=354px height=947px

[image194]: image194.png width=451px height=148px

[image136]: image136.png width=451px height=201px

[image202]: image202.png width=451px height=393px

[image243]: image243.png width=451px height=384px

[image172]: image172.png width=389px height=453px

[image269]: image269.png width=389px height=464px

[image38]: image38.png width=389px height=251px

[image280]: image280.png width=389px height=251px

[image126]: image126.png width=389px height=117px

[image234]: image234.png width=389px height=656px

[image112]: image112.png width=389px height=569px

[image55]: image55.png width=389px height=434px

[image44]: image44.png width=389px height=153px

[image261]: image261.png width=389px height=211px

[image156]: image156.png width=389px height=211px

[image193]: image193.png width=389px height=277px

[image84]: image84.png width=389px height=134px

[image20]: image20.png width=389px height=583px

[image26]: image26.png width=389px height=457px

[image56]: image56.png width=389px height=441px

[image162]: image162.png width=389px height=359px

[image142]: image142.png width=389px height=584px

[image73]: image73.png width=389px height=456px

[image149]: image149.png width=389px height=385px

[image230]: image230.png width=389px height=425px

[image48]: image48.png width=389px height=374px

[image199]: image199.png width=389px height=695px

[image244]: image244.png width=389px height=225px

[image35]: image35.png width=389px height=225px

[image196]: image196.png width=389px height=199px

[image65]: image65.png width=389px height=113px

[image214]: image214.png width=389px height=328px

[image164]: image164.png width=389px height=328px

[image260]: image260.png width=389px height=431px

[image190]: image190.png width=389px height=377px

[image110]: image110.png width=389px height=174px

[image43]: image43.png width=389px height=281px

[image91]: image91.png width=389px height=227px

[image83]: image83.png width=389px height=113px

[image180]: image180.png width=381px height=98px

[image25]: image25.png width=389px height=348px

[image282]: image282.png width=389px height=135px

[image227]: image227.png width=389px height=167px

[image263]: image263.png width=389px height=115px

[image10]: image10.png width=389px height=169px

[image114]: image114.png width=389px height=96px

[image96]: image96.png width=389px height=283px

[image238]: image238.png width=389px height=151px

[image255]: image255.png width=309px height=129px

[image154]: image154.png width=389px height=95px

[image24]: image24.png width=389px height=291px

[image205]: image205.png width=389px height=215px

[image111]: image111.png width=389px height=539px

[image270]: image270.png width=315px height=141px

[image143]: image143.png width=389px height=74px

[image116]: image116.png width=424px height=125px

[image32]: image32.png width=389px height=191px

[image155]: image155.png width=389px height=537px

[image270-1]: image270.png width=315px height=141px

[image78]: image78.png width=389px height=373px

[image217]: image217.png width=389px height=210px

[image235]: image235.png width=389px height=659px

[image248]: image248.png width=389px height=695px

[image239]: image239.png width=389px height=229px

[image160]: image160.png width=341px height=86px

[image222]: image222.png width=389px height=191px

[image189]: image189.png width=389px height=320px

[image23]: image23.png width=389px height=115px

[image50]: image50.png width=389px height=680px

[image161]: image161.png width=389px height=680px

[image64]: image64.png width=389px height=680px

[image178]: image178.png width=389px height=680px

[image251]: image251.png width=389px height=680px

[image86]: image86.png width=389px height=680px

[image5]: image5.png width=389px height=341px

[image132]: image132.png width=389px height=208px

[image49]: image49.png width=389px height=275px

[image213]: image213.png width=389px height=719px

[image171]: image171.png width=389px height=338px

[image54]: image54.png width=389px height=172px

[image18]: image18.png width=389px height=188px

[image181]: image181.png width=389px height=579px

[image1]: image1.png width=389px height=116px

[image37]: image37.png width=389px height=131px

[image89]: image89.png width=389px height=245px

[image201]: image201.png width=333px height=76px

[image125]: image125.png width=389px height=137px

[image103]: image103.png width=326px height=107px

[image275]: image275.png width=389px height=245px

[image15]: image15.png width=389px height=208px

[image279]: image279.png width=389px height=220px

[image283]: image283.png width=389px height=284px

[image218]: image218.png width=389px height=134px

[image129]: image129.png width=293px height=94px

[image101]: image101.png width=389px height=201px

[image79]: image79.png width=292px height=119px

[image173]: image173.png width=254px height=73px

[image212]: image212.png width=389px height=246px

[image277]: image277.png width=389px height=134px

[image203]: image203.png width=389px height=145px

[image33]: image33.png width=389px height=276px

[image109]: image109.png width=307px height=92px

[image215]: image215.png width=389px height=219px

[image76]: image76.png width=389px height=134px

[image179]: image179.png width=389px height=208px

[image41]: image41.png width=389px height=188px

[image137]: image137.png width=389px height=282px

[image66]: image66.png width=389px height=209px

[image3]: image3.png width=389px height=276px

[image106]: image106.png width=389px height=172px

[image254]: image254.png width=389px height=226px

[image197]: image197.png width=389px height=387px

[image140]: image140.png width=389px height=209px

[image123]: image123.png width=389px height=237px

[image27]: image27.png width=389px height=98px

[image183]: image183.png width=389px height=341px

[image163]: image163.png width=389px height=219px

[image152]: image152.png width=389px height=284px

[image29]: image29.png width=389px height=116px

[image69]: image69.png width=389px height=169px

[image259]: image259.png width=389px height=527px

[image192]: image192.png width=389px height=568px

[image88]: image88.png width=389px height=276px

[image166]: image166.png width=389px height=744px

[image102]: image102.png width=389px height=281px

[image274]: image274.png width=389px height=188px

[image16]: image16.png width=389px height=190px

[image28]: image28.png width=389px height=98px

[image9]: image9.png width=272px height=68px

[image87]: image87.png width=389px height=715px

[image145]: image145.png width=313px height=64px

[image6]: image6.png width=298px height=59px

[image57]: image57.png width=311px height=61px

[image67]: image67.png width=389px height=357px

[image147]: image147.png width=389px height=226px

[image94]: image94.png width=389px height=247px

[image223]: image223.png width=389px height=397px

[image127]: image127.png width=389px height=332px

[image208]: image208.png width=389px height=438px

[image11]: image11.png width=389px height=438px

[image232]: image232.png width=389px height=157px

[image256]: image256.png width=389px height=284px

[image121]: image121.png width=389px height=515px

[image139]: image139.png width=389px height=285px

[image182]: image182.png width=389px height=439px

[image184]: image184.png width=389px height=439px

[image92]: image92.png width=389px height=176px

[image257]: image257.png width=389px height=190px

[image17]: image17.png width=389px height=339px

[image281]: image281.png width=389px height=255px

[image8]: image8.png width=389px height=152px

[image175]: image175.png width=389px height=275px

[image53]: image53.png width=389px height=95px

[image141]: image141.png width=389px height=485px

[image167]: image167.png width=389px height=152px

[image253]: image253.png width=389px height=98px

[image31]: image31.png width=389px height=230px

[image258]: image258.png width=389px height=230px

[image188]: image188.png width=389px height=230px

[image45]: image45.png width=389px height=230px

[image115]: image115.png width=389px height=230px

[image224]: image224.png width=389px height=134px

[image265]: image265.png width=389px height=171px

[image158]: image158.png width=389px height=357px

[image4]: image4.png width=389px height=339px

[image131]: image131.png width=389px height=152px

[image207]: image207.png width=305px height=86px

[image130]: image130.png width=389px height=172px

[image120]: image120.png width=389px height=172px

[image59]: image59.png width=389px height=153px

[image262]: image262.png width=389px height=294px

[image34]: image34.png width=389px height=249px

[image204]: image204.png width=389px height=152px

[image229]: image229.png width=389px height=152px

[image245]: image245.png width=389px height=170px

[image80]: image80.png width=389px height=296px

[image117]: image117.png width=389px height=155px

[image104]: image104.png width=389px height=266px

[image148]: image148.png width=389px height=284px

[image128]: image128.png width=389px height=194px

[image231]: image231.png width=389px height=332px

[image271]: image271.png width=389px height=286px

[image226]: image226.png width=389px height=344px

[image42]: image42.png width=389px height=298px

[image75]: image75.png width=389px height=256px

[image74]: image74.png width=389px height=118px

[image187]: image187.png width=389px height=251px

[image144]: image144.png width=318px height=87px

[image133]: image133.png width=389px height=116px

[image82]: image82.png width=389px height=330px

[image252]: image252.png width=389px height=174px

[image266]: image266.png width=389px height=175px

[image98]: image98.png width=389px height=140px

[image276]: image276.png width=389px height=257px

[image22]: image22.png width=389px height=173px

[image105]: image105.png width=389px height=191px

[image62]: image62.png width=389px height=304px

[image107]: image107.png width=389px height=212px

[image119]: image119.png width=389px height=174px

[image135]: image135.png width=389px height=173px

[image108]: image108.png width=389px height=158px

[image7]: image7.png width=389px height=211px

[image68]: image68.png width=389px height=99px

[image247]: image247.png width=389px height=248px

[image221]: image221.png width=389px height=173px

[image12]: image12.png width=389px height=138px

[image90]: image90.png width=389px height=176px

[image118]: image118.png width=389px height=173px

[image71]: image71.png width=389px height=137px

[image236]: image236.png width=389px height=230px

[image185]: image185.png width=389px height=212px

[image273]: image273.png width=389px height=119px

[image267]: image267.png width=389px height=299px

[image176]: image176.png width=389px height=118px

[image138]: image138.png width=389px height=218px

[image206]: image206.png width=389px height=230px

[image211]: image211.png width=389px height=175px

[image99]: image99.png width=389px height=212px

[image228]: image228.png width=293px height=77px

[image21]: image21.png width=296px height=81px

[image122]: image122.png width=389px height=173px

[image100]: image100.png width=389px height=193px

[image169]: image169.png width=389px height=117px

[image210]: image210.png width=389px height=210px

[image95]: image95.png width=389px height=79px

[image219]: image219.png width=389px height=211px

[image2]: image2.png width=389px height=162px

[image151]: image151.png width=389px height=288px

[image150]: image150.png width=389px height=174px

[image240]: image240.png width=389px height=541px

[image241]: image241.png width=370px height=106px

[image93]: image93.png width=389px height=117px

[image40]: image40.png width=389px height=118px

[image186]: image186.png width=296px height=86px

[image85]: image85.png width=389px height=285px

[image13]: image13.png width=389px height=100px

[image113]: image113.png width=389px height=203px

[image72]: image72.png width=389px height=155px

[image242]: image242.png width=389px height=193px

[image134]: image134.png width=389px height=305px

[image168]: image168.png width=389px height=287px

[image225]: image225.png width=389px height=481px

[image233]: image233.png width=389px height=154px

[image51]: image51.png width=389px height=230px

[image209]: image209.png width=389px height=287px

[image52]: image52.png width=389px height=480px

[image174]: image174.png width=287px height=101px

[image264]: image264.png width=389px height=193px

[image272]: image272.png width=389px height=287px

[image30]: image30.png width=389px height=480px

[image250]: image250.png width=389px height=137px

[image47]: image47.png width=389px height=287px

[image58]: image58.png width=389px height=479px

[image46]: image46.png width=390px height=265px

[image200]: image200.png width=392px height=174px

[image36]: image36.png width=392px height=281px

[image19]: image19.png width=391px height=820px

[image268]: image268.png width=392px height=138px

[image60]: image60.png width=392px height=245px

[image198]: image198.png width=392px height=250px

[image278]: image278.png width=391px height=398px

[image77]: image77.png width=392px height=331px

[image159]: image159.png width=394px height=548px

[image216]: image216.png width=389px height=26px

[image63]: image63.png width=389px height=45px

[image191]: image191.png width=389px height=65px

[image246]: image246.png width=389px height=26px

[image14]: image14.png width=389px height=251px

[image237]: image237.png width=390px height=151px

[image220]: image220.png width=391px height=70px

[image39]: image39.png width=451px height=145px

[image124]: image124.png width=451px height=210px

[image81]: image81.png width=451px height=207px

[image153]: image153.png width=391px height=275px

[image70]: image70.png width=451px height=159px

[image195]: image195.png width=451px height=224px