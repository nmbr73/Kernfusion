The function sign() is defined in Metal as well as in OpenCL, but must be implemented for Cuda.

```C
#ifdef DEVICE_IS_CUDA
  __DEVICE__ inline float sign(float x) { return (x<0.0f ? -1.0f : (x>0.0f ? 1.0f : 0.0f)); }
#endif
```
