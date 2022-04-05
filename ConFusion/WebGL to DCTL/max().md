Here it is important that both parameters are of the same type:
```
float2 Par1 = 1.0f;
float Par2 = 2.0f;
float2 erg = _fmaxf(Par1, to_float2_s (Par2));
```