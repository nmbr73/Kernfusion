Most shader languages are based on some kind of C and thereby seem to inherit a good bunch of the well known `math.h` functions. On the other hand does GLSL define additional functions which don't come with the C standard libraries, or it uses features like overloading, which leads to problems when a function like `sin()` is defined as `sin(float)` as well as for `sin(double)` - in these cases DCTL avoids the ambiguity by providing explicit functions to determine the required variant - in the example a `_sinf()` works for a float parameter and only a float parameter.


Function    | Remark
------------|------------------------------------------
[[cos()]]   | Replace with DCTL's `_cosf(float)`
[[fract()]] | Implementation needed for Cuda
[[pow()]]   | Corrected version needed for some shaders
[[max()]]   | Replace with `_fmaxf()`
[[min()]]   | Replace with `_fmixf()`
[[mod()]]   | Replace with `mod_f()`
[[sign()]]  | Implementation needed for Cuda
[[sin()]]   | Replace with DCTL's `_sinf(float)`


See also [WebGL to DCTL](https://github.com/nmbr73/Shadertoys/wiki/WebGL-to-DCTL#build-in-math-functions) for a differently formatted overview on how to convert which of these functions.

Functions that do not come with `math.h` and must be implemented separately - if they don't come with the Graphics API or DCTL already.

Function       | Description
---------------|-------------------------------------------
[[clamp()]]    | Exists (at least `clamp(float,float,float)`
[[dot()]]      | Exists (at least `dot(float,float)`; we'll have to check for Vector types
[[radians()]]  | Implement as `radians(float)` (missing in Cuda - maybe better radians_f())
[[distance()]] | Implement as `distance_f` and `distance_fx` (missing in Cuda)
[[reflect()]]  | Missing in OpenCL (metal ? don't know exactly-please check)

### External links

- [C Mathematical Functions](https://en.wikipedia.org/wiki/C_mathematical_functions) on Wikipedia
- [Common Mathematical Functions](https://en.cppreference.com/w/cpp/numeric/math) on cppreference.co
- [Cuda Math API](https://docs.nvidia.com/cuda/cuda-math-api/index.html) on docs.nvidia.com
- [OpenGL Reference](https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/indexflat.php) at khronos.org

