First Draft

Created 2022-06-08 Last Updated 2022-06-12 11.06 PM GMT -3

Docs By [Andrew Hazelden <andrew@andrewhazelden.com>](mailto:andrew@andrewhazelden.com)

KKD Plugin By [Raf Schoenmaekers info@komkomdoorn.com](mailto:info@komkomdoorn.com)

# Overview

Krokodove (KKD) is a cross-platform compatible plugin for Fusion Studio and DaVinci Resolve Studio. It includes 100+ free Fusion tools. Krokodove was created by Raf Schoenmaekers of [Komkom Doorn](http://komkomdoorn.com/).

  

The KKD shape tools allow you to create animatable vector artwork which is excellent for node-based motion graphics projects.

  

The KKD data tools support workflows similar to Houdini CHOPS through the processing of lists, and sets of arrays.

## Resources

#### Krokodove Vimeo Channel:

[https://vimeo.com/channels/krokodove](https://vimeo.com/channels/krokodove)

#### Krokodove Email Contact:

[info@komkomdoorn.com](mailto:info@komkomdoorn.com)

## License

Krokodove is distributed for free.

## Compatibility

Please note that KKD is a compiled Fusion plugin that was created with the FusionSDK. The KKD tools will not work in Fusion Standalone (free) or Resolve (free). A paid copy of either Fusion Studio or DaVinci Resolve Studio is required to run this plugin.

## Software Required

To run Krokodove on your system you will need the following tools:

  

-    ![[Krokodove Essentials.img/Untitled.png]] [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) (Free)
    
-   ![[Krokodove Essentials.img/Untitled_1.png]]BMD [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/) (Paid)
    
-   ![[Krokodove Essentials.img/Untitled_2.png]]BMD [Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/) (Paid)
    

# Install KKD

The Krokodove plugin can be installed using the [Reactor Package Manager](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067) for Resolve Studio/Fusion Studio.

  

![[Krokodove Essentials.img/Untitled_3.png]]

  

After you have Reactor installed and open, select the "Tools > Plugins" category on the left sidebar. Click on the package named "Krokodove for Fusion/Resolve Studio 17" and then press the "Install" button.

  

![[Krokodove Essentials.img/Reactor Package Manager.png]]

  

Once the installation is complete, restart Resolve Studio or Fusion Studio standalone. This will load the KKD plugin.

## Accessing the KKD Nodes

  

Once Fusion Studio has finished loading you will have access to a new "Tools > Krokodove" set of menu items.

  

![[Krokodove Essentials.img/Fusion Tools Menu.png]]

  

You can also right-click in the Nodes view area, and select the "Add Tool > Krokodove" contextual menu item to access the KKD tools.

  

![[Krokodove Essentials.img/Nodes View Add Tool.png]]

  

In Resolve Studio you can access KKD nodes using the Effects Library tab at the top left of the user interface. Expand the "Tools > Krokodove" hierarchy to view the nodes.

  

![[Krokodove Essentials.img/Resolve Effects Library.png]]

  

## KKD Example Comps

![[Krokodove Essentials.img/KKD Showcase.png]]

  

There is a collection of KKD example .comp files that can also be installed using Reactor.

  

Select the "Comps > Krokodove" category on the left sidebar. Click on the package named "Krokodove Showcase" and then press the "Install" button.

  

![[Krokodove Essentials.img/KKD Showcase Reactor Tools Show Comps Folder.png]]

  

To access the installed KKD example comps, navigate to the "Reactor > Tools > Show Comps Folder" menu item in Fusion Studio. 

  

This will open up a folder browsing window using Explorer (Windows) or Finder (macOS).

  

The folder window displays the contents of the PathMap based location of "Reactor:/Deploy/Comps/". 

  

Double-click on the folder labeled "Krokodove" to open it. 

  

Inside this location you will have access to 35 example comps that use a variety of KKD tools. These examples are stored in categorized sub-folders for quick access.

  

![[Krokodove Essentials.img/KKD Examples.png]]

  

Here is a screenshot of the "Reactor:/Deploy/Comps/Krokodove/Pack/Pack_A_001.comp" project file:

  

![[Krokodove Essentials.img/KKD Showcase Pack comp.png]]

# KKD Node Categories

The Krokodove nodes are separated into the following categories and sub-categories based upon what data types they work with, and the function they perform:

## 3D

-   Align 3D
    
-   Connect 3D
    
-   Cut 3D
    
-   Data Duplicate 3D
    
-   Kill 3D
    
-   Mapped Duplicate 3D
    
-   Objectify 3D
    
-   Poly Play 3D
    
-   Retime 3D
    
-   Tool 3D
    
-   Vertex Play 3D
    

  

## 3D Create

-   Data Create 3D
    
-   Fold Create 3D
    
-   Heightfield Create 3D
    
-   Object Create 3D
    
-   Tube Create 3D
    
-   World Position Create 3D
    

## 3D Region

-   rCube
    
-   rImage
    
-   rMerge
    
-   rModify
    
-   rNoise
    
-   rPlane
    
-   rShape
    
-   rSphere
    
-   rTransform
    

## Data

-   dCopy
    
-   dDelete
    
-   dGrow
    
-   dInfo
    
-   dMath
    
-   dMerge
    
-   dRemap
    
-   dSelect
    
-   dSet Constant
    
-   dSet Manual
    
-   dSet Ramp
    
-   dSet Random
    
-   dSort
    
-   dTool
    
-   dTransform
    

## Data Create

-   dChannels Create
    
-   dFrom Image Analyzer Create
    
-   dFrom Image Create
    
-   dFrom Image Pack Create
    
-   dFrom Region Create
    
-   dLoader Create
    
-   dPattern Create
    

## Image

-   Analyzer
    
-   Blur in Space
    
-   Bounding Box
    
-   Connect
    
-   Dither
    
-   Extend
    
-   Find
    
-   Flur
    
-   Fragments
    
-   Grow
    
-   Grow Color
    
-   Microwaves
    
-   Pack
    
-   Painterly
    
-   Rasterize
    
-   Smart Field Strobe
    
-   Spiral
    
-   Switcher
    
-   Time Mapper
    
-   Wireless Link
    
-   Wireless Linky
    
-   Worm
    

## Image Color

-   Color
    
-   Hue/Saturation
    
-   Invert
    
-   Match Color
    
-   Replace Color
    
-   Threshold
    
-   Image Create
    

## Image Create

-   Blob
    
-   Lines
    
-   Pattern
    
-   Shapes
    

## Image Pixel

-   Average
    
-   Beams
    
-   Bevel
    
-   Border
    
-   Canvas
    
-   Channel Shifter
    
-   Clean Edges
    
-   Combine
    
-   Crop Monsieur
    
-   Cut and Bleed
    
-   Deflicker
    
-   Duplicate
    
-   Eat
    
-   Extrude
    
-   Map Filter
    
-   Matte Cleaner
    
-   Merge and Bone
    
-   Noise
    
-   Pixel Region
    
-   Planes
    
-   Plastic
    
-   Positioner
    
-   Push
    
-   Reassemble
    
-   Rest
    
-   Seamless Loop
    
-   Smear
    
-   Sort
    

## Image Position

-   Contour
    
-   Gradient
    
-   Shade by Sample
    

## Image Vector

-   Vector Blur
    
-   Vector Field
    
-   Vector Motion
    
-   Vector Time
    
-   Vector Visualization
    

## Image Warp

-   Blend
    
-   Directional Scale
    
-   Kaleidoscope
    
-   Lens Distortion
    
-   Mirror
    
-   Morph
    
-   Offset
    
-   Radial
    
-   Relative Transform
    
-   Ramp
    
-   Segment Transform
    
-   Shear
    
-   Shuffle
    
-   Spherize
    
-   Stretch
    
-   Transform
    

## Shape

-   sBoolean
    
-   sKill
    
-   sMerge
    
-   sOffset
    
-   sRender
    
-   sResample
    
-   sShading
    
-   sSmooth
    
-   sTools
    
-   sTransform
    
-   sTriangulate
    
-   sWriteOn
    
-   sZigZag
    

## Shape Create

-   sChart Create
    
-   sPrimitive Create
    
-   sSpiral Create
    
-   sTrace Create
    

## Modifiers

-   Color Switcher
    
-   Beat
    
-   Formula
    
-   From File
    
-   Juggle
    
-   Random
    
-   Write
    

  

KKD Node Reference Guide

## Align 3D

Align an object relative to

  

![[Krokodove Essentials.img/Align3D.png]]

## Connect 3D

Connect vertices...

  

![[Krokodove Essentials.img/Connect3D.png]]

## Cut 3D

Cuts off an object

## ![[Krokodove Essentials.img/Cut3D.png]]

## Data Duplicate 3D

Create duplicates, fully controlled by data channels.

## ![[Krokodove Essentials.img/DataDuplicate3D.png]]

## Kill 3D

Kills (part of) an object

## ![[Krokodove Essentials.img/Kill3D.png]]

## Mapped Duplicate 3D

Create duplicates, fully controlled by image maps.

## ![[Krokodove Essentials.img/MappedDuplicate3D.png]]

## Objectify 3D

Manipulates objects as a whole

## ![[Krokodove Essentials.img/Objectify3D.png]]

## Poly Play 3D

Manipulate objects on a poly level.

## ![[Krokodove Essentials.img/PolyPlay3D.png]]

## Retime 3D

A 3D retiming tool

## ![[Krokodove Essentials.img/Retime3D.png]]

## Tool 3D

Tools to manipulate an object![[Krokodove Essentials.img/Tool3D.png]]

## Vertex Play 3D

Manipulate objects on a vertex level.

## ![[Krokodove Essentials.img/VertexPlay3D1.png]]![[Krokodove Essentials.img/VertexPlay3D2.png]]

## Data Create 3D

Creates a height field from a map

## ![[Krokodove Essentials.img/DataCreate3D1.png]]![[Krokodove Essentials.img/DataCreate3D2.png]]![[Krokodove Essentials.img/DataCreate3D3.png]]![[Krokodove Essentials.img/DataCreate3D4.png]]

## Fold Create 3D

Creates a foldable object

## ![[Krokodove Essentials.img/FoldCreate3D1.png]]![[Krokodove Essentials.img/FoldCreate3D2.png]]![[Krokodove Essentials.img/FoldCreate3D3.png]]![[Krokodove Essentials.img/FoldCreate3D4.png]]

## Heightfield Create 3D

Creates a height field from a map

## ![[Krokodove Essentials.img/HeightfieldCreate3D1.png]]![[Krokodove Essentials.img/HeightfieldCreate3D2.png]]

## Object Create 3D

Creates an object

## ![[Krokodove Essentials.img/ObjectCreate3D.png]]

## Shape Create 3D

Creates a 3D object from a shape

![[Krokodove Essentials.img/ShapeCreate3D1.png]]

## Tube Create 3D

Creates some tubes

## ![[Krokodove Essentials.img/TubeCreate3D1.png]]![[Krokodove Essentials.img/TubeCreate3D2.png]]![[Krokodove Essentials.img/TubeCreate3D3.png]]![[Krokodove Essentials.img/TubeCreate3D4.png]]![[Krokodove Essentials.img/TubeCreate3D5.png]]![[Krokodove Essentials.img/TubeCreate3D6.png]]

## World Position Create 3D

Creates a plane with based on world space coordinates

## ![[Krokodove Essentials.img/WorldPositionCreate3D1.png]]

## rCube

Region 3D Cube

## ![[Krokodove Essentials.img/rCube1.png]]![[Krokodove Essentials.img/rCube2.png]]

## rImage

Region 3D Image

## ![[Krokodove Essentials.img/rImage1.png]]

## rMerge

Region 3D Merge

## ![[Krokodove Essentials.img/rMerge1.png]]

The "Combine" control can be set to "Union", "Intersect", "Add", "Subtract", or "Exclusive".

## ![[Krokodove Essentials.img/rMerge2.png]]

## rModify

Region 3D Modify

## ![[Krokodove Essentials.img/rModify.png]]

## rNoise

Region 3D Noise

## ![[Krokodove Essentials.img/rNoise.png]]

## rPlane

Region 3D Plane

## ![[Krokodove Essentials.img/rPlane.png]]

## rShape

Region 3D Shape

## ![[Krokodove Essentials.img/rShape.png]]

  

The Mapping control can be set to "Planar", "Spherical", or "Cylindrical".

## rSphere

Region 3D Sphere

## ![[Krokodove Essentials.img/rSphere.png]]

## rTransform

Region 3D Transform

## ![[Krokodove Essentials.img/rTransform.png]]

The "Region Transform" control page has a single checkbox labelled "Invert".

  

The "Transform" control page can be used to adjust the XYZ Position, Rotation, and Scale attributes.

  

![[Krokodove Essentials.img/rTransform2.png]]

## dCopy

Copy data channels

## ![[Krokodove Essentials.img/dCopy.png]]

The "Type In" and "Type Out" controls can be set to "Any", "Bool", "Integer", "Float", "Vector2", "Vector3", or "Color".

## ![[Krokodove Essentials.img/dCopy2.png]]

## dDelete

Data Delete

## ![[Krokodove Essentials.img/dDelete.png]]

## dGrow

Data Grow

## ![[Krokodove Essentials.img/dGrow.png]]

## dInfo

Data Info

## ![[Krokodove Essentials.img/dInfo.png]]

## dMath

Data Math

## ![[Krokodove Essentials.img/dMath.png]]

The Operation control can be set to "None", "Add", "Subtr", "Mult", "Div", "Power", or "Mod".

  

![[Krokodove Essentials.img/dMath2.png]]

## dMerge

Data Merge

## ![[Krokodove Essentials.img/dMerge.png]]

  

The data merge node has 8 initial input connections named "Data [1-8] (in)".

  

![[Krokodove Essentials.img/dMerge_Node.png]]

## dRemap

Data Remap

## ![[Krokodove Essentials.img/dRemap.png]]

## dSelect

Data Select

## ![[Krokodove Essentials.img/dSelect.png]]

The Operation control can be set to "None", "Add", "Subtr", "Mult", "Div", "Power", or "Mod".

  

![[Krokodove Essentials.img/dSelect2.png]]

## dSet Constant

Set Constant Data

## ![[Krokodove Essentials.img/dSet Constant1.png]]

## dSet Manual

Set Data Manually, one by one

## ![[Krokodove Essentials.img/dSetManual1.png]]

## dSet Ramp

Set data to follow a ramp or gradient between 2 values

## ![[Krokodove Essentials.img/dSetRamp1.png]]

## dSet Random

Set/add random data

## ![[Krokodove Essentials.img/dSet Random.png]]

## dSort

Data Sorting

## ![[Krokodove Essentials.img/dSort.png]]

  

The "Vector Sort1" control can be set to "By X", "By Y", "By Z", or "Distance".

## ![[Krokodove Essentials.img/dSort2.png]]

## dTool

Data Tools

## ![[Krokodove Essentials.img/dTool.png]]

  

By default the "Limit Count Start" and "Limit Count End" controls have an initial control range of 0-100.

## dTransform

Data Transform

## ![[Krokodove Essentials.img/dTransform.png]]

## dChannels Create

Create data channels

## ![[Krokodove Essentials.img/dChannels Create1.png]]![[Krokodove Essentials.img/dChannels Create2.png]]![[Krokodove Essentials.img/dChannels Create3.png]]![[Krokodove Essentials.img/dChannels Create4.png]]![[Krokodove Essentials.img/dChannels Create5.png]]![[Krokodove Essentials.img/dChannels Create6.png]]![[Krokodove Essentials.img/dChannels Create7.png]]

## dFrom Image Analyzer Create

Sample image and format data

## ![[Krokodove Essentials.img/dFrom Image Analyzer Create1.png]]![[Krokodove Essentials.img/dFrom Image Analyzer Create2.png]]![[Krokodove Essentials.img/dFrom Image Analyzer Create3.png]]

## dFrom Image Create

Sample Image

## ![[Krokodove Essentials.img/dFrom Image Create.png]]

## dFrom Image Pack Create

Sample image using packing method

## ![[Krokodove Essentials.img/dFrom Image Pack Create.png]]

## dFrom Region Create

Sample Region

## ![[Krokodove Essentials.img/dFrom Region Create.png]]

The "Replace Type" control can be set to "Replace in Range" or "Replace All".

  

## dLoader Create

Load data

## ![[Krokodove Essentials.img/dLoader Create.png]]

The "Channels Direction" control can be set to "By Row" or "By Column".

  

The "First Row" control can be set to "Automatic", "Channel Names", or "Channel Data".

  

The "First Column" control can be set to "Automatic", "Channel Names", or "Channel Data".

## dPattern Create

Create a pattern

## ![[Krokodove Essentials.img/dPattern Create.png]]

  

The "Pattern Type" control can be set to "Grid" or "Ring".

  

The "Ring Count Type" control can be set to "By Number", "By Distance", or "By Angle".

## Analyzer

Image analysis

## ![[Krokodove Essentials.img/Analyzer1.png]]![[Krokodove Essentials.img/Analyzer2.png]]![[Krokodove Essentials.img/Analyzer3.png]]

  

The "Scale" control on the Guides control page can be set to "0.0 … 1.0", "0 … 255", "0 … 1023", or "0 … 65535".

  

## ![[Krokodove Essentials.img/Analyzer4.png]]

## Blur in Space

A mere re-packaging of two basic Fusion tools: color space swapping and blur

## ![[Krokodove Essentials.img/BlurinSpace1.png]]

The "Blur Filter" control can be set to "Box", "Soften", "Bartlett", "Gaussian", or "Sharpen"

  

## ![[Krokodove Essentials.img/BlurinSpace2.png]]

## Bounding Box

Bounding Box

## ![[Krokodove Essentials.img/BoundingBox1.png]]

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or  "Lumin.".

  

The "Threshold" control has a default input control range of 0 - 1.

  

The "Lock" control can be set to "All Sides", "Vert./Horiz.", or "None".

  

The "Extend" control has a default input control range of -0.05 to 0.1. The initial value is 0.0.

## Connect

Connect points with lines or splines

## ![[Krokodove Essentials.img/Connect1.png]]![[Krokodove Essentials.img/Connect2.png]]![[Krokodove Essentials.img/Connect3.png]]

## Dither

Reduces the number of bits for each color channel and creates a 'logical noise' doing it

  

![[Krokodove Essentials.img/Dither1.png]]

  

The "Dither method" control can be set to "None", "Ordered", "Simple error distribution", or "Floyd & Steinberg".

  

![[Krokodove Essentials.img/Dither2.png]]

## Extend

## ![[Krokodove Essentials.img/Extend1.png]]

  

The "Direction" control can be set to "Horizontal" or "Vertical".

  

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", "Lumin.", or "Each".

  

![[Krokodove Essentials.img/Extend2.png]]

  

The "Hold" control can be set to "Within range", "Minimum", or "Maximum". 

  

![[Krokodove Essentials.img/Extend3.png]]

## Find

![[Krokodove Essentials.img/Find1.png]]

  

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or "Lumin.".

  

The "Result" control can be set to "Analytic" or "Clean".

## Flur

![[Krokodove Essentials.img/Flur.png]]

  

The "Shape" control can be set to "Square", "Round", or "Axial".

## Fragments

  

![[Krokodove Essentials.img/Fragments1.png]]

  

The "Channel" control can be set to "Red", "Green", "Blue", "Alpha", or "Lumin.".

  

![[Krokodove Essentials.img/Fragments2.png]]

  

The "Range Curve" control can be set to "Linear", "Ease In", "Ease Out", or "Ease In/Out".

  

![[Krokodove Essentials.img/Fragments3.png]]

## Grow

![[Krokodove Essentials.img/Grow1.png]]![[Krokodove Essentials.img/Grow2.png]]

## Grow Color

Fill transparent parts by extending the edge color

  

![[Krokodove Essentials.img/GrowColor1.png]]

  

## Microwaves![[Krokodove Essentials.img/Microwaves.png]]

  

## Pack

![[Krokodove Essentials.img/Pack1.png]]![[Krokodove Essentials.img/Pack2.png]]![[Krokodove Essentials.img/Pack3.png]]

  

## Painterly

Painterly effects

  

![[Krokodove Essentials.img/Painterly.png]]

## Rasterize

Half-tone style rasterize

![[Krokodove Essentials.img/Rasterize1.png]]![[Krokodove Essentials.img/Rasterize2.png]]![[Krokodove Essentials.img/Rasterize3.png]]

## Smart Field Strobe

Smart Field Strobe tries to detect motion and only removes fields where there is.

  

![[Krokodove Essentials.img/Smart Field Strobe1.png]]![[Krokodove Essentials.img/Smart Field Strobe2.png]]

  

## Spiral

![[Krokodove Essentials.img/Spiral1.png]]![[Krokodove Essentials.img/Spiral2.png]]![[Krokodove Essentials.img/Spiral3.png]]

## Switcher

  

![[Krokodove Essentials.img/Switcher.png]]

## Time Mapper

![[Krokodove Essentials.img/Time Mapper1.png]]

  

## Wireless Link

![[Krokodove Essentials.img/Wireless Link.png]]

## Wireless Linky

![[Krokodove Essentials.img/Wireless Linky.png]]

## Worm

  

![[Krokodove Essentials.img/Worm1.png]]![[Krokodove Essentials.img/Worm2.png]]![[Krokodove Essentials.img/Worm3.png]]

## Color

Simple tool for easy fading to a certain color

  

![[Krokodove Essentials.img/Color.png]]

## Hue/Saturation

A simple color correcting tool, operating in HLS color space

  

![[Krokodove Essentials.img/HueSaturation1.png]]

## Invert

Invert color, luminance or hue

![[Krokodove Essentials.img/Invert1.png]]

  

The "Type" control can be set to "Color", "Luminance", or "Hue".

  

![[Krokodove Essentials.img/Invert2.png]]

## Match Color

Color matching

  

![[Krokodove Essentials.img/Match Color.png]]

  

The "Number of colors" control can be set to "Single", "Low and High", or "Low, Mid && High".

  

![[Krokodove Essentials.img/Match Color2.png]]

  

The "Shadows match" control can be set to "Full color", "Color tint", or "Luminance".

  

![[Krokodove Essentials.img/Match Color3.png]]

  

The "Highlights match" control can be set to "Full color", "Color tint", or "Luminance".

  

![[Krokodove Essentials.img/Match Color4.png]]

## Replace Color

This color correcting tool replaces a certain color range with another

  

![[Krokodove Essentials.img/Replace Color1.png]]![[Krokodove Essentials.img/Replace Color2.png]]

## Threshold

Clips the color in reference to the threshold

  

![[Krokodove Essentials.img/Threshold.png]]

## Blobs

Create metaball like blob shapes

  

![[Krokodove Essentials.img/Blobs1.png]]![[Krokodove Essentials.img/Blobs2.png]]

## Lines

Line patterns

![[Krokodove Essentials.img/Lines1.png]]![[Krokodove Essentials.img/Lines2.png]]![[Krokodove Essentials.img/Lines3.png]]![[Krokodove Essentials.img/Lines4.png]]

## Pattern

Creation of a wild collection of patterns (assuming you think grids are wild)

  

The "Type" control can be set to "Triangles", "Grid", or "Honeycomb".

  

![[Krokodove Essentials.img/Pattern1.png]]![[Krokodove Essentials.img/Pattern2.png]]

## Shapes

Shape patterns; circles, squares, ...

  

![[Krokodove Essentials.img/Shapes1.png]]![[Krokodove Essentials.img/Shapes2.png]]![[Krokodove Essentials.img/Shapes3.png]]

  

## Average

![[Krokodove Essentials.img/Average.png]]

  

The "Main Time" control can be set to "Flow Time", or "Time Speed", or "Time Stretch".

  

The "Non-existing frames" control can be set to "Black" or "Ignore".

  

## Beams

![[Krokodove Essentials.img/Beams1.png]]![[Krokodove Essentials.img/Beams2.png]]

## Bevel

![[Krokodove Essentials.img/Bevel1.png]]![[Krokodove Essentials.img/Bevel2.png]]![[Krokodove Essentials.img/Bevel3.png]]

## Border

![[Krokodove Essentials.img/Border.png]]

## Canvas

![[Krokodove Essentials.img/Canvas.png]]

  

## Channel Shifter

![[Krokodove Essentials.img/Channel Shifter1.png]]![[Krokodove Essentials.img/Channel Shifter2.png]]![[Krokodove Essentials.img/Channel Shifter3.png]]![[Krokodove Essentials.img/Channel Shifter4.png]]![[Krokodove Essentials.img/Channel Shifter5.png]]![[Krokodove Essentials.img/Channel Shifter6.png]]

## Clean Edges

![[Krokodove Essentials.img/Clean Edges.png]]

## Combine

![[Krokodove Essentials.img/Combine.png]]

## Crop Monsieur

Makes multiple copies of an image

![[Krokodove Essentials.img/Crop Monsieur.png]]

  

## Cut and Bleed

![[Krokodove Essentials.img/Cut and Bleed.png]]

## Deflicker

![[Krokodove Essentials.img/Deflicker1.png]]![[Krokodove Essentials.img/Deflicker2.png]]

The "Reference" control can be set to "Fixed Time", "Time Steps", "Average", or "External".

  

## Duplicate

![[Krokodove Essentials.img/Duplicate1.png]]![[Krokodove Essentials.img/Duplicate2.png]]![[Krokodove Essentials.img/Duplicate3.png]]

## Eat

Eats out the edges of an image

  

![[Krokodove Essentials.img/Eat.png]]

## Extrude

![[Krokodove Essentials.img/Extrude1.png]]![[Krokodove Essentials.img/Extrude2.png]]

  

The "Perspective type" control can be set to "Parallel" or "Radial".

  

The "Color type" control can be set to "Solid" or "Original".

  

## Map Filter

![[Krokodove Essentials.img/Map Filter.png]]

## Matte Cleaner

![[Krokodove Essentials.img/Matte Cleaner1.png]]![[Krokodove Essentials.img/Matte Cleaner2.png]]

## Merge and Bone

![[Krokodove Essentials.img/Merge and Bone1.png]]![[Krokodove Essentials.img/Merge and Bone2.png]]![[Krokodove Essentials.img/Merge and Bone3.png]]

## Noise

![[Krokodove Essentials.img/Noise.png]]

## Pixel Region

  

![[Krokodove Essentials.img/Pixel Region.png]]

## Planes

![[Krokodove Essentials.img/Planes2.png]]![[Krokodove Essentials.img/Planes1.png]]

  

## Plastic

Put a plastic film over your image

## ![[Krokodove Essentials.img/Plastic1.png]]![[Krokodove Essentials.img/Plastic2.png]]![[Krokodove Essentials.img/Plastic3.png]]

## Positioner

  

![[Krokodove Essentials.img/Positioner1.png]]

  

The "Type of positioner" control can be set to "One point", "Two point",  "Three point", or "Four point".

  

![[Krokodove Essentials.img/Positioner2.png]]

  

## Push

![[Krokodove Essentials.img/Push.png]]

  

## Reassemble

![[Krokodove Essentials.img/Reassemble.png]]

## Rest

## ![[Krokodove Essentials.img/Rest.png]]

## Seamless Loop

Create seamlessly looping sequences easily

  

![[Krokodove Essentials.img/Seamless Loop.png]]

  

The "Fade type" control can be set to either "Linear" or "Smooth".

## Smear

Smears the image horizontally or vertically

  

![[Krokodove Essentials.img/Smear1.png]]![[Krokodove Essentials.img/Smear2.png]]

## Sort

![[Krokodove Essentials.img/Sort.png]]

## Contour

Draws a nice, anti-aliased contour around an image

  

![[Krokodove Essentials.img/Contour.png]]

## Gradient

Creation of gradients: linear, radial and spotlight shapes can be created an combined with the background image

  

![[Krokodove Essentials.img/Gradient2.png]]![[Krokodove Essentials.img/Gradient1.png]]

## Shade by Sample

Shade an image based on the normals

  

![[Krokodove Essentials.img/Shade by Sample.png]]

## Vector Blur

![[Krokodove Essentials.img/Vector Blur.png]]

## Vector Field

![[Krokodove Essentials.img/Vector Field.png]]

  

## Vector Motion

  

![[Krokodove Essentials.img/Vector Motion.png]]

  

The "Motion analysis direction" control can be set to "Backward", "Both", or "Forward".

  

## Vector Time

![[Krokodove Essentials.img/Vector Time.png]]

  

The "Adjust" control can be set to "Not", "Time Speed", "Time Stretch".

  

## Vector Visualization

![[Krokodove Essentials.img/Vector Visualization.png]]

  

The "Vizualize vector field" control can be set to "Grid" or "Edges".

  

The "Line Color" control can be set to "Solid" or "Image".

## Blend

  

## Directional Scale

![[Krokodove Essentials.img/Directional Scale.png]]

  

## Kaleidoscope

![[Krokodove Essentials.img/Kaleidoscope2.png]]![[Krokodove Essentials.img/Kaleidoscope1.png]]

  

The "Type" control can be set to "Classic" or "Fancy".

## Lens Distortion

  

![[Krokodove Essentials.img/Lens Distortion.png]]

  

The "Type" control can be set to "Distort" or "Restore".

  

If you have "K1" and "K2" lens distortion parameters provided by an external lens calibration tool, those values are entered in the "Kappa1" and "Kappa2" number-fields.

  

## Mirror

![[Krokodove Essentials.img/Mirror.png]]

  

## Morph

  

![[Krokodove Essentials.img/Morph.png]]

  

The "Warp Type" control can be set to "Field" or "Radial".

  

## Offset

  

![[Krokodove Essentials.img/Offset.png]]

  

## Radial

![[Krokodove Essentials.img/Radial.png]]

  

## Relative Transform

![[Krokodove Essentials.img/Relative Transform.png]]

  

The "Center Type" control can be set to "Bounding Box" or "Weighted Pixels".

  

The "Size Type" control can be set to "Size X and Size Y" or "Size and Aspect".

## Remap

![[Krokodove Essentials.img/Remap.png]]

  
  

## Segment Transform

![[Krokodove Essentials.img/SegmentTransform.png]]

  

## Shear

![[Krokodove Essentials.img/Shear.png]]

  

The "Input Type" control can be set to "By value" or "By angle".

  

## Shuffle

![[Krokodove Essentials.img/Shuffle.png]]

  

The "Type" control can be set to "Slide" or "Swap".

## Spherize

![[Krokodove Essentials.img/Spherize1.png]]

  

The "Type" control can be set to "Horizontal", "Vertical", "Sphere", or "Rectangle".

  

![[Krokodove Essentials.img/Spherize2.png]]

  

The "Algorithm" control can be set to "Spherize", "Soft in/out", "Smooth", or "Sinusoid".

  

![[Krokodove Essentials.img/Spherize3.png]]

  

## Stretch

![[Krokodove Essentials.img/Stretch.png]]

  

The "Type" control can be set to "Source and Destination", or "Source and Offset".

## Transform

![[Krokodove Essentials.img/Transform.png]]

  

The "Size Type" control can be set to "Size X and Size Y" or "Size and Aspect".

  

## sBoolean

Combines shapes by union, difference or intersection

![[Krokodove Essentials.img/sBoolean.png]]

  

The "Type" control can be set to "Intersect", "Union", "Difference", or "Xor".

  

The "Fill Type" can be set to "Even Odd" or "Non Zero".

## sKill

Shape Kill

  

![[Krokodove Essentials.img/sKill.png]]

## sMerge

Shape Merge

  

![[Krokodove Essentials.img/sMerge.png]]

  

The sMerge node has two input connections named "Shape1" and "Shape2".

## sOffset

Shape Offset

  

![[Krokodove Essentials.img/sOffset.png]]

  

The "Join Type" control can be set to "Miter", "Bevel", or "Rounded".

  

The "Sides" control can be set to "Both", "Inside", or "Outside".

## sRender

Render out the shape to an image

  

![[Krokodove Essentials.img/sRender1.png]]![[Krokodove Essentials.img/sRender2.png]]

  

The "Winding" can be set to "Even/Odd" or "Non-Zero".

  

The "Image" control page can be used to define the dimensions of the rendered image.

## sResample

Shape Resample

  

![[Krokodove Essentials.img/sResample.png]]

## sShading

Apply Shading to shape

  

![[Krokodove Essentials.img/sShading.png]]

  

The "Pen Line Type" control can be set to "Solid", "Dashed", "Dotted", or "Custom".

  

![[Krokodove Essentials.img/sShading2.png]]

## sSmooth

Shape Smooth

  

![[Krokodove Essentials.img/sSmooth.png]]

## sTools

Shape Tools

  

![[Krokodove Essentials.img/sTools.png]]

  

The "Open Close" control can be set to "Keep", "Close All", "Open All", or "Swap".

  

![[Krokodove Essentials.img/sTools2.png]]

  

## sTransform

Shape Transform

  

![[Krokodove Essentials.img/sTransform.png]]

## sTriangulate

Shape Triangulate

  

![[Krokodove Essentials.img/sTriangulate.png]]

  

The "Type" control can be set to "Type 1" or "Type 2".

## sWriteOn

Shape WriteOn

  

![[Krokodove Essentials.img/sWriteOn.png]]

  

The "Level" control can be set to "Global", "Shape", or "Element".

## sZigZag

Shape ZigZag

  

![[Krokodove Essentials.img/sZigZag.png]]

  

The "Type" control can be set to "By Segment", or "By distance".

## sChart Create

Shape Chart Create

![[Krokodove Essentials.img/sChart Create1.png]]![[Krokodove Essentials.img/sChart Create2.png]]![[Krokodove Essentials.img/sChart Create3.png]]![[Krokodove Essentials.img/sChart Create4.png]]

## sPrimitive Create

Shape Primitive Create

  

![[Krokodove Essentials.img/sPrimitive Create1.png]]![[Krokodove Essentials.img/sPrimitive Create2.png]]![[Krokodove Essentials.img/sPrimitive Create3.png]]![[Krokodove Essentials.img/sPrimitive Create4.png]]

  

The "Shape Primitive Create" control page has a "Type" control that can be set to "Cross", "Polygon", "Rectangle", or "Star".

  

![[Krokodove Essentials.img/sPrimitive Create5.png]]

  

## sSpiral Create

Shape Spiral Create

  

![[Krokodove Essentials.img/sSpiral Create1.png]]![[Krokodove Essentials.img/sSpiral Create2.png]]![[Krokodove Essentials.img/sSpiral Create3.png]]

  

The "Shape Spiral Create" control page has an "Angle End Type" control that can be set to "None", "Type 1", or "Type 2".

## sTrace Create

Shape Trace Create

  

![[Krokodove Essentials.img/sTrace Create1.png]]![[Krokodove Essentials.img/sTrace Create2.png]]![[Krokodove Essentials.img/sTrace Create3.png]]

  
  

KKD Modifier Reference Guide

# Beat

Pulse your animation in sync with the beat of your music

  

![[Krokodove Essentials.img/Beat1.png]]![[Krokodove Essentials.img/Beat2.png]]

# Color Switcher

A modifier that switches color values

  

![[Krokodove Essentials.img/ColorSwitcher1.png]]![[Krokodove Essentials.img/ColorSwitcher2.png]]![[Krokodove Essentials.img/ColorSwitcher3.png]]

# Formula

Text formula allows numeric values to be used within text fields, or combines several texts (such as timecode, flow name, ...)

  

![[Krokodove Essentials.img/Formula1.png]]![[Krokodove Essentials.img/Formula2.png]]![[Krokodove Essentials.img/Formula3.png]]![[Krokodove Essentials.img/Formula4.png]]

# From File

Retrieve text from file

  

![[Krokodove Essentials.img/FromFile1.png]]

### Source

  

The "Source" control allows you to input your data from an external text file, or by entering the content in the "Text" input field on the modifier node itself.

  

![[Krokodove Essentials.img/FromFile_Source.png]]

  

The "Format" control options are "Each line a frame",  "Startframe and text", and "Line on frame".

### Line on Frame

  

Setting the "Format" control to the "Line on Frame" option exposes an additional "Line" slider element which can be used to directly select the exact line number from the text file that is displayed.

![[Krokodove Essentials.img/FromFile_Modifier_Line_on_frame.png]]

### Each line a frame

  

Setting the "Format" control to the default "Each line a frame" option syncs the line being read from the external text file with the current frame number in the timeline. 

  

![[Krokodove Essentials.img/FromFile_Modifier_Each_line.png]]

The "Loop" checkbox allows you to replay the contents of the external text file, line by line, once the end of the document is reached.

  

The "Hold frames" control allows you to delay the start of the text file playback for a user specified amount of frames.

### Startframe and text

  

![[Krokodove Essentials.img/FromFile_Modifier_Startframe_text.png]]

  

Setting the "Format" control to the "Startframe and text" option allows you to customize your timing with very tight precision for pre-defined frame ranges.

  

Each row in the document starts with either a single frame number, or a frame range written with a dash like "30-60", followed by a whitespace character, then the text to display. To display an initial message for 120 frames, then to display another message for a subsequent 120 frame duration you would write in:

  

1-120 Hello World!

121-240 To Be Continued…

  

## Juggle

Juggle text (characters, words, lines) around

  

![[Krokodove Essentials.img/Juggle1.png]]

The "Juggle Characters" slider can be adjusted from 0 (no effect) to 1.0 (all characters juggled).

  

If you entered "Hello World" into the "Text" field of the modifier and set the Juggle Characters control to 1.0 you would get a result of "llroeHdl Wo".

# Random

Random Number

![[Krokodove Essentials.img/Random1.png]]

  

The Random Modifier is applied to Number input field based values. The randomized number value is animated across the timeline frame range.

  

The "Minimum value" control is used to adjust the lowest part of the spline curve generated.

  

The "Maximum value" control is used to adjust the highest part of the spline curve generated.

  

If you lift both the minimum and maximum ranges at the same time you can offset the range of values created.

  

It is also possible to split the min/max value range instead of being 0 to 1 to have a min/max value range of -1 to 1, or -0.5 to 0.5 if you need both negative and positive random numbers generated.

  

The "Seed" control is used to shift the initial random number starting point. Changing the seed value will result in a different sequence of numbers being generated.

### New value for every field/frame

  

Unchecking the "[x] New value for every field/frame" checkbox will display two additional UI elements that provide more control over the frequency of change for the random number generation.

  

![[Krokodove Essentials.img/Random_Modifier_New_values_for_every_frame.png]]

  

The additional UI controls are labeled "New value every … frames", along with an "Interpolation" control.

  

The "New value every … frames" control lets you define how fast the random number generator output is refreshed. The control unit of measure is in timeline frames.

  

The "Interpolation" control options are "Step", "Linear", and "Ease-in, Ease-out".

#### Step Interpolation

  

If you were to set the "New value every … frames" control to 30 (frames), and the "Interpolation" control to "Step", the resulting number output when displayed in the Splines view would have flat plateau like tangents, positioned at random heights:

  

![[Krokodove Essentials.img/Random_Modifier_Step_Interpolation_Spline_View.png]]

#### Linear Interpolation

  

Selecting "Linear" interpolation creates a randomized sawtooth like Spline view result:

  

![[Krokodove Essentials.img/Random_Modifier_Linear_Interpolation_Spline_View.png]]

#### Ease-in, Ease-out interpolation

  

Selecting "Ease-in, Ease-out" interpolation creates a slightly smoothed top and bottom "cap" on the peaks of the randomized sawtooth like Spline view result:

  

![[Krokodove Essentials.img/Random_Modifier_Ease_Interpolation_Spline_View.png]]

### Random Number Use Cases

The Random number generator is quite versatile. It could help with adding jitter to 2D or 3D transform attributes, or could add an organic feeling of chaos to blurs, glows, exposure, and other filter effects. 

  

This could be the missing element needed to make a more lively lightsaber that pulses over time, or it could add a bit of uniqueness to simulated analog onscreen motion graphics composited onto an old CRT monitor that has characteristics like snow, static, glitching effects and lots of glow/flicker.

# Write

Easy writing of text

  

![[Krokodove Essentials.img/Write1.png]]

  

The Write modifier acts much like an old VT100 text terminal character generator. This effect will typically be applied on a Text+ node. The font size of the text generated by the Write modifier is inherited from the base "Size" control on the Text+ node.

  

As you animate the "Write" slider control from 0 to 1, the letters entered in the "Text" field will be printed on screen, one character at a time.

  

The "Cursor" element is placed to the right of the most recently entered letter.

  

The "Prefix" element is placed at the start of the line.

  

If you entered the text "Hello World" in the Write modifier, enabled the "[x] Prefix Show" checkbox, and set the "Write" control to 0.45, you would see the output text:

  

//Hello_

  

The Write modifier can be applied to any Text based attributes in Fusion. This includes the Fusion 3D workspace based "Text3D" node, or the 3rd party Vonk "vText" class of nodes like "vTextCreateMultiline".

  

![[Krokodove Essentials.img/Write_Modifier_Output.png]]

  

![[Krokodove Essentials.img/Write_Modifier_vText_Output.png]]

  

KKD Node Cookbook

A collection of Fusion node-graph recipes for common KKD techniques.

  

Content TBD.

  
**