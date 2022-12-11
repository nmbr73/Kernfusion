Kartaverse is an extensive open-source media production pipeline that integrates seamlessly with a broad range of post-production tools used in VFX, VP, XR, 360VR, fulldome, volumetric video, computer vision, and machine learning workflows.

## The Kartaverse Packages

The core technologies that are part of the Kartaverse v5 suite are namely:

-   [[KartaVR]]
-   KartaVP
-   KartaVision
-   KartaSonic
-   [[KartaLink]]
-   CompX
-   [[Vonk Ultra]]

These modules are based upon the culmination of many years of research & development.

Kartaverse is delivered via the web as free open-source software. It costs you nothing to download and use the Kartaverse tools for both personal and commercial usage. It even works fine with Resolve (Free) running as the host program. The main tool, KartaVR, is Apache 2.0 licensed. Several tools like Vonk Ultra are GPL v3 licensed.

## Kartaverse Project Assistance

If you want to assist the Kartaverse effort, the best way to help is to provide access to camera original "raw" unprocessed footage from a wide range of digital cinema cameras, DSLR/mirrorless cameras, flagship multi-lens mobile phones, drones, 360VR camera rigs, structured light depth sensors, lightfield cameras, and LIDAR scanners with permissive licensing. Anything you can share helps greatly.

Having new, modern, example footage to work with helps the whole Kartaverse community as it pushes forward the ongoing development of new tools, techniques and workflows. 

It is important, if possible, that the sample footage is shared with permissive license terms that would allow the media to be used under a [Creative Commons Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/) license. This media usage policy allows new example project files to be created and shared broadly with the community for learning purposes. 

If you have access to sample footage that you are willing to share and are the copyright holder, [please email me](mailto:andrew@andrewhazelden.com). Thanks!

![](https://lh5.googleusercontent.com/tRxKZVDXHhtWnqhHML_bSS5XFYnTIrKBjbp51LPkGWsW69d0Ir2vp6mrpTyupvtzqX1DcYReKYmxP7srGqTTNM9a8VaYAK9gNybmbVnOdppKAtuup-08r91j12tSjac7fX_KavOQmLQqe8bs1RGPhrywRgqrvMJz_stk0-PWeUpyQFrkWcvj4KdZih8GYA)

## The Karta Development Journey

Many of the workflow ideas and features found in the Kartaverse suite started development in the following toolsets that I had the opportunity to collaborate on as either a developer, co-developer, software maintainer, or technical writer.

  

[Domemaster Photoshop Actions Pack](https://github.com/AndrewHazelden/Domemaster-Photoshop-Actions-Pack), [Domemaster3D](https://github.com/zicher3d-org/domemaster-stereo-shader), [Domemaster Fusion Macros](https://forum.blackmagicdesign.com/viewtopic.php?f=13&t=34060), [RocketComp](http://www.cgchannel.com/2015/07/andrew-hazelden-releases-rocketcomp-for-maya/), [PlayblastVR](http://www.cgchannel.com/2016/07/andrew-hazelden-releases-playblastvr-for-maya-v2-0/), [Lightfielder Suite](https://github.com/AndrewHazelden/LightfielderSuite), [OBQ Shaders](https://github.com/madesjardins/Obq_Shaders), [CompX](https://github.com/AndrewHazelden/CompX), [dome2rect](https://github.com/AndrewHazelden/dome2rect), [Panoramic Geometry Collection](https://github.com/AndrewHazelden/Panoramic_Geometry_Collection), [CameraSnap](https://github.com/AndrewHazelden/CameraSnap_Tools), [Z360 6DOF Stereo VR Tools](https://github.com/AndrewHazelden/Z360-6DOF-Stereo-VR-Tools), [Dover Planar Grid Array Camera](https://youtu.be/sKbzGgLLCoo), [KartaVR Volumetric Capture Utility](https://youtu.be/4rH4hbzQdYU), [HDR Pano Camera Rig PIC32 Microcontroller Firmware](https://libstock.mikroe.com/projects/view/1129/building-an-hdr-panoramic-camera-rig), [IRIXBASIC](https://github.com/AndrewHazelden/IRIXBASIC), [Mission Control](https://github.com/AndrewHazelden/Mission_Control_for_Raspberry_Pi/), WarpStitch TD, [Spicy Acorn Vonk](https://github.com/Spicy-Acorn), [Cryptomatte](https://github.com/Psyop/Cryptomatte), [KickAss ShaderZ](https://www.steakunderwater.com/wesuckless/viewtopic.php?t=3648), [SilhouetteFX Python Scripts](https://github.com/AndrewHazelden/SilhouetteFX-Python-Scripts), along with the Steakunderwater [Reactor Package Manager](https://gitlab.com/WeSuckLess/Reactor), the Dover Studios, Inc. in-house pipeline tools BucketTime/Popcorn, the [CameraCommander volumetric video](https://www.youtube.com/watch?v=dWECCiS__OY) pipeline, the ongoing Kino TR2X virtual production project, and the Borikuaverse project.

## Choosing Your Installation Packages

The Kartaverse package installation approach is very flexible. Reactor makes it possible to do a minimal installation of only the KartaVR features you need. This is a good choice when getting started so you don't become overwhelmed by choice.

# ![](https://lh5.googleusercontent.com/dJOAvNlyqSQwTcbQCNFnSOaMQXXbiIaHoozIW0f_R2KJpF3GKm-sR2dCaqGRt6LfBUwVs-gW6TAO9sPibcVrQaG0rfDC0OIpz_1NR-ZYGpx4E2CE8bizO06QN8LjdRh5VF_jy_pLx9oQxNUdr23SAMJYkzf4ZwEeCPz1vAhryqQdgK7duFwS7_IqYYlGsA)

If you are are an entry-level 360VR content creator, who is new to using KartaVR in Resolve/Fusion, then you might choose to only install the "[Reframe360Ultra](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=36688#p36688)" and "[WarpStitchUltra](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=41337#p41337)" packages using Reactor. This is a good entry point during your first few weeks of using the toolset. These specific Reactor packages make it possible to work efficiently with fisheye, 360VR, and 180VR media.

  

As you become more comfortable you could slowly add more Kartaverse tools as required.

  

Alternatively, if you want to install every possible component in the full Kartaverse suite, it requires the dedication of several hours to set up the entire toolchain to a full production-usage level. This time estimate includes installing Resolve/Fusion/Fusion Render Node, configuring the settings in a render manager for each of the render nodes, and customizing the program execution paths for each of the 3rd party integration bindings available in the toolset.

## Kartaverse Development Reference Hardware

The Kartaverse v5 release was developed using the following reference computer hardware:

  

Windows 10 & 11 / Rocky Linux 8.5:

-   [ASRock TRX 40 Creator Motherboard](https://www.asrock.com/mb/AMD/TRX40%20Creator/)
    
-   [AMD Ryzen Threadripper 3990X Desktop CPU](https://www.amd.com/en/products/cpu/amd-ryzen-threadripper-3990x)
    
-   [NVIDIA GeForce RTX 3090 GPU 24 GB VRAM](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3090-3090ti/)
    
-   256 GB RAM
    
-   10 GB Ethernet Networking
    

  

macOS Monterey:

-   M1 MacBook AIR 16GB RAM, 2 TB HD
    
-   OWC Thunderbolt 3 Pro Dock with 10GB Ethernet
    

  

Oculus Quest "Santa Cruz" HMD Dev Kit

## Kartaverse Learning Resources

-   [Kartaverse Google Group](https://groups.google.com/g/kartaverse)
    
-   [KartaVR Documentation](https://andrewhazelden.com/projects/kartavr/docs/)
    
-   [KartaVR Facebook Group](https://www.facebook.com/groups/582228925914491/) (Paused)
    
-   [KartaVR Steakunderwater Forum Thread](https://www.steakunderwater.com/wesuckless/viewtopic.php?p=21111#p21111)
    
-   [Reactor Package Manager Steakunderwater Forum Thread](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=3067)
    


[[Vonk Ultra#Vonk Ultra Learning Resources]]
    

### Workflow Guides

-   [KartaVR Compositing Examples](https://andrewhazelden.com/projects/kartavr/docs/examples.html)
    
-   [KartaVR Workflows | Creating ST Maps](https://docs.google.com/document/d/1lQ-wc9ucLJqj-HL7iKMNWA71klV5O1fk2-JicRB6gDY/edit?usp=sharing)
    
-   [KartaVR Workflows | YouTube 360 to Equirectangular Conversions](https://docs.google.com/document/d/1-7qD_xpxrYhczR5VihShTfdQ9u5E7yYGTtOcdw3DBXE/edit?usp=sharing)
    
-   [Kartaverse Workflows | Creating Volumetric NeRFs](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit?usp=sharing)
    
-   [Kartaverse Workflows | Jupyter Notebook for Resolve/Fusion](https://docs.google.com/document/d/1Jza91fL7csYVOSgYCMsa17r3DMmaJdwXevieTh-tqWg/edit?usp=sharing)
    
-   [Kartaverse Workflows | SketchFab in VR Via QuestLink](https://docs.google.com/document/d/1sWkv5H7ZAM1SnqrEXYRL3kBKnvjqmDjKTA9v9ObN490/edit?usp=sharing)
    


