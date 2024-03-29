---
author: Andrew Hazelden
tags:
  - Kartaverse
  - Workflow
  - .scrivener-export
---

> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

**Domemaster Photoshop Actions Pack**

**Version 2.5** - Released March 16, 2017\
by Andrew Hazelden

Email: <andrew@andrewhazelden.com>\
Blog: <http://www.andrewhazelden.com>

GitHub Page:

-   <https://github.com/AndrewHazelden/Domemaster-Photoshop-Actions-Pack>

### About the Software

**About the Software**

The Domemaster Photoshop Actions Pack is a collection of custom Adobe Photoshop actions that were designed to speed up the fulldome content creation workflow.

The actions provide tools for converting images from several common panoramic formats such as angular fisheye, equirectangular, and cube map panoramas, and general utilities for fulldome production.

[![[DomemasterPhotoshopActionsPackOverview.png]]](https://www.youtube.com/watch?v=VcfHzyIuR4E)

*The Domemaster Photoshop Actions Pack is distributed under the GPL v3 license.*

![[photoshop-actions-list.png]]

### Version History

**Version History**

**Version 2.5 - 2017-03-16**

-   Fixed a Photoshop CS6 compatibility issue with the "2:1 Equirectangular to Domemaster 180°" action.

**Version 2.4 - 2017-01-21**

-   Added support for the new Autodesk Revit Vertical Strip and Horizontal Strip panoramic image projections.

-   Added a new experimental set of "UV Pass" actions allow you to prepare UV pass maps that are used for pre-computed panoramic image transforms. This approach is commonly used in compositing to correct for lens distortion.

    Another term for a UV pass map if you are a Foundry NukeX user is an "ST map". A UV pass image template is made using a 16 bit integer red/green gradient image that is then distorted using a program like PTGui Pro and the Domemaster Fusion Macros.

    Note: It is very important that you load and save a UV pass map using an sRGB linear gamma 1.0 color space in Photoshop or you will have distortions in your image template from the non-linear shading of the generated gradients.

**Version 2.3 - 2015-12-18**

-   Added more sample panoramic images examples to illustrate the different image projection formats.

**Version 2.2 - 2015-11-23**

-   Added a "Cube Map to Gear VR Mono" and "Gear VR Mono to Cube Map" set of actions. The "Cube Map to Gear VR Mono" action creates a 6:1 aspect ratio horizontal strip cubemap and the other action can extract that imagery back into a set of 6 cube map layers.
-   Added a "Stereo Side by Side Extract" and a "Stereo Over Under Extract" macro for processing stereo imagery.
-   Updated the "Cube Map to X" actions to fix an error that would happen if the File \> New... dialog had a transparent background selected, and there was no background layer present in the new document.

**Version 2.1 - 2015-11-21**

-   Improved the Photoshop compatibility of the "2:1 Equirectangular to 180° Domemaster" action.

**Version 2 - 2015-11-20**

-   Expanded the **General Utilities** section to include "1x1 Guide Grid", "1x2 Guide Grid", "2x1 Guide Grid", "6x2 Guide Grid", and "12x1 Guide Grid".
-   Expanded the **Transforms** section to include "200% Vertical Canvas Expand", and "200% Horizontal Canvas Expand".

### Action List

**Action List**

#### Transforms:

**Transforms:**

1:1 to 2:1 Aspect Ratio Expand\
2:1 to 1:1 Aspect Ratio Reduce\
50% Scale\
200% Scale\
200% Vertical Canvas Expand\
200% Horizontal Canvas Expand\
Rotate 90 Degrees\
Rotate 180 Degrees\
Rotate 270 Degrees\
Flip Vertical\
Flop Horizontal\
Horizontal Offset 1024 pixels\
Vertical Offset 1024 pixels\
Horizontal and Vertical Offset 1024 pixels

#### Conversions

**Conversions**

Inverse Angular Fisheye\
Angular Fisheye to Equirectangular\
Angular Fisheye to 2:1 Equirectangular\
180° Domemaster to 2:1 Equirectangular\
Equirectangular to Angular Fisheye\
2:1 Equirectangular to Angular Fisheye\
2:1 Equirectangular to 180° Domemaster\
3x2 Cube Map to Cube Map\
Vertical Cross to Cube Map\
Horizontal Cross to Cube Map\
Vertical Tee to Cube Map\
Horizontal Tee to Cube Map\
Vertical Strip to Cube Map\
Horizontal Strip to Cube Map\
Mental Ray Horizontal Strip to Cube Map\
Gear VR Mono to Cube Map\
Revit Horizontal Strip to Cube Map\
Revit Horizontal Strip Stereo to Cube Map Stereo\
Revit Vertical Strip to Cube Map\
Cube Map to 3x2 Cube Map\
Cube Map to Vertical Cross\
Cube Map to Horizontal Cross\
Cube Map to Vertical Tee\
Cube Map to Horizontal Tee\
Cube Map to Vertical Strip\
Cube Map to Horizontal Strip\
Cube Map to Mental Ray Horizontal Strip\
Cube Map to Revit Horizontal Strip\
Cube Map to Revit Vertical Strip\
Cube Map to Gear VR Mono\
Cube Map to New Cube Map\
Cube Map Rotate X:+90 Degrees\
Cube Map Rotate Y:+90 Degrees\
Cube Map Rotate Z:+90 Degrees\
Stereo Side by Side Extract\
Stereo Over Under Extract

#### Masking and Selection:

**Masking and Selection:**

Crop to Selection\
Select All\
Save Selection\
Load Selection\
Color Range Selection\
Inside Circular 50% Mask\
Outside Circular 50% Mask\
Fisheye Alpha Channel\
Fisheye Layer Mask\
Layer Mask from Selection\
Layer Mask from Inverse Selection\
Enable Layer Mask\
Disable Layer Mask\
Delete Layer Mask\
Black Matting BG

#### General Utilities:

**General Utilities:**

1x1 Guide Grid\
1x2 Guide Grid\
1x6 Guide Grid\
2x1 Guide Grid\
2x2 Guide Grid\
3x2 Guide Grid\
3x4 Guide Grid\
4x3 Guide Grid\
4x4 Guide Grid\
6x1 Guide Grid\
6x2 Guide Grid\
12x1 Guide Grid\
Clear Guides\
Invert Colors\
Background to Layer\
Merge Visible\
Flatten Image

#### UV Pass

**UV Pass**

UV Rectangle Gradient Landscape Layout\
UV Rectangle Gradient Portrait Layout\
UV Equirectangular to Angular Gradient\
UV Equirectangular to Domemaster Gradient\
Horizontal Offset 960px\
Vertical Offset 960px\
Rotate 90 Degrees\
Rotate 180 Degrees\
Rotate 270 Degrees\
Flip Vertical\
Flop Horizontal\
Gamma 2.2 to 1.0 Repair\
Gamma 1.0 to 2.2 Repair

### Installation Instructions

**Installation Instructions**

The Domemaster Photoshop Actions Pack is compatible with Photoshop CS3 to CC on both macOS and Windows.

#### Step 1. Open the Actions Tab

**Step 1. Open the Actions Tab**

Start by opening Adobe Photoshop. Navigate to the "Window" menu, and select the "Actions" menu item.

![[1install-window-actions-menu-item.png]]

#### Step 2. Load the actions.

**Step 2. Load the actions.**

Click on the Actions tab pop-up menu located at the top right of the actions tab.

Select the "Load Actions" menu item.

![[2load-actions-menu-item.png]]

In the Load dialogue window select the action files "Conversions.atn", "General Utilties.atn", "Masking and Selection.atn", "Transforms.atn", and "UV Pass.atn".

Click the Load button to open the action files.

![[3load-actions-dialogue.png]]

The Domemaster Photoshop Actions Pack files will be loaded into the Actions Tab.

![[4actions-loaded.png]]

#### Step 3. Switch to Button Mode

**Step 3. Switch to Button Mode**

If you want to make it easier to run the actions you can switch the Actions tab to "Button Mode". This will make each action item a clickable button.

Click on the Actions tab pop-up menu located at the top right of the actions tab.

Select the first item in the menu labeled "Button Mode". Your view will switch from a long list into a colorful grid of labeled buttons.

![[5switch-to-button-mode.png]]

To make it easier to find things, the actions groups are color coded:

The "Conversions" actions are blue.

The "General Utilities" actions are violet.

The "Masking and Selection" actions are green.

The "Transforms" actions are yellow.

The "UV Pass" actions are red.

### Tool Descriptions

**Tool Descriptions**

#### Transforms

Transforms

**1:1 to 2:1 Aspect Ratio Expand**

This action will convert a 1:1 square aspect ratio image into a 2:1 aspect ratio image by scaling the document 200% larger horizontally.

**2:1 to 1:1 Aspect Ratio Reduce**

This action will convert a 2:1 square aspect ratio image into a 1:1 aspect ratio image by scaling the document 50% smaller horizontally.

**50% Scale**

This action will scale the image 50% smaller using bicubic interpolation.

**200% Scale**

This action will scale the image 200% larger using bicubic interpolation.

**200% Vertical Canvas Expand**

This action will double the height of the image which is helpful for preparing over under format stereo images. A guide line is added at the edge of the expanded area which makes snapping easier.

**200% Horizontal Canvas Expand**

This action will double the width of the image which is helpful for preparing side by side format stereo images. A guide line is added at the edge of the expanded area which makes snapping easier.

**Rotate 90 Degrees**

This action will rotate the Photoshop document by 90 degrees. This is useful for changing the orientation of the angular fisheye and equirectangular images prior to the conversion.

![[Rotate-90-Degrees-Action.jpg]]

![[Rotate-90-Degrees-Action2.jpg]]

**Rotate 180 Degrees**

This action will rotate the Photoshop document by 180 degrees. This is useful for changing the up orientation of the angular fisheye and equirectangular images prior to the conversion.

![[Rotate-180-Degrees-Action.jpg]]

![[Rotate-180-Degrees-Action2.jpg]]

**Rotate 270 Degrees**

This action will rotate the Photoshop document by 270 degrees. This is useful for changing the up orientation of the angular fisheye and equirectangular images prior to the conversion.

**Flip Vertical**

This flips the image upside down.

**Flop Horizontal**

This flops the image left and right.

**Horizontal Offset 1024 Pixels**

This action slides the image 1024 pixels to the right and wraps the right side of the image around to the left side.

This is useful for changing the content in the center of an equirectangular image. This is also useful for fixing image seams and preparing tiling textures

![[Horizontal-Offset-1024-Pixels-Action.jpg]]

![[Horizontal-Offset-1024-Pixels-Action2.jpg]]

**Vertical Offset 1024 Pixels**

This action slides the image upwards by 1024 pixels and wraps the top side of the image around to the bottom side. This is useful for fixing image seams and preparing tiling textures.

![[Vertical-Offset-1024-Pixels-Action.jpg]]

![[Vertical-Offset-1024-Pixels-Action2.jpg]]

**Horizontal and Vertical Offset 1024 Pixels**

This action slides the image upwards and to the right by 1024 pixels and wraps the top and right side of the image around to the bottom side. This is useful for fixing image seams and preparing tiling textures.

If you are running this action on a 2K square resolution image it will shift the seams on an image's border to the center of the document. After you have finished your cloning or touch-up work you can run the action a 2nd time so the image border will be reset to its original position.

On a 4K square or 8K square resolution image you will need to run the action multiple time until the seam is shifted into the center of the document.

![[Horizontal-and-Vertical-Offset-1024-Pixels.jpg]]

#### Conversions {#ref9}

Conversions

**Inverse Angular Fisheye**

This action will allow you to inverse an angular fisheye image. This is the effect "rolling" the inside of the fisheye image to the outside of the frame. This effect works best with a 360° degree fisheye image.

The action can be used to quickly turn a regular angular fisheye image into a "tiny planet" style image.

The inverted fisheye effect is achieved by taking your angular fisheye image and doing a polar to rectangular conversion. Then the action rotates the image 180 degrees. The final step is to convert the image from rectangular coordinates back into polar coordinates.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

*Note:* It is also possible to use the "Inverse Angular Fisheye" action a 2nd time to convert a "tiny planet" image back into a normal fisheye image.

![[Inverse-Angular-Fisheye.jpg]]

**Angular Fisheye to Equirectangular**

This action converts a full frame fisheye image into a 360° x 180° spherical panorama with a ratio of 1:1. This means a fulldome image with a 2048x2048 resolution will be converted to a 2048x2048 resolution lat/long image. This is done with the help of the Photoshop polar to rectangular coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![[Angular-Fisheye-to-Equirectangular-Action.jpg]]

**Angular Fisheye to 2:1 Equirectangular**

This action converts a full frame fisheye image into a 360° x 180° spherical panorama with a ratio of 2:1. This means a fulldome image with a 2048x2048 resolution will be converted to a 4096x2048 resolution lat/long image. This is done with the help of the Photoshop polar to rectangular coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![[Angular-Fisheye-to-2to1-Equirectangular-Action.jpg]]

**180° Domemaster to 2:1 Equirectangular**

This action converts a 180° Domemaster angular fisheye image into a 360° x 180° spherical panorama with a ratio of 2:1.

Since a domemaster frame only has a vertical coverage area of 90 degrees when converted into a spherical format, this image will have the bottom / empty half of the spherical frame filled with a black background color.

![[180-Domemaster-to-2to1-Equirectangular-Action.jpg]]

**Equirectangular to Angular Fisheye**

This action converts a 360° x 180° spherical panorama into a full frame fisheye image. This means a lat/long image with a 1:1 aspect ratio like 2048x2048 pixels will be converted to a 2048x2048 angular fisheye image. This is done with the help of the Photoshop rectangular to polar coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![[Equirectangular-to-Angular-Fisheye-Action.jpg]]

**2:1 Equirectangular to Angular Fisheye**

This action converts a 360° x 180° spherical panorama into a full frame fisheye image. This means a lat/long image with a 2:1 aspect ratio like 4096x2048 pixels will be converted to a 2048x2048 angular fisheye image. This is done with the help of the Photoshop rectangular to polar coordinates filter.

This action can also be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action.

The latest version of Photoshop CC (14.2.1+) has added support for 16-bit per channel and 32-bit per channel imagery in the Polar Coordinates filter. If you are using an older version of Photoshop, the action will not work on 16-bit per channel and 32-bit per channel images due to limitations in Photoshop's "Polar to Rectangular" image filter.

Tip: If you see a visible seam artifact at the 0° mark after converting to/from an angular fisheye format you can try flattening the image before performing the conversions.

![[Equirectangular-to-Angular-Fisheye-Action.jpg]]

**2:1 Equirectangular to 180° Domemaster**

This action converts a 360° x 180° spherical panorama into a 180° domemaster formatted angular fisheye image. This means a lat/long image with a 2:1 aspect ratio will be converted to a domemaster formatted image with a black circular fisheye mask applied around the frame.

This is done with the help of the Photoshop rectangular to polar coordinates filter.

![[2to1-Equirectangular-to-180-Domemaster-Action.jpg]]

**3x2 Cube Map to Cube Map**

This converts a 3x2 cube map format image into the cubic layer map panorama format.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[3x2-cubemap-action.jpg]]

**Vertical Cross to Cube Map**

This converts a vertical cross format panorama into the cubic map panorama format.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[vertical-cross-cubemap-action.jpg]]

**Horizontal Cross to Cube Map**

This converts a horizontal cross format panorama into the cubic map panorama format.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[horizontal-cross-cubemap-action.jpg]]

**Vertical Tee to Cube Map**

This converts a vertical tee format panorama into the cubic map panorama format.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[vertical-tee-cubemap-action.jpg]]

**Horizontal Tee to Cube Map**

This converts a horizontal tee format panorama into the cubic map panorama format.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[horizontal-tee-cubemap-action.jpg]]

**Vertical Strip to Cube Map**

This converts a vertical strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 1:6 ratio. If the input image is 1024x6,144 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[vertical-strip-cubemap-action.jpg]]

**Horizontal Strip to Cube Map**

This converts a horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[horizontal-strip-cubemap-action.jpg]]

**Mental Ray Horizontal Strip to Cube Map**

This converts a mental ray mib_lookup_cube1 horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio in the mental ray cubic frame layout. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The input image is in the mental ray mib_lookup_cube1 horizontal strip image format:

  left
  --------------------------
  right
  bottom
  top (flipped vertically)
  back
  front

The output from this action is a layered Photoshop document with cubic faces named:

  front
  --------
  right
  back
  left
  top
  bottom

![[mr-horizontal-strip-to-cubemap-action.jpg]]

**Gear VR Mono to Cube Map**

This converts a Gear VR / Octange Render monoscopic horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 6,144x1024 pixel image the output will be a 1024x1024 pixel layered Photoshop image.

The converted cubic map faces are named:

  front
  --------
  right
  back
  left
  top
  bottom

![[gearvr-horizontal-strip-to-cubemap-action.jpg]]

**Revit Vertical Strip to Cube Map**

This converts an Autodesk Revit cloud rendered vertical strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 1:6 ratio. If the input image is 1536x9216 pixel image the output will be a 1536x1536 pixel layered Photoshop image.

The converted cubic map faces are named:

  right
  --------
  left
  top
  bottom
  back
  front

**Revit Horizontal Strip to Cube Map**

This converts an Autodesk Revit cloud rendered horizontal strip format panorama into the cubic map panorama format.

The input image is expected to be in a aspect 6:1 ratio. If the input image is 9216x1536 pixel image the output will be a 1536x1536 pixel layered Photoshop image.

The converted cubic map faces are named:

  front
  -------------------------
  right
  back
  left
  bottom (rotate 90° CCW)
  top (rotate -90° CW)

**Revit Horizontal Strip Stereo to Cube Map Stereo**

This converts an Autodesk Revit cloud rendered stereoscopic 3D horizontal strip format panorama into a pair of left and right view cubic map panoramas.

The input image is expected to be in an over/under stereo Revit Horizontal Strip panoramic format. For the over/under stereo image layout the right view is placed ontop of the left view.

If the input image is 9216x3072 pixel image the output will be two 1536x1536 pixel layered Photoshop images.

Note: If you want to apply an additional image editing panoramic transform like a "Cube Map to Horizontal Cross" action to the left and right camera cube map documents, you need to drag the active image's filename tab in Photoshop to the farthest to the right side of the open document tabs.

The converted cubic map faces are named:

  front
  -------------------------
  right
  back
  left
  bottom (rotate 90° CCW)
  top (rotate -90° CW)

**Cube Map to 3x2 Cube Map**

This converts a cube map format image into the 3x2 panorama format.

![[cubemap-3x2-cube-action.jpg]]

**Cube Map to Vertical Cross**

This converts a cube map format image into the vertical cross panorama format.

The converted vertical cross faces are located in the format:

  blank   top                   blank
  ------- --------------------- -------
  left    front                 right
  blank   bottom                blank
  blank   back (rotated 180°)   blank

![[cubemap-vertical-cross-action.jpg]]

**Cube Map to Horizontal Cross**

This converts a cube map format image into the horizontal cross panorama format.

The converted horizontal cross faces are located in the format:

  blank   top      blank   blank
  ------- -------- ------- -------
  left    front    right   back
  blank   bottom   blank   blank

![[cubemap-horizontal-cross-action.jpg]]

**Cube Map to Vertical Tee**

This converts a cube map format image into the vertical tee panorama format.

The converted vertical tee faces are located in the format:

  left    front                 right
  ------- --------------------- -------
  blank   bottom                blank
  blank   back (rotated 180°)   blank
  blank   top                   blank

![[cubemap-vertical-tee-action.jpg]]

**Cube Map to Horizontal Tee**

This converts a cube map format image into the horizontal tee panorama format.

The converted horizontal tee faces are located in the format:

  blank   top      blank   blank
  ------- -------- ------- -------
  front   right    back    left
  blank   bottom   blank   blank

![[cubemap-horizontal-tee-action.jpg]]

**Cube Map to Vertical Strip**

This converts a cube map format image into a single column panorama format.

The vertical strip faces are located in the format:

  front
  --------
  right
  back
  left
  top
  bottom

![[cubemap-vertical-strip-action.jpg]]

**Cube Map to Horizontal Strip**

This converts a cube map format image into a single row panorama format.

The horizontal strip faces are located in the format:

| :----- \| :----- \| :----- \| :----- \| :----- \| :----- \|
| front \| right \| back \| left \| top \| bottom \|

![[cubemap-horizontal-strip-action.jpg]]

**Cube Map to Revit Horizontal Strip**

This converts a cube map format image into a single row panorama format that is used by Autodesk Revit's cloud rendering VR Panorama products.

The Revit horizontal strip faces are located in the format:

| :----- \| :----- \| :----- \| :----- \| :----- \| :----- \|
| front \| right \| back \| left \| bottom (rotate 90° CCW) \| top (rotate -90° CW) \|

**Cube Map to Revit Vertical Strip**

This converts a cube map format image into a single column vertical panorama format that is used by Autodesk Revit's cloud rendering VR Panorama products.

The Revit vertical strip faces are located in the format:

  right
  --------
  left
  top
  bottom
  back
  front

**Cube Map to Mental Ray Horizontal Strip**

This converts a cube map format image into a single row panorama format.

This converts a layered cubic map Photoshop document into a mental ray `mib_lookup_cube1` horizontal strip format panorama.

The input image is expected to be in a 1:1 aspect ratio. If the input image is a layered 1024x1024 pixel image the output will be a 6,144x1024 pixel image with a 6:1 aspect ratio.

The input for this action is a layered Photoshop document with cubic faces named:

  front
  --------
  right
  back
  left
  top
  bottom

The output image is in the mental ray `mib_lookup_cube1` horizontal strip image layout with the following cubic map face order:

  left
  --------------------------
  right
  bottom
  top (flipped vertically)
  back
  front

![[cubemap-to-mr-horizontal-strip-action.jpg]]

**Cube Map to Gear VR Mono**

This converts a cube map format image into the Gear VR / Octane Render ORBX 6:1 aspect ratio horizontal strip cubic panorama format.

The converted horizontal strip faces are located in the format:

| :----- \| :----- \| :----- \| :----- \| :----- \| :----- \|
| Left \| Right \| Top (rotated 180) \| Bottom (rotated 180) \| Back \| Front \|

![[cubemap-to-gearvr-horizontal-strip-action.jpg]]

**Cube Map to New Cube Map**

This action will copy the cube map "front", "right", "back", "left", "top", and "bottom" layers from your current Photoshop document into a new Photoshop document.

**Cube Map Rotate X:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the X-axis. This has the effect of turning the front "view" upwards towards the sky.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![[cubemap-rotate-x90-action.jpg]]

![[cubemap-rotate-x90-layers.jpg]]

**Cube Map Rotate Y:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the Y-axis. The has the effect of turning the front "view" towards the left.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![[cubemap-rotate-y90-action.jpg]]

![[cubemap-rotate-y90-layers.jpg]]

**Cube Map Rotate Z:+90 Degrees**

This action will rotate the cube map panorama by 90 degrees on the Z-axis. This has the effect of rotating the front "view" 90 degrees clockwise to the right.

Tip: If you want to rotate a cross style, tee style, 3x2 cubic map, or strip style pano you need to convert them to the layered "cube map" format first using the actions in the Conversions Actions tab group.

![[cubemap-rotate-z90-action.jpg]]

![[cubemap-rotate-z90-layers.jpg]]

**Stereo Side by Side Extract**

This action will copy the left and right stereo views out of a side by side stereo format image.

A new image will be created and then two layers will be added with the layer names of "left" and "right".

The source image should have the stereo image layout of:

| :----- \| :----- \|
| left \| right \|

**Stereo Over Under Extract**

This action will copy the left and right stereo views out of an over under stereo format image.

A new image will be created and then two layers will be added with the layer names of "left" and "right".

The source image should have the stereo image layout of:

  left
  -------
  right

#### Masking and Selection

Masking and Selection

**Crop to Selection**

This action will crop the Photoshop document smaller based upon the currently selected area. The crop command will reduce the image size based upon a square cropping rectangle drawn around the current selection shape.

**Select All**

This action will select all of the pixels on the current image layer.

![[Select-All-Action.jpg]]

**Save Selection**

This action will save the current selection to a new alpha channel.

**Load Selection**

This action will open the "Load Selection" dialogue. You can choose to load either a layer mask, transparency channel, or an alpha channel into the current selection region.

There are several advanced options in the the "Load Selection" dialogue that will let you do differencing operations ( new, add, subtract, intersect, or invert) your current selection.

For example of you were painting a layer mask you could change your current selection region by subtracting the shape of a mask or alpha channel from another layer or image.

**Color Range Selection**

This action will load the "Color Range" dialogue. This dialogue is useful for using a color / luma keying approach to generate a new selection region.

You can preview the effects of the selection region in the dialogue or use the "Selection Preview" pop-up menu to view the results in the main Photoshop window.

**Inside Circular 50% Mask**

This action creates a circular layer mask that hides the area inside a circular region in the center of the current layer.

![[Inside-Circular-50-Percent-Mask-Action.jpg]]

**Outside Circular 50% Mask**

This action creates a circular layer mask that hides the area outside a circular region in the center of the current layer.

![[Outside-Circular-50-Percent-Mask-Action.jpg]]

**Fisheye Alpha Channel**

This action creates a full frame circular alpha channel.

A common use is to create a single circular alpha channel and then use the "load selection" action to repetitively make circular domemaster shaped boundary selections.

![[Fisheye-Alpha-Channel-Action.jpg]]

**Fisheye Layer Mask**

This action creates a full frame circular layer mask on the currently select layer.

To use this action you must convert all flattened background layers into floating layers. You can do this using the "Background to Layer" action.

![[Fisheye-Layer-Mask-Action.jpg]]

**Layer Mask From Selection**

This action applies a new raster layer mask based upon the current selection. To use this action you must remove any existing "raster" layer masks from the current layer.

Layer masks are a quick and easy way to temporarily hide content on an image layer.

![[Layer-Mask-From-Selection-Action.jpg]]

![[Layer-Mask-From-Selection-Action2.jpg]]

After you create a new layer mask you can edit the layer mask by opening the layers tab and clicking on the mask icon to the right of the layer icon. When the layer mask is selected you can paint the mask using the brush tool.

**Layer Mask Editing Tips**

When editing a layer mask you can paint regions of the layer visible or invisible by changing the brush color to either white or black.

You can create transparent areas on the layer by using a shade of gray as the brush color when painting the layer mask.

If you adjust the brush hardness to 100% you can paint a crisp hard-edged matte. For a nice soft matte edge set the brush hardness to a value between 0 to 80%.

You can view the contents of a single layer mask full-screen by holding down the option key on Mac OS X or the alt key on Windows, and clicking on a layer mask thumbnail image in the Layers Tab.

To exit the full-screen layer mask view you need to click back on the layer's color thumbnail image in the Layers Tab.

You can invert a layer mask by selecting the layer mask thumbnail icon and clicking the "Invert Colors" action button. This will reverse the visible and hidden areas in the layer mask.

**Layer Mask From Inverse Selection**

This action creates a new layer mask based upon inverting the current selection. To use this action you must remove any existing "raster" layer masks from the current layer.

![[Layer-Mask-From-Inverse-Selection-Action.jpg]]

![[Layer-Mask-From-Inverse-Selection-Action2.jpg]]

**Enable Layer Mask**

This action will enable the layer mask on the current layer. This is useful for comparing the effects of transparency on the current layer.

![[Enable-Layer-Mask-Action.jpg]]

**Disable Layer Mask**

This action temporarily disables the layer mask on the current layer. This is useful for comparing the effects of transparency on the current layer.

![[Disable-Layer-Mask-Action.jpg]]

**Delete Layer Mask**

This action deletes the layer mask on the current layer.

![[Delete-Layer-Mask-Action.jpg]]

**Black Matting BG**

This action creates a new shape layer with a black background color.

If the current image layer is a floating layer, the black BG shape layer will be placed behind it. If the current image layer is a flattened background layer, the Black BG shape layer will be placed on top of it.

#### General Utilities

General Utilities

**1x1 Guide Grid**

This creates a guide layout that forms a basic outline of the image frame. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**1x2 Guide Grid**

This creates an over under stereo format guide grid. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**1x6 Guide Grid**

This creates a vertical strip style 1x6 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**2x1 Guide Grid**

This creates a side by side stereo format guide grid. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**2x2 Guide Grid**

This creates a 2x2 guide grid that divides the image into quarters. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**3x2 Guide Grid**

This creates a 3x2 cube map style alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**3x4 Guide Grid**

This creates a vertical cross or vertical tee style 3x4 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**4x3 Guide Grid**

This creates a horizontal cross or horizontal tee style 4x3 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**4x4 Grid Guide**

This action creates a 4x4 style alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on. You can use the grid to make sure the nadir point in the fulldome image is perfect centered.

![[4-x-4-Grid-Guide-Action.jpg]]

![[4-x-4-Grid-Guide-Action2.jpg]]

**6x1 Guide Grid**

This creates a horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**6x2 Guide Grid**

This creates a 2 image high, over under stereo format, horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**12x1 Guide Grid**

This creates a side by side stereo format horizontal strip style 6x1 alignment guide layout. This grid is extremely useful for making accurate selections in the image when the "Snap to Guides" command is turned on.

**Clear Guides**

This action will remove all of the guides from the current Photoshop document.

![[Clear-Guides-Action.jpg]]

**Invert Colors**

This action will invert the image colors of the currently selected layer. This action can be used on color images, layer masks, and alpha channels.

![[Invert-Colors-Action.jpg]]

My favorite use of this filter is to invert a grayscale layer mask. This will reverse the visible and hidden parts of the layer mask.

This action can be used on individual alpha channels by selecting the alpha channel in the Channels tab and then clicking the button for the action. The action can also used on a layer mask by selecting the layer mask's thumbnail icon in the layers tab and then clicking the button for the action.

**Background to Layer**

This action will convert a flattened image from the background layer mode into a floating layer that supports features like layer masks.

The most common use for this action is to prepare an imported picture like a flat JPEG .jpg or Targa .tga file for custom layer masks.

![[Background-to-Layer-Action.jpg]]

**Merge Visible**

This action will merge all of the visible layers into a single layer.

This action is different than the flatten image command in that it will ignore any hidden layers. You can use the merge visible command to selectively flatten layers by hiding the other layers, elements, and groups you want to keep.

This version of Merge Visible can merge a single layer and bake the layer mask and layer style effects into the final image.

**Flatten Image**

This action will merge all of the layers in the current Photoshop document. This is useful for removing transparency from an image, merging layer style effects, vector shapes, and editable text layers into a single raster image.

When an image is flattened, all of the transparent background areas in the image will be filled with a solid color.

*Note:* You really want to have saved a backup of your Photoshop document before you flatten the image because all of your layers are permanently merged into a single element!

#### UV Pass {#ref10}

UV Pass

The "UV Pass" actions allow you to prepare UV pass maps that are used for pre-computed panoramic image transforms. This approach is commonly used in compositing to correct for lens distortion. Another term for a UV pass map if you are a Foundry NukeX user is an "ST map".

A UV pass image template is made using a 16 bit integer red/green gradient image that is then distorted using a program like PTGui Pro and KartaVR.

Note: It is very important that you load and save a UV pass map using an sRGB linear gamma 1.0 color space in Photoshop or you will have distortions in your image template from the non-linear shading of the generated gradients.