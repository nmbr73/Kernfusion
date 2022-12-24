---
tags: [export, export-scrivener, revise]
xself: 'YouTube 360 to Equirectangular Conversions'
xhead: 'Kartaverse Workflows'
xtail: 'KickAss ShaderZ for Fusion'
xprev: 'Troubleshooting Guide for Fusion Studio Freeze Ups'
xnext: 'Jupyter Notebook for Resolve_Fusion'
---

# YouTube 360 to Equirectangular Conversions

KartaVR has several different workflow paths that can be used to convert panoramic image projections. This guide will cover a technique called a "MeshUV" based conversion that relies on a Wavefront ".obj" based polygon mesh and UV layout to define the image projection transform.

Optionally you could use a YouTube 360 monoscopic 2D centric "direct" image projection conversion macro called "[YouTubeCubemap3x22Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22Equirectangular)" if you want to avoid using a MeshUV approach.

Also, it's worth mentioning that KartaVR supports "MacroLUTs" that can be loaded into the Fusion Standalone "LUTs" viewer window control. These specialized LUTs provide an interactive preview of the image projection conversion on any media loaded into that viewer window context on-the-fly. For more information about LUT based approaches, check out the [KartaVR MacroLUTs documentation](https://www.andrewhazelden.com/projects/kartavr/docs/luts.html).

![[Kartaverse Workflows.img/image3__fix4.png]]

### YouTube 360 Image Projections

YouTube 360 Image Projections

When you use a video downloading tool to save a local copy of a YouTube 360 video, you will likely come across a video file that is stored in one of the following "cubic view" based image projection layouts. KartaVR can be used to translate these cubic image projections back into an equirectangular format.

### YouTube 3x2 Cubic Face Layout - Monoscopic 2D

YouTube 3x2 Cubic Face Layout - Monoscopic 2D

(Macros:/KartaVR/Images/youtube_cubemap3x2.jpg)

![[Kartaverse Workflows.img/image22__fix3.png]]

### YouTube 2x3 Cubic Face Layout - Stereo 3D Side By Side

YouTube 2x3 Cubic Face Layout - Stereo 3D Side By Side

(Macros:/KartaVR/Images/youtube_cubemap2x3.jpg)

![[Kartaverse Workflows.img/image21.png]]

### KartaVR Conversion OBJ Meshes

KartaVR Conversion OBJ Meshes

KartaVR includes two MeshUV centric conversion meshes. These polygon models can be loaded into your Fusion composite using the "FBX File" control on the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" and "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" macros.

The OBJ meshes are located on disk using the following Fusion based PathMap:

-   Macros:/KartaVR/Images/youtube_cubemap2x3.obj
-   Macros:/KartaVR/Images/youtube_cubemap3x2.obj

### KartaVR Built-In Example Comps

KartaVR Built-In Example Comps

The following three example comps show a few different ways to rework panoramic imagery. These comps are located inside the "Reactor:\\Deploy\\Comps\\KartaVR" PathMap based folder:

-   [MeshUV Conversions.comp](https://www.andrewhazelden.com/projects/kartavr/docs/examples.html#meshuv-conversions)
-   YouTube Cubemap3x2.comp
-   YouTube180 Conversions.comp

### Macro Documentation

Macro Documentation

-   [MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)
-   [MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)
-   [YouTubeCubemap3x22CubicFaces](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22CubicFaces)
-   [YouTubeCubemap3x22Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#YouTubeCubemap3x22Equirectangular)

### MeshUV2Equirectangular Macro Usage

MeshUV2Equirectangular Macro Usage

Note: This macro node expects you to link in an OBJ or FBX formatted polygon mesh using the "FBX File" control in the Inspector view.

#### Step 1. Create a new Fusion composite.

**Step 1.** Create a new Fusion composite.

![[Kartaverse Workflows.img/image20__fix3.png]]

#### Step 2. Add a YouTube 360 downloaded video file to your Fusion composite using either a Loader Node (in Fusion Studio), or a MediaIn node (in Resolve's Fusion Page).

**Step 2.** Add a YouTube 360 downloaded video file to your Fusion composite using either a *Loader* Node (in Fusion Studio), or a *MediaIn* node (in Resolve's Fusion Page).

![[Kartaverse Workflows.img/image12__fix6.png]]

#### Sample Media

**Sample Media**

KartaVR provides a YouTube 360 "Monoscopic 2D" based still image that you can use to test the image projection conversion process out. You can paste in the following KartaVR PathMap based file path into a Loader node's *Filename* control:

Macros:/KartaVR/Images/youtube_cubemap3x2.jpg

![[Kartaverse Workflows.img/image16.png]]

When you view this node's output in the left viewer window you will see the following output that has an arrangement of 3 horizontal cubemap faces by two vertical cubemap faces. This is often shortened down to being called a *3x2* (three by two) cubic face layout. The cubic faces are laid out in the order of Left, Front, Right, Bottom, Back, Top.

![[Kartaverse Workflows.img/image22__fix3.png]]

#### Step 3. With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard.

**Step 3.** With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard.

![[Kartaverse Workflows.img/image14__fix1.png]]

This hotkey will display the "Select Tool" dialog that is used to quickly add nodes to your composite. Start typing the words "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" into the Select Tool dialog until the macro is selected in the list. Then press the "Add" button.

At this point, a new node has been added to the Fusion composite.

A file browsing window will appear automatically as soon as a new "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node is placed in the comp. This dialog is used to select the mesh that will be used for the conversion. The OBJ or FBX formatted polygon model you select will then be entered in the "FBX File" control in the Inspector view.

Let's select the "youtube_cubemap3x2.obj" mesh file in this folder. This mesh is used for monoscopic 2D footage saved from YouTube 360.

![[Kartaverse Workflows.img/image13__fix2.png]]

You can manually browse to the folder that holds the KartaVR sample images and MeshUV models by navigating to the following Pathmap folder:

Macros:/KartaVR/Images/

That PathMap folder location translates automatically into the following absolute filepath based locations on your system:

(Note: The C:\\ProgramData\\ folder might be set to be invisible on a default Windows OS install. That setting can be adjusted in the Explorer window's properties in the ribbon toolbar.)

Fusion Standalone Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Resolve Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\DaVinci Resolve\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

If you click on the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node and load its controls in the Inspector view the controls should look like this:

![[Kartaverse Workflows.img/image18__fix4.png]]

#### Step 4. In the Fusion Nodes view you need to connect your YouTube 360 footage's MediaIn/Loader node output connection to the "MeshUV2Equirectangular" node's input connection.

**Step 4.** In the Fusion Nodes view you need to connect your YouTube 360 footage's *MediaIn*/*Loader* node output connection to the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node's input connection.

![[Kartaverse Workflows.img/image1__fix8.png]]

This node connection allows the RGBA image data from the *MediaIn*/*Loader* node to flow into the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node.

Now we can view the output from the "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node on the right viewer window.

Looking at the screenshot below we can see how the YouTube 3x2 cubic face media was loaded into Fusion, the media was then reformatted into an Equirectangular format, and the result was then displayed on the right viewer window.

![[Kartaverse Workflows.img/image6__fix5.png]]

#### Step 5. You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone).

**Step 5.** You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone).

![[Kartaverse Workflows.img/image8.png]]

![[Kartaverse Workflows.img/image4.png]]

### MeshUV2EquirectangularStereo Macro Usage

MeshUV2EquirectangularStereo Macro Usage

A stereoscopic 3D based MeshUV conversion node is available in KartaVR and it is called [MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo). The macro node can be used to convert YouTube 360 footage that is stereoscopic 3D into an Equirectangular Over-Under or Side-By-Side Stereoscopic 3D format.

This node also uses an FBX or OBJ formatted mesh to control the panoramic image conversion via the "FBX File" control in the inspector window just like the previous "[MeshUV2Equirectangular](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2Equirectangular)" node.

#### Step 1. Create a new Fusion composite. {#ref4}

**Step 1.** Create a new Fusion composite.

![[Kartaverse Workflows.img/image20__fix3.png]]

#### Step 2. Add a YouTube 360 Stereoscopic 3D downloaded video file to your Fusion composite using either a Loader Node (in Fusion Studio), or a MediaIn node (in Resolve's Fusion Page).

**Step 2.** Add a YouTube 360 Stereoscopic 3D downloaded video file to your Fusion composite using either a *Loader* Node (in Fusion Studio), or a *MediaIn* node (in Resolve's Fusion Page).

![[Kartaverse Workflows.img/image7__fix1.png]]

#### Sample Media {#ref5}

**Sample Media**

KartaVR provides a YouTube 360 "Stereoscopic 3D" based still image that you can use to test the image projection conversion process out. You can paste in the following KartaVR PathMap based file path into a Loader node's *Filename* control:

Macros:/KartaVR/Images/KartaVR/Images/youtube_cubemap2x3_stereo.jpg

![[Kartaverse Workflows.img/image9__fix3.png]]

When you view this node's output in the left viewer window you will see the following output that has a Side-By-Side stereoscopic 3D frame arrangement of 2 horizontal cubemap faces by three vertical cubemap faces (per eye view).

This view layout is often shortened down to being called a *2x3* stereo SBS (two by three stereo side-by-side) cubic face layout. The cubic faces are laid out in the order of Right, Top, Front, Back, Left, Bottom.

![[Kartaverse Workflows.img/image21.png]]

#### Step 3. With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard. {#ref6}

**Step 3.** With the Fusion Nodes view active in the foreground, press the "Shift + Space" hotkey on your keyboard.

![[Kartaverse Workflows.img/image15__fix2.png]]

This hotkey will display the "Select Tool" dialog that is used to quickly add nodes to your composite. Start typing the words "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" into the Select Tool dialog until the macro is selected in the list. Then press the "Add" button.

At this point, a new node has been added to the Fusion composite.

A file browsing window will appear automatically as soon as a new "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node is placed in the comp. This dialog is used to select the mesh that will be used for the conversion. The OBJ or FBX formatted polygon model you select will then be entered in the "FBX File" control in the Inspector view.

Let's select the "youtube_cubemap2x3.obj" mesh file in this folder. This mesh is used for stereoscopic footage saved from YouTube 360.

![[Kartaverse Workflows.img/image5__fix4.png]]

You can manually browse to the folder that holds the KartaVR sample images and MeshUV models by navigating to the following Pathmap folder:

Macros:/KartaVR/Images/

That PathMap folder location translates automatically into the following absolute filepath based locations on your system:

(Note: The C:\\ProgramData\\ folder might be set to be invisible on a default Windows OS install. That setting can be adjusted in the Explorer window's properties in the ribbon toolbar.)

Fusion Standalone Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Resolve Paths

Windows Reactor Path:

C:\\ProgramData\\Blackmagic Design\\DaVinci Resolve\\Fusion\\Reactor\\Deploy\\Macros\\KartaVR\\Images\\

Mac Reactor Path:

/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

Linux Reactor Path:

/var/BlackmagicDesign/DaVinci Resolve/Fusion/Reactor/Deploy/Macros/KartaVR/Images/

If you click on the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node and load its controls in the Inspector view the controls should look like this:

![[Kartaverse Workflows.img/image2__fix7.png]]

#### Step 4. In the Fusion Nodes view you need to connect your YouTube 360 footage's MediaIn/Loader node output connection to the "MeshUV2EquirectangularStereo" node's input connection.

**Step 4.** In the Fusion Nodes view you need to connect your YouTube 360 footage's *MediaIn*/*Loader* node output connection to the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node's input connection.

![[Kartaverse Workflows.img/image10__fix7.png]]

This node connection allows the RGBA image data from the *MediaIn*/*Loader* node to flow into the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node.

Now we can view the output from the "[MeshUV2EquirectangularStereo](https://www.andrewhazelden.com/projects/kartavr/docs/macros-guide-conversions.html#MeshUV2EquirectangularStereo)" node on the right viewer window.

Looking at the screenshot below we can see how the YouTube 3x2 cubic face media was loaded into Fusion, the media was then reformatted into an Equirectangular format, and the result was then displayed on the right viewer window.

![[Kartaverse Workflows.img/image19__fix5.png]]

#### Step 5. You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone). {#ref7}

**Step 5.** You can render this footage back to an image sequence or movie file on disk using either a MediaOut node (in Resolve), or a Saver node (in Fusion Standalone).

![[Kartaverse Workflows.img/image11__fix5.png]]

![[Kartaverse Workflows.img/image17__fix3.png]]