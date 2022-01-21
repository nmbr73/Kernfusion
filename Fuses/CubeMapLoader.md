# CubeMap Loader

Fuse to create a 2D representation of a cube map.

Status
- Does not work yet!

What you can do with it:
- Use it as an input for Fusion's *'CubeMap (3Cu)* tool ... but I have no idea what this 3Cu tool is good for
- Use it as an input for DCTL fragment shaders that work with a cube map texture (example in this repository to come) ... but that's a very special use case

Questions it raises:
- Why does it instantly crash Fusion if `REG_Source_GlobalCtrls` is set to `false`?
- Why does a simple and useful thing like the `MultiButtonControl` not work anymore?!?

Things to discover in its source code:
- Creating a simple, fully Lua based tool for Fusion
- Loading a sequence of pictures as a clip
- Creating a single image copying the clip pictures into a single textures
- Simulating kind of a toggle multi button (see [Examples/MultiButtonControl](Examples/MultiButtonControl.md))
