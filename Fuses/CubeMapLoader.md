# CubeMap Loader

- [CubeMapLoader.fuse](CubeMapLoader.fuse)
- [CubeMapLoader.comp](../Comp/CubeMapLoader.comp)


Fuse to create a 2D representation of a cube map.

![cml](CubeMapLoader.jpg)

What you can do with it:
- Use it as an input for Fusion's *'CubeMap (3Cu)* tool ... but I have no idea what this 3Cu tool is good for
- Use it as an input for DCTL fragment shaders that work with a cube map texture (example in this repository to come) ... but that's a very special use case
- No idea if it is even needed - most probably there are already built in tools that do all of this and a lot more?!?
- Or maybe it can be done with some images and transform nodes as a simple composition / macro / whatsoever?

Questions it raises:
- Why does it instantly crash Fusion if `REG_Source_GlobalCtrls` is set to `false`?
- Why does a simple and useful thing like the [MultiButtonControl](Examples/MultiButtonControl.md) not work anymore?!?

Things to discover in its source code:
- Creating a simple, fully Lua based tool for Fusion
- Loading a sequence of pictures as a clip
- Creating a single image copying the clip pictures into a single textures
- Copy, translate, rotate images into a target texture (i.e. the vertical cross)
- Simple but often forgotten things like setting tooltips on buttons and status texts for labels
- Simulating kind of a toggle multi button as proposed in [MultiButtonControl](Examples/MultiButtonControl.md)
