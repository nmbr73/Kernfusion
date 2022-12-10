---
tags: [webgl2dctl]
---

## Background

WebGL supports the so called *swizzling*. This is to generate a vector out of single and reordered elements of another vector.

```C
vec3 a(1.,2.);
vec4 b=a.xyxx; // b is (1.,2.,1.,1.)
vec2 c=a.yy // c is (2.,2.)
```

### Swizzling for r-values

We can eliminate this by defines as follows:
```C
#define swixy(V) to_float2((V).x,(V).y)
```

A typical scenario is the `iResolution.xy` that you often see in shader code and which would then translate to `swixy(iResolution)`.

As [[Metal]] has full support for swizzling we don't need this workaround here, which would make it:
```C
#if defined (DEVICE_IS_METAL)
  #define swixy(V) (V).xy
#else
  #define swixy(V) to_float2((V).x,(V).y)
#endif
```

It's simple to extend the list of these defines to whatever is needed in the respective shader:
```C
#ifdef DEVICE_IS_METAL
  #define swixy(V) (V).xy
  #define swiyx(V) (V).yx
  #define swixz(V) (V).xz
  #define swiyz(V) (V).yz
  #define swixyz(V) (V).xyz
  #define swixxy(V) (V).xxy
  #define swixyx(V) (V).xyx
  #define swiyxx(V) (V).yxx
#else
  #define swixy(V) to_float2((V).x,(V).y)
  #define swiyx(V) to_float2((V).y,(V).x)
  #define swixz(V) to_float2((V).x,(V).z)
  #define swiyz(V) to_float2((V).y,(V).z)
  #define swixyz(V) to_float3((V).x,(V).y,(V).z)
  #define swixxy(V) to_float3((V).x,(V).x,(V).y)
  #define swixyx(V) to_float3((V).x,(V).y,(V).x)
  #define swiyxx(V) to_float3((V).y,(V).x,(V).x)
#endif
```

### Swizzling for l-values

But furthermore swizzling is also possible for l-values. Here defines as follow can help, but are not that generic as the above definitions for r-values:
```C
#if defined (DEVICE_IS_METAL)
  #define lswixy(L,R) (L).xy = (R)
  #define lswiyx(L,R) (L).yx = (R)
  #define lswiyz(L,R) (L).yz = (R)
  #define lswixz(L,R) (L).xz = (R)
  #define lswixyz(L,R) (L).xyz = (R)
  // ...
#else
  #define lswixy(L,R) { float2 tmp = (R); (L).x=tmp.x; (L).y=tmp.y; }
  #define lswiyx(L,R) { float2 tmp = (R); (L).y=tmp.x; (L).x=tmp.y; }
  #define lswiyz(L,R) { float2 tmp = (R); (L).y=tmp.x; (L).z=tmp.y; }
  #define lswixz(L,R) { float2 tmp = (R); (L).x=tmp.x; (L).z=tmp.y; }
  #define lswixyz(L,R) { float3 tmp = (R); (L).x=tmp.x; (L).y=tmp.y; (L).z=tmp.z; }
  // ...
#endif
```
With these ugly little helpers you can make for example a ...
```C
dir.yz=prod_float2_mat2(swiyz(dir),to_mat2(_cosf(an),_sinf(an),-_sinf(an),_cosf(an)));
```
that would compile neither on OpenCL nor on CUDA, a
```C
lswiyz(dir,prod_float2_mat2(swiyz(dir),to_mat2(_cosf(an),_sinf(an),-_sinf(an),_cosf(an))));
```
which should run on all platforms.

