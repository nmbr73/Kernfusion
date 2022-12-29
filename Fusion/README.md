# Fuses, Macros & Compositions




Fuses:
- **[Bokeh](Fuses/tida/Bokeh.md)** by TiDa
- **[FastGlow](Fuses/danell/FastGlow.md)** by Danell
- **[CubeMapLoader](Fuses/nmbr73/CubeMapLoader.md)** by nmbr73
- **[CubeMapUnfold](Fuses/nmbr73/CubeMapUnfold.md)** by nmbr73
- **[CubeMapColorizer](Fuses/nmbr73/CubeMapColorizer.md)** by nmbr73
- **[CubeMapEquirectangular](Fuses/nmbr73/CubeMapEquirectangular.md)** by nmbr73

Comps:
- **[TitleBurnEffect](Comp/tida/TitleBurnEffect.md)** by TiDa

Macros:
- **[Bokeh_Image](Macros/tida/Bokeh_Image.md)** by TiDa
- **[Bokeh_AChroma](Macros/tida/Bokeh_AChroma.md)** by TiDa


## Setup

Link Fuses into Fusion

### on macOS

Set PROJECTS to whatever folder you want to clone the project into:

    PROJECTS="/Users/$(whoami)/Projects/"
    FUSION="/Users/$(whoami)/Library/Application Support/Blackmagic Design/Fusion"

    cd $PROJECTS
    git clone "https://github.com/$(whoami)/Kernfusion"

    cd "$FUSION/Fuses"
    ln -s "$PROJECTS/Kernfusion/Fusion/Fuses" Kernfusion

    cd "$FUSION/Macros"
    ln -s "$PROJECTS/Kernfusion/Fusion/Macros" Kernfusion

### on Windows

No idea. Did that once for the [Shadertoys](https://nmbr73.github.io/Shadertoys/) setup script, but I don't have a Windows PC and soft links seem to me pretty weird on Windows.

### on Linux

Should be pretty much the same as on macOS ... kind of ... despite the paths ... but if you are on Linux I guess you know what you are doing.

### in Fusion

Not a must, but if you want to avoid the need to manually fix paths in comps and such, then you may want to set a 'Kernfusion:' path map to the folder you checked out the repository to.

### in Resolve

I don't know; just use Fusion.