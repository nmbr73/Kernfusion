# Fuses

Not much in here yet. Explanation will follow as soon as it's worth it; so maybe never.

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

### in Fusion

Not a must, but if you want to avoid the need to manually fix paths in comps and such, then you may want to set a 'Kernfusion:' path map to the folder you checked out the repository to.

### in Resolve

I don't know; just use Fusion.