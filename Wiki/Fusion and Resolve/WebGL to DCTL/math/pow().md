There are shader translations in which unexpected results occur as a result of a pow calculation. This is due to the different handling of the result. The problem can be eliminated with the help of this substitute function:

```C
// corrected pow-function by Chris Ridings
__DEVICE__ float powcf(float x, float y) {
  float ret = _powf(x,y);
  if (isnan(ret))
    return 0.0001f;
  return ret;
}
```

Alternative method

```C
__DEVICE__ float lpowf(float a, float b) {
  return _expf(b * _logf(a));
}
```