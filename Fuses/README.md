# Fuses

- [CubeMapLoader](CubeMapLoader.md) to load a sequence of 6 images as a single texture
- [CubeMapUnfold](CubeMapUnfold.md) DCTL to display a CubeMapLoader input
- [Examples/](Examples/README.md) are not fuses meant to be actually used in Fusion, but are simple code examples to play with
  - [MultiButtonControl.md](Examples/MultiButtonControl.md)
  - [MultiButtonEmulation.md](Examples/MultiButtonEmulation.md)

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
