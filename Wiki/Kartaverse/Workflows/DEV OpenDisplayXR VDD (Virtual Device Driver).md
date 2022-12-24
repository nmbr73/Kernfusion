---
tags: [export, export-scrivener, revise]
xself: 'DEV OpenDisplayXR VDD (Virtual Device Driver)'
xhead: 'Kartaverse Workflows'
xtail: 'KickAss ShaderZ for Fusion'
xprev: 'Domemaster Photoshop Actions Pack'
xnext: 'DEV The Ultimate Guide to OpenUSD Pipeline Development'
---

**OpenDisplayXR VDD (Virtual Device Driver)**

*"A Simulated OpenVR/OpenXR-Based Virtual Hardware Device"*

First Draft

Created: 2022-12-02 Last Updated 2022-12-08 12:10 PM (UTC -4)

### Project Objectives

Project Objectives

Create a working group to develop a cross-platform compatible, hybrid [OpenVR](https://en.wikipedia.org/wiki/OpenVR)/[OpenXR](https://en.m.wikipedia.org/wiki/OpenXR) API-based virtual display driver solution for arbitrary multi-view display, and video projection hardware.

When completed, the "OpenDisplayXR VDD (Virtual Device Driver)" toolset works as a simulated OpenVR/OpenXR-based virtual hardware device.

The VDD software powers the visual output that is sent in real-time to multiple displays in parallel. The VDD SDK allows you to transform-VR optimised graphics rendering API calls into a pipeline for arbitrary multi-view stereo media creation.

The final-frame pixels can be rendered on any number of local-region hosted Amazon AWS EC2 instances, or the full process can run 100% locally on-prem with a GPU-equipped laptop, desktop, workstation, rack-mounted server, or a virtualized VIRSH/QEMU compute instance with hardware accelerated PCIe passthrough support.

The modular codebase that the OpenDisplayXR project is creating, right now, is covered by a 100% free, open-source "license mix" based Apache/NVIDIA source code license terms, based upon the individual VDD microservices you install.

A virtual device driver rendering approach allows existing [DCC](https://en.m.wikipedia.org/wiki/Content_creation) (Digital Content Creation) software, that supports conventional [VR HMDs](https://en.m.wikipedia.org/wiki/HMD) (Head Mounted Displays), to automatically work interactively with arbitrary 3rd party immersive display systems used for [stereoscopic](https://en.m.wikipedia.org/wiki/Stereoscopy), [360VR](https://en.m.wikipedia.org/wiki/VR_photography), [180VR](https://www.usa.canon.com/shop/p/rf5-2mm-f2-8-l-dual-fisheye?color=Black&type=New&cjevent=850c55ae26be11ec8103d19b0a82b82c), [iDome](http://paulbourke.net/dome/iDome/), [SfM](https://en.m.wikipedia.org/wiki/Structure_from_motion), lightfield, and [multi-view](https://en.m.wikipedia.org/wiki/3D_reconstruction) applications.

This user-programmable image generation bridge layer offers more flexibility, that enables use cases like the ability to drive in real-time [passive 3D stereo-monitor](https://www.schneider-digital.com/de/produkte/passive-3d-stereo-monitore/#highlights) display solutions, immersive [caves](https://en.wikipedia.org/wiki/Cave_automatic_virtual_environment), [fulldome theatres](https://www.cosm.com/what-we-do/screens/), [projection mapping](https://www.barco.com/en/solutions/Projection-mapping), [virtual production LED stages](https://www.darkmatters.one) with composting-created [live-action stitched 360VR cylindrical video](https://www.youtube.com/watch?v=IAy_WXqRMX0) and [2D/2.5D/3D digital matte paintings](https://vimeo.com/71148018).

### Modular VDD Microservices

Modular VDD Microservices

A foundational, key design aspect of the "OpenDisplayXR VDD (Virtual Device Driver)" SDK rollout, is the consistent use of a [microservices architecture](https://en.wikipedia.org/wiki/Microservices). The use of microservices is applied equally to internal core operators and external user-added microservice features. All microservice plugins get bare-metal direct access to the rendering hardware and VDD-API-provided functions.

The OpenDisplayXR VDD operator nodes are designed to be chained together in novel ways by the end user. This process is streamlined, with the help of a powerful preset system, visual macro-building tools, and support for deeply nested, externally referenced flowcharts.

When the node graph is evaluated (cooked) during real-time playback, a node-based concatenation approach is used by the VDD node's chosen [JIT](https://en.wikipedia.org/wiki/Just-in-time_compilation) (Just in Time) compiler that is designed to optimize the rendering performance. Memory management is improved by the JIT compiler's ability to dynamically flatten a series of "chained operations" at render time if the nodes have matching class types.

Background: The VDD API design choice to rely on [node-based](https://en.wikipedia.org/wiki/Node_graph_architecture) microservices comes from experiences learned during the development of the open-source Vonk Data Node project. Vonk includes 329 fuses.

A fuse is created as a plain-text-based [LuaJIT](https://en.wikipedia.org/wiki/LuaJIT) plugin. Data nodes are interconnected in a [DAG](https://en.wikipedia.org/wiki/Directed_acyclic_graph) (Directed Acyclic Graph) like nodal environment, through the use of a wide range of node-based input and output connection data types that can be converted (and [typecasted](https://en.wikipedia.org/wiki/Type_conversion) on the fly) as needed.

### Nodal Operator Types

Nodal Operator Types

The node-based content that defines a specific VDD setup, is exported to disk via a DOM (Document Object Model) approach into either a plain-text encoded JSON file, or a CompX-flavored OpenUSD ASCII (.usda) file.

End users can extend any of the operators available inside the micro-services architecture via the installation of plain-text-based JIT-evaluated plugins, or compiled [C++](https://en.m.wikipedia.org/wiki/C%2B%2B) based plugins.

Full source-code access is provided for all internal VDD micro-service operators, which allows the core features to be customized and extended by the end user on an as-needed basis.

The core operator types used in a typical multi-view OpenXR-OpenVR driven VDD project include:

-   HID Input
-   Output Driver
-   Fragment Shaders
-   Data Nodes
-   Scripting
-   Network Transport

End users are free to implement support for new class types in their own microservice plugins. Through the use of a JIT architecture, VDD supports the creation and use of arbitrary "data node" based input and output data types on-the-fly.

### Microservices Package Manager

Microservices Package Manager

OpenDisplayXR has a custom LuaJIT-based package manager that is under development.

To streamline deployments, the package manager will allow administrators to perform "network broadcast based" syncing of custom microservice plugins across a local subnet of GPU-based worker nodes.

Newly added microservices that are code-signed, and approved for use by a sysadmin, will be re-initialized in only a few moments by the VDD controller process. This allows deployments to occur in a transparent "system wide" fashion that works seamlessly across a large GPU clutter that runs across several different operating systems and CPU/GPU architectures.

Microservice updates happen in a low-friction fashion, without requiring the end-user to quit a VDD integration plugin's host process, or requiring someone to re-launch a CLI worker's executable or needing a reboot of the system. This feature dramatically minimizes downtime and keeps the real-time distributed rendering system online, and ready for use in a high-availability state.

The design concepts of the VDD package manager implementation are inspired by the success of the [Steakunderwater forum](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=32&t=1814) hosted Blackmagic Resolve/Fusion community project called the "[Reactor Package Manager](https://gitlab.com/WeSuckLess/Reactor)".

Reactor uses a modular .atom formatted Lua table structure to define installation bundles that are sourced from any number of user-configured, public or private GitLab/GitHub repos, or local/NAS based disk storage location.

### Build a 6DoF RT Previsualization Station

Build a 6DoF RT Previsualization Station

Previsualization supervisors will enjoy the way VDD assists workstation-based previsualization tasks, like time-consuming "[techviz](https://en.wikipedia.org/wiki/Previsualization)". The Viz operational steps are accelerated by an order of magnitude by OpenDisplayXR. This efficiency is achieved, in-part through the removal of disk-based intermediate video/image files, media transcoding, which has the added bonus of reducing file server I/O operations, and significantly cuts down on unnecessary network bandwidth consumption.

The VDD interface has a unique capability to dramatically simplify the process of connecting a HDR "video texture" pixel stream output, from a best-in-class NLE video timeline, or a colourist suite, directly to an external real-time 3D engine based visualisation tool. By doing this process, OpenDisplayXR supports 6DoF room-scale previsualization approaches of arbitrary image projection based media with assistance provided by a system's native OpenVR and OpenXR APIs.

For in-office design review tasks, it is very effective to let OpenDisplayXR manage the visual image generating pipeline. A VDD can send multi-view media in a transparent fashion to large format passive stereo 3D monitoring solutions, like a [3D PluraView monitor](https://www.schneider-digital.com/de/produkte/passive-3d-stereo-monitore/). This class of passive display hardware makes it possible for 3 co-workers to wear light-weight polarizer glasses, at the same time, to collaborate and provide direct feedback on creative design or engineering tasks.

### Plain-Text JSON-Based Settings

Plain-Text JSON-Based Settings

A single .json-based configuration file automatically configures all relevant parameters required to define a new hardware display product DCC integration. This makes it possible to rapidly test and iterate on new hardware setups without requiring the end user/integrator to maintain a complex build toolchain.

### User Input

User Input

Optionally, any of the connected [HID](https://en.wikipedia.org/wiki/USB_human_interface_device_class) (Human Interface Devices) could be activated in the virtual device driver preferences so they are passed through the virtual VR/XR bridge interface to the host DCC package. This makes it possible for the HID hardware to appear as an emulated [VR controller](https://www.meta.com/quest/accessories/quest-touch-pro-controllers-and-charging-dock/) style of input device.

When the alternative input device is configured as a simulated VR controller, input remapping techniques can change the nature of the input data stream, to establish constraints and range of motion limits, or to perform [3D coordinate system-based transforms](https://en.wikipedia.org/wiki/Anamorphosis) for planar 2D motion-based input devices like [graphics tablets](https://www.wacom.com/en-us) or mice.

### Output Driver

Output Driver

An extensible "output driver" based plugin system allows live-rendered framebuffer data to pass with ultra-low latency from the virtual device driver interface into a post-processing stack that supports external libraries, and fragment shaders.

The Output Driver is GPU accelerated via common cross-platform compatible rendering APIs ([CUDA](https://en.m.wikipedia.org/wiki/CUDA), [DirectX DXR](https://en.m.wikipedia.org/wiki/DirectX_Raytracing), [OpenCL](https://en.m.wikipedia.org/wiki/OpenCL), [Metal](https://en.m.wikipedia.org/wiki/Metal_(API)), [OpenGL](https://en.m.wikipedia.org/wiki/OpenGL)). The VRAM based framebuffer in the output driver supports layering ML ([Machine Learning](https://en.m.wikipedia.org/wiki/Machine_learning)) [neural style transfer effects](https://en.m.wikipedia.org/wiki/Neural_style_transfer), [deep dream effects](https://www.tensorflow.org/tutorials/generative/deepdream), and [Hugging Face](https://huggingface.co) transformer models.

When running at a reduced frame rate, deferred rendering of [Stable Diffusion 2.0](https://stability.ai/blog/stable-diffusion-v2-release) "img2img" generators are possible with [latent space](https://en.m.wikipedia.org/wiki/Latent_space) support, including the use of multiple [raster](https://en.wikipedia.org/wiki/Raster_graphics)or [vector-shape](https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline) based alpha masks for effects like ML-driven content-aware fill, [seamless blending](https://en.m.wikipedia.org/wiki/Enblend), and in/out painting.

An "output driver" concept enables a wide range of customer-created solutions to be achieved such as; Applying [WarpMesh](http://paulbourke.net/dome/warpingfisheye/) techniques for iDome projection, using [RTSP](https://en.wikipedia.org/wiki/Real_Time_Streaming_Protocol)/[HLS streaming video](https://en.wikipedia.org/wiki/HTTP_Live_Streaming) encoders, passing media to [NDI-based](https://en.wikipedia.org/wiki/Network_Device_Interface) IP video streaming connections, working with a frame server solution such as [Syphon](https://syphon.info/) or [Spout](https://spout.zeal.co) FFGL that utilise shared video memory techniques for [VJing](https://en.m.wikipedia.org/wiki/VJing) applications.

### Temporal Feedback Loop Buffer

Temporal Feedback Loop Buffer

Customizable in-memory visual feedback loops can be used inside the VDD output driver module. This is a wonderful feature if you need to create MVS compatible "onion-skinning" animation overlays, or to generate temporally delayed fadeable motion trail "visual echos" effects with a subtractive luminance decay. A feedback loop is also interesting when used with highly-stylized audio-reactive multi-pass image distortion effects used in immersive VJing.

The feedback system has a [FIFO](https://en.m.wikipedia.org/wiki/FIFO) 4D frame buffer duration parameter to support time-offsets.

The multi-view VRAM stored FIFO frame buffer is also helpful when animating or retraining ML transformer models to build up the visual appearance of ML synthesized "[emergent design behaviours](https://en.m.wikipedia.org/wiki/Emergent_Design)".

A good starting point is to try the visual feedback loop feature out, with a [ShaderToy](https://www.shadertoy.com) sourced fragment shader (like pixel sorting) applied in the VDD output driver stack.

This combination of ML and fragment shader effects will very often result in the creation of artistically unique evolving 4D pipe-dream-esque imagery.

### Live 360VR Media Reframing

Live 360VR Media Reframing

For in-context immersive media review tasks, such as [LED fulldome](https://en.m.wikipedia.org/wiki/MSG_Sphere_at_The_Venetian) show [QA checks](https://en.m.wikipedia.org/wiki/QA/QC), it is helpful to pass the raw multi-view media directly to the external process via shared memory, or with the use of pixel streaming to an external 360VR immersive media playback tool.

### Virtual Environment Simulation

Virtual Environment Simulation

Complex "nested-visual simulation" workflows can be satisfied using the generated pixel-streaming framebuffer content as a 2D texture map that is reapplied to a mesh within a game-engine centric [virtual production LED stage](https://en.m.wikipedia.org/wiki/On-set_virtual_production) techviz toolset. The 3rd party previz/techviz tools would apply the generated pixel-streamed data on the fly to a textured "screen surface" that is part of a 1:1 3D scale model of a simulated [sound stage](https://en.m.wikipedia.org/wiki/Sound_stage)/ LED dome theatre environment.

### Scripted Actions & Callback Events

Scripted Actions & Callback Events

[Lua scripting](https://luajit.org/luajit.html) could be used in the virtual device driver HID settings to configure and apply scripted actions or replay pre-recorded "input motion" clips that are passed through as simulated HID control input data with [absolute coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) or relative coordinate system offsets. The scripted action system could be triggered by any of the mappable Aux (Auxiliary) input controls on HID devices, or via OSC ([Open Sound Control](https://en.wikipedia.org/wiki/Open_Sound_Control)) based protocol signals via tools like [TouchOSC](https://hexler.net/touchosc) or [MIDI](https://en.wikipedia.org/wiki/MIDI) hardware.

### Initial R&D Team

Initial R&D Team

Developers

-   [Andrew Hazelden](https://www.linkedin.com/in/andrewhazelden/) ([Dover Studios](https://github.com/AndrewHazelden) and [Kartaverse](https://docs.google.com/document/d/1tewIaHZh8mWI8x5BzlpZBkF8eXhK2b_XhTWiU_93HBA/edit?usp=sharing)), Canada, Principal Researcher
-   [Paul Bourke](http://www.paulbourke.net), Australia, Digital capture and processing for immersive displays

Creative

-   [Antonio Victor Garcia-Serrano](https://www.linkedin.com/in/antoniovictorgarciaserrano/) ([Zakato360](https://www.zakato.com)), Spain, Creative Advisor
-   [Alexandre Regeffe](https://www.linkedin.com/in/alexandreregeffe/), France, Creative Advisor
-   [Frederic Fermon](https://www.linkedin.com/in/frederic-fermon-19709576/) ([CST - Commission Supérieure Technique](https://www.cst.fr)), France, Creative Advisor
-   [Hogan Burrows](https://www.linkedin.com/in/hogan-burrows-177ab821/) ([Untitled Project](https://untitledproject.sg)), Singapore, Creative Advisor
-   [Jared Sandrew](https://www.imdb.com/name/nm1150826/), USA, Creative Advisor
-   [Joergen Geerds](https://www.facebook.com/jgeerds) ([KonceptVR](https://www.konceptvr.com)), USA, Creative Advisor

Technical

-   [Alexis Haggar](https://www.linkedin.com/in/lexhag/)(LexhagVFX), UK, Technical Advisor
-   [Alexey Bogomolov](https://www.imdb.com/name/nm11741875/?ref_=fn_al_nm_1), Technical Advisor
-   [Marc-Antoine Desjardins](https://ca.linkedin.com/in/marc-antoine-desjardins-8132464), Canada, Technical Advisor
-   [Peregrine Mc Cafferty](https://www.imdb.com/name/nm1657221/), UK, Technical Advisor

Fulldome

-   [Allen Rose](https://www.linkedin.com/in/allen-rose/), USA, Technical Advisor
-   [Dario Tiveron](https://www.fddb.org/author/dariotiveron/) ([FDDB](https://www.fddb.org)), Italy, Creative Advisor
-   [Greg Downing](https://www.imdb.com/name/nm1598682/) ([Hyperacuity](https://hyperacuity.com)), USA, Creative Advisor
-   Matthew Dougherty ([NOAA](http://www.noaa.gov)), USA, Lead Technical Advisor
-   [Paul Mowbray](https://www.imdb.com/name/nm4638232/) ([NSC Creative](https://www.linkedin.com/company/nsc-creative/)), UK, Creative Advisor
-   [Peter Morse](https://www.petermorse.com.au/about/), Tasmania, Creative Advisor

Virtual Production

-   [Aurore de Blois](https://www.imdb.com/name/nm2642629/) ([Drengr Bilder](https://www.imdb.com/title/tt19622596/fullcredits/)), UK, Creative Advisor
-   [Tobias Falk](https://www.linkedin.com/in/tobiasfalk/) ([Cinegrace](https://www.cinegrace.com/biography)), Sweden, Technical Advisor
-   [Tomas Wall](https://www.linkedin.com/in/tomaswall/) ([Cinegrace](https://www.cinegrace.com/biography)), Sweden, Technical Advisor
-   [Kino Gil](https://www.linkedin.com/in/joaquin-kino-gil-9072a67/) (Kino Digital), USA, Creative Advisor

Industry Partners

-   [Josef J. Schneider](https://www.linkedin.com/company/schneider-digital-josef-j-schneider-e-k-/), ([Schneider Digital](https://www.schneider-digital.com/de/)), Germany, Display Hardware Vendor
-   [Lutz Moehr](https://www.linkedin.com/in/lutz-moehr-63a41b7/), ([Schneider Digital](https://www.schneider-digital.com/de/) and [3D-CC](http://3dcc.eu/introduction.html) / DNS Consult), Germany, Consultant / Networker / Event organizer

### Software Interface

Software Interface

The virtual device driver is bound to the external DCC package using the conventional OpenVR/OpenXR support in the host toolset.

The following screenshot shows Blackmagic Design's [Fusion Studio](https://www.blackmagicdesign.com/products/fusion/) compositing software. The "VR Headset" preference is used to define "OpenVR" as the active API. This single control is the only setting required to allow a 3rd party [OpenVR](https://partner.steamgames.com/doc/features/steamvr/openvr)/[OpenXR](https://www.openxrforum.org) virtual device driver to be enabled on the DCC package side of things.

Blackmagic Design's [DaVinci Resolve Studio](https://www.blackmagicdesign.com/products/davinciresolve/) video editing and color correction software uses the same style of HMD connectivity settings as are present in the Fusion page.

![[Kartaverse Workflows.img/image3__fix6.png]]![[Kartaverse Workflows.img/image5__fix6.png]]

Node Based Workflows

![[Kartaverse Workflows.img/image1__fix9.png]]

This Blackmagic Design DaVinci Resolve v18.1 Fusion page node graph shows an initial proof-of-concept "OpenDisplayXR VDD" workflow. The comp imports Kartaverse Z360 (Color + depth) equirectangular image projection media as a Fusion 3D system processed content via the Renderer3D node. The WIP logic for the OpenDisplayXR VDD node was implemented via Vonk Data Nodes, and a custom Fuse that is capable of rendering DCTL fragment shaders, and returns the output to a C++ bridge shared library implemented with LuaJIT's FFI feature.

### Demo Apps

**Demo Apps**

#### NeuralFoam for SynthEyes Pro

# NeuralFoam for SynthEyes Pro

Andersson Technologies production-proven "[SynthEyes Pro](https://www.ssontech.com/synsumm.html)" matchmoving software is now able to export directly to a NeuralFoam flavoured [OpenUSD ASCII](https://graphics.pixar.com/usd/release/usdfaq.html#so-what-file-formats-does-usd-support) (.usda) format for faster, more precise, and reliable, NeRF camera 4x4 transform matrix alignment.

This unique, SynthEyes powered, multi-view camera tracking and neural rendering based workflow allows NVIDIA InstantNGP based NeRF scenes to be created more efficiently.

SynthEyes already has an efficient UI that provides access to manual and supervised trackers, fine-grained editing of camera paths via spline editing controls, and the ability to intuitively control the scene origin, scale, and world Up-axis coordinate system.

![[Kartaverse Workflows.img/image6__fix3.png]]

SynthEyes is able to export a non-NeRF based output for use in all common DCC programs, as well as in [NLE packages like Resolve](https://www.youtube.com/watch?v=KIBeSmKekQ0).

The following YouTube video, by Russ Andersson, explores what is possible with [SynthEyes Pro's USD (Universal Scene Description) format capabilities.](https://youtu.be/_vHHYXptZpA)

Exporting a NeuralFoam ready camera transform matrix from SynthEyes Pro is as easy as selecting the "File \> Export \> Virtual Production \> NeuralFoam nVP Calibrated OpenUSD" menu item. A Universal Scene Description ASCII encoded file is exported to disk with a unique "CompX" schema embedded that makes multi-view and volumetric content creation workflows friendlier.

Having both NeRF and conventional match moving/photogrammetry export paths in SynthEyes Pro allows the creation of a hybrid volumetric scene with point clouds, meshes, multi-view 3D camera locators, stand-in geometry, and 3D locators.

A pre-existing [SynthEyes + Resolve based workflow tutorial](https://www.youtube.com/watch?v=KIBeSmKekQ0), by one of the VDD developers, is available. The video shows how quickly an aerial scene shot on a drone can be camera tracked, and then loaded directly as a node-based 3D composite in the Fusion page.

The OpenDisplayXR SDK provided sizzle scripts are installed to:

    /Applications/SynthEyes/scripts/Virtual Production/neuralfoam.szl (macOS)
    C:\Program Files\Andersson Technologies LLC\SynthEyes\scripts\Virtual Production\neuralfoam.szl (Win)

#### NeuralFoam OFX Plugin

# NeuralFoam OFX Plugin

A C++ based [OFX plugin](http://openeffects.org) named "NeuralFoam Engine for Resolve" will be included with the finished OpenXR/OpenVR compatible Virtual Device Driver SDK.

![[Kartaverse Workflows.img/image2__fix5.png]]

The OpenFX node is a port of the [NVIDIA InstantNGP TestBed](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit) executable with [OpenXR SDK support](https://github.com/KhronosGroup/OpenXR-SDK)included for direct 6DoF HMD connectivity.

Check out the guide "[Kartaverse Workflows \| Creating Volumetric NeRFs](https://docs.google.com/document/d/1vouz5gYpIw7bUBAGfAvPNcvNQoAfY_E7BhUJOGtV2cw/edit)" for more information about live-action based NeRF capture workflows, and how to build InstantNGP from source. A next-gen nVP workflow guide is available that acts as a semi-official overview of nVP concepts for LED volume creation. The document is titled "[Kartaverse Workflows \| Building an Effective nVP (Neural Virtual Production) Sound Stage](https://docs.google.com/document/d/1O2EmlJpP6y2zTzX750Ld-TxO0x9u06SfJbrr-mHs0rs/edit?usp=sharing)".

#### NeuralFoam Worker CLI

# NeuralFoam Worker CLI

Additionally, a standalone CLI launched "NeuralFoam Worker Node" will be included with the OpenDisplayXR VDD SDK when it is released.

This neural rendering client is a direct adaptation of [Thomas Müller & Alex Evans](https://github.com/NVlabs/instant-ngp/graphs/contributors)' NeRF testbed executable. The testbed code is available publicly from NVIDIA's GitHub page for InstantNGP under an [NVIDIA Source Code License](https://github.com/NVlabs/instant-ngp/blob/master/LICENSE.txt).

The ported open-source code was redesigned by the VDD developers to better handle HPC workloads, with load balancing, task scheduling, and [XML-RPC](https://en.wikipedia.org/wiki/XML-RPC) socket support. The worker supports dynamic GPU performance tuning with support for temperature sensing, and automatic GPU fan speed control. When extreme performance is required, user-controlled tweaks can be defined for GPU parameters like core voltage (mV), core clock (MHz), memory clock (MHz), power limits, and temperature limits.

The NeuralFoam worker runs its rendering process in a 100% real-time fashion with an immediate mode UX overlay for advanced cluster rendering diagnostics. Pixel streaming techniques are used to either pass image tiles back to the "NeuralFoam Engine" controller host software package (like Resolve) where the buckets are re-assembled into a unified image, or the tiles can be batched together into larger regions, recombined, and then routed via Ethernet, NDI, or SDI, so the image data arrives at a predefined LED processor device that is connected to a specific LED panel on the LED sound stage video wall.

The NeRF generated render bucket tasks are distributed across a GPU cluster using a form of [tile-based](https://en.wikipedia.org/wiki/Tiled_rendering) distributed rendering acceleration. The buckets are responsive and intelligent in that each render thread controls a dynamically sized multi-channel HDRI framebuffer. The pixel data is tunnelled over a conventional network using a parallel I/O approach that passes data through a series of high-speed low-latency pixel streaming connections.

The NeuralFoam Worker executable is capable of running affordably with a rack-mounted NVIDIA RTX GPU enabled server that hosts an [NVLink bridge](https://en.m.wikipedia.org/wiki/NVLink) connected pair of 3090/3090 TI graphics cards.

A local cluster of GPU powered worker nodes are synced to a line-level accurate [genlock](https://en.m.wikipedia.org/wiki/Genlock) unit. The active Workers perform the real-time distributed rendering of large NeRF scenes with the assistance of [camera Frustum](https://en.wikipedia.org/wiki/Frustum)-defined DoD (Domain of Definition) 3D region cropping.

An OpenDisplayXR VDD hardware certified NeRF render node is useful in virtual production LED stage environments where large-scale neural radiance fields provide a compelling alternative to traditional "[machinima](https://en.m.wikipedia.org/wiki/Machinima)" style OpenGL/DirectX based graphics.

#### NeRF NTB (Neural Texture Baker)

# NeRF NTB (Neural Texture Baker)

A sample NeRF-based NTB (Neural Texture Baker) tool is planned for release with the official Open DisplayXR SDK.

[NeRF scene graphs](https://blogs.nvidia.com/blog/2022/03/25/instant-nerf-research-3d-ai/) are interesting for immersive media content creators, and [nVP](https://docs.google.com/document/d/1O2EmlJpP6y2zTzX750Ld-TxO0x9u06SfJbrr-mHs0rs/edit?usp=sharing) (Neural Virtual Production) usage, as they allow a neural encoded representation of photorealistic lighting, shading, transparency, reflections, refractions, [Beer's law colour-absorption](https://en.wikipedia.org/wiki/Beer%E2%80%93Lambert_law), [polarized lighting](https://en.wikipedia.org/wiki/Polarization_(waves)), and [SSS](https://en.wikipedia.org/wiki/Subsurface_scattering)(Subsurface Scattering).

The NeRF NTB executable generates temporally stable animated texture maps that can be used on mesh sequence and point cloud sequence outputs. This is an excellent choice for workflows that need both NeRF flythrough renders, while also creating mobile-friendly [AR .usdz-based assets](https://developer.apple.com/augmented-reality/quick-look/) that work efficiently on iPhones and iPad tablets as well as desktop systems for use in AAA quality [USDZ](https://graphics.pixar.com/usd/release/wp_usdz.html) encoded AR/MR/XR experiences.

The provided source code and project files for NTB performs a unique [MVS](https://en.wikipedia.org/wiki/3D_reconstruction_from_multiple_images)(multi-view stereo) centric version of geometry-defined texture baking operations. The supported output data formats are [OpenUSD Clips](https://j-cube.jp/solutions/multiverse/docs/usage/sequenceclip.html), and [e57](http://libe57.org) sequence-based dense point clouds.

The final baked texture maps are exported as a [multi-view](https://openexr.readthedocs.io/en/latest/MultiViewOpenEXR.html) encoded multi-part EXR image sequence with an [anisotropic filtered](https://en.wikipedia.org/wiki/Anisotropic_filtering), [MIP-Mapped](https://en.wikipedia.org/wiki/Mipmap) tiled encoding, using either None, ZIPS, or DWAA image compression.

The NTB executable connects to an OpenDisplayXR .json preference file to access the transform matrix data for each of the multi-view definitions. These locator positions drive the positional values used for transferring NeRF shading information in a view-dependent fashion into a [PTEX](https://github.com/wdas/ptex) or [UDIM](https://learn.foundry.com/modo/901/content/help/pages/uving/udim_workflow.html)-based [UV layout](https://en.wikipedia.org/wiki/UV_mapping) on the polygon model.

Creased Sub-D ([Catmull-Clark subdivision surfaces](https://graphics.pixar.com/library/Geri/paper.pdf)) meshes with [full-character rig skeletons](https://graphics.pixar.com/usd/dev/api/usd_skel_page_front.html) are supported correctly with the texture transfer operation, however interactive performance is reduced.

[OpenUSD variants](https://graphics.pixar.com/usd/docs/Authoring-Variants.html) allow for the use of multi-resolution [LOD](https://en.wikipedia.org/wiki/Level_of_detail_(computer_graphics)#:~:text=In%20computer%20graphics%2C%20level%20of,viewpoint%2Drelative%20speed%20or%20position.) (Level-of-Detail) sets on the imported models. The NTB texture transfer operation is effectively repeated for each LOD level present in a model and is accessed typically via [USD VariantSet](https://graphics.pixar.com/usd/release/glossary.html#usdglossary-variantset).

OpenUSD [.usdc (binary encoded) or .usda (ASCII encoded) scenes](https://graphics.pixar.com/usd/release/tut_converting_between_layer_formats.html?highlight=usda) that use [USD composition](https://graphics.pixar.com/usd/release/glossary.html#composition)features often take advantage of [reference layers](https://graphics.pixar.com/usd/release/tut_referencing_layers.html) and [point instances](https://github.com/PixarAnimationStudios/USD/wiki/PointInstancer-Object-Model). These scene-graph hierarchies are correctly evaluated when the texture baking occurs. Pixar's OpenUSD team provides additional information on [OpenUSD terminology](https://graphics.pixar.com/usd/release/glossary.html) which can be handy for new users.

A powerful token-based approach is offered to control the texture map output file naming syntax, and the EXR multi-part/multi-channel layer names. Per-frame-based OpenDisplayXR VDD metadata records can be encoded into each model and texture map if desired. This metadata system is compatible with node-based tools that support powerful "[data node](https://docs.google.com/document/d/1U9WfdHlE1AZHdU6_ZQCB1I2nSa5I7TyHG2vKMi2I7v8/edit)" workflows during post-production.

The content production pipeline-friendly [metadata passthrough](https://openexr.readthedocs.io/en/latest/OpenEXRCoreAPI.html?highlight=metadata) feature includes support for retaining the original VDD-captured [HID input data](https://en.wikipedia.org/wiki/USB_human_interface_device_class), a [DOM](https://en.wikipedia.org/wiki/Document_Object_Model)-encoded version of the current VDD [.json](https://en.wikipedia.org/wiki/JSON) settings and external side-car file metadata that holds values like [YAML](https://en.wikipedia.org/wiki/YAML)-encoded lens information from protocols like[Cooke /i Technology](https://cookeoptics.com/i-technology/) lenses, or [camera tracking](http://docs.vizrt.com/tracking-hub-guide/1.0/protocol.html) information.

### JSON Config File

JSON Config File

A [JSON-based](https://en.wikipedia.org/wiki/JSON) configuration file is used to define the display parameters for the connected output video streams.

This is an early proof-of-concept JSON file to express the display device/input device centric syntax needed for a passive stereo 3D display that has three frame buffers: a left view, a centre view (monoscopic 2D), and a right eye view.

![[Kartaverse Workflows.img/image4__fix5.png]]