---
tags: [webgl2dctl]
---

This article is mainly based on [@J-i-P-i](https://github.com/J-i-P-i)'s excellent WSL post "[Convert a Shadertoy WebGL Code to DCTL](https://www.steakunderwater.com/wesuckless/viewtopic.php?f=17&t=4460)".


### Show Stoppers

Before converting a Shadertoy you should have a look if the code contains something yet not possible to convert:
- dFdx / dFdy
- texelfetch

For other challenges there might be workarounds, but you should check the impact on the resulting image beforehand:
- for `textureLod` omittimg the LOD by using `_tex2DVecN` might be sufficient
- ...



### Floating Point Literals

Add the explicit type qualifier suffix `f` to every floating point literal to avoid its interpretation as a `double` precision value (which is the default if no suffix is present). Don't leave out the optional parts of the _significant_ (though they are optional). That means don't use the shortcuts like `0.` or `.0`, but always write the complete `0.0` (or in our case even more precisely it must be a `0.0f`).



### Math Functions for Scalars Types (floats)

DCTL provides a lot of substitutes like `_sinf(float)`, `_cosf(float)` for the common math functions `sin(T)`, `cos(T)` to avoid ambiguities in particular with single precision, and double precision floating point types, and overloaded functions.

replace         | with
----------------|------------------
sin, cos, pow   | _sinf, _cosf, _powf
max, min        | _fmaxf, _fminf
abs, mod        | _fabs, **mod_f** (Incompatibility)
atan            | _atan2f (possibly on `_atan2f (var, 1.0f);` expand)
clamp, dot, step| _no replacement needed_
mix             | _mix

See [[Mathematical Functions]] for further details.



### Porting Vector Types

Replace WebGL's `vec2`, `vec3`, `vec4` types by DCTL's `float2`, `float3`, `float4`. Note that for r-values you must use the corresponding `to_float`-functions.

For example ...
```C
vec3 v = vec3(.2,.4,1.3);
```
... translates to ...
```C
float3 v = to_float3(0.2f,0.4f,1.3f);
```

One speciality with those vector types ist, that accessing multiple vector elements at ones (e.g. `float2 c=coords.xy`) must be resolved to single element access (the example could be converted to `float2 c = to_float2(coords.x,coords.y)`). See [[swizzling]] for further details and more examples.



### Math Functions for Vector Types

The built-in math functions we usually need for shader programming only handle the scalar types (i.e. `float` and `double`). For vector types we have to implement these functions ourselves. But as this in most cases means to just perform the function on each of the vector's element, this is pretty easy to do. For example one could define the `floor` function for a `vec2` aka `floar2` as:
```C
__DEVICE__ inline floor_float2(float2 v) { return to_float2(_floor(v.x),_fllor(v.y)); }
``` 

### Matrices

In contrast to WebGL, where there is support for the matrix types 2x2, 3x3 and 4x4, this is missing in DCTL.
An attempt to implement the different initializations with overloaded functions and the multiplication by overloading the operator could not be implemented in this way. Firstly, different procedures are necessary for overloading for OpenCL and Cuda, but unfortunately an operator cannot be overloaded in OpenCL, so that the following functions are added uniformly for all frameworks when using mat2.

First the type definition:
```C
 typedef struct
  {
     float2 r0, r1;
  } mat2;
 ```
Then the two initialization functions:
```C
 __DEVICE__ inline mat2 make_mat2 (float2 A, float2 B)
  {
     mat2 C;
     C.r0 = A;
     C.r1 = B;
     return C;
  }
  
 __DEVICE__ inline mat2 make_mat2_2 (float A, float B, float C, float D)
  {
     mat2 E;
     E.r0 = to_float2 (A, B);
     E.r1 = to_float2 (C, D);
     return E;
  }
```

and the multiplication functions:
```C
  __DEVICE__ inline float2 mat2_multi_2f (mat2 B, float2 A)
  {
     float2 C;
     C.x = A.x * B.r0.x + A.y * B.r0.y;
     C.y = A.x * B.r1.x + A.y * B.r1.y;
     return C;
  }
   __DEVICE__ inline float2 f2_multi_mat2 (float2 A, mat2 B)
  {
     float2 C;
     C.x = A.x * B.r0.x + A.y * B.r0.y;
     C.y = A.x * B.r1.x + A.y * B.r1.y;
     return C;
  }
  __DEVICE__ inline mat2 mat2_multi_f (mat2 A, float B)
  {
    return make_mat2 (to_float2 (A.r0.x * B, A.r0.y * B), to_float2 (A.r1.x * B, A.r1.y * B));
  }
```

### Shader Parameters

#### iResolution

Is a `vec3` with the width and height (in pixels) and the pixel aspect ration (usually 1.0) of the viewport.