---
tags:
  - Development
---

The FusionSDK is a BMD's software development kit to create Fusion [[Plugins]] using C/C++ code.

> [!important] The FusionSDK must be licensed under an NDA!
> The FusionSDK must be license from BMD under an NDA (Non Disclosure Agreement). The FusionSDK costs you $0 but has a signed PDF contract where you agree not to share BMDs header files from the SDK with others.
    
The `.plugin` format allows low level access to Fusion's 3D workspace. You can also make plugins that have similar features to what is possible with an [[OpenFX]] plugin for 2D graphics.
    
A [[Fuse]]  and an OFX (OpenFX) addon are a great way to get started with making custom node based tools in Resolve/Fusion.
    
> [!important] Plugins do work only in the Studio editions.
> The `.plugin` files only work in the payed "DaVinci Resolve Studio" and "Fusion Studio", not in "DaVinci Resolve" (free).

The [[Krokodove]] plugin in [[Reactor]] is an example of a compiled FusionSDK based [[Tool]], and so is LearnNowFX's AccuShaders PBR surface material system which is [available on Gumroad](https://davidkohen.gumroad.com/l/AccuShader). Both of those tools make excellent use of the Fusion page's 3D workspace.

Being compiled software OpenFX plugins and FusionSDK plugins makes it easier to put a paid license management feature in place if releasing paid commercial software.