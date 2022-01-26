# CubeMap Colorizer

- [CubeMapColorizer.fuse](CubeMapColorizer.fuse) <br />*... can be downloaded and copied manually into your fuses folder if needed*


Fuse to colorize horizontal cross image that is meant to be used as a cube map.

![cml](CubeMapColorizer.jpg)[^Ryfjallet]

[^Ryfjallet]: The picture you see being used as in input in the screenshot is the work of Emil Persson, aka [Humus](http://www.humus.name).


What you can do with it:
- Connect a [CubeMapLoader](CubeMapLoader.md) to it ... and you see the cube's faces colorized by different colors
- Connect any tool that accepts a horizontal cross texture as a cube map to see where the cube's faces end up


Things to discover in its source code:
- Creating a simple, fully Lua based tool for Fusion
- This Fuse is a very lightweight example of how one can implement a fragment shader via DCTL
