---
tags: [export, export-scrivener, revise]
xself: 'DEV Building an Effective nVP (Neural Virtual Production) Sound Stage'
xhead: 'Kartaverse Workflows'
xtail: 'KickAss ShaderZ for Fusion'
xprev: 'DEV The Ultimate Guide to OpenUSD Pipeline Development'
xnext: 'KickAss ShaderZ for Fusion'
---

**Kartaverse Workflows \| Building an Effective nVP (Neural Virtual Production) Sound Stage**

Kartaverse \| nVP On-set Solutions

First Draft

Created: 2022-12-07 Last Updated 2022-12-10 07:30 AM UTC -4

### Overview {#ref12}

Overview

This guide is a companion resource for the [OpenDisplayXR VDD (Virtual Device Driver)](#dev-opendisplayxr-vdd-virtual-device-driver) and Kartaverse "KartaVP" open-source immersive content production pipeline projects. This draft document explains how to approach driving large-scale nVP (Neural Virtual Production) workflows in an efficient and performant fashion.

Included with the guide is a high-level discussion of the back-end hardware systems integration considerations a new nVP sound stage operator needs to consider when switching away from traditional "[machinima](https://en.m.wikipedia.org/wiki/Machinima)" style [OpenGL](https://en.wikipedia.org/wiki/OpenGL)/[DirectX](https://en.wikipedia.org/wiki/DirectX) based LED panel rendering workflows.

### OpenGL Rasterization Rendering

OpenGL Rasterization Rendering

[OpenGL](https://en.wikipedia.org/wiki/OpenGL) real-time rendering is still quite common, as of December 2022. OpenGL started out as [IrisGL on SGI IRIX](https://en.wikipedia.org/wiki/IRIS_GL) systems, and the descendant of that API is pretty much the number one option used in (legacy) [rectilinear lens](https://en.wikipedia.org/wiki/Rectilinear_lens) based [rasterizer](https://en.wikipedia.org/wiki/Rasterisation) VP pipeline architectures.

The fact that OpenGL rasterization techniques have endured for decades is impressive. Many of the essential OpenGL API developer documentation resources pre-date the 1997 release of the [Nintendo64 GoldenEye 007 game](https://en.m.wikipedia.org/wiki/GoldenEye_007_(1997_video_game)). The N64 hardware performed photo-realistic rendering via OpenGL running on [SGI](https://en.wikipedia.org/wiki/Silicon_Graphics) (Silicon Graphics) derived graphics chips. It's a stunning technical and engineering accomplishment to keep the OpenGL API going in such a consistent fashion for so long, really! 👍

### Neural VP Rendering

Neural VP Rendering

KartaVP and the OpenDisplayXR VDD provided "NeuralFoam Engine" renderer are developed as cross-platform compatible, free open-source tools. This is an intentional choice to help move forward the objective of modernizing existing VP workflows with ML driven neural rendering techniques.

With NeRF approaches, content creators can embrace recent advances in the state of the art technology used in volumetric video capture/playback.

In 2023 the emergence of off-the-shelf nVP stage solutions will hopefully provide feature film-level [DOPs](https://en.m.wikipedia.org/wiki/Directors_of_Photography) (Director of Photography) with the chance to unlock exciting new potential for 100% real-time rendered digital environments. [NeRF has already demonstrated its potential](https://blogs.nvidia.com/blog/2022/08/05/instant-nerf-creators-siggraph/) to deliver levels of photorealism (and rendering features) never witnessed in conventional[rasterized](https://en.wikipedia.org/wiki/Rasterisation)-based on-set virtual production systems deployed between 2015-2022.

### Distributed NeRF Rendering for Live-Action Virtual Production Background Environments

Distributed NeRF Rendering for Live-Action Virtual Production Background Environments

If you review the [OpenXR-VR Virtual Device Driver Google Docs file](https://docs.google.com/document/d/1RRnaui-QQ689v6xH30GK36Hhf1yCRGcBldFwapOakWo/edit?usp=sharing), you will see a "Demo Apps" section that has notes that cover a novel "distributed NeRF rendering" pipeline, and how that can be achieved in a modular fashion, (with relatively low design complexity), to power near-infinite LED video wall size, for an nVP stage setup that supports an arbitrary geometric screen surface shape.

![[Kartaverse Workflows.img/image3.png]]

This approach empowers the construction of highly-scalable virtual production workflows that use NeRF techniques on large-scale [LED display panel based cylindrical VP](https://en.wikipedia.org/wiki/On-set_virtual_production) [sound stages](https://en.wikipedia.org/wiki/Sound_stage).

The core aspect is the use of a conventional [10 Gb Ethernet](https://en.wikipedia.org/wiki/10_Gigabit_Ethernet) networked client/server method. This drives a genlock synced, GPU-powered, rack-mounted NeRF-based distributed rendering appliance.

The key aspect is that the individual NeRF "worker nodes'' are used as multi-view tile generators. Of special importance in the system design is to avoid the need of OpenGL [quad buffer](https://en.wikipedia.org/wiki/Multiple_buffering) rendering support in the worker node's GPUs.

One worker node is configured to direct-drive high-resolution 24Hz - 120 Hz output. The generated frame-buffer data is routed via an [NewTek NDI](https://www.aja.com/products/bridge-ndi-3g) IP video stream or a [fibre-encoded SDI](https://www.blackmagicdesign.com/products/blackmagicfiberconverters) cable and either an [ATEM switcher](https://www.blackmagicdesign.com/products) or [SmartVideo Hub](https://www.blackmagicdesign.com/products/smartvideohub) connection to either individual [LED display](https://www.roevisual.com/uploads/files/Product%20File/Ruby/ruby-brochure-1.5f1.9b-aug-10-2022.pdf) panel's [LED video processor](https://www.bromptontech.com/product/s8/) unit.

  -----------------------------------------------------------------------------------------------------------------------------------------------------------
        ![[Kartaverse Workflows.img/image5.png]]AJA NDI to SDI Encoder         ![[Kartaverse Workflows.img/image4.png]]BMD Smart Video Hub SDI Video Routing
  --------------------------------------------------------------------------- -------------------------------------------------------------------------------
   ![[Kartaverse Workflows.img/image1.png]]Brompton Tessera S8 LED Processor           ![[Kartaverse Workflows.img/image2.png]]Roe Visual LED panel

  -----------------------------------------------------------------------------------------------------------------------------------------------------------

I feel this NeRF distributed rendering workflow best mirrors the concepts that Disguise, [Unreal + nDisplay](https://www.unrealengine.com/en-US/tech-blog/explore-ndisplay-technology-limitless-scaling-of-real-time-content), [Assimilate LiveFX](https://www.assimilateinc.com/products/livefx/), [Notch](https://www.notch.one), and [TouchDesigner](https://derivative.ca/download) [TouchEngine](https://derivative.ca/UserGuide/TouchEngine) all support for [OpenGL](https://en.wikipedia.org/wiki/OpenGL)/[DirectX](https://en.wikipedia.org/wiki/DirectX) rendered real-time "Machinima" content today.

All [NVIDIA InstantNGP](https://github.com/NVlabs/instant-ngp) API based NeRF rendering implementations support a cropped 3D DoD (Domain of Definition) bounding box.To fully optimize the render pipeline, and efficiently extract all usable VRAM on the [NVLink bridge](https://en.wikipedia.org/wiki/NVLink) connected GPUs pairs; one needs to bind the active GPU worker node's "[nCam tracked](https://www.ncam-tech.com/real-time-camera-tracking-on-location/)" camera view frustum to the precise DoD region cropping control in NVIDIA's InstantNGP testbed program.

This DoD usage allows a VP production setup, that features an arbitrarily shaped LED panel based video wall, to handle voxel scene scales an order of magnitude larger than most people could ever conceivably imagine.