Missing in Cuda, so it has to be impelmented. Unfortunately, there are two cases:

```
#if defined(DEVICE_IS_CUDA)
   #define distance_f(pt1,pt2) (_fabs(pt1-pt2))
   #define distance_fx(pt1,pt2) (_sqrtf(dot(pt2-pt1,pt2-pt1)))
#else
   #define distance_f(pt1,pt2) (distance(pt1,pt2))
   #define distance_fx(pt1,pt2) (distance(pt1,pt2))
#endif

```