---
tags: [export, export-scrivener, revise]
prev: Photogrammetry Tools
next: RAW and HDRI Image Processing Tools
---

### Impulse Response Simulation

Impulse Response Simulation

Extensive research is underway to explore the feasibility of analytically generating sound [impulse response](https://support.apple.com/en-ca/guide/logicpro/lgcef2af4d05/mac) files from the volumetric scan data.

This approach helps increase the realism of the immersive XR experiences by allowing for a more accurate sound playback of field-recorded sound elements. These techniques can model sound sources and the audio level "fall off" when they are hidden by occlusions (large blocking objects) such as natural caverns, and interior spaces like hallways and tunnels.

### Reaper DAW

Reaper DAW

Reaper is a free open-source DAW software package that is excellent for spatial audio workflows. It doesn't force any preconceptions onto the audio so you can flexibly work with multi-track sound information.

<https://www.reaper.fm/>

### Logic Pro

Logic Pro

Apple's [Logic Pro](https://www.apple.com/logic-pro/) DAW software can be used to trim spatial audio based recordings down to the sound clip's final edited duration. The program runs on macOS systems.

![[image195.png]]

### Resolve Fairlight DAW

Resolve Fairlight DAW

Blackmagic Design's NLE software Resolve (free) and Resolve Studio (Paid) include a copy of the Fairlight DAW.

<https://www.blackmagicdesign.com/products/davinciresolve/fairlight>

![[image280.png]]

### About Fairlight

About Fairlight

Fairlight has its own dedicated page environment inside the Resolve software:

![[image276.png]]

Fairlight makes it possible for advanced audio post-production workflows to be completed inside the same Resolve project database that holds Media pool based footage, Fusion page composites, and Resolve Edit page video editing timelines.

### Fairlight Sound Library

Fairlight Sound Library

When you first open the Fairlight page Sound Library tab an option is presented to "Download DaVinci Resolve's Free Sound Library".

![[image23.png]]

Clicking the "Download" button takes you to the BMD Support Center webpage in your default web browser. After completing the 2-part form on the webpage you can then download a macOS or Windows based install package.

![[image162.png]]

Once you press the "Register & Download" button a new download link will be generated for your session.

![[image343.png]]

On macOS systems you would open up and mount the downloaded DMG (Disk Image) file named:

Blackmagic_Fairlight_Sound_Library_Mac.dmg

The disk image holds a "Install Fairlight Sound Library 1.0.pkg" installer.

![[image53.png]]

The PKG installer then adds the 1.12 GB of sound resources to a folder that Resolve's Fairlight page can access.

![[image397.png]]

### Unreal Engine MetaSounds

Unreal Engine MetaSounds

Epic Game's Unreal Engine 5 includes the [MetaSounds DSP technology](https://docs.unrealengine.com/5.0/en-US/AudioFeatures/MetaSounds/) for ambisonic spatial audio playback on PC desktops, Consoles and VR HMDs.

For more information about Unreal MetaSounds:

-   [MetaSounds Reference Guide](https://docs.unrealengine.com/5.0/en-US/metasounds-reference-guide-in-unreal-engine/)
-   [MetaSounds: The Next Generation Sound Sources](https://docs.unrealengine.com/5.0/en-US/metasounds-the-next-generation-sound-sources-in-unreal-engine/)

### Cycling '74 Max

Cycling '74 Max

Max is a node based creation environment used to create audio and interface with hardware like MIDI devices.

<https://cycling74.com/products/max>

For more information about Max:

-   [Max Downloads](https://cycling74.com/downloads)
-   [Learn Max](https://cycling74.com/learn)
-   [Max Resources](https://cycling74.com/resources)
-   [Max Docs](https://cycling74.com/learn/documentation)
-   [Cycling Forums](https://cycling74.com/forums)

### Spat Revolution

Spat Revolution

Spat allows artists, sound-designers, and sound-engineers to create and mix audio that is targeted at creating outstanding immersive experiences. The toolset provides options for WFS (Wave Field Synthesis). Spat Revolution comes with three integration plugins for use with DAW packages.

<https://www.flux.audio/project/spat-revolution/>

### Fraunhofer SpatialSound Wave

Fraunhofer SpatialSound Wave

<https://www.idmt.fraunhofer.de/en/institute/projects-products/spatialsound-wave.html>

### Morrow Sound

Morrow Sound

<https://www.morrowsound.com/>

### Dolby Atmos

Dolby Atmos

<https://www.dolby.com/technologies/dolby-atmos/>

### Spatial Audio Designer

Spatial Audio Designer

<https://newaudiotechnology.com/products/spatial-audio-designer/>

### NVIDIA VR Works \| Audio Tools

NVIDIA VR Works \| Audio Tools

<https://developer.nvidia.com/vrworks/vrworks-audio>

### Noisemakers Ambi Plugin

Noisemakers Ambi Plugin

The Noisemakers Ambi tools help create 3D audio scenes which can be used in the production of 360VR/180VR videos, and immersive experiences.

<https://www.noisemakers.fr/product/ambi-bundle-hd/>

Noisemakers creates ambisonic plugins including:

-   [AMBI PAN HD](https://www.noisemakers.fr/ambi-pan-hd/) -- Position input sounds in the 3D scene
-   [AMBI VERB HD](https://www.noisemakers.fr/ambi-verb-hd/) -- Add 360 reverberation
-   [AMBI LIMITER HD](https://www.noisemakers.fr/ambi-limiter-hd/) -- Control the ambisonic bus peak level
-   [AMBI HEAD HD](https://www.noisemakers.fr/ambi-head-hd/) -- Render the 3D scene to binaural audio
-   [AMBI EYES](https://www.noisemakers.fr/ambi-eyes/) - Monitor 360 videos while authoring audio
-   [AMBI CONVERTER](https://www.noisemakers.fr/ambi-converter/) - Convert B-format signals between FuMa and ambiX

### Comsol Multiphysics Simulations

Comsol Multiphysics Simulations

A friend of the Kartaverse project, Jared Sandrew (from InfiniteWorld), introduced our audio research group to Jason Riggs from Harman International. Jason volunteered his time over multiple sessions, and shared his insights via Zoom on advanced audio workflows, sound impulse response creation, and an overview of acoustic simulation technologies. Part of that effort by Jason was to explain how the [Comsol Multiphysics](https://www.comsol.com/) software is used to pre-visualize detailed and accurate audio environments based upon measured real-world locations for HiFi home audio and automotive audio needs.

Comsol Multiphysics, when combined with the Comsol [acoustics simulation module](https://www.comsol.com/acoustics-module), dramatically expands on what is possible for digitally simulating acoustic environments using hybrid FEM (Finite Element) solvers.

![[image235.jpg]]

This is a sample Comsol website image of simulating sound emission from a source like a speaker element:

![[image155.png]]

These techniques potentially take the volumetric research further by allowing for a greater understanding of the acoustic properties of the environments such as caves, and visualize how sounds in this space propagate.

![[image223.png]]

### Ultrasonic Sounds in Caves

Ultrasonic Sounds in Caves

Through the use of software like Comsol, it is possible to fully visualize and simulate the acoustic properties of how [ultrasonic avoidance](https://en.wikipedia.org/wiki/Ultrasound_avoidance) is used by bats for navigation and hunting insects using sound recordings of bat vocalizations. One can see plots in 2D and in 3D of the sound waves propagating outwards as bats fly through a large underground cavern hunting for insects.

This image shows a real-world ultrasonic audio recording of a pulse train of bat chirps from a cave in Puerto Rico:

![[image102.png]]

### Microsoft Triton \| Project Acoustics

Microsoft Triton \| Project Acoustics

The Microsoft Triton / [Project Acoustics](https://docs.microsoft.com/en-us/gaming/acoustics/what-is-acoustics) learning resources have been enormously helpful to Kartaverse development efforts. Project Acoustics ships with extensive background reference material that clarifies what is currently possible with real-time acoustic simulation-driven spatial audio playback and for insight into game engine-based uses of [acoustic impulse responses](https://docs.microsoft.com/en-us/gaming/acoustics/design-process).

For more information:

-   [Web \| Microsoft Project Triton Immersive Engine](https://www.microsoft.com/en-us/research/project/project-triton/)
-   [YouTube \| Project Triton \| Interactive Sound Simulation: Rendering immersive soundscapes in games](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)
-   [Web \| Microsoft \| What is Acoustics](https://docs.microsoft.com/en-us/gaming/acoustics/what-is-acoustics)
-   [Web \| Microsoft Project Triton \| FAQs](https://docs.microsoft.com/en-us/gaming/acoustics/faq)
-   [GitHub \| Microsoft Project Acoustics](https://github.com/microsoft/ProjectAcoustics/issues)
-   [GitHub \| Microsoft \| Project Acoustics 2.0 now available!](https://github.com/microsoft/ProjectAcoustics/issues/55)

Project Triton \| Unity Plugin

-   [Web \| Microsoft Project Triton \| Project Acoustics Unity3d Editor plug-in](https://www.microsoft.com/en-us/download/details.aspx?id=57346)
-   [Web \| Microsoft Project Triton \| Project Acoustics Unity3d Quickstart](https://docs.microsoft.com/en-us/gaming/acoustics/unity-quickstart)

Project Triton \| Unreal Plugin

-   [Web \| Microsoft Project Triton \| Project Acoustics Unreal Editor plug-in and Wwise plug-in](https://www.microsoft.com/en-us/download/details.aspx?id=58090)
-   [Web \| Microsoft Project Triton \| Project Acoustics Unreal Quickstart](https://docs.microsoft.com/en-us/gaming/acoustics/unreal-quickstart)

Project Triton \| Talks

-   [YouTube \| Microsoft \| Project Triton \| GDC 2017 - A general introduction to the ideas behind Project Triton and its integration in Gears of War 4](https://www.youtube.com/watch?v=qCUEGvIgco8)
-   [YouTube \| Microsoft \| Project Triton \| GDC 2019 - An introductory talk on Project Acoustics and plugins for Unity and Unreal](https://www.youtube.com/watch?v=uY4G-GUAQIE)
-   [Web \| Microsoft \| Project Triton \| SIGGRAPH 2014 - Core algorithms and architecture of the system](https://www.microsoft.com/en-us/research/publication/parametric-wave-field-coding-precomputed-sound-propagation/)
-   [Web \| Microsoft \| Project Triton \| SIGGRAPH 2018 - Extend the model spatial audio effects such as portaling](https://www.microsoft.com/en-us/research/publication/parametric-directional-coding-for-precomputed-sound-propagation/)

![[image4.png]]

Project Acoustics Figure: Connecting simulation to audio DSP with parameters[^1]

The Project Acoustics YouTube video "[Interactive sound simulation: Rendering immersive soundscapes in games and virtual reality](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)" is an excellent primer on next-gen real-time audio capabilities.

[![[image244.png]]](https://www.youtube.com/watch?v=Fy9lQT_MJ3Q)

### Audio Definition Model / OSC / MIDI

Audio Definition Model / OSC / MIDI

#### ADM - Audio Definition Model

ADM - Audio Definition Model

<https://adm.ebu.io/>

ADM-OSC

<https://github.com/immersive-audio-live/ADM-OSC>

#### OSC (Open Sound Control)

OSC (Open Sound Control)

<https://opensoundcontrol.stanford.edu/>

For more information:

-   [Wikipedia \| OSC](https://en.wikipedia.org/wiki/Open_Sound_Control)
-   [OSC \| Specifications](https://opensoundcontrol.stanford.edu/spec-1_0.html)
-   [OSC \| NIME Paper](https://opensoundcontrol.stanford.edu/files/2009-NIME-OSC-1.1.pdf)
-   [OSC \| Application Support](https://opensoundcontrol.stanford.edu/page-list.html#implementations)

#### Spat Revolution \| Flux \| ADM OSC

Spat Revolution \| Flux \| ADM OSC

<https://doc.flux.audio/en_US/spat_revolution_doc/Ecosystem_&_integration_ADM_OSC.html>

#### TouchOSC

TouchOSC

<https://hexler.net/touchosc>

For More Information:

-   [Traktor for TouchOSC](https://hexler.net/touchosc/manual/setup-traktor)
-   [Vimeo \| TouchOSC \| Scripting Demo](https://vimeo.com/565870285)
-   [TouchOSC \| Lua Scripting API](https://hexler.net/touchosc/manual/script)
-   [TouchOSC \| Manual](https://hexler.net/touchosc/manual/introduction)
-   [Hexler \| Protokol Utility](https://hexler.net/protokol)
-   [Hexler \| KodeLife](https://hexler.net/kodelife)
-   [Hexler \| TochViZ](https://hexler.net/touchviz)

#### Control Booster for Tangent Panels

Control Booster for Tangent Panels

<https://souandrerodrigues.com.br/controlbooster/>

#### Node Red

Node Red

<https://github.com/Streampunk/node-red-contrib-dynamorse-core>