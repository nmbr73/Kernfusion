# Fuses

- **[CubeMapLoader](CubeMapLoader.md)** to load a sequence of 6 images as a single texture
- **[CubeMapUnfold](CubeMapUnfold.md)** DCTL non-sense (was just to develop and debug the the shader access to a cube map texture)
- **[CubeMapColorizer](CubeMapColorizer.md)** colorize the faces of a cube by different colors (via DCTL)
- **[Docs/](Docs/README.md)** examples for developing Fuses in Lua (nothing there yet)
  - **[MultiButtonControls.fuse](Docs/MultiButtonControls.fuse)** example for the different [MultiButtonControl](https://github.com/nmbr73/Kernfusion/wiki/MultiButtonControl) types

## Link Fuses into Fusion

Not a must, but if you want to avoid to manually fix paths in comps and such you may want to set a 'Kernfusion:' path map to the folder you checked out the repository to.

### on macOS

Set PROJECTS to whatever folder you want to clone the project into:

    PROJECTS="/Users/$(whoami)/Projects/"
    cd $PROJECTS
    git clone https://github.com/nmbr73/Kernfusion

    cd "/Users/$(whoami)/Library/Application Support/Blackmagic Design/Fusion/Fuses/"
    ln -s "$PROJECTS/Kernfusion/Fuses" Kernfusion

### on Windows

No idea. Did that once for the [Shadertoys](https://nmbr73.github.io/Shadertoys/) setup script, but I don't have a PC and softlinks seem to me pretty weird.

### on Linux

Should be pretty much the same as on macOS ... kind of ... despite the paths.
