The fract function is absent in Cuda, but fortunately the _floor function works
```C
#ifdef DEVICE_IS_CUDA 
   #define fract(A) ((A)-_floor(A))
#endif
```

