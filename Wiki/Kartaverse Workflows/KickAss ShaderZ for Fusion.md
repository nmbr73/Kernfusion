---
tags: [export, export-scrivener, revise]
xself: 'KickAss ShaderZ for Fusion'
xhead: 'Kartaverse Workflows'
xtail: 'KickAss ShaderZ for Fusion'
xprev: 'DEV Building an Effective nVP (Neural Virtual Production) Sound Stage'
---

**KickAss ShaderZ for Fusion**

**Overview**

"KickAss ShaderZ" is a community supported repository of material shaders for the Fusion community by the Fusion community. Curated by Andromeda_Girl and developed for Reactor by Andrew Hazelden.

WSL members can submit shaders to be added and watch the library grow.

![[Kartaverse Workflows.img/image1__fix4.png]]

**For More Information**

If you'd like to explore how the KickAss Shaders were created, simply expand the group to peek inside the shader.

KickAss ShaderZ is a project that is hosted on the WeSuckLess Fusion community forum. You can check out the Reactor GitLab Repository if you need direct access to the individual files via your web browser.

**Project Created by**

-   andromeda_girl (WSL Profile)
-   Andrew Hazelden (WSL Profile)
-   WSL Community

**Requirements**

-   Blackmagic Fusion Studio or Resolve
-   WSL Reactor Package Manager

**Installation**

The KickAss ShaderZ is installed using the Reactor package manager. Look for KickAss ShaderZ in the "Shaders" category on the left side of the Reactor window.

### Import PBR Metal Roughness Textures Script

**Import PBR Metal Roughness Textures Script**

KickAss ShaderZ includes a handy "Substance PBR Import" script that reads the image from the selected Loader node and expands it to import the full set of related Substance PBR texture maps.

The idea for this PBR texture map "splitter" script was directly inspired by the concept of how the "hos_SplitEXR_Ultra.lua" script works at breaking apart EXR channels. ![[Kartaverse Workflows.img/image1__fix3.png]]

**Nodes View Screenshot**

This is what a typical PBR material import looks like in the Nodes view area:

![[Kartaverse Workflows.img/image2__fix2.png]]

**File Import Menu Usage**

Step 1. If you have KickAss ShaderZ menus installed, then you have access in Fusion Studio to a "File \> Import \> PBR Textures..." menu item.

![[Kartaverse Workflows.img/image3__fix1.png]]

As a fallback option, there is a KickAss ShaderZ menu entry for this script as well. It can be accessed using the "KickAss Shaders \> Tools \> Substance PBR Import" menu item.

![[Kartaverse Workflows.img/image4__fix1.png]]

Step 2. A file browsing dialog is shown when either of the menu items are selected. In the file browsing dialog choose a PBR Metal Roughness texture map on disk.

![[Kartaverse Workflows.img/image5__fix1.png]]

An example KAS bundled PBR Metal Roughness set of texture maps you can try out can be found on-disk at the PathMap location of:

Reactor:/Deploy/Macros/KickAss ShaderZ/Assets/PreviewSphere_Sphere_BaseColor.png

A PBR Import dialog will appear with import options. Clicking the "Create PBR Material" button will auto-create a PBR material shading network in the Fusion comp by matching the corresponding texture filenames and PBR channel names.

![[Kartaverse Workflows.img/image6__fix1.png]]

### Tool Script Usage

**Tool Script Usage**

Step 1. Select a Loader node in the Flow view.

![[Kartaverse Workflows.img/image7__fix5.png]]

Step 2. Right-click in the flow view and from the contextual menu select the "Script \> KickAss ShaderZ \> Substance PBR Import" menu item to launch the script.

![[Kartaverse Workflows.img/image8__fix5.png]]

Step 3. Customize the settings in the dialog, then click the "Create PBR Material" button.

![[Kartaverse Workflows.img/image6__fix1.png]]

### GUI Controls

**GUI Controls**

PBR Surface Material

The "PBR Surface Material" ComboBox allows you to choose either a "Cook Torrance/Reflect", or a "CustomShader3D (Alpha)" based material workflow.

![[Kartaverse Workflows.img/image9__fix4.png]]

Note: You need to have the 3rd party "CustomShader3D" plugin installed in Fusion Studio v9 for Windows in order to use this option.

Add Environment Map

The "Add Environment Map" checkbox allows you to have an HDRI panoramic image added to the node graph automatically.

![[Kartaverse Workflows.img/image10__fix2.png]]

Add Shader Ball

The "Add Shader Ball" checkbox allows you to have a polygon mesh added to the node graph automatically for use as preview geometry for your surface materials.

![[Kartaverse Workflows.img/image11__fix4.png]]

This is a preview of the KickAss ShaderZ "kas_ShaderBall" node with PBR Materials applied to it.

![[Kartaverse Workflows.img/image12__fix3.png]]

Add Note

The "Add Note" checkbox inserts a note node into the composite which summarizes the texture maps and settings used when the PBR materials were imported.

![[Kartaverse Workflows.img/image13__fix3.png]]

This is a preview of the type of information that is automatically added to the Node node when the PBR Materials are imported.

![[Kartaverse Workflows.img/image14__fix3.png]]

Reset to Defaults

The "Reset to Defaults" checkbox reverts the settings in the dialog back to their initial factory default values.

![[Kartaverse Workflows.img/image15__fix1.png]]

? / Help

The "?" help button shows the built-in help documentation (which you are currently viewing now).

![[Kartaverse Workflows.img/image16__fix2.png]]

Create PBR Material

The "Create PBR Material" button will process the current Loader node selection in the flow view to generate a full set of imported PBR maps connected to a Fusion surface material.

![[Kartaverse Workflows.img/image17__fix2.png]]

Image Channels

A Substance "PBR Metal Rough" export workflow is expected by this script. That means you will have a set of texture maps with the following PBR map channels:

BaseColor

Roughness

Normal

Metallic

Height

Emissive

These maps will be named with a filename formatted like:

image\_\<map\>.ext

Note: It would be possible to add PBR texture import support for additional naming conventions such as importing maps and building the shading network for the LearnNowFX AccuShader plugin, or loading in footage based upon the naming patterns of Disney Principal texture maps, or Pixar Surface texture maps if there was user interest.

### Substance Material Export

Substance Material Export

In Substance Painter select the "File \>Export Textures..." menu item to prepare your final baked and flattened texture maps.

![[Kartaverse Workflows.img/image18__fix2.png]]

In the "Export document..." dialog set the export location using the button at the top of the dialog. Then set the "Config" attribute to use the "PBR MetalRough" option to generate the correct texture maps.

Finally, click the "Export" button to save out the textures.

![[Kartaverse Workflows.img/image19__fix1.png]]

### Content Browser

**Content Browser**

![[Kartaverse Workflows.img/image20__fix6.png]]

The "Content Browser" window allows you to effortlessly navigate through the "Industrial", "Natural", "Utility", and "HDRI" categories of macros included in the KAS shader collection. This view is accessed using the "KickAss ShaderZ \> Content Browser..." menu item.

### KickAss ShaderZ Descriptions

**KickAss ShaderZ Descriptions**

### Industrial

**Industrial**

kas_Atomic

"kas_Atomic" creates an irradiated material that is self-illuminated with an orange shade.

![[Kartaverse Workflows.img/image21__fix1.png]]

kas_Chrome

"kas_Chrome" creates a super shiny metallic surface.

![[Kartaverse Workflows.img/image22__fix4.png]]

kas_CobaltBlueCarbonFibre

"kas_CobaltBlueCarbonFibre" is great for futuristic hard surface modelled objects where you might want a procedurally textured lightly scuffed surface for added photorealism.

![[Kartaverse Workflows.img/image23__fix3.png]]

kas_GlassDeepBlue

"kas_GlassDeepBlue" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked blue color absorption effect on the material using a Falloff node.

![[Kartaverse Workflows.img/image24__fix2.png]]

kas_GlassDeepRuby

"kas_GlassRuby" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked red color absorption effect on the material using a Falloff node.

![[Kartaverse Workflows.img/image25__fix3.png]]

kas_GlassDirty

"kas_GlassDirty" creates a semi-transparent glass with a layer of grime coating the surface.

![[Kartaverse Workflows.img/image26__fix2.png]]

kas_GlassQuartzScratched

"kas_GlassQuartzScratched" is a semi-transparent glass material. A primitive attempt has been taken to simulate a faked purple color absorption effect on the material using a Falloff node.

![[Kartaverse Workflows.img/image27.png]]

kas_Gold

"kas_Gold" creates a stylized NPR metallic surface material that could be used for logos and titles. The lustre of the gold is highly dependent on the lighting angle. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

![[Kartaverse Workflows.img/image28__fix3.png]]

kas_HeatShield

"kas_HeatShield" generates a super-heated plasma-like fresnel shading effect that can be used to create earth atmosphere re-entry shading effects for spacecraft or meteorites. The material can also be modified to augment the look of tracer bullets, incendiary rounds, or futuristic ballistic weaponry that need a plasma like heat bubble that wraps around the projectile.

When you render the "kas_HeatShield" surface material, don't forget to explore adding an exponential glow effect to the final frame to increase the incandescent luminoous feel of the material. The "TextureMap" input connection on the node supports images with alpha channels which can punch holes through the final material for a patch-work shading effect.

If you want to see the kas_HeatShield material with the same look as the thumbnail has, open the provided kas_HeatShield.comp file located at "Reactor:/Deploy/Comps/KickAss ShaderZ/kas_HeatShield.comp".

This composite has a customized Light Rotate XYZ value on the kas_ShaderBall node.

![[Kartaverse Workflows.img/image29.png]]

kas_MetalGalvanized

"kas_MetalGalvanized" creates an industrial sheet metal material.

![[Kartaverse Workflows.img/image30__fix1.png]]

kas_MetalScuzzy

"kas_MetalScuzzy" is a metallic material that has become dulled by a thick layer of dirt and grime.

![[Kartaverse Workflows.img/image31__fix3.png]]

kas_Radioactive

"kas_Radioactive" creates an irradiated material that is self-illuminated with a strong violet shade.

![[Kartaverse Workflows.img/image32__fix1.png]]

kas_RustyNail

"kas_RustyNail" creates a worn, oxidized steel material.

![[Kartaverse Workflows.img/image33__fix1.png]]

kas_Xray

"kas_Xray" creates a stylized and colourful NPR rendering effect of a medical X-ray material.

![[Kartaverse Workflows.img/image34__fix4.png]]

### Natural

**Natural**

kas_DarkBlueIceShard

"kas_DarkBlueIceShard" creates a frosted blue icy material.

![[Kartaverse Workflows.img/image35__fix3.png]]

kas_GreenEctoplasm

"kas_GreenEctoplasm" is perfect for organic effects like semi-transparent gloopy liquids, or otherworldly paranormal objects.

![[Kartaverse Workflows.img/image36__fix2.png]]

kas_IridescentBlue

"kas_IridescentBlue" creates a luminous material with a saturated blue sheen, and a fresnel edge shading effect.

![[Kartaverse Workflows.img/image37__fix2.png]]

kas_MarbleStone

"kas_MarbleStone" creates a glossy tiled floor material. You can choose to render this stone with a full surface displacement effect on the mesh.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model's "3DData" output connection. Then connect the "kas_MarbleStoneDisplace" node's "DisplacementTextureOutput" connection to the Displace3D node's "Input"connection.

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.02.

![[Kartaverse Workflows.img/image38__fix1.png]]

kas_MarbleStone Asset Licenses:

Freeware:\
kas_MarbleStone PBR Textures

By:\
https://www.textures.com

Is licensed under:\
CG Textures Freeware

Creative Commons:\
St. Nicholaus Church Interior HDRI

By:\
https://hdrmaps.com

Is licensed under:\
CC BY 2.0

kas_OrganicMote

"kas_OrganicMote" is perfect for stylized NPR rendering needs such as bio-medical visualization. If you are assigning this material to animated elements that are floating around and drifting slowly in your scene, make sure to enable motion blur and DoF bokeh blur in your renderings for added realism.

![[Kartaverse Workflows.img/image39__fix1.png]]

kas_Ocean

"kas_Ocean" macro creates a multi-spectral ocean material that combines an HDRI environment map with a simulated sub-surface translucent like shading layer.

![[Kartaverse Workflows.img/image40__fix1.png]]

kas_Ocean Asset Licenses:

Simon's Town Rocks, Cape Town, South Africa IBL

Creative Commons:\
Simon's Town Rocks

By:\
https://hdrihaven.com/

Is licensed under:\
CC0 (Public Domain)

Anonymous Water Template

The Anonymous Water Template is the actual Fusion 3D water setup as it was used on Roland Emmerich's Anonymous (2011) film, courtesy of Uncharted Territory.

**SIGGRAPH 2012 Presentation on Anonymous:**\
https://www.youtube.com/watch?v=mOpN6C3ZrjY

kas_RedBloodCell

"kas_RedBloodCell" is perfect for stylized NPR rendering needs such as bio-medical visualization of high detail blood cells flowing in a bloodstream.

If you are assigning this material to animated blood cells that are floating around and drifting slowly in your scene, make sure to enable motion blur and DoF bokeh blur in your renderings for added realism.

![[Kartaverse Workflows.img/image41__fix2.png]]

kas_StoneWall

"kas_StoneWall" creates a rough wall from fieldstone and mortar. You can choose to render this stone with a bump map, or with a full surface displacement effect on the mesh.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model' s "3DData" output connection. Then connect the "kas_StoneWall" material' s "DisplacementTextureOutput" connection to the Displace3D node' s "Input" connection.

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.2.

![[Kartaverse Workflows.img/image42__fix2.png]]

kas_MarbleStone Asset Licenses:

Freeware:\
kas_StoneWall PBR Textures (Castle Stone Wall)

By:\
https://quixel.com/megascans

Is licensed under:\
Quixel Megascans Freeware

kas_VelvetyMoss

"kas_VelvetyMoss" is perfect for stylized NPR rendering organic elements such as bio-medical visualization.

![[Kartaverse Workflows.img/image43__fix3.png]]

kas_VolcanicMagma

"kas_VolcanicMagma" creates a super hot molten rock material. When you render this material, consider attaching a 2D glow effect to highlight the surface cracks that are luminous.

To get the displacement effect out of this material you need to add a Displace3D node and connect its "SceneInput" input to a 3D model' s "3DData" output connection. Then connect the "kas_VolcanicMagma" material' s "DisplacementTextureOutput" connection to the Displace3D node' s "Input" connection.

The strength of the displacement effect is controlled on the Displace3D node's scale attribute with a good starting value of approximately 0.2.

![[Kartaverse Workflows.img/image44__fix3.png]]

### Utility

**Utility**

kas_IconSaver

"kas_IconSaver" renders a Fusion v9 Bin window 130x100 px BMP format icon to the Comp PathMap folder. If you have HiQ enabled simply viewing this node will write you new bin icon to disk.

This node is supposed to be connected directly to the "kas_ShaderBall.Output" node's output connection.

The kas_IconSaver node includes an integrated copy of the GreyCheckerboard macro. GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![[Kartaverse Workflows.img/image45__fix3.png]]

kas_GreyCheckerboard

"kas_GreyCheckerboard" renders a preview shader swatch with a baked in grey checker background.

GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![[Kartaverse Workflows.img/image46__fix2.png]]

kas_ShaderBall

"kas_ShaderBall" adds a shader ball model to your Fusion 3D system scene. It is used to apply and preview the look of surface materials. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

This node's output is supposed to be connected directly to the "kas_ShaderPreview" nodes input connection so you can see a high-quality preview of your surface material.

![[Kartaverse Workflows.img/image47__fix3.png]]

kas_ShaderBallDragon

"kas_ShaderBallDragon" adds a Stanford Dragon model shader ball to your Fusion 3D system scene. It is used to apply and preview the look of surface materials. Make sure to enable the Fusion 3D workspace "3D Options \> Lighting" mode so you see an accurate preview of the material in the realtime viewport.

This node's output is supposed to be connected directly to the "kas_ShaderPreview" nodes input connection so you can see a high-quality preview of your surface material.

The "DragonUVMap3D" node inside the GroupOperator allows you to adjust the UV layout on the model and its perfect for tweaking how the texture map is placed on the mode.

![[Kartaverse Workflows.img/image48__fix2.png]]

kas_ShaderBallDragon Asset License:

By:\
The Stanford 3D Scanning Repository

Is licensed under:\
Public Domain

kas_ShaderPreview

"kas_ShaderPreview" is has a Renderer3D node inside is that renders a preview shader swatch with a baked-in grey checker background.

This node is supposed to be connected directly to the "kas_ShaderBall.Output" node's output connection.

The kas_ShaderPreview node includes an integrated copy of the GreyCheckerboard macro. GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

![[Kartaverse Workflows.img/image49__fix2.png]]

### HDRI

**HDRI**

kas_Parkland

"kas_Parkland" is an HDRI image of Egg mountain in Gory Sowie, Poland. The foreground of the image has a grassy field with smooth rolling mountains stretching upwards in the distance.

![[Kartaverse Workflows.img/image50__fix2.png]]

kas_SimonsTownRocks

"kas_SimonsTownRocks" is an HDRI image of a rocky coastal shoreline in Simon's Town, Cape Town, South Africa.

![[Kartaverse Workflows.img/image51.png]]

kas_StNicholasChurch

"kas_StNicholasChurch" is an HDRI image of the interior of the Dominican order's St. Nicholas Church in Gdańsk, Poland. The church was originally erected in 1227. The interior of the church currently features a baroque altar design with a black and golden colored theme.

![[Kartaverse Workflows.img/image52.png]]

### Copyright Credits

# Copyright Credits

kas_Parkland

Creative Commons:\
Egg mountain at afternoon

By:\
https://hdrmaps.com

Is licensed under:\
CC BY 2.0

Simon's Town Rocks, Cape Town, South Africa IBL

Creative Commons:\
Simon's Town Rocks

By:\
https://hdrihaven.com/

Is licensed under:\
CC0 (Public Domain)

St. Nicholas Church, Gdansk, Poland IBL

Creative Commons:\
St. Nicolaus Church Interior HDRI

By:\
https://hdrmaps.com

Is licensed under:\
CC BY 2.0

kas_StoneWall

Freeware:\
kas_StoneWall PBR Textures (Castle Stone Wall)

By:\
https://quixel.com/megascans

Is licensed under:\
Quixel Megascans Freeware

kas_MarbleStone

Freeware:\
kas_MarbleStone PBR Textures

By:\
https://www.textures.com

Is licensed under:\
CG Textures Freeware

Anonymous Water Template

The Anonymous Water Template is the actual Fusion 3D water setup as it was used on Roland Emmerich's Anonymous (2011) film, courtesy of Uncharted Territory.

**SIGGRAPH 2012 Presentation on Anonymous:**\
https://www.youtube.com/watch?v=mOpN6C3ZrjY

GreyCheckerboard

GreyCheckerboard is based upon the "Checkerboard" macro from the Muse Tools Library by Joe Laude.

kas_ShaderBallDragon Asset License:

By:\
The Stanford 3D Scanning Repository

Is licensed under:\
Public Domain

### ShaderZ Texture Inputs

**ShaderZ Texture Inputs**

There are two image input connections on most of the ShaderZ material nodes named "TextureMap" and "EnvironmentMap".

The "TextureMap" input connection allows you to supply your own imagery that will be applied as the base texture map. The "EnvironmentMap" input connection allows you to supply your own spherical environment image that will be visible as the reflected environment for the material.

![[Kartaverse Workflows.img/image53__fix2.png]]

Note: When imagery is connected to these inputs they are automatically activated and used inside the material via a pair of SwitchElse.fuse nodes that are packed inside the shader. The second you disconnect your imagery from the input connections the surface material defaults back to the internal default texture maps.

### Fusion Effects Tab

**Fusion Effects Tab**

In Fusion Studio Standalone you can access the KickAss ShaderZ by open up the "Effects" Tab. Then expand the "Templates \> KickAss ShaderZ \> Native ShaderZ \>" section. You can now select between a "Industrial", "Natural", and "Utility" set of surface materials.

You can drag/drop any of the items in this Templates list into your Nodes view and they will be instantly added to your composite.

![[Kartaverse Workflows.img/image54__fix1.png]]

Note: Try to make sure to drag the nodes to an open space in the Nodes view so the new material's node-based content doesn't co-mingle with your existing node graph and cause the content to pile up in an unsightly "heap of nodes". If this issue ever happens to you, all you have to do to rectify the situation is to hit the "Edit \> Undo \>" menu item to remove the most recently added nodes from the comp.

### Fusion Select Tool

**Fusion Select Tool**

Pressing the "Shift + Spacebar" hotkey when Fusion's Nodes view is in focus will display a "Select Tool" dialog. Typing in "kas\_" is a quick way to filter the list of available nodes down to the content provided by the "KickAss ShaderZ" collection.

![[Kartaverse Workflows.img/image55.png]]

### KickAss ShaderZ Menu

**KickAss ShaderZ Menu**

The "KickAss ShaderZ" root level menu system in Fusion Studio provides a quick way to access the full shader collection and the shader tools.

![[Kartaverse Workflows.img/image56__fix2.png]]

The KAS menu layout consists of the following entries:

KickAss ShaderZ \>

-   Native ShaderZ \>
    -   HDRI \>
        -   kas_Parkland
        -   kas_SimonsTownRocks
        -   kas_StNicholasChurch
    -   Natural \>
        -   kas_DarkBlueIceShard
        -   kas_GreenEctoplasm
        -   kas_IridescentBlue
        -   kas_MarbleStone
        -   kas_OrganicMote
        -   kas_Ocean
        -   kas_RedBloodCell
        -   kas_StoneWall
        -   kas_VelvetyMoss
        -   kas_VolcanicMagma
    -   Industrial \>
        -   kas_Atomic
        -   kas_Chrome
        -   kas_CobaltBlueCarbonFibre
        -   kas_GlassDeepBlue
        -   kas_GlassDeepRuby
        -   kas_GlassDirty
        -   kas_GlassQuartzScratched
        -   kas_Gold
        -   kas_HeatShield
        -   kas_MetalGalvanized
        -   kas_MetalScuzzy
        -   kas_Radioactive
        -   kas_RustyNail
        -   kas_Xray
    -   Production
        -   ...
    -   Utilty \>
        -   kas_IconSaver
        -   kas_GreyCheckerboard
        -   kas_ShaderBall
        -   kas_ShaderBallDragon
        -   kas_ShaderPreview
-   CustomShader3D ShaderZ \>
    -   Install the CustomShader3D Plugin
    -   ...
-   PBR ShaderZ \>
    -   ...
-   Tools \>
    -   Show KAS Docs
    -   Show KAS Macros Folder
    -   Show KAS Comps Folder
    -   Show KAS Config Folder
    -   Save Selection to Macro
    -   Package ShaderZ for Reactor...
-   Resources \>
    -   KAS Documentation
    -   KAS WSL Discussion
-   Content Browser...
-   About KickAss ShaderZ...

### KAS Tools

**KAS Tools**

### Save Selection to Macro

Save Selection to Macro

The "KickAss ShaderZ \> Tools \> Save Selection to Macro" menu item exports the active Nodes view selection to a new Fusion "Macros" PathMap based ".setting" file on disk. This makes it a lot easier for comp artists to create and save out their own macros with less effort.

![[Kartaverse Workflows.img/image57__fix4.png]]

When you run the "Save Selection to Macro" menu item, a file save dialog appears. You can then type in a name for your new macro ".setting" file and choose a folder location where you want the macro saved to.

![[Kartaverse Workflows.img/image58__fix4.png]]

Whatever nodes are selected in the Nodes view are then instantly exported and pushed out to this new macro .setting file. Your newly saved macro is then opened up in the external script editor that is defined in the Fusion Preferences "Global and Default Settings \> Script \> Editor Path" section.

By opening up the macro file in an external text editor like Notepad++ (Windows) / BBEdit (macOS) / gedit (Linux) it is possible to add the final polish like adding a CustomData HelpPage entry, or renaming the input and output connections.

![[Kartaverse Workflows.img/image1__fix12.png]]