
A stumbling block in the conversion arises with the modulo function. The `_fmod()` provided by DCTL unfortunately behaves a little differently than the one in WebGL. So it is sometimes absolutely necessary to use the replacement:

```
#define mod_f(a,b) (a-b*_floor(a/b))
```

> OpenGL ES defines `mod(x,y)` to compute `x` modulo `y` as `x-y*floor(x/y)`. In `cmath.h`an `fmod(x,y)`is defined being the floating point remainder of `x/y` which is calculated as `x-n*y` with `n` beging `x/y` with it's fractional part truncated.  With `floor` truncating the fractional part this should be `floor(x/y)` and thereby this interpretation should match the OpenGL ES spec. And as `fmod` is overloaded to work with `float` as well as with `double` (the default), one would use `float fmodf(float,float)` to constrain it to `float` and only `float`. For Metal (don't know if it comes with Metal or is added by DCTL) `_modf` comes as the type generic macro `#define _modf(X, INTVAL) modf((X), (INTVAL))` - and here it even works for the vector types. Furthermore you should know that in the C standard library there also is a `T modf(T,T*)` function defined with `T` being `float`, `double`, or `long double` that does decompose a value in its integral and fractional part, and has its `modff` variant for single precision values.

