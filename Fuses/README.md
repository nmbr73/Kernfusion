# Fuses

The fuses in this repository are not meant to provide any 'production ready' functionality or to be actually used in Fusion. It's more about having a simple example to show a single aspect without getting lost in tons of code that has all the bells and whistles. On the contrary, it is even about avoiding all the comfy inspector controls and options that would bloat the code.

If you search for a specific aspect implemented in one of these Fuses (see the readme and try the Fuse), then working with it is probably not about using the Fuse, but about reading and reusing the code for your own Fuse. Completely new to the whole subject matter of VFx, I'm myself currently learning only the very basics of Fusion scripting (I did not even use Fusion, Python, Lua, Git, etc before). And this repository just is kind of my personal notebook to have a kind of reference at hand for my findings on that path. Maybe it can be of help for another noob like me out there on the search for some basic information.

All of this is in a very early stage / not much in here yet; so far I started working on ...

- **[CubeMapLoader](CubeMapLoader.md)** to load a sequence of 6 images as a single texture
- **[CubeMapUnfold](CubeMapUnfold.md)** DCTL non-sense (was just to develop and debug the the shader access to a cube map texture)
- **[CubeMapColorizer](CubeMapColorizer.md)** colorize the faces of a cube by different colors (via DCTL)
- **[CubeMapEquirectangular](CubeMapEquirectangular.md)** DCTL based projection of a cubemap to a 2D image
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

No idea. Did that once for the [Shadertoys](https://nmbr73.github.io/Shadertoys/) setup script, but I don't have a PC and softlinks seem to me pretty weird on Windows.

### on Linux

Should be pretty much the same as on macOS ... kind of ... despite the paths.
