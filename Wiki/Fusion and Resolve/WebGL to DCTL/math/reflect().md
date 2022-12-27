Missing in OpenCL so it has to be added 

```C
#if defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)
   #define _reflect(I,N) (I-2.0f*dot(N,I)*N) 
#endif
```

