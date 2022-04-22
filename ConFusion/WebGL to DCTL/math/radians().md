Exists in OpenGL ES, but not in Cuda, OpenCL, Metal, and it's not added by DCTL. So we have to define it ourselves ...

```C
__DEVICE__ inline float radians(float degrees)
{ 
  return M_PI * degrees / 180.0f;
}
```

