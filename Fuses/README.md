# Fuses

The Fuses in this repository are not meant to provide any 'production ready' functionality or to be even used in Fusion. It's more of getting some ideas and having a basis for your own experiments. Being myself a noob when it comes to Fusion, Lua, Python and even Git, this repo is actually just my personal playground to persist and evolve some of my findings.

All of this is in a very early stage / not much in here yet; so far I started working on ...

- **[CubeMapLoader](CubeMapLoader.md)** to load a sequence of 6 images as a single texture
- **[CubeMapUnfold](CubeMapUnfold.md)** DCTL non-sense (was just to develop and debug the the shader access to a cube map texture)
- **[CubeMapColorizer](CubeMapColorizer.md)** colorize the faces of a cube by different colors (via DCTL)
- **[CubeMapEquirectangular](CubeMapEquirectangular.md)** DCTL based projection of a cubemap to a 2D image
- **[Docs/](Docs/README.md)** examples for developing Fuses in Lua (nothing there yet)
  - **[MultiButtonControls.fuse](Docs/MultiButtonControls.fuse)** example for the different [MultiButtonControl](https://github.com/nmbr73/Kernfusion/wiki/MultiButtonControl) types

## Link Fuses into Fusion

### on macOS

Set PROJECTS to whatever folder you want to clone the project into:

    PROJECTS="/Users/$(whoami)/Projects/"
    cd $PROJECTS
    git clone "https://github.com/$(whoami)/Kernfusion"

    cd "/Users/$(whoami)/Library/Application Support/Blackmagic Design/Fusion/Fuses/"
    ln -s "$PROJECTS/Kernfusion/Fuses" Kernfusion

### on Windows

No idea. Did that once for the [Shadertoys](https://nmbr73.github.io/Shadertoys/) setup script, but I don't have a Windows PC and soft links seem to me pretty weird on Windows.

### on Linux

Should be pretty much the same as on macOS ... kind of ... despite the paths ... but if you are on Linux I guess you know what you are doing.

### In Fusion

Not a must, but if you want to avoid the need to manually fix paths in comps and such, then you may want to set a 'Kernfusion:' path map to the folder you checked out the repository to.

