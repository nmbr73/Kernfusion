# CubeMapUnfold


The [CubeMapUnfold.fuse](CubeMapUnfold.fuse) converts a horizontal cross input into a horizontal cross output - this means: it is of no practical use.

It helps to test the `cubemap` function in the `CompatibilityCode` which is used to mimic Shadertoy cube maps by using a horizontal cross 2D texture. To do so it can be used to try out [CubeMapLoader](CubeMapLoader.md) as an input for a DCTL Fuse.

The `cubemap` function in the `CompatibilityCode` takes a normalized 3D vector meant to point into a cube map and converts it to the respective pixel on a 2D horizontal cross texture. This way we can use such horizontal crosses as an input for those fragment shaders that work on a cube map. Now the CubeMapUnfold's kernel is a fragment shader that displays a cube map as a horizontal cross - so it kind of does what the `cubemap` code does, but the other way around; maybe so to say it undoes it. However: you put a 2D horizontal cross texture into that fuse and the result is a 2D horizontal cross texture. A functionality that is pretty useless as such. But on the one hand seeing both directions of the calculations might help someone not used to that stuff (like me when I wrote this Fuse) to understand the formulas; and on the other hand it is good to have to doublecheck if the `cubemap` function does the right thing.

Tries to get the DCTL as close as possible to "normal" OpenGL ES. Actually the fragment shader code (content of the `KernelCode` variable) can just be copied and pasted into [shadertoy.com](https://www.shadertoy.com/view/7sBcRh)). Quite some DCTL specifics enclosed in `#ifdef` and the resulting code is not very readably, but still this might be an approach to consider to minimize the changes done for WebGL to DCTL conversions?!?

* Can be used to test and understand the `float4 cubemap(__TEXTURE2D__, float3)` function accessing a 2D horizontal cross texture.
* Shows on the DCTL side some transformations from different vector formats to others (normalized or not, 2D and 3D).
* Can be used as a basis by just replacing the `KernelCode` for your own DCTL code that requires accessing a cube map.
* Is an example of how close we can get between DCTL and WebGL.
