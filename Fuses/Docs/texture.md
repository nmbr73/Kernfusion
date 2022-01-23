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
