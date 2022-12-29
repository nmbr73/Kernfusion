---
author: Andrew Hazelden
tags:
  - Kartaverse
  - .scrivener-export
---



> [!wiki-todo]- Scrivener Export - Reformatting Needed!
> This article is an export of a Scrivener document. It will definitely need at least some reformatting to work in Obsidian and MkDocs. Delete this note once the article's formatting  has been fixed to some extent.

The ACES color management system is an adopted industry-wide standard for the entertainment sector. All footage and textures used in film, animation, visual effects, and games are created, edited, and displayed with ACES color profiles enabled.

<https://acescentral.com>

"ACEScg" is the color profile used for computer generated imagery.

All digital cinema camera systems have custom vendor specific ACES color profiles.

Finished film and TV projects are delivered as DCPs (digital cinema packages) and DCDM (digital cinema distribution masters). These delivery formats are based around a specific "ACES 2065-1" color encoding standard. This is used for the long-term archiving of all media in the motion picture industry.

Library of Congress DCDM Guide:

[Digital Cinema Initiative Distribution Master (DCDM)](https://www.loc.gov/preservation/digital/formats/fdd/fdd000177.shtml)

### OpenColorIO

OpenColorIO

As you start to work with media from a wide range of sources, including digital cinema cameras, RAW high-bit-depth footage from 360VR camera rigs, and CG renderings, the need for an end-to-end color managed workflow becomes essential and unavoidable.

Currently, your best option is to consider using an ACES OpenColorIO v1.0.3 based color managed workflow in Fusion Studio v18.1 and Fusion Render Node 18.1.

<https://opencolorio.org/>

OCIO Resources:

-   [ACES Central](https://community.acescentral.com/)
-   [OpenColorIO Documentation](https://opencolorio.readthedocs.io/en/latest/)
-   [OpenColorIO GitHub Repo](https://github.com/AcademySoftwareFoundation/OpenColorIO)
-   [YouTube \| StatixVFX \| Fusion Pipeline - Getting started with OCIO and ACES](https://www.youtube.com/watch?v=Sfer5VZKe1U)

### Installing OpenColorIO

Installing OpenColorIO

![[Kartaverse/Immersive Pipeline Integration Guide/img/image388.png]]

Installing OpenColorIO v1.0.3 is done by downloading the resources directly from an OCIO repository, or to install the OCIO config files with the Reactor Package Manager.

Unzip the OCIO files and either store the "aces" folder locally on your laptop/workstation's internal hard disk, or if you are working in a studio environment move the OCIO config folder to a shared mount point on a file server that is accessible to the machines on your local LAN subnet so the Fusion Render Node systems and other computers can access the content.

Next, you need to define a custom environment variable that tells all of the OCIO compatible graphics tools on your system where to find your aces config folder. The environment variable is named "OCIO", and the value you define for that environment variable is the full absolute filepath on your hard disk to the "config.ocio" file.

### Using OpenColorIO in Fusion

Using OpenColorIO in Fusion

With OCIO installed on your system, in Fusion Studio v18.1 you can then add a viewer LUT that allows you to preview footage correctly on your monitor. A viewer LUT allows you to maintain the original working color space and gamut for the footage loaded into your composite, while previewing the content in a correct fashion on your monitor so you will be able to make informed decisions as a compositor.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image83.png]]

The "OCIOColorspace" node is then used by Fusion's node graph to convert your footage into the right space for your needs.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image275.png]]

With the OCIOColorspace node selected in the Nodes view you can then access the controls in Fusion's Inspector view. The primary controls you are concerned with in this node are the "Source Space" and "Output Space" settings.

![[Kartaverse/Immersive Pipeline Integration Guide/img/image210.png]]

When you are working on a large-scale professional media project you will typically receive and deliver footage as ACES 2065-1 formatted content when interfacing with external vendors.

All your in-house compositing, and node-based 360VR/180VR/Fulldome based stitching, paint, and roto operations should be done using ACEScg.

ACEScg usage at your studio also covers all of the imagery that your 3D department renders when they deliver EXR format media to a compositor that contains beauty and denoised RGBA render passes coming from production renderers like RenderMan, V-Ray, Arnold, Redshift, Houdini Karma, or Blender Cycles X.

An important detail for your 3D department to keep in mind, when generating OpenEXR based image sequences from a 3D rendering package, is that you can opt to use a 16-bit half-float framebuffer, with the ZIPS or DWAA codec for your RGBA based beauty pass and denoised content.

The technical passes stored in an EXR file, like Z-depth, cryptomatte, world position, UV, and motion vectors should however be kept as 32-bit float image data for numerical precision reasons. Do not use a lossy compression codec on technical passes as it will create visual artifacts when you go to apply those channels in your compositing workflows.

### OpenImageIO

OpenImageIO

OIIO Resources:

-   [OIIO Docs](https://openimageio.readthedocs.io/en/v2.4.5.0/)
-   [OIIO GitHub Repository](https://github.com/OpenImageIO/oiio)