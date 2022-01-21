# Fuses

- [CubeMampLoader](CubeMapLoader.md)
- [Examples/](Examples/README.md) are not fuses meant to be actually used in Fusion, but are simple code examples you can play with
  - [MultiButtonControl.md](Examples/MultiButtonControl.md)

## Link Fuses into Fusion

Make sure to ste a 'Kernfusion:' path map to the folder you checked out the repository to.

### on macOS

Set PROJECTS to whatever folder you want to clone the project into:

    PROJECTS="/Users/$(whoami)/Projects/"
    cd $PROJECTS
    git clone https://github.com/nmbr73/Kernfusion

    cd "/Users/$(whoami)/Library/Application Support/Blackmagic Design/Fusion/Fuses/"
    ln -s "$PROJECTS/Kernfusion/Fuses" Kernfusion
