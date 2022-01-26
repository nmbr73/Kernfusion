# Docs

* [MultiButtonControl.fuse](MultiButtonControl.fuse) ... see [MultiButtonControl](https://github.com/nmbr73/Kernfusion/wiki/MultiButtonControl)
<!-- * [texture](texture.md) (wip) -->


The fuses in the `Docs` are only meant as simple examples to document single controls, functions, etc. But the documentation itself has been moved to the [project's wiki](https://github.com/nmbr73/Kernfusion/wiki).


<!-- It'll be nice to have the wiki in Pages (but as you can see e.g. on https://stackoverflow.com/questions/41183642/how-to-convert-github-wiki-into-github-pages it is not an easy one).
-->

<!--
# Studies

* [CubeMapUnfold](CubeMapUnfold.md) DCTL to display a [CubeMapLoader](CubeMapLoader.md) input

The fuses in the `Studies` subfolder are not meant to provide any functionality or to be actually used in Fusion. It's more about having a simple example to show a single aspect without getting lost in tons of code that has all the bells and whistles. On the contrary, it is even about avoiding all the comfy inspector controls and options that would bloat the code.

If you search for a specific aspect implemented in one of these Fuses (see the readme and try th Fuse), then it is not about using the Fuse, but about reading and reusing the code for your own Fuse.
-->



<!--
# WORK IN PROGRESS

Code

    #define _tex2DVecN(texID, X, Y, O)   make_intensity(_tex2DVec4((texID), (X), (Y)), (O))
    #define _tex2DVec4(texID, X, Y)      texID.sample(RowSampler, float2((float)(X), (float)(Y)))

    typedef vec<float, 4> float4
    vec<float, 4> _tex2DVec4(?,float x,floaty)

    __DEVICE__ inline float4 make_intensity(float4 p_Tex, uchar p_Order)


    // System/Library/PrivateFrameworks/GPUCompiler.framework/Versions/31001/Libraries/lib/clang/31001.192/include/metal/metal_texture
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, int2 offset = int2(0)) const thread
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, bias options, int2 offset = int2(0)) const thread
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, level options, int2 offset = int2(0)) const thread
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, gradient2d options, int2 offset = int2(0)) const thread
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, bias options, int2 offset = int2(0)) const device
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, level options, int2 offset = int2(0)) const device
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, gradient2d options, int2 offset = int2(0)) const device
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, bias options, int2 offset = int2(0)) const constant
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, level options, int2 offset = int2(0)) const constant
    METAL_FUNC vec<T, 4> sample(sampler s, float2 coord, gradient2d options, int2 offset = int2(0)) const constant

Worth a look:
- https://www.nirsoft.net/utils/dll_export_viewer.html
-->
