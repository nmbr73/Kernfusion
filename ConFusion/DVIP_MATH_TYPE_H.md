```C
#define DVIP_MATH_TYPE_H
```


```C
#ifndef DEVICE_IS_OPENCL
namespace DAVINCIIP_NAMESPACE {
#endif

typedef struct TransformMatrix
{
    float c00, c01, c02;
    float c10, c11, c12;
    float c20, c21, c22;
} TransformMatrix;

typedef struct TransformMatrixI
{
    int c00, c01, c02;
    int c10, c11, c12;
    int c20, c21, c22;
} TransformMatrixI;

#ifndef DEVICE_IS_OPENCL
}
#endif

#endif



#ifdef DEVICE_IS_CUDA




#ifndef HELPER_MATH_H
#define HELPER_MATH_H


typedef unsigned int uint;
typedef unsigned short ushort;

#ifndef EXIT_WAIVED
#define EXIT_WAIVED 2
#endif

#ifndef __CUDACC__
inline float fminf(float a, float b) { return a < b ? a : b; }
inline float fmaxf(float a, float b) { return a > b ? a : b; }
inline int max(int a, int b) { return a > b ? a : b; }
inline int min(int a, int b) { return a < b ? a : b; }
inline float rsqrtf(float x) { return 1.0f / sqrtf(x); }
#endif


```

```
inline __host__ __device__ <T>2 make_<TYPE>2(<TYPE> s)
````


```C
float2 make_float2(float s) // x=y=s
float2 make_float2(float3 a) //x=a.x, y=a.y
float2 make_float2(int2 a) //x=a.x, y=a.y
float2 make_float2(uint2 a) //x=a.x, y=a.y

int2 make_int2(int s) // x=y=s
int2 make_int2(int3 a) // x=a.x, y=a.y
int2 make_int2(uint2 a) // x=a.x, y=a.y
int2 make_int2(float2 a) // x=a.x, y=a.y

uint2 make_uint2(uint s) // x=y=s
uint2 make_uint2(uint3 a) // x=a.x, y=a.y
uint2 make_uint2(int2 a) // x=a.x, y=a.y

float3 make_float3(float s) // x=y=z=s
float3 make_float3(float2 a) // x=a.x, y=a.y, z=0
float3 make_float3(float2 a, float s) // x=a.x, y=a.y, z=s
float3 make_float3(float4 a) // x=a.x, y=a.y, z=a.z
float3 make_float3(int3 a) // x=a.x, y=a.y, z=a.z
float3 make_float3(uint3 a) // x=a.x, y=a.y, z=a.z

int3 make_int3(int s) // x=y=z=s
int3 make_int3(int2 a) // x=a.x, y=a.y, z=0
int3 make_int3(int2 a, int s) // x=a.x, y=a.y, z=s
int3 make_int3(uint3 a) // x=a.x, y=a.y, z=a.z
int3 make_int3(float3 a) // x=a.x, y=a.y, z=a.z

uint3 make_uint3(uint s) // x=y=z=s
uint3 make_uint3(uint2 a) // x=a.x, y=a.y, z=0
uint3 make_uint3(uint2 a, uint s) // x=a.x, y=a.y, z=s
uint3 make_uint3(uint4 a) // x=a.x, y=a.y, z=a.z
uint3 make_uint3(int3 a) // x=a.x, y=a.y, z=a.z

float4 make_float4(float s) // x=y=z=w=s
float4 make_float4(float3 a) // x=a.x, y=a.y, z=a.z, w=0
float4 make_float4(float3 a, float s) // x=a.x, y=a.y, z=a.z, w=s
float4 make_float4(int4 a) // x=a.x, y=a.y, z=a.z, w=a.w
float4 make_float4(uint4 a) // x=a.x, y=a.y, z=a.z, w=a.w

int4 make_int4(int s) // x=y=z=w=s
int4 make_int4(int3 a) // x=a.x, y=a.y, z=a.z, w=0
int4 make_int4(int3 a, int s) // x=a.x, y=a.y, z=a.z, w=s
int4 make_int4(uint4 a) // x=a.x, y=a.y, z=a.z, w=a.w
int4 make_int4(float4 a) // x=a.x, y=a.y, z=a.z, w=a.w


uint4 make_uint4(uint s)  // x=y=z=w=s
uint4 make_uint4(uint3 a) // x=a.x, y=a.y, z=a.z, w=0
uint4 make_uint4(uint3 a, uint s) // x=a.x, y=a.y, z=a.z, w=s
uint4 make_uint4(int4 a) // x=a.x, y=a.y, z=a.z, w=a.w





inline __host__ __device__ float2 operator-(float2 &a)
{
    return make_float2(-a.x, -a.y);
}
inline __host__ __device__ int2 operator-(int2 &a)
{
    return make_int2(-a.x, -a.y);
}
inline __host__ __device__ float3 operator-(float3 &a)
{
    return make_float3(-a.x, -a.y, -a.z);
}
inline __host__ __device__ int3 operator-(int3 &a)
{
    return make_int3(-a.x, -a.y, -a.z);
}
inline __host__ __device__ float4 operator-(float4 &a)
{
    return make_float4(-a.x, -a.y, -a.z, -a.w);
}
inline __host__ __device__ int4 operator-(int4 &a)
{
    return make_int4(-a.x, -a.y, -a.z, -a.w);
}





inline __host__ __device__ float2 operator+(float2 a, float2 b)
{
    return make_float2(a.x + b.x, a.y + b.y);
}
inline __host__ __device__ void operator+=(float2 &a, float2 b)
{
    a.x += b.x;
    a.y += b.y;
}
inline __host__ __device__ float2 operator+(float2 a, float b)
{
    return make_float2(a.x + b, a.y + b);
}
inline __host__ __device__ float2 operator+(float b, float2 a)
{
    return make_float2(a.x + b, a.y + b);
}
inline __host__ __device__ void operator+=(float2 &a, float b)
{
    a.x += b;
    a.y += b;
}

inline __host__ __device__ int2 operator+(int2 a, int2 b)
{
    return make_int2(a.x + b.x, a.y + b.y);
}
inline __host__ __device__ void operator+=(int2 &a, int2 b)
{
    a.x += b.x;
    a.y += b.y;
}
inline __host__ __device__ int2 operator+(int2 a, int b)
{
    return make_int2(a.x + b, a.y + b);
}
inline __host__ __device__ int2 operator+(int b, int2 a)
{
    return make_int2(a.x + b, a.y + b);
}
inline __host__ __device__ void operator+=(int2 &a, int b)
{
    a.x += b;
    a.y += b;
}

inline __host__ __device__ uint2 operator+(uint2 a, uint2 b)
{
    return make_uint2(a.x + b.x, a.y + b.y);
}
inline __host__ __device__ void operator+=(uint2 &a, uint2 b)
{
    a.x += b.x;
    a.y += b.y;
}
inline __host__ __device__ uint2 operator+(uint2 a, uint b)
{
    return make_uint2(a.x + b, a.y + b);
}
inline __host__ __device__ uint2 operator+(uint b, uint2 a)
{
    return make_uint2(a.x + b, a.y + b);
}
inline __host__ __device__ void operator+=(uint2 &a, uint b)
{
    a.x += b;
    a.y += b;
}


inline __host__ __device__ float3 operator+(float3 a, float3 b)
{
    return make_float3(a.x + b.x, a.y + b.y, a.z + b.z);
}
inline __host__ __device__ void operator+=(float3 &a, float3 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
}
inline __host__ __device__ float3 operator+(float3 a, float b)
{
    return make_float3(a.x + b, a.y + b, a.z + b);
}
inline __host__ __device__ void operator+=(float3 &a, float b)
{
    a.x += b;
    a.y += b;
    a.z += b;
}

inline __host__ __device__ int3 operator+(int3 a, int3 b)
{
    return make_int3(a.x + b.x, a.y + b.y, a.z + b.z);
}
inline __host__ __device__ void operator+=(int3 &a, int3 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
}
inline __host__ __device__ int3 operator+(int3 a, int b)
{
    return make_int3(a.x + b, a.y + b, a.z + b);
}
inline __host__ __device__ void operator+=(int3 &a, int b)
{
    a.x += b;
    a.y += b;
    a.z += b;
}

inline __host__ __device__ uint3 operator+(uint3 a, uint3 b)
{
    return make_uint3(a.x + b.x, a.y + b.y, a.z + b.z);
}
inline __host__ __device__ void operator+=(uint3 &a, uint3 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
}
inline __host__ __device__ uint3 operator+(uint3 a, uint b)
{
    return make_uint3(a.x + b, a.y + b, a.z + b);
}
inline __host__ __device__ void operator+=(uint3 &a, uint b)
{
    a.x += b;
    a.y += b;
    a.z += b;
}

inline __host__ __device__ int3 operator+(int b, int3 a)
{
    return make_int3(a.x + b, a.y + b, a.z + b);
}
inline __host__ __device__ uint3 operator+(uint b, uint3 a)
{
    return make_uint3(a.x + b, a.y + b, a.z + b);
}
inline __host__ __device__ float3 operator+(float b, float3 a)
{
    return make_float3(a.x + b, a.y + b, a.z + b);
}

inline __host__ __device__ float4 operator+(float4 a, float4 b)
{
    return make_float4(a.x + b.x, a.y + b.y, a.z + b.z,  a.w + b.w);
}
inline __host__ __device__ void operator+=(float4 &a, float4 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
    a.w += b.w;
}
inline __host__ __device__ float4 operator+(float4 a, float b)
{
    return make_float4(a.x + b, a.y + b, a.z + b, a.w + b);
}
inline __host__ __device__ float4 operator+(float b, float4 a)
{
    return make_float4(a.x + b, a.y + b, a.z + b, a.w + b);
}
inline __host__ __device__ void operator+=(float4 &a, float b)
{
    a.x += b;
    a.y += b;
    a.z += b;
    a.w += b;
}

inline __host__ __device__ int4 operator+(int4 a, int4 b)
{
    return make_int4(a.x + b.x, a.y + b.y, a.z + b.z,  a.w + b.w);
}
inline __host__ __device__ void operator+=(int4 &a, int4 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
    a.w += b.w;
}
inline __host__ __device__ int4 operator+(int4 a, int b)
{
    return make_int4(a.x + b, a.y + b, a.z + b,  a.w + b);
}
inline __host__ __device__ int4 operator+(int b, int4 a)
{
    return make_int4(a.x + b, a.y + b, a.z + b,  a.w + b);
}
inline __host__ __device__ void operator+=(int4 &a, int b)
{
    a.x += b;
    a.y += b;
    a.z += b;
    a.w += b;
}

inline __host__ __device__ uint4 operator+(uint4 a, uint4 b)
{
    return make_uint4(a.x + b.x, a.y + b.y, a.z + b.z,  a.w + b.w);
}
inline __host__ __device__ void operator+=(uint4 &a, uint4 b)
{
    a.x += b.x;
    a.y += b.y;
    a.z += b.z;
    a.w += b.w;
}
inline __host__ __device__ uint4 operator+(uint4 a, uint b)
{
    return make_uint4(a.x + b, a.y + b, a.z + b,  a.w + b);
}
inline __host__ __device__ uint4 operator+(uint b, uint4 a)
{
    return make_uint4(a.x + b, a.y + b, a.z + b,  a.w + b);
}
inline __host__ __device__ void operator+=(uint4 &a, uint b)
{
    a.x += b;
    a.y += b;
    a.z += b;
    a.w += b;
}





inline __host__ __device__ float2 operator-(float2 a, float2 b)
{
    return make_float2(a.x - b.x, a.y - b.y);
}
inline __host__ __device__ void operator-=(float2 &a, float2 b)
{
    a.x -= b.x;
    a.y -= b.y;
}
inline __host__ __device__ float2 operator-(float2 a, float b)
{
    return make_float2(a.x - b, a.y - b);
}
inline __host__ __device__ float2 operator-(float b, float2 a)
{
    return make_float2(b - a.x, b - a.y);
}
inline __host__ __device__ void operator-=(float2 &a, float b)
{
    a.x -= b;
    a.y -= b;
}

inline __host__ __device__ int2 operator-(int2 a, int2 b)
{
    return make_int2(a.x - b.x, a.y - b.y);
}
inline __host__ __device__ void operator-=(int2 &a, int2 b)
{
    a.x -= b.x;
    a.y -= b.y;
}
inline __host__ __device__ int2 operator-(int2 a, int b)
{
    return make_int2(a.x - b, a.y - b);
}
inline __host__ __device__ int2 operator-(int b, int2 a)
{
    return make_int2(b - a.x, b - a.y);
}
inline __host__ __device__ void operator-=(int2 &a, int b)
{
    a.x -= b;
    a.y -= b;
}

inline __host__ __device__ uint2 operator-(uint2 a, uint2 b)
{
    return make_uint2(a.x - b.x, a.y - b.y);
}
inline __host__ __device__ void operator-=(uint2 &a, uint2 b)
{
    a.x -= b.x;
    a.y -= b.y;
}
inline __host__ __device__ uint2 operator-(uint2 a, uint b)
{
    return make_uint2(a.x - b, a.y - b);
}
inline __host__ __device__ uint2 operator-(uint b, uint2 a)
{
    return make_uint2(b - a.x, b - a.y);
}
inline __host__ __device__ void operator-=(uint2 &a, uint b)
{
    a.x -= b;
    a.y -= b;
}

inline __host__ __device__ float3 operator-(float3 a, float3 b)
{
    return make_float3(a.x - b.x, a.y - b.y, a.z - b.z);
}
inline __host__ __device__ void operator-=(float3 &a, float3 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
}
inline __host__ __device__ float3 operator-(float3 a, float b)
{
    return make_float3(a.x - b, a.y - b, a.z - b);
}
inline __host__ __device__ float3 operator-(float b, float3 a)
{
    return make_float3(b - a.x, b - a.y, b - a.z);
}
inline __host__ __device__ void operator-=(float3 &a, float b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
}

inline __host__ __device__ int3 operator-(int3 a, int3 b)
{
    return make_int3(a.x - b.x, a.y - b.y, a.z - b.z);
}
inline __host__ __device__ void operator-=(int3 &a, int3 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
}
inline __host__ __device__ int3 operator-(int3 a, int b)
{
    return make_int3(a.x - b, a.y - b, a.z - b);
}
inline __host__ __device__ int3 operator-(int b, int3 a)
{
    return make_int3(b - a.x, b - a.y, b - a.z);
}
inline __host__ __device__ void operator-=(int3 &a, int b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
}

inline __host__ __device__ uint3 operator-(uint3 a, uint3 b)
{
    return make_uint3(a.x - b.x, a.y - b.y, a.z - b.z);
}
inline __host__ __device__ void operator-=(uint3 &a, uint3 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
}
inline __host__ __device__ uint3 operator-(uint3 a, uint b)
{
    return make_uint3(a.x - b, a.y - b, a.z - b);
}
inline __host__ __device__ uint3 operator-(uint b, uint3 a)
{
    return make_uint3(b - a.x, b - a.y, b - a.z);
}
inline __host__ __device__ void operator-=(uint3 &a, uint b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
}

inline __host__ __device__ float4 operator-(float4 a, float4 b)
{
    return make_float4(a.x - b.x, a.y - b.y, a.z - b.z,  a.w - b.w);
}
inline __host__ __device__ void operator-=(float4 &a, float4 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
    a.w -= b.w;
}
inline __host__ __device__ float4 operator-(float4 a, float b)
{
    return make_float4(a.x - b, a.y - b, a.z - b,  a.w - b);
}
inline __host__ __device__ void operator-=(float4 &a, float b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
    a.w -= b;
}

inline __host__ __device__ int4 operator-(int4 a, int4 b)
{
    return make_int4(a.x - b.x, a.y - b.y, a.z - b.z,  a.w - b.w);
}
inline __host__ __device__ void operator-=(int4 &a, int4 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
    a.w -= b.w;
}
inline __host__ __device__ int4 operator-(int4 a, int b)
{
    return make_int4(a.x - b, a.y - b, a.z - b,  a.w - b);
}
inline __host__ __device__ int4 operator-(int b, int4 a)
{
    return make_int4(b - a.x, b - a.y, b - a.z, b - a.w);
}
inline __host__ __device__ void operator-=(int4 &a, int b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
    a.w -= b;
}

inline __host__ __device__ uint4 operator-(uint4 a, uint4 b)
{
    return make_uint4(a.x - b.x, a.y - b.y, a.z - b.z,  a.w - b.w);
}
inline __host__ __device__ void operator-=(uint4 &a, uint4 b)
{
    a.x -= b.x;
    a.y -= b.y;
    a.z -= b.z;
    a.w -= b.w;
}
inline __host__ __device__ uint4 operator-(uint4 a, uint b)
{
    return make_uint4(a.x - b, a.y - b, a.z - b,  a.w - b);
}
inline __host__ __device__ uint4 operator-(uint b, uint4 a)
{
    return make_uint4(b - a.x, b - a.y, b - a.z, b - a.w);
}
inline __host__ __device__ void operator-=(uint4 &a, uint b)
{
    a.x -= b;
    a.y -= b;
    a.z -= b;
    a.w -= b;
}





inline __host__ __device__ float2 operator*(float2 a, float2 b)
{
    return make_float2(a.x * b.x, a.y * b.y);
}
inline __host__ __device__ void operator*=(float2 &a, float2 b)
{
    a.x *= b.x;
    a.y *= b.y;
}
inline __host__ __device__ float2 operator*(float2 a, float b)
{
    return make_float2(a.x * b, a.y * b);
}
inline __host__ __device__ float2 operator*(float b, float2 a)
{
    return make_float2(b * a.x, b * a.y);
}
inline __host__ __device__ void operator*=(float2 &a, float b)
{
    a.x *= b;
    a.y *= b;
}

inline __host__ __device__ int2 operator*(int2 a, int2 b)
{
    return make_int2(a.x * b.x, a.y * b.y);
}
inline __host__ __device__ void operator*=(int2 &a, int2 b)
{
    a.x *= b.x;
    a.y *= b.y;
}
inline __host__ __device__ int2 operator*(int2 a, int b)
{
    return make_int2(a.x * b, a.y * b);
}
inline __host__ __device__ int2 operator*(int b, int2 a)
{
    return make_int2(b * a.x, b * a.y);
}
inline __host__ __device__ void operator*=(int2 &a, int b)
{
    a.x *= b;
    a.y *= b;
}

inline __host__ __device__ uint2 operator*(uint2 a, uint2 b)
{
    return make_uint2(a.x * b.x, a.y * b.y);
}
inline __host__ __device__ void operator*=(uint2 &a, uint2 b)
{
    a.x *= b.x;
    a.y *= b.y;
}
inline __host__ __device__ uint2 operator*(uint2 a, uint b)
{
    return make_uint2(a.x * b, a.y * b);
}
inline __host__ __device__ uint2 operator*(uint b, uint2 a)
{
    return make_uint2(b * a.x, b * a.y);
}
inline __host__ __device__ void operator*=(uint2 &a, uint b)
{
    a.x *= b;
    a.y *= b;
}

inline __host__ __device__ float3 operator*(float3 a, float3 b)
{
    return make_float3(a.x * b.x, a.y * b.y, a.z * b.z);
}
inline __host__ __device__ void operator*=(float3 &a, float3 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
}
inline __host__ __device__ float3 operator*(float3 a, float b)
{
    return make_float3(a.x * b, a.y * b, a.z * b);
}
inline __host__ __device__ float3 operator*(float b, float3 a)
{
    return make_float3(b * a.x, b * a.y, b * a.z);
}
inline __host__ __device__ void operator*=(float3 &a, float b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
}

inline __host__ __device__ int3 operator*(int3 a, int3 b)
{
    return make_int3(a.x * b.x, a.y * b.y, a.z * b.z);
}
inline __host__ __device__ void operator*=(int3 &a, int3 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
}
inline __host__ __device__ int3 operator*(int3 a, int b)
{
    return make_int3(a.x * b, a.y * b, a.z * b);
}
inline __host__ __device__ int3 operator*(int b, int3 a)
{
    return make_int3(b * a.x, b * a.y, b * a.z);
}
inline __host__ __device__ void operator*=(int3 &a, int b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
}

inline __host__ __device__ uint3 operator*(uint3 a, uint3 b)
{
    return make_uint3(a.x * b.x, a.y * b.y, a.z * b.z);
}
inline __host__ __device__ void operator*=(uint3 &a, uint3 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
}
inline __host__ __device__ uint3 operator*(uint3 a, uint b)
{
    return make_uint3(a.x * b, a.y * b, a.z * b);
}
inline __host__ __device__ uint3 operator*(uint b, uint3 a)
{
    return make_uint3(b * a.x, b * a.y, b * a.z);
}
inline __host__ __device__ void operator*=(uint3 &a, uint b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
}

inline __host__ __device__ float4 operator*(float4 a, float4 b)
{
    return make_float4(a.x * b.x, a.y * b.y, a.z * b.z,  a.w * b.w);
}
inline __host__ __device__ void operator*=(float4 &a, float4 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
    a.w *= b.w;
}
inline __host__ __device__ float4 operator*(float4 a, float b)
{
    return make_float4(a.x * b, a.y * b, a.z * b,  a.w * b);
}
inline __host__ __device__ float4 operator*(float b, float4 a)
{
    return make_float4(b * a.x, b * a.y, b * a.z, b * a.w);
}
inline __host__ __device__ void operator*=(float4 &a, float b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
    a.w *= b;
}

inline __host__ __device__ int4 operator*(int4 a, int4 b)
{
    return make_int4(a.x * b.x, a.y * b.y, a.z * b.z,  a.w * b.w);
}
inline __host__ __device__ void operator*=(int4 &a, int4 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
    a.w *= b.w;
}
inline __host__ __device__ int4 operator*(int4 a, int b)
{
    return make_int4(a.x * b, a.y * b, a.z * b,  a.w * b);
}
inline __host__ __device__ int4 operator*(int b, int4 a)
{
    return make_int4(b * a.x, b * a.y, b * a.z, b * a.w);
}
inline __host__ __device__ void operator*=(int4 &a, int b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
    a.w *= b;
}

inline __host__ __device__ uint4 operator*(uint4 a, uint4 b)
{
    return make_uint4(a.x * b.x, a.y * b.y, a.z * b.z,  a.w * b.w);
}
inline __host__ __device__ void operator*=(uint4 &a, uint4 b)
{
    a.x *= b.x;
    a.y *= b.y;
    a.z *= b.z;
    a.w *= b.w;
}
inline __host__ __device__ uint4 operator*(uint4 a, uint b)
{
    return make_uint4(a.x * b, a.y * b, a.z * b,  a.w * b);
}
inline __host__ __device__ uint4 operator*(uint b, uint4 a)
{
    return make_uint4(b * a.x, b * a.y, b * a.z, b * a.w);
}
inline __host__ __device__ void operator*=(uint4 &a, uint b)
{
    a.x *= b;
    a.y *= b;
    a.z *= b;
    a.w *= b;
}





inline __host__ __device__ float2 operator/(float2 a, float2 b)
{
    return make_float2(a.x / b.x, a.y / b.y);
}
inline __host__ __device__ void operator/=(float2 &a, float2 b)
{
    a.x /= b.x;
    a.y /= b.y;
}
inline __host__ __device__ float2 operator/(float2 a, float b)
{
    return make_float2(a.x / b, a.y / b);
}
inline __host__ __device__ void operator/=(float2 &a, float b)
{
    a.x /= b;
    a.y /= b;
}
inline __host__ __device__ float2 operator/(float b, float2 a)
{
    return make_float2(b / a.x, b / a.y);
}

inline __host__ __device__ float3 operator/(float3 a, float3 b)
{
    return make_float3(a.x / b.x, a.y / b.y, a.z / b.z);
}
inline __host__ __device__ void operator/=(float3 &a, float3 b)
{
    a.x /= b.x;
    a.y /= b.y;
    a.z /= b.z;
}
inline __host__ __device__ float3 operator/(float3 a, float b)
{
    return make_float3(a.x / b, a.y / b, a.z / b);
}
inline __host__ __device__ void operator/=(float3 &a, float b)
{
    a.x /= b;
    a.y /= b;
    a.z /= b;
}
inline __host__ __device__ float3 operator/(float b, float3 a)
{
    return make_float3(b / a.x, b / a.y, b / a.z);
}

inline __host__ __device__ float4 operator/(float4 a, float4 b)
{
    return make_float4(a.x / b.x, a.y / b.y, a.z / b.z,  a.w / b.w);
}
inline __host__ __device__ void operator/=(float4 &a, float4 b)
{
    a.x /= b.x;
    a.y /= b.y;
    a.z /= b.z;
    a.w /= b.w;
}
inline __host__ __device__ float4 operator/(float4 a, float b)
{
    return make_float4(a.x / b, a.y / b, a.z / b,  a.w / b);
}
inline __host__ __device__ void operator/=(float4 &a, float b)
{
    a.x /= b;
    a.y /= b;
    a.z /= b;
    a.w /= b;
}
inline __host__ __device__ float4 operator/(float b, float4 a)
{
    return make_float4(b / a.x, b / a.y, b / a.z, b / a.w);
}





inline  __host__ __device__ float2 fminf(float2 a, float2 b)
{
    return make_float2(fminf(a.x,b.x), fminf(a.y,b.y));
}
inline __host__ __device__ float3 fminf(float3 a, float3 b)
{
    return make_float3(fminf(a.x,b.x), fminf(a.y,b.y), fminf(a.z,b.z));
}
inline  __host__ __device__ float4 fminf(float4 a, float4 b)
{
    return make_float4(fminf(a.x,b.x), fminf(a.y,b.y), fminf(a.z,b.z), fminf(a.w,b.w));
}

inline __host__ __device__ int2 min(int2 a, int2 b)
{
    return make_int2(min(a.x,b.x), min(a.y,b.y));
}
inline __host__ __device__ int3 min(int3 a, int3 b)
{
    return make_int3(min(a.x,b.x), min(a.y,b.y), min(a.z,b.z));
}
inline __host__ __device__ int4 min(int4 a, int4 b)
{
    return make_int4(min(a.x,b.x), min(a.y,b.y), min(a.z,b.z), min(a.w,b.w));
}

inline __host__ __device__ uint2 min(uint2 a, uint2 b)
{
    return make_uint2(min(a.x,b.x), min(a.y,b.y));
}
inline __host__ __device__ uint3 min(uint3 a, uint3 b)
{
    return make_uint3(min(a.x,b.x), min(a.y,b.y), min(a.z,b.z));
}
inline __host__ __device__ uint4 min(uint4 a, uint4 b)
{
    return make_uint4(min(a.x,b.x), min(a.y,b.y), min(a.z,b.z), min(a.w,b.w));
}





inline __host__ __device__ float2 fmaxf(float2 a, float2 b)
{
    return make_float2(fmaxf(a.x,b.x), fmaxf(a.y,b.y));
}
inline __host__ __device__ float3 fmaxf(float3 a, float3 b)
{
    return make_float3(fmaxf(a.x,b.x), fmaxf(a.y,b.y), fmaxf(a.z,b.z));
}
inline __host__ __device__ float4 fmaxf(float4 a, float4 b)
{
    return make_float4(fmaxf(a.x,b.x), fmaxf(a.y,b.y), fmaxf(a.z,b.z), fmaxf(a.w,b.w));
}

inline __host__ __device__ int2 max(int2 a, int2 b)
{
    return make_int2(max(a.x,b.x), max(a.y,b.y));
}
inline __host__ __device__ int3 max(int3 a, int3 b)
{
    return make_int3(max(a.x,b.x), max(a.y,b.y), max(a.z,b.z));
}
inline __host__ __device__ int4 max(int4 a, int4 b)
{
    return make_int4(max(a.x,b.x), max(a.y,b.y), max(a.z,b.z), max(a.w,b.w));
}

inline __host__ __device__ uint2 max(uint2 a, uint2 b)
{
    return make_uint2(max(a.x,b.x), max(a.y,b.y));
}
inline __host__ __device__ uint3 max(uint3 a, uint3 b)
{
    return make_uint3(max(a.x,b.x), max(a.y,b.y), max(a.z,b.z));
}
inline __host__ __device__ uint4 max(uint4 a, uint4 b)
{
    return make_uint4(max(a.x,b.x), max(a.y,b.y), max(a.z,b.z), max(a.w,b.w));
}






inline __device__ __host__ float lerp(float a, float b, float t)
{
    return a + t*(b-a);
}
inline __device__ __host__ float2 lerp(float2 a, float2 b, float t)
{
    return a + t*(b-a);
}
inline __device__ __host__ float3 lerp(float3 a, float3 b, float t)
{
    return a + t*(b-a);
}
inline __device__ __host__ float4 lerp(float4 a, float4 b, float t)
{
    return a + t*(b-a);
}






inline __device__ __host__ float clamp(float f, float a, float b)
{
    return fmaxf(a, fminf(f, b));
}
inline __device__ __host__ int clamp(int f, int a, int b)
{
    return max(a, min(f, b));
}
inline __device__ __host__ uint clamp(uint f, uint a, uint b)
{
    return max(a, min(f, b));
}

inline __device__ __host__ float2 clamp(float2 v, float a, float b)
{
    return make_float2(clamp(v.x, a, b), clamp(v.y, a, b));
}
inline __device__ __host__ float2 clamp(float2 v, float2 a, float2 b)
{
    return make_float2(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y));
}
inline __device__ __host__ float3 clamp(float3 v, float a, float b)
{
    return make_float3(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b));
}
inline __device__ __host__ float3 clamp(float3 v, float3 a, float3 b)
{
    return make_float3(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z));
}
inline __device__ __host__ float4 clamp(float4 v, float a, float b)
{
    return make_float4(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b), clamp(v.w, a, b));
}
inline __device__ __host__ float4 clamp(float4 v, float4 a, float4 b)
{
    return make_float4(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z), clamp(v.w, a.w, b.w));
}

inline __device__ __host__ int2 clamp(int2 v, int a, int b)
{
    return make_int2(clamp(v.x, a, b), clamp(v.y, a, b));
}
inline __device__ __host__ int2 clamp(int2 v, int2 a, int2 b)
{
    return make_int2(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y));
}
inline __device__ __host__ int3 clamp(int3 v, int a, int b)
{
    return make_int3(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b));
}
inline __device__ __host__ int3 clamp(int3 v, int3 a, int3 b)
{
    return make_int3(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z));
}
inline __device__ __host__ int4 clamp(int4 v, int a, int b)
{
    return make_int4(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b), clamp(v.w, a, b));
}
inline __device__ __host__ int4 clamp(int4 v, int4 a, int4 b)
{
    return make_int4(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z), clamp(v.w, a.w, b.w));
}

inline __device__ __host__ uint2 clamp(uint2 v, uint a, uint b)
{
    return make_uint2(clamp(v.x, a, b), clamp(v.y, a, b));
}
inline __device__ __host__ uint2 clamp(uint2 v, uint2 a, uint2 b)
{
    return make_uint2(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y));
}
inline __device__ __host__ uint3 clamp(uint3 v, uint a, uint b)
{
    return make_uint3(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b));
}
inline __device__ __host__ uint3 clamp(uint3 v, uint3 a, uint3 b)
{
    return make_uint3(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z));
}
inline __device__ __host__ uint4 clamp(uint4 v, uint a, uint b)
{
    return make_uint4(clamp(v.x, a, b), clamp(v.y, a, b), clamp(v.z, a, b), clamp(v.w, a, b));
}
inline __device__ __host__ uint4 clamp(uint4 v, uint4 a, uint4 b)
{
    return make_uint4(clamp(v.x, a.x, b.x), clamp(v.y, a.y, b.y), clamp(v.z, a.z, b.z), clamp(v.w, a.w, b.w));
}





inline __host__ __device__ float dot(float2 a, float2 b)
{
    return a.x * b.x + a.y * b.y;
}
inline __host__ __device__ float dot(float3 a, float3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}
inline __host__ __device__ float dot(float4 a, float4 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
}

inline __host__ __device__ int dot(int2 a, int2 b)
{
    return a.x * b.x + a.y * b.y;
}
inline __host__ __device__ int dot(int3 a, int3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}
inline __host__ __device__ int dot(int4 a, int4 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
}

inline __host__ __device__ uint dot(uint2 a, uint2 b)
{
    return a.x * b.x + a.y * b.y;
}
inline __host__ __device__ uint dot(uint3 a, uint3 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z;
}
inline __host__ __device__ uint dot(uint4 a, uint4 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
}





inline __host__ __device__ float length(float2 v)
{
    return sqrtf(dot(v, v));
}
inline __host__ __device__ float length(float3 v)
{
    return sqrtf(dot(v, v));
}
inline __host__ __device__ float length(float4 v)
{
    return sqrtf(dot(v, v));
}





inline __host__ __device__ float2 normalize(float2 v)
{
    float invLen = rsqrtf(dot(v, v));
    return v * invLen;
}
inline __host__ __device__ float3 normalize(float3 v)
{
    float invLen = rsqrtf(dot(v, v));
    return v * invLen;
}
inline __host__ __device__ float4 normalize(float4 v)
{
    float invLen = rsqrtf(dot(v, v));
    return v * invLen;
}





inline __host__ __device__ float2 floorf(float2 v)
{
    return make_float2(floorf(v.x), floorf(v.y));
}
inline __host__ __device__ float3 floorf(float3 v)
{
    return make_float3(floorf(v.x), floorf(v.y), floorf(v.z));
}
inline __host__ __device__ float4 floorf(float4 v)
{
    return make_float4(floorf(v.x), floorf(v.y), floorf(v.z), floorf(v.w));
}





inline __host__ __device__ float fracf(float v)
{
    return v - floorf(v);
}
inline __host__ __device__ float2 fracf(float2 v)
{
    return make_float2(fracf(v.x), fracf(v.y));
}
inline __host__ __device__ float3 fracf(float3 v)
{
    return make_float3(fracf(v.x), fracf(v.y), fracf(v.z));
}
inline __host__ __device__ float4 fracf(float4 v)
{
    return make_float4(fracf(v.x), fracf(v.y), fracf(v.z), fracf(v.w));
}





inline __host__ __device__ float2 fmodf(float2 a, float2 b)
{
    return make_float2(fmodf(a.x, b.x), fmodf(a.y, b.y));
}
inline __host__ __device__ float3 fmodf(float3 a, float3 b)
{
    return make_float3(fmodf(a.x, b.x), fmodf(a.y, b.y), fmodf(a.z, b.z));
}
inline __host__ __device__ float4 fmodf(float4 a, float4 b)
{
    return make_float4(fmodf(a.x, b.x), fmodf(a.y, b.y), fmodf(a.z, b.z), fmodf(a.w, b.w));
}





inline __host__ __device__ float2 fabs(float2 v)
{
    return make_float2(fabs(v.x), fabs(v.y));
}
inline __host__ __device__ float3 fabs(float3 v)
{
    return make_float3(fabs(v.x), fabs(v.y), fabs(v.z));
}
inline __host__ __device__ float4 fabs(float4 v)
{
    return make_float4(fabs(v.x), fabs(v.y), fabs(v.z), fabs(v.w));
}

inline __host__ __device__ int2 abs(int2 v)
{
    return make_int2(abs(v.x), abs(v.y));
}
inline __host__ __device__ int3 abs(int3 v)
{
    return make_int3(abs(v.x), abs(v.y), abs(v.z));
}
inline __host__ __device__ int4 abs(int4 v)
{
    return make_int4(abs(v.x), abs(v.y), abs(v.z), abs(v.w));
}







inline __host__ __device__ float3 reflect(float3 i, float3 n)
{
    return i - 2.0f * n * dot(n,i);
}





inline __host__ __device__ float3 cross(float3 a, float3 b)
{
    return make_float3(a.y*b.z - a.z*b.y, a.z*b.x - a.x*b.z, a.x*b.y - a.y*b.x);
}








inline __device__ __host__ float smoothstep(float a, float b, float x)
{
    float y = clamp((x - a) / (b - a), 0.0f, 1.0f);
    return (y*y*(3.0f - (2.0f*y)));
}
inline __device__ __host__ float2 smoothstep(float2 a, float2 b, float2 x)
{
    float2 y = clamp((x - a) / (b - a), 0.0f, 1.0f);
    return (y*y*(make_float2(3.0f) - (make_float2(2.0f)*y)));
}
inline __device__ __host__ float3 smoothstep(float3 a, float3 b, float3 x)
{
    float3 y = clamp((x - a) / (b - a), 0.0f, 1.0f);
    return (y*y*(make_float3(3.0f) - (make_float3(2.0f)*y)));
}
inline __device__ __host__ float4 smoothstep(float4 a, float4 b, float4 x)
{
    float4 y = clamp((x - a) / (b - a), 0.0f, 1.0f);
    return (y*y*(make_float4(3.0f) - (make_float4(2.0f)*y)));
}

#endif

#endif
     #ifndef KERNELMATHBASE_COMMON_H
#define KERNELMATHBASE_COMMON_H
#if defined(DEVICE_IS_METAL)
using namespace metal;
#elif defined(DEVICE_IS_CUDA)
#endif







#if defined(DEVICE_IS_CUDA)
typedef unsigned int uint;
typedef unsigned short ushort;
typedef unsigned char uchar;
typedef unsigned long ulong;
#endif

#ifdef DEVICE_IS_OPENCL
#define uint8_t unsigned char
#define uint16_t unsigned short
#endif

#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_METAL)

typedef struct dvip_int8 { int4 lo, hi; } dvip_int8;
typedef struct dvip_int16 { dvip_int8 lo, hi; } dvip_int16;
typedef struct dvip_float8 { float4 lo, hi; } dvip_float8;
typedef struct dvip_float16 { dvip_float8 lo, hi; } dvip_float16;
typedef struct dvip_float32 { dvip_float16 lo, hi; } dvip_float32;
#endif
#ifdef DEVICE_IS_OPENCL
typedef int8 dvip_int8;
typedef int16 dvip_int16;
typedef float8 dvip_float8;
typedef float16 dvip_float16;
typedef struct dvip_float32 { dvip_float16 lo, hi; } dvip_float32;
#endif

#if !defined(DEVICE_IS_CUDA) && !defined(DEVICE_IS_OPENCL) && !defined(DEVICE_IS_METAL)
#define DEVICE_IS_CPU
#ifndef ENABLE_KERNEL_FILE_INCLUDES
#error 'This file is only intended to be compiled on GPU, no host side inclusion, use ENABLE_KERNEL_FILE_INCLUDES to allow this explicitly'
#endif
#endif

#if defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)
#define DEVICE_IS_RUN_TIME_COMPILED
#endif

#ifdef DEVICE_IS_CPU
#endif

#ifdef _WIN32
#define _PRAGMA_UNROLL __pragma("unroll")
#else
#define _PRAGMA_UNROLL _Pragma("unroll")
#endif

#ifndef FLT_MAX
#define FLT_MAX 0x1.fffffep127f
#endif

#ifndef FLT_MIN
#define FLT_MIN 0x1.0p-126f
#endif

#ifndef FLT_EPSILON
#define FLT_EPSILON 0x1.0p-23f
#endif


#ifndef HALF_MIN
#define HALF_MIN 5.96046448e-08f
#endif

#ifndef HALF_MAX
#define HALF_MAX 65504.0f
#endif

#ifndef HALF_EPSILON
#define HALF_EPSILON 0.00097656f
#endif

#ifndef UINT_MAX
#define UINT_MAX 0xffffffff
#endif


#undef M_PI
#define M_PI 3.141592653589793238462643f


#if defined(DEVICE_IS_CUDA)
    #define __HOST__         __host__
    #define __DEVICE__      __device__
    #define __KERNEL__      __global__
    #define __GLOBAL__
    #define __CONSTANT__    __constant__
    #define __CONSTANTREF__
    #define __CONSTANTSTATIC__ __constant__
    #define __STRUCTTYPE__(STRUCT) STRUCT
    #define MAP_STRUCT(STRUCT, PARAM, VAR_NAME) STRUCT* VAR_NAME = &PARAM
    #define __SHARED__      __shared__
    #define __SHAREDREF__
    #define __SYNCTHREAD__  __syncthreads();
    #define __MEMFENCE__    __syncthreads();
    #define __PRIVATE__
    #define __BOOL__        bool
    #define __MTL_VOLATILE
    #define GRIDDIM_X       (int)(gridDim.x)
    #define GRIDDIM_Y       (int)(gridDim.y)
    #define GRIDDIM_Z       (int)(gridDim.z)
    #define BLOCKDIM_X      (int)(blockDim.x)
    #define BLOCKDIM_Y      (int)(blockDim.y)
    #define BLOCKDIM_Z      (int)(blockDim.z)
    #define BLOCKIDX_X      (int)(blockIdx.x)
    #define BLOCKIDX_Y      (int)(blockIdx.y)
    #define BLOCKIDX_Z      (int)(blockIdx.z)
    #define THREADIDX_X     (int)(threadIdx.x)
    #define THREADIDX_Y     (int)(threadIdx.y)
    #define THREADIDX_Z     (int)(threadIdx.z)
    #define GRIDSIZE_X      (int)(gridDim.x * blockDim.x)
    #define GRIDSIZE_Y      (int)(gridDim.y * blockDim.y)
    #define GRIDSIZE_Z      (int)(gridDim.z * blockDim.z)
    #define __RESTRICT__    __restrict__
    #define __COMPUTE_QUALIFIER__
    #define __PASS_QUALIFIER__
    #define __COMPUTE_QUALIFIER_3D__
#if (__CUDA_ARCH__ < 350)
    #define _ldg(ARR, IDX)  (ARR)[IDX]
#else



    #define _ldg(ARR, IDX)  __ldg(&(ARR)[IDX])
#endif
#elif defined(DEVICE_IS_OPENCL)
    #define __HOST__
    #define __DEVICE__
    #define __KERNEL__      __kernel
    #define __GLOBAL__      __global
    #define __CONSTANT__    __constant
    #define __CONSTANTREF__ __constant
    #define __CONSTANTSTATIC__ __constant
    #define __STRUCTTYPE__(STRUCT) __constant STRUCT*
    #define MAP_STRUCT(STRUCT, PARAM, VAR_NAME) __CONSTANT__ STRUCT* VAR_NAME = PARAM
    #define __SHARED__      __local
    #define __SHAREDREF__   __local
    #define __SYNCTHREAD__  barrier(CLK_LOCAL_MEM_FENCE);
    #define __MEMFENCE__    mem_fence(CLK_LOCAL_MEM_FENCE);
    #define __PRIVATE__     __private
    #define __BOOL__        int
    #define __MTL_VOLATILE
    #define GRIDDIM_X       (int)(get_num_groups(0))
    #define GRIDDIM_Y       (int)(get_num_groups(1))
    #define GRIDDIM_Z       (int)(get_num_groups(2))
    #define BLOCKDIM_X      (int)(get_local_size(0))
    #define BLOCKDIM_Y      (int)(get_local_size(1))
    #define BLOCKDIM_Z      (int)(get_local_size(2))
    #define BLOCKIDX_X      (int)(get_group_id(0))
    #define BLOCKIDX_Y      (int)(get_group_id(1))
    #define BLOCKIDX_Z      (int)(get_group_id(2))
    #define THREADIDX_X     (int)(get_local_id(0))
    #define THREADIDX_Y     (int)(get_local_id(1))
    #define THREADIDX_Z     (int)(get_local_id(2))
    #define GRIDSIZE_X      (int)(get_global_size(0))
    #define GRIDSIZE_Y      (int)(get_global_size(1))
    #define GRIDSIZE_Z      (int)(get_global_size(2))
    #define __RESTRICT__
    #define _ldg(ARR, IDX)   (ARR)[IDX]
    #define __COMPUTE_QUALIFIER__
    #define __PASS_QUALIFIER__
    #define __COMPUTE_QUALIFIER_3D__
#elif defined(DEVICE_IS_METAL)
    #define __HOST__
    #define __DEVICE__
    #define __KERNEL__      kernel
    #define __GLOBAL__      device
    #define __CONSTANT__    constant
    #define __CONSTANTREF__ constant
    #define __CONSTANTSTATIC__ constant
    #define __STRUCTTYPE__(STRUCT) constant STRUCT*
    #define MAP_STRUCT(STRUCT, PARAM, VAR_NAME) __CONSTANT__ STRUCT* VAR_NAME = PARAM
    #define __SHARED__      threadgroup
    #define __SHAREDREF__   threadgroup
    #define __SYNCTHREAD__  threadgroup_barrier(mem_flags::mem_threadgroup);
    #define __MEMFENCE__    threadgroup_barrier(mem_flags::mem_threadgroup);
    #define __PRIVATE__     thread
    #define __BOOL__        int
    #define __MTL_VOLATILE  volatile
    #define GRIDDIM_X       (int)(gridDim.x)
    #define GRIDDIM_Y       (int)(gridDim.y)
    #define GRIDDIM_Z       (int)(gridDim.z)
    #define BLOCKDIM_X      (int)(blockDim.x)
    #define BLOCKDIM_Y      (int)(blockDim.y)
    #define BLOCKDIM_Z      (int)(blockDim.z)
    #define BLOCKIDX_X      (int)(blockIdx.x)
    #define BLOCKIDX_Y      (int)(blockIdx.y)
    #define BLOCKIDX_Z      (int)(blockIdx.z)
    #define THREADIDX_X     (int)(threadIdx.x)
    #define THREADIDX_Y     (int)(threadIdx.y)
    #define THREADIDX_Z     (int)(threadIdx.z)
    #define GRIDSIZE_X      (int)(gridSize.x)
    #define GRIDSIZE_Y      (int)(gridSize.y)
    #define GRIDSIZE_Z      (int)(gridSize.z)
    #define __RESTRICT__
    #define _ldg(ARR, IDX)  (ARR)[IDX]
    #define __COMPUTE_QUALIFIER__ , uint2 gridIdx      [[ thread_position_in_grid ]],           \
                                    uint2 gridDim      [[ threadgroups_per_grid ]],             \
                                    uint2 blockDim     [[ threads_per_threadgroup ]],           \
                                    uint2 blockIdx     [[ threadgroup_position_in_grid ]],      \
                                    uint2 threadIdx    [[ thread_position_in_threadgroup ]],    \
                                    uint2 gridSize     [[ threads_per_grid ]]
    #define __PASS_QUALIFIER__ , gridIdx,     \
                                 gridDim,     \
                                 blockDim,    \
                                 blockIdx,    \
                                 threadIdx,   \
                                 gridSize
    #define __COMPUTE_QUALIFIER_3D__ , uint3 gridIdx      [[ thread_position_in_grid ]],           \
                                       uint3 gridDim      [[ threadgroups_per_grid ]],             \
                                       uint3 blockDim     [[ threads_per_threadgroup ]],           \
                                       uint3 blockIdx     [[ threadgroup_position_in_grid ]],      \
                                       uint3 threadIdx    [[ thread_position_in_threadgroup ]],    \
                                       uint3 gridSize     [[ threads_per_grid ]]

#else
    #define __HOST__
    #define __PRIVATE__
    #define __DEVICE__
    #define __SHAREDREF__
    #define __BOOL__        bool
    #define __GLOBAL__
    #define __CONSTANT__
    #define __CONSTANTREF__
    #define __CONSTANTSTATIC__ static const
    #define __STRUCTTYPE__(STRUCT)
    #define MAP_STRUCT(STRUCT, PARAM, VAR_NAME)
#endif


#if defined(DEVICE_IS_CUDA)
    struct Sampler;
    #define __SAMPLER__                              Sampler*
    #define __TEXTURE__                              cudaTextureObject_t
    #define __TEXTURE1D__                            cudaTextureObject_t
    #define __TEXTURE2D__                            cudaTextureObject_t
    #define __TEXTURE3D__                            cudaTextureObject_t
    #define __TEXTURE2D_WRITE__                      CudaSurface
    #define __TEXTURE3D_WRITE__                      CudaSurface
    #define _tex1D(texID, X)                         tex1D<float>((texID), (X))
    #define _tex1DSampler(texID, sampler, X)         tex1D<float>((texID), (X))
    #define _tex2D(texID, X, Y)                      tex2D<float>((texID), (X), (Y))
    #define _tex3D(texID, X, Y, Z)                   tex3D<float>((texID), (X), (Y), (Z))
    #define _tex1DVec4(texID, X)                     tex1D<float4>((texID), (X))
    #define _tex2DVec4(texID, X, Y)                  tex2D<float4>((texID), (X), (Y))
    #define _tex2DVecN(texID, X, Y, O)               make_intensity(_tex2DVec4((texID), (X), (Y)), (O))
    #define _tex2DSamplerVec4(texID, sampler, X, Y)  tex2D<float4>((texID), (X), (Y))
    #define _tex2DSamplerVecN(texID, sampler, X, Y, O) make_intensity(_tex2DSamplerVec4((texID), sampler, (X), (Y)), (O))
    #define _tex3DVec4(texID, X, Y, Z)               tex3D<float4>((texID), (X), (Y), (Z))
    #define _tex3DVecN(texID, X, Y, Z, O)            make_intensity(_tex3DVec4((texID), (X), (Y), (Z)), (O))
    #define _tex3DSamplerVec4(texID, sampler, X, Y, Z) tex3D<float4>((texID), (X), (Y), (Z))
    #define _tex2DVec4Write(texID, X, Y, RGBA)       cuda_tex2DVec4Write(texID, (X), (Y), (RGBA))
    #define _tex3DVec4Write(texID, X, Y, Z, RGBA)    cuda_tex3DVec4Write(texID, (X), (Y), (Z), (RGBA))
#elif defined(DEVICE_IS_OPENCL)
    #define __SAMPLER__                              sampler_t
    #define __TEXTURE__                              __read_only image2d_t
    #define __TEXTURE1D__                            __read_only image2d_t
    #define __TEXTURE2D__                            __read_only image2d_t
    #define __TEXTURE3D__                            __read_only image3d_t
    #define __TEXTURE2D_WRITE__                      __write_only image2d_t
    #define __TEXTURE3D_WRITE__                      __write_only image3d_t

    #define _tex1D(texID, X)                         read_imagef(texID, RowSampler, (float2)((X), 0.0f)).x
    #define _tex1DSampler(texID, sampler, X)         read_imagef(texID, sampler, (float2)((X), 0.0f)).x
    #define _tex2D(texID, X, Y)                      read_imagef(texID, RowSampler, (float2)((X), (Y))).x
    #define _tex3D(texID, X, Y, Z)                   read_imagef(texID, RowSampler, (float3)((X), (Y), (Z))).x
    #define _tex1DVec4(texID, X)                     read_imagef(texID, RowSampler, (float2)((X), 0.0f))
    #define _tex2DVec4(texID, X, Y)                  read_imagef(texID, RowSampler, (float2)((X), (Y)))
    #define _tex2DVecN(texID, X, Y, O)               make_intensity(_tex2DVec4((texID), (X), (Y)), (O))
    #define _tex2DSamplerVec4(texID, sampler, X, Y)  read_imagef(texID, sampler, (float2)((X), (Y)))
    #define _tex2DSamplerVecN(texID, sampler, X, Y, O) make_intensity(_tex2DSamplerVec4((texID), sampler, (X), (Y)), (O))
    #define _tex3DVec4(texID, X, Y, Z)               read_imagef(texID, RowSampler, (float4)((X), (Y), (Z), 1.0f))
    #define _tex3DVecN(texID, X, Y, Z, O)            make_intensity(_tex3DVec4((texID), (X), (Y), (Z)), (O))
    #define _tex3DSamplerVec4(texID, sampler, X, Y, Z) read_imagef(texID, sampler, (float4)((X), (Y), (Z), 1.0f))
    #define _tex2DVec4Write(texID, X, Y, RGBA)       write_imagef(texID, (int2)((X), (Y)), (RGBA))
    #define _tex3DVec4Write(texID, X, Y, Z, RGBA)    write_imagef(texID, (int4)((X), (Y), (Z), 0), (RGBA))
#elif defined(DEVICE_IS_METAL)
    #define __SAMPLER__                              sampler
    #define __TEXTURE__                              texture2d<float, access::sample>
    #define __TEXTURE1D__                            texture2d<float, access::sample>
    #define __TEXTURE2D__                            texture2d<float, access::sample>
    #define __TEXTURE3D__                            texture3d<float, access::sample>
    #define __TEXTURE2D_READ__                       texture2d<float, access::read>
    #define __TEXTURE2D_WRITE__                      texture2d<float, access::write>
    #define __TEXTURE3D_WRITE__                      texture3d<float, access::write>
    #define __TEXTURE2D_ARRAY_READ__                 texture2d_array<float, access::read>
    #define __TEXTURE2D_ARRAY_WRITE__                texture2d_array<float, access::write>
    #define _tex1D(texID, X)                         texID.sample(RowSampler, float2((float)(X), 0.0f)).r
    #define _tex1DSampler(texID, sampler, X)         texID.sample(sampler, float2((float)(X), 0.0f)).r
    #define _tex2D(texID, X, Y)                      texID.sample(RowSampler, float2((float)(X), (float)(Y))).r
    #define _tex3D(texID, X, Y, Z)                   texID.sample(RowSampler, float3((float)(X), (float)(Y), (float)(Z))).r
    #define _tex1DVec4(texID, X)                     texID.sample(RowSampler, float2((float)(X), 0.0f))
    #define _tex2DVec4(texID, X, Y)                  texID.sample(RowSampler, float2((float)(X), (float)(Y)))
    #define _tex2DVecN(texID, X, Y, O)               make_intensity(_tex2DVec4((texID), (X), (Y)), (O))
    #define _tex2DSamplerVec4(texID, sampler, X, Y)  texID.sample(sampler, float2((float)(X), (float)(Y)))
    #define _tex2DSamplerVecN(texID, sampler, X, Y, O) make_intensity(_tex2DSamplerVec4((texID), sampler, (X), (Y)), (O))
    #define _tex3DVec4(texID, X, Y, Z)               texID.sample(RowSampler, float3((float)(X), (float)(Y), (float)(Z)))
    #define _tex3DVecN(texID, X, Y, Z, O)            make_intensity(_tex3DVec4((texID), (X), (Y), (Z)), (O))
    #define _tex3DSamplerVec4(texID, sampler, X, Y, Z) texID.sample(sampler, float3((float)(X), (float)(Y), (float)(Z)))
    #define _tex2DVec4Read(texID, X, Y)              texID.read(uint2(uint(X), uint(Y)))
    #define _tex2DVec4Write(texID, X, Y, RGBA)       texID.write((RGBA), uint2(uint(X), uint(Y)))
    #define _tex3DVec4Write(texID, X, Y, Z, RGBA)    texID.write((RGBA), uint3(uint(X), uint(Y), uint(Z)))
    #define _tex2DArrayVec4Read(texID, X, Y, I)      texID.read(uint2(uint(X), uint(Y)), uint(I))
    #define _tex2DArrayVec4Write(texID, X, Y, I, RGBA) texID.write((RGBA), uint2(uint(X), uint(Y)), uint(I))
#else
#endif

#if defined(DEVICE_IS_CUDA)
    #define _fabs          fabsf
    #define _powf          __powf
    #define _logf          __logf
    #define _log2f         __log2f
    #define _log10f        __log10f
    #define _expf          __expf
    #define _exp2f         exp2f
    #define _exp10f        __exp10f
    #define _copysignf     copysignf
    #define _fmaxf         fmaxf
    #define _fminf         fminf
    #define _saturatef     __saturatef
    #define _sqrtf         sqrtf
    #define _ceil          ceil
    #define _floor         floorf
    #define _fmod          fmodf
    #define _fremainder    remainderf
    #define _round         roundf
    #define _hypotf        hypotf
    #define _atan2f        atan2f
    #define _sinf          __sinf
    #define _cosf          __cosf
    #define _tanf          __tanf
    #define _acosf         acosf
    #define _asinf         asinf
    #define _sinpif        sinpif
    #define _cospif        cospif
    #define _fdivide       __fdividef
    #define _frecip        __frcp_rn
    #define _acoshf        acoshf
    #define _asinhf        asinhf
    #define _atanhf        atanhf
    #define _coshf         coshf
    #define _sinhf         sinhf
    #define _tanhf         tanhf
    #define _cbrtf         cbrtf
    #define _truncf        truncf
    #define _fdimf         fdimf
    #define _fmaf          fmaf
    #define _lgammaf       lgammaf
    #define _tgammaf       tgammaf
    #define _rsqrtf        rsqrtf
    #define _atomicAdd     atomicAdd
    #define _atomicAddShared atomicAdd
    #define _atomicAddInt  atomicAdd
    #define _atomicAddSharedInt  atomicAdd
    #define _atomicMaxInt  atomicMax
    #define _mul24(X, Y)   __mul24((X), (Y))
    #define _mad24(X, Y, Z) (__mul24((X), (Y)) + (Z))
    #define _mulhi         __mulhi
    #define _umulhi        __umulhi
    #define _mix           lerp
    #define _mad(X, Y, Z)  __fmaf_rz((X), (Y), (Z))
    #define _clamp(_X, _MIN, _MAX) min(max((_MIN), (_X)), (_MAX))
    #define _clampf(_X, _MIN, _MAX) fminf(fmaxf((_MIN), (_X)), (_MAX))
    #define _frexp(X, E)   frexpf((X), (&(E)))
    #define _ldexp         ldexpf
    #define UNUSED_PARAMETER(_X)
    #define make_bool4(_X) (_X)
    #define _modf(X, INTVAL) modff((X), &(INTVAL))
#elif defined(DEVICE_IS_OPENCL)
    #define _fabs          fabs
    #define _powf          native_powr
    #define _logf          native_log
    #define _log2f         native_log2
    #define _log10f        native_log10
    #define _expf          native_exp
    #define _exp2f         native_exp2
    #define _exp10f        native_exp10
    #define _copysignf     copysign
    #define _fmaxf         fmax
    #define _fminf         fmin
    #define _saturatef(_X) clamp(_X, 0.0f, 1.0f)
    #define _sqrtf         native_sqrt
    #define _ceil          ceil
    #define _floor         floor
    #define _fmod          fmod
    #define _fremainder    remainder
    #define _round         round
    #define _hypotf        hypot
    #define _atan2f        atan2
    #define _sinf(_X)      native_sin((float)(_X))
    #define _cosf(_X)      native_cos((float)(_X))
    #define _tanf(_X)      native_tan((float)(_X))
    #define _acosf         acos
    #define _asinf         asin
    #define _sinpif        sinpi
    #define _cospif        cospi
    #define _fdivide       native_divide
    #define _frecip(_X)    native_recip((float)(_X))
    #define _acoshf        acosh
    #define _asinhf        asinh
    #define _atanhf        atanh
    #define _coshf         cosh
    #define _sinhf         sinh
    #define _tanhf         tanh
    #define _cbrtf         cbrt
    #define _truncf        trunc
    #define _fdimf         fdim
    #define _fmaf          fma
    #define _lgammaf       lgamma
    #define _tgammaf       tgamma
    #define _rsqrtf        rsqrt

    #define _atomicAddInt  atomic_add
    #define _atomicAddSharedInt  atomic_add
    #define _atomicMaxInt  atomic_max
    #define _mul24(X, Y)   mul24((X), (Y))
    #define _mad24(X, Y, Z) mad24((X), (Y), (Z))
    #define _mulhi         mul_hi
    #define _umulhi        mul_hi
    #define _mix           mix
    #define _mad(X, Y, Z)  mad((X), (Y), (Z))
    #define _clamp(_X, _MIN, _MAX) clamp((_X), (_MIN), (_MAX))
    #define _clampf(_X, _MIN, _MAX) clamp((_X), (_MIN), (_MAX))
    #define _frexp(X, E)   frexp((X), (&(E)))
    #define _ldexp         ldexp
    #define UNUSED_PARAMETER(_X)
    #define make_bool4(_X) (_X)
    #define _modf(X, INTVAL) modf((X), &(INTVAL))
#ifndef __APPLE__
    #define make_float4(A, B, C, D) (float4)((A), (B), (C), (D))
    #define make_float3(A, B, C)    (float3)((A), (B), (C))
    #define make_float2(A, B)       (float2)((A), (B))
    #define make_int4(A, B, C, D)   (int4)((A), (B), (C), (D))
    #define make_int3(A, B, C)      (int3)((A), (B), (C))
    #define make_int2(A, B)         (int2)((A), (B))
    #define make_ushort2(A, B)      (ushort2)((A), (B))
#endif
#elif defined(DEVICE_IS_METAL)
    #define _fabs          fabs
    #define _powf          pow
    #define _logf          log
    #define _log2f         log2
    #define _log10f        log10
    #define _expf          exp
    #define _exp2f         exp2
    #define _exp10f        exp10
    #define _copysignf     copysign
    #define _fmaxf         fmax
    #define _fminf         fmin
    #define _saturatef     saturate
    #define _sqrtf         sqrt
    #define _ceil          ceil
    #define _floor         floor
    #define _fmod          fmod
    #define _fremainder    NOT_DEFINED
    #define _round         round
    #define _hypotf(_X, _Y) _sqrtf((_X) * (_X) + (_Y) * (_Y))
    #define _atan2f        atan2
    #define _sinf          sin
    #define _cosf          cos
    #define _tanf          tan
    #define _acosf         acos
    #define _asinf         asin
    #define _sinpif        sinpi
    #define _cospif        cospi
    #define _fdivide(_X,_Y) ((float)(_X) / (float)(_Y))
    #define _frecip(_X)    (1.0f / (float)(_X))
    #define _acoshf        acosh
    #define _asinhf        asinh
    #define _atanhf        atanh
    #define _coshf         cosh
    #define _sinhf         sinh
    #define _tanhf         tanh
    #define _cbrtf         NOT_DEFINED
    #define _truncf        trunc
    #define _fdimf         fdim
    #define _fmaf          fma
    #define _lgammaf       NOT_DEFINED
    #define _tgammaf       NOT_DEFINED
    #define _rsqrtf        rsqrt
    #define _frexp(X, E)   frexp((X), (E))
    #define _ldexp         ldexp
    #define as_int         as_type<int>
    #define as_uint        as_type<uint>

    #define _atomicAddInt(X, Y)  atomic_fetch_add_explicit( (volatile device atomic_int *)X, Y, memory_order_relaxed)
    #define _atomicAddSharedInt(X, Y)  atomic_fetch_add_explicit( (volatile threadgroup atomic_int *)X, Y, memory_order_relaxed)
    #define _atomicMaxInt(X, Y)  atomic_fetch_max_explicit( (volatile device atomic_int *)X, Y, memory_order_relaxed)
    #define _mul24(X, Y)   ((X) * (Y))
    #define _mad24(X, Y, Z) ((X) * (Y) + (Z))
    #define _mulhi         mulhi
    #define _umulhi        mulhi
    #define _mix           mix
    #define _mad(X, Y, Z)  fma((X), (Y), (Z))
    #define _clamp(_X, _MIN, _MAX) clamp((_X), (_MIN), (_MAX))
    #define _clampf(_X, _MIN, _MAX) clamp((_X), (_MIN), (_MAX))
    #define UNUSED_PARAMETER(_X) volatile int unused_##_X = _X;
    #define make_bool4(_X) (bool4)(_X)
    #define make_float4(A, B, C, D) float4((float)(A), (float)(B), (float)(C), (float)(D))
    #define make_float3(A, B, C)    float3((float)(A), (float)(B), (float)(C))
    #define make_float2(A, B)       float2((float)(A), (float)(B))
    #define make_int4(A, B, C, D)   int4((int)(A), (int)(B), (int)(C), (int)(D))
    #define make_int3(A, B, C)      int3((int)(A), (int)(B), (int)(C))
    #define make_int2(A, B)         int2((int)(A), (int)(B))
    #define make_ushort2(A, B)      (ushort2)((ushort)(A), (ushort)(B))
    #define _modf(X, INTVAL) modf((X), (INTVAL))
#else
    #define _fabs          fabs
    #define _powf          powf
    #define _logf          logf
    #define _log2f         log2f
    #define _log10f        log10f
    #define _expf          expf
    #define _exp2f         exp2f
    #define _exp10f        __exp10f
    #define _copysignf     copysignf
    #define _fmaxf         std::max
    #define _fminf         std::min
    #define _saturatef(_X) std::max(0.0f, std::min((_X), 1.0f))
    #define _sqrtf         sqrtf
    #define _ceil          ceil
    #define _floor         floorf
    #define _fmod          fmodf
    #define _fremainder    remainderf
    #define _round         roundf
    #define _hypotf        hypotf
    #define _atan2f        atan2f
    #define _sinf          sinf
    #define _cosf          cosf
    #define _tanf          tanf
    #define _acosf         acosf
    #define _asinf         asinf
    #define _fdivide(_X,_Y) ((float)(_X) / (float)(_Y))
    #define _frecip(_X)    (1.0f / (float)(_X))
    #define _acoshf        acoshf
    #define _asinhf        asinhf
    #define _atanhf        atanhf
    #define _coshf         coshf
    #define _sinhf         sinhf
    #define _tanhf         tanhf
    #define _cbrtf         cbrt
    #define _truncf        truncf
    #define _fdimf         fdimf
    #define _fmaf          fmaf
    #define _lgammaf       lgammaf
    #define _tgammaf       tgammaf
    #define _rsqrtf        NOT_DEFINED
    #define _clampf(_X, _MIN, _MAX) std::min(std::max((float)(_MIN), (float)(_X)), (float)(_MAX))
    #define _frexp(X, E)   frexp((X), (&(E)))
    #define _ldexp         ldexp
    #define UNUSED_PARAMETER(_X)
    #define make_bool4(_X) (_X)
#endif


#if defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL) || defined(DEVICE_IS_CUDA)


__DEVICE__ inline float2 to_float2(float x, float y)                   { float2 t; t.x = x; t.y = y; return t; }
__DEVICE__ inline float2 to_float2_v(__CONSTANTREF__ float* v)         { return to_float2(v[0], v[1]); }
__DEVICE__ inline float2 to_float2_s(float s)                          { return to_float2(s, s); }
__DEVICE__ inline float2 to_float2_cint(int2 a)                        { return to_float2((float)(a.x), (float)(a.y)); }
__DEVICE__ inline float2 to_float2_cuint(uint2 a)                      { return to_float2((float)(a.x), (float)(a.y)); }

__DEVICE__ inline float3 to_float3(float x, float y, float z)          { float3 t; t.x = x; t.y = y; t.z = z; return t; }
__DEVICE__ inline float3 to_float3_v(__CONSTANTREF__ float* v)         { return to_float3(v[0], v[1], v[2]); }
__DEVICE__ inline float3 to_float3_s(float s)                          { return to_float3(s, s, s); }
__DEVICE__ inline float3 to_float3_aw(float2 a, float w)               { return to_float3(a.x, a.y, w); }
__DEVICE__ inline float3 to_float3_cint(int3 a)                        { return to_float3((float)(a.x), (float)(a.y), (float)(a.z)); }
__DEVICE__ inline float3 to_float3_cuint(uint3 a)                      { return to_float3((float)(a.x), (float)(a.y), (float)(a.z)); }

__DEVICE__ inline float4 to_float4(float x, float y, float z, float w) { float4 t; t.x = x; t.y = y; t.z = z; t.w = w; return t; }
__DEVICE__ inline float4 to_float4_v(__CONSTANTREF__ float* v)         { return to_float4(v[0], v[1], v[2], v[3]); }
__DEVICE__ inline float4 to_float4_s(float s)                          { return to_float4(s, s, s, s); }
__DEVICE__ inline float4 to_float4_aw(float3 a, float w)               { return to_float4(a.x, a.y, a.z, w); }
__DEVICE__ inline float4 to_float4_cint(int4 a)                        { return to_float4((float)(a.x), (float)(a.y), (float)(a.z), (float)(a.w)); }
__DEVICE__ inline float4 to_float4_cuint(uint4 a)                      { return to_float4((float)(a.x), (float)(a.y), (float)(a.z), (float)(a.w)); }

__DEVICE__ inline dvip_float16 to_float16_v(__CONSTANTREF__ float* v)
{
    dvip_float16 t;
    t.lo.lo = to_float4(v[0]  , v[1]  , v[2]  , v[3]);
    t.lo.hi = to_float4(v[4]  , v[5]  , v[6]  , v[7]);
    t.hi.lo = to_float4(v[8]  , v[9]  , v[10] , v[11]);
    t.hi.hi = to_float4(v[12] , v[13] , v[14] , v[15]);
    return t;
}


__DEVICE__ inline int2 to_int2(int x, int y)             { int2 t; t.x = x; t.y = y; return t; }
__DEVICE__ inline int2 to_int2_v(__CONSTANTREF__ int* v) { return to_int2(v[0], v[1]); }
__DEVICE__ inline int2 to_int2_s(int s)                  { return to_int2(s, s); }
__DEVICE__ inline int2 to_int2_cfloat(float2 a)          { return to_int2((int)(a.x), (int)(a.y)); }
__DEVICE__ inline int2 to_int2_cuint(uint2 a)            { return to_int2((int)(a.x), (int)(a.y)); }

__DEVICE__ inline int3 to_int3(int x, int y, int z)      { int3 t; t.x = x; t.y = y; t.z = z; return t; }
__DEVICE__ inline int3 to_int3_v(__CONSTANTREF__ int* v) { return to_int3(v[0], v[1], v[2]); }
__DEVICE__ inline int3 to_int3_s(int s)                  { return to_int3(s, s, s); }
__DEVICE__ inline int3 to_int3_aw(int2 a, float w)       { return to_int3(a.x, a.y, w); }
__DEVICE__ inline int3 to_int3_cfloat(float3 a)          { return to_int3((int)(a.x), (int)(a.y), (int)(a.z)); }
__DEVICE__ inline int3 to_int3_cuint(uint3 a)            { return to_int3((int)(a.x), (int)(a.y), (int)(a.z)); }
__DEVICE__ inline int3 to_int3_rtn(float3 a)             { return to_int3_cfloat(_floor(a)); }

__DEVICE__ inline int4 to_int4(int x, int y, int z, int w) { int4 t; t.x = x; t.y = y; t.z = z; t.w = w; return t; }
__DEVICE__ inline int4 to_int4_v(__CONSTANTREF__ int* v)   { return to_int4(v[0], v[1], v[2], v[3]); }
__DEVICE__ inline int4 to_int4_s(int s)                    { return to_int4(s, s, s, s); }
__DEVICE__ inline int4 to_int4_aw(int3 a, float w)         { return to_int4(a.x, a.y, a.z, w); }
__DEVICE__ inline int4 to_int4_cfloat(float4 a)            { return to_int4((int)(a.x), (int)(a.y), (int)(a.z), (int)(a.w)); }
__DEVICE__ inline int4 to_int4_cuint(uint4 a)              { return to_int4((int)(a.x), (int)(a.y), (int)(a.z), (int)(a.w)); }
__DEVICE__ inline int4 to_int4_rtn(float4 a)               { return to_int4_cfloat(_floor(a)); }

#endif

#if defined(DEVICE_IS_CUDA)
__DEVICE__ inline float _half2float(ushort x)
{
#ifdef USE_CUDA_NVRTC

    float val;
    asm("{  cvt.f32.f16 %0, %1;}\n" : "=f"(val) : "h"(x));
    return val;
#else
#ifdef __CUDA_FP16_TYPES_EXIST__
    const __half_raw raw = { x };
    return __half2float(raw);
#else
    return __half2float(x);
#endif
#endif
}

__DEVICE__ inline ushort _float2half(float x)
{
#ifdef USE_CUDA_NVRTC

    ushort val;
    asm("{  cvt.rn.f16.f32 %0, %1;}\n" : "=h"(val) : "f"(x));
    return val;
#else
#ifdef __CUDA_FP16_TYPES_EXIST__

    return static_cast<__half_raw>(__float2half_rn(x)).x;
#else

    return __float2half_rn(x);
#endif
#endif
}

__DEVICE__ inline float4 _half2floatVec4(ushort4 v)
{
    return to_float4(_half2float(v.x), _half2float(v.y), _half2float(v.z), _half2float(v.w));
}

__DEVICE__ inline ushort2 _float2halfVec2(float2 v)
{
    return make_ushort2(_float2half(v.x), _float2half(v.y));
}

__DEVICE__ inline ushort4 _float2halfVec4(float4 v)
{
    return make_ushort4(_float2half(v.x), _float2half(v.y), _float2half(v.z), _float2half(v.w));
}


__DEVICE__ inline float4 lerp(float4 a, float4 b, float4 t) { return a + t * (b - a); }

__DEVICE__ inline float step(float e, float v)    { return (v < e) ? 0.0f : 1.0f; }
__DEVICE__ inline float2 step(float2 e, float2 v) { return to_float2(step(e.x, v.x), step(e.y, v.y)); }
__DEVICE__ inline float3 step(float3 e, float3 v) { return to_float3(step(e.x, v.x), step(e.y, v.y), step(e.z, v.z)); }
__DEVICE__ inline float4 step(float4 e, float4 v) { return to_float4(step(e.x, v.x), step(e.y, v.y), step(e.z, v.z), step(e.w, v.w)); }

__DEVICE__ inline float2 round(float2 e) { return to_float2(_round(e.x), _round(e.y)); }
__DEVICE__ inline float3 round(float3 e) { return to_float3(_round(e.x), _round(e.y), _round(e.z)); }
__DEVICE__ inline float4 round(float4 e) { return to_float4(_round(e.x), _round(e.y), _round(e.z), _round(e.w)); }

__DEVICE__ inline float2 select(float2 x, float2 y, int2  m) { return to_float2(m.x ? y.x : x.x, m.y ? y.y : x.y); }
__DEVICE__ inline float3 select(float3 x, float3 y, int3  m) { return to_float3(m.x ? y.x : x.x, m.y ? y.y : x.y, m.z ? y.z : x.z); }
__DEVICE__ inline float4 select(float4 x, float4 y, int4  m) { return to_float4(m.x ? y.x : x.x, m.y ? y.y : x.y, m.z ? y.z : x.z, m.w ? y.w : x.w); }
__DEVICE__ inline float2 select(float2 x, float2 y, uint2 m) { return to_float2(m.x ? y.x : x.x, m.y ? y.y : x.y); }
__DEVICE__ inline float3 select(float3 x, float3 y, uint3 m) { return to_float3(m.x ? y.x : x.x, m.y ? y.y : x.y, m.z ? y.z : x.z); }
__DEVICE__ inline float4 select(float4 x, float4 y, uint4 m) { return to_float4(m.x ? y.x : x.x, m.y ? y.y : x.y, m.z ? y.z : x.z, m.w ? y.w : x.w); }

#elif defined(DEVICE_IS_OPENCL)

__DEVICE__ inline float _half2float(ushort x)
{
    return vload_half(0, (half*)&x);
}

__DEVICE__ inline ushort _float2half(float x)
{
    ushort val;
    vstore_half(x, 0, (half*)&val);
    return val;
}

__DEVICE__ inline float4 _half2floatVec4(ushort4 x)
{
    return vload_half4(0, (half*)&x);
}

__DEVICE__ inline ushort2 _float2halfVec2(float2 x)
{
    ushort2 val;
    vstore_half2(x, 0, (half*)&val);
    return val;
}

__DEVICE__ inline ushort4 _float2halfVec4(float4 x)
{
    ushort4 val;
    vstore_half4(x, 0, (half*)&val);
    return val;
}


__DEVICE__ inline void _atomicAdd(volatile __global float* addr, float val)
{
    union{
        unsigned int u32;
        float        f32;
    } next, expected, current;

    current.f32 = *addr;
    do {
        expected.f32 = current.f32;
        next.f32     = expected.f32 + val;
        current.u32  = atomic_cmpxchg( (volatile __global unsigned int *)addr, expected.u32, next.u32);
    } while (current.u32 != expected.u32);
}

__DEVICE__ inline void _atomicAddShared(volatile __local float* addr, float val)
{
    union{
        unsigned int u32;
        float        f32;
    } next, expected, current;

    current.f32 = *addr;
    do {
        expected.f32 = current.f32;
        next.f32     = expected.f32 + val;
        current.u32  = atomic_cmpxchg( (volatile __local unsigned int *)addr, expected.u32, next.u32);
    } while (current.u32 != expected.u32);
}

#elif defined(DEVICE_IS_METAL)
__DEVICE__ inline float _half2float(ushort x)
{
    thread half *val = (thread half *) &x;
    return (float)(*val);
}

__DEVICE__ inline half _ushort2half(ushort x)
{
    thread half *val = (thread half *) &x;
    return (*val);
}

__DEVICE__ inline ushort _float2half(float x)
{
    half hval = (half)x;
    thread ushort *val = (thread ushort *) &hval;
    return (*val);
}

__DEVICE__ inline float4 _half2floatVec4(ushort4 x)
{
    thread half4 *val = (thread half4 *) &x;
    return (float4)(*val);
}

__DEVICE__ inline ushort2 _float2halfVec2(float2 x)
{
    half2 hval = (half2)x;
    thread ushort2 *val = (thread ushort2 *) &hval;
    return (*val);
}

__DEVICE__ inline ushort4 _float2halfVec4(float4 x)
{
    half4 hval = (half4)x;
    thread ushort4 *val = (thread ushort4 *) &hval;
    return (*val);
}


__DEVICE__ inline void _atomicAdd(volatile device float* p_Addr, float p_Val)
{
    uint current, next;

    thread float* pNextFloat       = (thread float*)&next;
    thread float* pCurrentFloat    = (thread float*)&current;
    volatile device uint* addrUInt = (volatile device uint*)p_Addr;

    do {
        current = *addrUInt;
        *pNextFloat = *pCurrentFloat + p_Val;
    } while (!atomic_compare_exchange_weak_explicit((volatile device atomic_uint*)p_Addr, &current, next, memory_order_relaxed, memory_order_relaxed));
}

__DEVICE__ inline void _atomicAddShared(volatile threadgroup float* p_Addr, float p_Val)
{
    uint current, next;

    thread float* pNextFloat            = (thread float*)&next;
    thread float* pCurrentFloat         = (thread float*)&current;
    volatile threadgroup uint* addrUInt = (volatile threadgroup uint*)p_Addr;

    do {
        current = *addrUInt;
        *pNextFloat = *pCurrentFloat + p_Val;
    } while (!atomic_compare_exchange_weak_explicit((volatile threadgroup atomic_uint*)p_Addr, &current, next, memory_order_relaxed, memory_order_relaxed));
}

#elif defined(DEVICE_IS_CPU)

#ifdef _WIN32
#define ALIGNED(x) __declspec(align(x))
#else
#define ALIGNED(x) __attribute__((aligned(x)))
#endif


struct float4 { float x, y, z, w; } ALIGNED(16);
struct float2 { float x, y; } ALIGNED(8);

struct int4 { int x, y, z, w; } ALIGNED(16);
struct int3 { int x, y, z; };

inline float4 make_float4(float x, float y, float z, float w)
{
    float4 t; t.x = x; t.y = y; t.z = z; t.w = w; return t;
}

inline int3 make_int3(int x, int y, int z)
{
    int3 t; t.x = x; t.y = y; t.z = z; return t;
}

inline float dot(float4 a, float4 b)
{
    return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
}

inline float4 operator*(float4 a, float b)
{
    return make_float4(a.x * b, a.y * b, a.z * b,  a.w * b);
}

inline float4 operator*(float b, float4 a)
{
    return make_float4(b * a.x, b * a.y, b * a.z, b * a.w);
}
#endif




#if defined(DEVICE_IS_CUDA)

    #ifdef USE_CUDA_NVRTC
        #define __TEMPLATE_REAL__
        #ifdef USE_HALFFLOAT
            #define REAL                unsigned short
            #define REAL4               ushort4
            #define REAL_TYPE_IS_HALF   true
            #define READ_REAL(VAL)      _half2float(VAL)
            #define WRITE_REAL(OUT, IN) (OUT) = _float2half(IN)
            #define READ_REAL4(VAL)     _half2floatVec4(VAL)
            #define WRITE_REAL4(OUT, IN) (OUT) = _float2halfVec4(IN)
            #define _float2real(VAL)    _float2half(VAL)
            #define _half2real(VAL)     (VAL)
        #else
            #define REAL                float
            #define REAL4               float4
            #define REAL_TYPE_IS_HALF   false
            #define READ_REAL(VAL)      (VAL)
            #define WRITE_REAL(OUT, IN) (OUT) = (IN)
            #define READ_REAL4(VAL)     (VAL)
            #define WRITE_REAL4(OUT, IN) (OUT) = (IN)
            #define _float2real(VAL)    (VAL)
            #define _half2real(VAL)     _half2float(VAL)
        #endif
    #else
        #define __TEMPLATE_REAL__       template<typename REAL>
        #define REAL_TYPE_IS_HALF       (bool)(sizeof(REAL) == 2)
        #define READ_REAL(VAL)          _read_real<REAL>(VAL)
        #define WRITE_REAL(OUT, IN)     _write_real<REAL>(OUT, IN)
        #define READ_REAL4(VAL)         _read_real_vec4<REAL4>(VAL)
        #define WRITE_REAL4(OUT, IN)    _write_real_vec4<REAL4>(OUT, IN)
        #define _float2real(VAL)        _float2realTmpl<REAL>(VAL)
        #define _half2real(VAL)         _half2realTmpl<REAL>(VAL)

        template<typename REAL> __device__ inline float _read_real(REAL value);
        template<> __device__ inline float _read_real(ushort value) { return _half2float(value); }
        template<> __device__ inline float _read_real(float value) { return value; }

        template<typename REAL> __device__ inline void _write_real(REAL& output, float value);
        template<> __device__ inline void _write_real(ushort& output, float value) { output = _float2half(value); }
        template<> __device__ inline void _write_real(float& output, float value) { output = value; }

        template<typename REAL4> __device__ inline float4 _read_real_vec4(REAL4 value);
        template<> __device__ inline float4 _read_real_vec4(ushort4 value) { return _half2floatVec4(value); }
        template<> __device__ inline float4 _read_real_vec4(float4 value) { return value; }

        template<typename REAL4> __device__ inline void _write_real_vec4(REAL4& output, float4 value);
        template<> __device__ inline void _write_real_vec4(ushort4& output, float4 value) { output = _float2halfVec4(value); }
        template<> __device__ inline void _write_real_vec4(float4& output, float4 value) { output = value; }

        template<typename REAL> __device__ inline REAL _float2realTmpl(float value);
        template<> __device__ inline ushort _float2realTmpl(float value) { return _float2half(value); }
        template<> __device__ inline float _float2realTmpl(float value) { return value; }

        template<typename REAL> __device__ inline REAL _half2realTmpl(ushort value);
        template<> __device__ inline ushort _half2realTmpl(ushort value) { return value; }
        template<> __device__ inline float _half2realTmpl(ushort value) { return _half2float(value); }
    #endif
#elif defined(DEVICE_IS_OPENCL)
    #define __TEMPLATE_REAL__
    #ifdef USE_HALFFLOAT
        #define REAL                unsigned short
        #define REAL4               ushort4
        #define REAL_TYPE_IS_HALF   true
        #define READ_REAL(VAL)      _half2float(VAL)
        #define WRITE_REAL(OUT, IN) (OUT) = _float2half(IN)
        #define READ_REAL4(VAL)     _half2floatVec4(VAL)
        #define WRITE_REAL4(OUT, IN) (OUT) = _float2halfVec4(IN)
        #define _float2real(VAL)    _float2half(VAL)
        #define _half2real(VAL)     (VAL)
    #else
        #define REAL                float
        #define REAL4               float4
        #define REAL_TYPE_IS_HALF   false
        #define READ_REAL(VAL)      (VAL)
        #define WRITE_REAL(OUT, IN) (OUT) = (IN)
        #define READ_REAL4(VAL)     (VAL)
        #define WRITE_REAL4(OUT, IN) (OUT) = (IN)
        #define _float2real(VAL)    (VAL)
        #define _half2real(VAL)     _half2float(VAL)
    #endif
#elif defined(DEVICE_IS_METAL)
    #define __TEMPLATE_REAL__
    #ifdef USE_HALFFLOAT
        #define REAL                half
        #define REAL4               half4
        #define REAL_TYPE_IS_HALF   true
        #define READ_REAL(VAL)      (float)(VAL)
        #define WRITE_REAL(OUT, IN) (OUT) = (half)(IN)
        #define READ_REAL4(VAL)      (float4)(VAL)
        #define WRITE_REAL4(OUT, IN) (OUT) = (half4)(IN)
        #define _float2real(VAL)    (half)(VAL)
        #define _half2real(VAL)     _ushort2half(VAL)
    #else
        #define REAL                float
        #define REAL4               float4
        #define REAL_TYPE_IS_HALF   false
        #define READ_REAL(VAL)      (VAL)
        #define WRITE_REAL(OUT, IN) (OUT) = (IN)
        #define READ_REAL4(VAL)      (VAL)
        #define WRITE_REAL4(OUT, IN) (OUT) = (IN)
        #define _float2real(VAL)    (VAL)
        #define _half2real(VAL)     _half2float(VAL)
    #endif
#endif

#if defined(DEVICE_IS_CUDA)
    #define DEFINE_KERNEL_ITERATORS_X(_X)  const int _X = blockIdx.x * blockDim.x + threadIdx.x;
    #define DEFINE_KERNEL_ITERATORS_Y(_Y)  const int _Y = blockIdx.y * blockDim.y + threadIdx.y;
#elif defined(DEVICE_IS_OPENCL)
    #define DEFINE_KERNEL_ITERATORS_X(_X)  const int _X = get_global_id(0);
    #define DEFINE_KERNEL_ITERATORS_Y(_Y)  const int _Y = get_global_id(1);
#elif defined(DEVICE_IS_METAL)
    #define DEFINE_KERNEL_ITERATORS_X(_X)  const int _X = gridIdx.x;
    #define DEFINE_KERNEL_ITERATORS_Y(_Y)  const int _Y = gridIdx.y;
#endif



#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)
    #define IMUL(a, b) (((int)(a)) * ((int)(b)))
#endif

#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)
    #define REAL_MIN     ((REAL_TYPE_IS_HALF) ? (HALF_MIN) : (FLT_MIN))
    #define REAL_MAX     ((REAL_TYPE_IS_HALF) ? (HALF_MAX) : (FLT_MAX))
    #define REAL_EPSILON ((REAL_TYPE_IS_HALF) ? (HALF_EPSILON) : (FLT_EPSILON))

    #define DEFINE_KERNEL_ITERATORS_XY(_X, _Y)  \
        DEFINE_KERNEL_ITERATORS_X(_X)           \
        DEFINE_KERNEL_ITERATORS_Y(_Y)

    #define DEFINE_KERNEL_ITERATORS_T_XY(_TX, _TY) \
        const int _TX = THREADIDX_X;              \
        const int _TY = THREADIDX_Y;

    #define DEFINE_KERNEL_ITERATORS_T_XYZ(_TX, _TY, _TZ) \
        DEFINE_KERNEL_ITERATORS_T_XY(_TX, _TY)           \
        const int _TZ = THREADIDX_Z;

    #define DEFINE_KERNEL_ITERATORS_TXY(_X, _Y, _TX, _TY) \
        DEFINE_KERNEL_ITERATORS_XY(_X, _Y)                \
        const int _TX = THREADIDX_X;                      \
        const int _TY = THREADIDX_Y;

    #define DEFINE_KERNEL_ITERATORS(_X, _Y, _WIDTH, _GIDX) \
        DEFINE_KERNEL_ITERATORS_XY(_X, _Y)                 \
        const int _GIDX = (_X) + (_Y) * (_WIDTH);

    #define DEFINE_KERNEL_ITERATORS_SIDX_TIDX(_X, _Y, _SSTRIDE, _TSTRIDE, _SIDX, _TIDX) \
        DEFINE_KERNEL_ITERATORS_XY(_X, _Y)                                              \
        const int _SIDX = (_X) + (_Y) * (_SSTRIDE);                                     \
        const int _TIDX = (_X) + (_Y) * (_TSTRIDE);

    #define DEFINE_KERNEL_ITERATORS_XY_TIDX(_TX, _TY, _BX, _BY, _TIDX) \
        const int _TX   = THREADIDX_X;                                 \
        const int _TY   = THREADIDX_Y;                                 \
        const int _BX   = BLOCKIDX_X;                                  \
        const int _BY   = BLOCKIDX_Y;                                  \
        const int _TIDX = (_TX) + BLOCKDIM_X * (_TY);

    #define DEFINE_KERNEL_ITERATORS_XYZ_TIDX(_TX, _TY, _TZ, _BX, _BY, _TIDX) \
        const int _TX   = THREADIDX_X;                                       \
        const int _TY   = THREADIDX_Y;                                       \
        const int _TZ   = THREADIDX_Z;                                       \
        const int _BX   = BLOCKIDX_X;                                        \
        const int _BY   = BLOCKIDX_Y;                                        \
        const int _TIDX = (_TX) + BLOCKDIM_X * (_TY) + BLOCKDIM_X * BLOCKDIM_Y * (_TZ);
#endif


#ifndef EPSILON
#define EPSILON 0.000001f
#endif

__DEVICE__ __HOST__ inline bool fequal(float a, float b)
{
    return _fabs(a - b) < EPSILON;
}

__DEVICE__ inline bool fequalEpsilon(float a, float b, float epsilon)
{
    return _fabs(a - b) < epsilon;
}

__DEVICE__ inline float clampNegative(float v)
{
    return _fmaxf(0.0f, v);
}

__DEVICE__ inline bool IsOdd(unsigned int x)
{
    return (x & 1);
}

__DEVICE__ inline float CrossProductVec2(float2 p_A, float2 p_B)
{
    return p_A.x * p_B.y - p_A.y * p_B.x;
}

#if defined(DEVICE_IS_CUDA)





struct CudaSurface
{
    cudaSurfaceObject_t surface;
    enum { R_8U = 0, R_16U, R_16F, R_32F, RG_8U, RG_16U, RG_16F, RG_32F, RGBA_8U, RGBA_16U, RGBA_16F, RGBA_32F } type;
};

__device__ inline uchar RoundToNearest8U(float p_V)
{
    return (_saturatef(p_V) * 255.0f + 0.5f);
}

__device__ inline uchar4 RoundToNearest8U4(float4 p_RGBA)
{
    return make_uchar4(RoundToNearest8U(p_RGBA.x), RoundToNearest8U(p_RGBA.y), RoundToNearest8U(p_RGBA.z), RoundToNearest8U(p_RGBA.w));
}

__device__ inline ushort RoundToNearest16U(float p_V)
{
    return (_saturatef(p_V) * 65535.0f + 0.5f);
}

__device__ inline ushort4 RoundToNearest16U4(float4 p_RGBA)
{
    return make_ushort4(RoundToNearest16U(p_RGBA.x), RoundToNearest16U(p_RGBA.y), RoundToNearest16U(p_RGBA.z), RoundToNearest16U(p_RGBA.w));
}

__device__ inline void cuda_tex2DVec4Write(const CudaSurface& p_Surface, int p_X, int p_Y, const float4& p_RGBA)
{


    if (p_Surface.type == CudaSurface::RGBA_8U)
    {

        surf2Dwrite(RoundToNearest8U4(p_RGBA), p_Surface.surface, p_X * sizeof(uchar4), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_16F)
    {

        surf2Dwrite(_float2halfVec4(p_RGBA), p_Surface.surface, p_X * sizeof(ushort4), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_8U)
    {

        surf2Dwrite(RoundToNearest8U(p_RGBA.x), p_Surface.surface, p_X * sizeof(uchar), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_16U)
    {

        surf2Dwrite(RoundToNearest16U(p_RGBA.x), p_Surface.surface, p_X * sizeof(ushort), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_16F)
    {

        surf2Dwrite(_float2half(p_RGBA.x), p_Surface.surface, p_X * sizeof(ushort), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_32F)
    {

        surf2Dwrite(p_RGBA.x, p_Surface.surface, p_X * sizeof(float), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_16U)
    {

        surf2Dwrite(RoundToNearest16U4(p_RGBA), p_Surface.surface, p_X * sizeof(ushort4), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_32F)
    {

        surf2Dwrite(p_RGBA, p_Surface.surface, p_X * sizeof(float4), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RG_8U)
    {

        const uchar2 color = make_uchar2(RoundToNearest8U(p_RGBA.x), RoundToNearest8U(p_RGBA.y));
        surf2Dwrite(color, p_Surface.surface, p_X * sizeof(uchar2), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RG_16U)
    {

        const ushort2 color = make_ushort2(RoundToNearest16U(p_RGBA.x), RoundToNearest16U(p_RGBA.y));
        surf2Dwrite(color, p_Surface.surface, p_X * sizeof(ushort2), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RG_16F)
    {

        const ushort2 color = make_ushort2(_float2half(p_RGBA.x), _float2half(p_RGBA.y));
        surf2Dwrite(color, p_Surface.surface, p_X * sizeof(ushort2), p_Y, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RG_32F)
    {

        const float2 color = make_float2(p_RGBA.x, p_RGBA.y);
        surf2Dwrite(color, p_Surface.surface, p_X * sizeof(float2), p_Y, cudaBoundaryModeClamp);
    }
}

__device__ inline void cuda_tex3DVec4Write(const CudaSurface& p_Surface, int p_X, int p_Y, int p_Z, const float4& p_RGBA)
{
    if (p_Surface.type == CudaSurface::R_8U)
    {

        surf3Dwrite(RoundToNearest8U(p_RGBA.x), p_Surface.surface, p_X * sizeof(uchar), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_16U)
    {

        surf3Dwrite(RoundToNearest16U(p_RGBA.x), p_Surface.surface, p_X * sizeof(ushort), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_16F)
    {

        surf3Dwrite(_float2half(p_RGBA.x), p_Surface.surface, p_X * sizeof(ushort), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::R_32F)
    {

        surf3Dwrite(p_RGBA.x, p_Surface.surface, p_X * sizeof(float), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_8U)
    {

        surf3Dwrite(RoundToNearest8U4(p_RGBA), p_Surface.surface, p_X * sizeof(uchar4), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_16U)
    {

        surf3Dwrite(RoundToNearest16U4(p_RGBA), p_Surface.surface, p_X * sizeof(ushort4), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_16F)
    {

        surf3Dwrite(_float2halfVec4(p_RGBA), p_Surface.surface, p_X * sizeof(ushort4), p_Y, p_Z, cudaBoundaryModeClamp);
    }
    else if (p_Surface.type == CudaSurface::RGBA_32F)
    {

        surf3Dwrite(p_RGBA, p_Surface.surface, p_X * sizeof(float4), p_Y, p_Z, cudaBoundaryModeClamp);
    }
}
#endif

#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)
__DEVICE__ inline float4 make_intensity(float4 p_Tex, uchar p_Order)
{
    const uchar order = p_Order & 0xF;
    return (order == 0x1) ? to_float4_s(p_Tex.x) : (order == 0x8) ? to_float4_s(p_Tex.w) : (order == 0x3) ? to_float4(p_Tex.x, p_Tex.y, 0.f, 1.f) : p_Tex;
}

__DEVICE__ inline int get_comp_order(int p_CompOrder, int p_Idx)
{
    return (p_CompOrder >> (p_Idx << 2));
}

__DEVICE__ inline float4 maxFloat4(float4 p_A, float4 p_B)
{
    return to_float4(_fmaxf(p_A.x, p_B.x), _fmaxf(p_A.y, p_B.y), _fmaxf(p_A.z, p_B.z), _fmaxf(p_A.w, p_B.w));
}

__DEVICE__ inline float4 minFloat4(float4 p_A, float4 p_B)
{
    return to_float4(_fminf(p_A.x, p_B.x), _fminf(p_A.y, p_B.y), _fminf(p_A.z, p_B.z), _fminf(p_A.w, p_B.w));
}

__DEVICE__ inline float4 clampFloat4(float4 p_Val, float4 p_Min, float4 p_Max)
{
    return to_float4(_clampf(p_Val.x, p_Min.x, p_Max.x),
                     _clampf(p_Val.y, p_Min.y, p_Max.y),
                     _clampf(p_Val.z, p_Min.z, p_Max.z),
                     _clampf(p_Val.w, p_Min.w, p_Max.w));
}

__DEVICE__ inline float4 ldexp4(float4 p_Val, int4 p_N)
{
    return to_float4(_ldexp(p_Val.x, p_N.x), _ldexp(p_Val.y, p_N.y), _ldexp(p_Val.z, p_N.z), _ldexp(p_Val.w, p_N.w));
}

__DEVICE__ inline float4 frexp4(float4 p_Val, __PRIVATE__ int4* p_Exp)
{
    int x, y, z, w;
    const float4 mantissa = to_float4(_frexp(p_Val.x, x), _frexp(p_Val.y, y), _frexp(p_Val.z, z), _frexp(p_Val.w, w));
    *p_Exp = to_int4(x, y, z, w);
    return mantissa;
}

#endif

#ifndef DEVICE_IS_OPENCL
namespace DAVINCIIP_NAMESPACE {
#endif


__DEVICE__ inline void PreMultiplyMatrix(__CONSTANTREF__ TransformMatrix* p_Matrix, __PRIVATE__ float p_Input0, __PRIVATE__ float p_Input1, __PRIVATE__ float p_Input2,
                                         __PRIVATE__ float* p_Output0, __PRIVATE__ float* p_Output1, __PRIVATE__ float* p_Output2)
{
    *p_Output0 = p_Matrix->c00 * p_Input0 + p_Matrix->c01 * p_Input1 + p_Matrix->c02 * p_Input2;
    *p_Output1 = p_Matrix->c10 * p_Input0 + p_Matrix->c11 * p_Input1 + p_Matrix->c12 * p_Input2;
    *p_Output2 = p_Matrix->c20 * p_Input0 + p_Matrix->c21 * p_Input1 + p_Matrix->c22 * p_Input2;
}


__DEVICE__ inline void PostMultiplyMatrix(__CONSTANTREF__ TransformMatrix* p_Matrix, __PRIVATE__ float p_Input0, __PRIVATE__ float p_Input1, __PRIVATE__ float p_Input2,
                                          __PRIVATE__ float* p_Output0, __PRIVATE__ float* p_Output1, __PRIVATE__ float* p_Output2)
{
    *p_Output0 = p_Input0 * p_Matrix->c00 + p_Input1 * p_Matrix->c10 + p_Input2 * p_Matrix->c20;
    *p_Output1 = p_Input0 * p_Matrix->c01 + p_Input1 * p_Matrix->c11 + p_Input2 * p_Matrix->c21;
    *p_Output2 = p_Input0 * p_Matrix->c02 + p_Input1 * p_Matrix->c12 + p_Input2 * p_Matrix->c22;
}

#ifndef DEVICE_IS_OPENCL
}
#endif


#ifdef DEVICE_IS_OPENCL
    #define INIT_ARRAY(TYPE, NUM, ARRAY, LIST)  \
        TYPE ARRAY[NUM];                        \
        {                                       \
            TYPE tmpCoeffs[NUM] = LIST;         \
            for (int idx = 0; idx < NUM; ++idx) \
            {                                   \
                ARRAY[idx] = tmpCoeffs[idx];    \
            }                                   \
        }
#else
    #define INIT_ARRAY(TYPE, NUM, ARRAY, LIST) TYPE ARRAY[NUM] = LIST;
#endif


#define GRID_STRIDE_KERNEL_LOOP(_INDEX, _N)                 \
    DEFINE_KERNEL_ITERATORS_X(x)                            \
    for (int _INDEX = x; _INDEX < _N; _INDEX += GRIDSIZE_X)

#define GROUP_STRIDE_LOOP_X(INDEX, N) \
    for (int INDEX = THREADIDX_X; INDEX < N; INDEX += BLOCKDIM_X)

#define GROUP_STRIDE_LOOP_Y(INDEX, N) \
    for (int INDEX = THREADIDX_Y; INDEX < N; INDEX += BLOCKDIM_Y)

#endif

    #ifndef LUT_APPLICATOR_TETRAHEDRAL_KERNEL_H
#define LUT_APPLICATOR_TETRAHEDRAL_KERNEL_H

#ifndef COMPILER_IS_DVIP_RT
#ifndef DEVICE_IS_OPENCL
namespace DAVINCIIP_NAMESPACE {
#endif
#endif

#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)

__DEVICE__ inline void interpolateTetrahedron(bool p_IsInsideCube, __PRIVATE__ const float* p_Coeffs, float p_PosR, float p_PosG, float p_PosB, __PRIVATE__ const int* p_CornerIdx,
                                              __TEXTURE3D__ lut3DTexParam,
                                              __PRIVATE__ float* p_OutR, __PRIVATE__ float* p_OutG, __PRIVATE__ float* p_OutB)
{
#ifndef COMPILER_IS_DVIP_RT
#ifdef DEVICE_IS_OPENCL
    const sampler_t RowSampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
#endif

#ifdef DEVICE_IS_METAL
    constexpr sampler RowSampler(coord::pixel, address::clamp_to_edge, filter::nearest);
#endif
#endif

    (*p_OutR) = 0.0f;
    (*p_OutG) = 0.0f;
    (*p_OutB) = 0.0f;

    if (p_IsInsideCube)
    {
        float cornerR[4], cornerG[4], cornerB[4];
        for (int i = 0; i < 4; ++i)
        {
            const int idx = p_CornerIdx[i];
            const int r = idx >> 2;
            const int g = (idx & 0x2) >> 1;
            const int b = idx & 0x1;

            const float4 val = _tex3DVec4(lut3DTexParam, p_PosB + b, p_PosG + g, p_PosR + r);

            cornerR[i] = val.x;
            cornerG[i] = val.y;
            cornerB[i] = val.z;
        }

        for (int i = 0; i < 4; ++i)
        {
            (*p_OutR) += p_Coeffs[i] * cornerR[i];
            (*p_OutG) += p_Coeffs[i] * cornerG[i];
            (*p_OutB) += p_Coeffs[i] * cornerB[i];
        }
    }
}

__DEVICE__ inline void updateCoefficientsAndCornerIdx(float p_Coeff0, float p_Coeff1, float p_Coeff2, float p_Coeff3,
                                                      int p_Idx0, int p_Idx1, int p_Idx2, int p_Idx3,
                                                      __PRIVATE__ float* p_Coeffs, __PRIVATE__ int* p_CornerIdx)
{
    p_Coeffs[0] = p_Coeff0;
    p_Coeffs[1] = p_Coeff1;
    p_Coeffs[2] = p_Coeff2;
    p_Coeffs[3] = p_Coeff3;
    p_CornerIdx[0] = p_Idx0;
    p_CornerIdx[1] = p_Idx1;
    p_CornerIdx[2] = p_Idx2;
    p_CornerIdx[3] = p_Idx3;
}

__DEVICE__ inline void tetrahedral3DInterpolator(int p_LutLevels, float p_InputScale, float p_InputOffset,
                                                 __TEXTURE3D__ lut3DTexParam,
                                                 __PRIVATE__ float *p_R, __PRIVATE__ float *p_G, __PRIVATE__ float *p_B)
{

    const float R = ((*p_R) * p_InputScale + p_InputOffset) * (p_LutLevels - 1);
    const float G = ((*p_G) * p_InputScale + p_InputOffset) * (p_LutLevels - 1);
    const float B = ((*p_B) * p_InputScale + p_InputOffset) * (p_LutLevels - 1);


    const int rMin = R;
    const int gMin = G;
    const int bMin = B;

    const float fR = R - rMin;
    const float fG = G - gMin;
    const float fB = B - bMin;

    float coeffs[4];
    int cornerIdx[4];
    bool isInsideCube = true;
    if ((fG >= fB) && (fB >= fR))
    {
        updateCoefficientsAndCornerIdx(1.0f - fG, fG - fB, fB - fR, fR, 0, 2, 3, 7, coeffs, cornerIdx);

    }
    else if ((fB > fR) && (fR > fG))
    {
        updateCoefficientsAndCornerIdx(1.0f - fB, fB - fR, fR - fG, fG, 0, 1, 5, 7, coeffs, cornerIdx);
    }
    else if  ((fB > fG) && (fG >= fR))
    {
        updateCoefficientsAndCornerIdx(1.0f - fB, fB - fG, fG - fR, fR, 0, 1, 3, 7, coeffs, cornerIdx);
    }
    else if ((fR >= fG) && (fG > fB))
    {
        updateCoefficientsAndCornerIdx(1.0f - fR, fR - fG, fG - fB, fB, 0, 4, 6, 7, coeffs, cornerIdx);
    }
    else if ((fG > fR) && (fR >= fB))
    {
        updateCoefficientsAndCornerIdx(1.0f - fG, fG - fR, fR - fB, fB, 0, 2, 6, 7, coeffs, cornerIdx);
    }
    else if ((fR >= fB) && (fB >= fG))
    {
        updateCoefficientsAndCornerIdx(1.0f - fR, fR - fB, fB - fG, fG, 0, 4, 5, 7, coeffs, cornerIdx);
    }
    else
    {
        isInsideCube = false;
    }

    interpolateTetrahedron(isInsideCube, coeffs, rMin, gMin, bMin, cornerIdx, lut3DTexParam, p_R, p_G, p_B);
}

#endif

#ifndef COMPILER_IS_DVIP_RT
#ifndef DEVICE_IS_OPENCL
}
#endif
#endif

#endif

        ()$^.*+?[]|\-{},:=!

  s       u p p e r       x d i g i t     "“   XW            XW8          "“   pXW           xXW           "“   ¬XW           ÈXW           "“   4YW           HYW8          "“   DZW        	   pZWX          "“   ÜZW        	    [W@          "“   °[W   À[W   è[W           "“   œ\W   ¬\W   Ø\W           "“   ¤]W        
   Ð]W@          "“   P^W           ^W@          "“   _W           _W           "“   P_W           à_W(          "“
   ü`W           PaW(          "“   üaW           bW           "“   `bW           hbW8          "“   œbW           °bW(          "“   cW           (cW(          "“N   €cW        x   ðeW˜          "“   XjW           ÀjW         "“   ˆkW           ÀkW(          "“   €lW        ?   €mW(          "“   øoW           ppW8          "“
   PqW        /   ÀqW         "“
   hsW           ÐsW         "“   ¸tW           @uW@          "“   vW           @vWX          "“   èvW            wW(          "“   xwW        
   °wW(          "“   8xW           pxW0          "“   yW           0yW8          "“   ¨yW        
   àyW@          "“   hzW        <   `{W(          "“   X}W           `}W(          "“    }W        	   Ð}W(          "“<   D~W        `   0€WÀ          "“   ˜ƒW            `„W@          "“   ¤…W            †W8          "“
   È†W           0‡Wx          "“   0ˆW           @ˆWP          "“   ÜˆW           ‰W8          "“   ”‰W            ‰W8          "“   è‰W           ð‰W0          "“   ŠW           (ŠW           "“   dŠW           pŠW           "“   ˜ŠW            ŠW           "“   ì‹W   ü‹W   (ŒW0          "“   xŒW   ˆŒW   °ŒW0          "“   äŽW           ðŽW           "“   W            W           "“   °W           ¸W           "“   àW           èW           "“   W           W           "“   @W           HW           "“   ¼‘W           Ø‘W(          "“   ,’W           8’W(          "“   t’W            ’Wø          "“   ü’W           “W0          "“   ”“W           ¨“WX          "“   ð“W            ”Wð          "“   €”W           °”Wð          "“   •W           •W(          "“   d–W           p–W           "“   ¨–W           °–W(          "“   —W           0—W(          "“   l—W           €—W(          "“   ˜W           (˜W           "“   x˜W           €˜W           "“   ¼˜W           Ð˜W           "“    ™W   0™W   X™W0          "“   8šW           @šW           "“   šW            šW           "“    ›W   0›W   X›W0          "“   Ð›W           ø›W8          "“   ´œW           ÀœW0          "“   W   W   @W0          "“   W    W   ÈW0          "“   \žW           hžW           "“   ŸW           ŸW0          "“   8ŸW           @ŸW           "“   pŸW           xŸW           "“   ¨ŸW           °ŸW           "“   àŸW           èŸW           "“   À W           È W0          "“   ü W           ¡W@          "“   T¡W   d¡W   ¡W           "“   ¢W           ¢W           "“   P¢W   `¢W   ˆ¢W           "“   ¦W           ¦W8          "“   |¦W   Œ¦W   ¸¦W           "“   ¨W           (¨W0          "“   „¨W           ¨W           "“   À¨W           È¨W           "“   ø¨W            ©W           "“   0©W           8©W           "“   p©W   €©W   ¨©W8          "“   @ªW           HªW°          "“   |ªW           ªW           "“   ÈªW   ØªW    «W           "“   |®W           ˆ®W8          "“   ô®W   ¯W   0¯W           "“   Œ°W            °W0          "“   ü°W           ±W           "“   ¨±W   ¸±W   à±W0          "“   4²W   D²W   p²W0          "“   ¼²W   Ì²W   ø²W0          "“   T³W   d³W   ³W0          "“   ´W            ´W           "“   l´W           ´W           "“   ð´W           µW           "“   hµW           xµW0          "“   ¶W           (¶W@          "“   ¤¶W   ´¶W   à¶W8          "“   (·W   8·W   `·W8          "“   °·W           ¸·W           "“   è·W           ð·W           "“   €¸W   ¸W   ¸¸W0          "“   ¹W   ¹W   @¹W0          "“   ŒºW            ºW           "“   »W   »W   H»W           "“   ¸»W   È»W   ð»W           "“   @¼W   P¼W   x¼W           "“   à¼W           è¼W           "“   L½W           X½W@          "“   <¾W           P¾W8          "“   Ä¾W           Ø¾W@          "“   (¿W           0¿W           "“   x¿W   ˆ¿W   °¿W           "“   ø¿W   ÀW   0ÀW           "“   ”ÀW           °ÀW           "“   „ÁW   ”ÁW   ÀÁW0          "“   ÂW   $ÂW   PÂW0          "“   œÂW   ¬ÂW   ØÂW0          "“   4ÃW   DÃW   pÃW0          "“   øÃW            ÄW           "“   LÄW           pÄW           "“   ÐÄW           ðÄW           "“   LÅW           `ÅW0          "“   ¸ÅW           ÀÅW@          "“   8ÆW           HÆW8          "“   ´ÆW   ÌÆW   øÆW(          "“   \ÇW           hÇW           "“   ˜ÇW   ¨ÇW   ÐÇW           "“   TÈW   dÈW   ÈW           "“   ØÈW   èÈW   ÉW           "“   hÉW           xÉW@          "“   °ÉW           ¸ÉW           "“   èÉW   øÉW    ÊW           "“   hÊW   xÊW    ÊW           "“   èÊW   øÊW    ËW           "“   ¸ËW           ÈËW           "“   ,ÌW           @ÌW@          "“   |ÌW   ŒÌW   ¸ÌW           "“    ÍW           0ÍW           "“   xÍW   ˆÍW   °ÍW           "“   øÍW   ÎW   0ÎW           "“   ”ÎW           ¨ÎW0          "“   èÎW   øÎW    ÏW           "“    ÏW           °ÏW@          "“   øÏW           ÐW@          "“   @ÐW   PÐW   xÐW           "“   ÀÐW   ÐÐW   øÐW           "“   @ÑW   PÑW   xÑW           "“   ØÑW           èÑW@          "“   ØÒW   èÒW   ÓW           "“   hÓW   xÓW    ÓW           "“   ðÓW    ÔW   (ÔW           "“   tÔW   „ÔW   °ÔW           p;0T   ú
E   ú ìE   ô ìE    `E   €^E   P\E   @bE   @aE   P[E   PZE   @cE           
typedef struct DCTLUIParams {
 float sliderFloatParams[MAX_DCTL_UI_ELEMENTS]; int sliderIntParams[MAX_DCTL_UI_ELEMENTS]; float valueBoxParams[MAX_DCTL_UI_ELEMENTS]; int checkBoxParams[MAX_DCTL_UI_ELEMENTS]; int comboBoxParams[MAX_DCTL_UI_ELEMENTS]; } DCTLUIParams;
      è:0T   °ù
E   ú ìE   ô ìE   ÀYE    eE   ZE   ø;0T   °ú
E   p<0T    ü
E   ð<0T   û
E   p=0T   Pú
E   ð=0T   àú
E   p>0T   €ú
E   ð>0T   pû
E   p?0T    û
E   p@0T   @û
E   ð?0T   Ðû
E   DEFINE_DCTL_EXPIRATION_DATE(    DEFINE_DCTL_ENCRYPTION_VERSION( DEFINE_DCTL_START_OF_SOURCE_CODE
       const sampler_t RowSampler = CLK_NORMALIZED_COORDS_FALSE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_NEAREST;
     constexpr sampler RowSampler(coord::pixel, address::clamp_to_edge, filter::nearest);
   __CONSTANT__ __SAMPLER__ RowSampler;
   const sampler_t LUTRowSampler = CLK_NORMALIZED_COORDS_TRUE | CLK_ADDRESS_CLAMP_TO_EDGE | CLK_FILTER_LINEAR;
    constexpr sampler LUTRowSampler(coord::normalized, address::clamp_to_edge, filter::linear);
    __CONSTANT__ __SAMPLER__ LUTRowSampler;
        __DEVICE__ float3 transform(int p_Width, int p_Height, int p_X, int p_Y, float p_R, float p_G, float p_B)       __DEVICE__ float3 transform(int p_Width, int p_Height, int p_X, int p_Y, __TEXTURE__ p_TexR, __TEXTURE__ p_TexG, __TEXTURE__ p_TexB)    globalKernel    textureKernel           
{
    DEFINE_KERNEL_ITERATORS(x, y, p_Stride, gIdx)
    if (x < p_Width && y < p_Height)
    {
                
        WRITE_REAL(p_OutR[gIdx], outRGB.x);
        WRITE_REAL(p_OutG[gIdx], outRGB.y);
        WRITE_REAL(p_OutB[gIdx], outRGB.z);
    }
}
   float3 outRGB = transform(p_Width, p_Height, x, y, READ_REAL(p_InR[gIdx]), READ_REAL(p_InG[gIdx]), READ_REAL(p_InB[gIdx])       float3 outRGB = transform(p_Width, p_Height, x, y, lutTexR, lutTexG, lutTexB    
__KERNEL__ void globalKernel(int p_Width, int p_Height, int p_Stride,
                             __GLOBAL__ const REAL* p_InR, __GLOBAL__ const REAL* p_InG, __GLOBAL__ const REAL* p_InB,
                             __GLOBAL__ REAL* p_OutR, __GLOBAL__ REAL* p_OutG, __GLOBAL__ REAL* p_OutB
           
__KERNEL__ void textureKernel(int p_Width, int p_Height, int p_Stride,
                              __TEXTURE__ lutTexR, __TEXTURE__ lutTexG, __TEXTURE__ lutTexB,
                              __GLOBAL__ REAL* p_OutR, __GLOBAL__ REAL* p_OutG, __GLOBAL__ REAL* p_OutB
   
__KERNEL__ void globalKernel(constant int& p_Width, constant int& p_Height, constant int& p_Stride,
                              __GLOBAL__ const REAL* p_InR, __GLOBAL__ const REAL* p_InG, __GLOBAL__ const REAL* p_InB,
                              __GLOBAL__ REAL* p_OutR, __GLOBAL__ REAL* p_OutG, __GLOBAL__ REAL* p_OutB
           
__KERNEL__ void textureKernel(constant int& p_Width, constant int& p_Height, constant int& p_Stride,
                               __TEXTURE__ lutTexR, __TEXTURE__ lutTexG, __TEXTURE__ lutTexB,
                               __GLOBAL__ REAL* p_OutR, __GLOBAL__ REAL* p_OutG, __GLOBAL__ REAL* p_OutB
   
#ifndef DEVICE_IS_OPENCL
namespace DAVINCIIP_NAMESPACE {
#endif

#if defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL) // all gpu only functions here

         
#endif // defined(DEVICE_IS_CUDA) || defined(DEVICE_IS_OPENCL) || defined(DEVICE_IS_METAL)

#ifndef DEVICE_IS_OPENCL
} // DAVINCIIP_NAMESPACE
#endif

         
typedef struct LUTParams
{
    int is3DLUT;
    int hasShaperLUT;
    float shaperScale;
    float shaperOffset;
    float lutScale;
    float lutOffset;
    int lutLevels;
} LUTParams;

#define APPLY_LUT(_R, _G, _B, _LUT)                                                                                \
applyLUT(_R, _G, _B, _LUT##Params, _LUT##ShaperR, _LUT##ShaperG, _LUT##ShaperB, _LUT, _LUT##R, _LUT##G, _LUT##B);

__DEVICE__ inline float3 applyLUT(float p_R, float p_G, float p_B, __GLOBAL__ LUTParams* p_Params,
                                  __TEXTURE1D__ p_ShaperLUTR, __TEXTURE1D__ p_ShaperLUTG, __TEXTURE1D__ p_ShaperLUTB,
                                  __TEXTURE3D__ p_ColorLUT, __TEXTURE1D__ p_ColorLUTR, __TEXTURE1D__ p_ColorLUTG, __TEXTURE1D__ p_ColorLUTB)
{
    if (p_Params->hasShaperLUT)
    {
        p_R = _tex1DSampler(p_ShaperLUTR, LUTRowSampler, p_R * p_Params->shaperScale + p_Params->shaperOffset);
        p_G = _tex1DSampler(p_ShaperLUTG, LUTRowSampler, p_G * p_Params->shaperScale + p_Params->shaperOffset);
        p_B = _tex1DSampler(p_ShaperLUTB, LUTRowSampler, p_B * p_Params->shaperScale + p_Params->shaperOffset);
    }

    if (p_Params->is3DLUT)
    {
      

        const float4 res = _tex3DSamplerVec4(p_ColorLUT, LUTRowSampler, p_B * p_Params->lutScale + p_Params->lutOffset,
                                p_G * p_Params->lutScale + p_Params->lutOffset, p_R * p_Params->lutScale + p_Params->lutOffset);
        return make_float3(res.x, res.y, res.z);
    
        tetrahedral3DInterpolator(p_Params->lutLevels, p_Params->lutScale, p_Params->lutOffset, p_ColorLUT, &p_R, &p_G, &p_B);
        return make_float3(p_R, p_G, p_B);
     
    }
    else
    {
        p_R = _tex1DSampler(p_ColorLUTR, LUTRowSampler, p_R * p_Params->lutScale + p_Params->lutOffset);
        p_G = _tex1DSampler(p_ColorLUTG, LUTRowSampler, p_G * p_Params->lutScale + p_Params->lutOffset);
        p_B = _tex1DSampler(p_ColorLUTB, LUTRowSampler, p_B * p_Params->lutScale + p_Params->lutOffset);

        return make_float3(p_R, p_G, p_B);
    }
}
   , __GLOBAL__ DCTLUIParams* p_UIParams   , p_UIParams    __DEVICE__[\s]+inline[\s]+      __DEVICE__ static inline        (/\*([^*]|[
]|(\*+([^*/]|[
])))*\*+/)|(//.*)  $1      ^ +| +$|( ) +   #define __RESOLVE_VER_MAJOR__   #define __RESOLVE_VER_MINOR__   15
     #include        0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*:<>?|,./; %4d.%2d.%2d.%2d.%2d.%2d Get expiry date failed  make_float3     No return value.    float3      Return Value must be float3 to represent RGB.   "<>     #include "      Inclusion file is not found %s  dvipDCTLDir /\  Params  , __GLOBAL__ LUTParams*         ShaperR,        __TEXTURE1D__   ShaperG,        ShaperB,        __TEXTURE3D__   R,  G,  _ENUMTYPE   
{
 enum    typedef int BoolType;
  ExtraHeaderInclusion    __KERNEL__      Invalid DCTL/RTC format extern "C" __KERNEL__   customLUTName   HasDCTLUIParams #define MAX_DCTL_UI_ELEMENTS    DEFINE_LUT(     DEFINE_UI_PARAMS(       Wrong transform function template.      extern "C"       __COMPUTE_QUALIFIER__) IsRTKernel  HALF    FLOAT       TETRAHEDRALINTERP_  FX_ _DCTL_  _RT_    __BOOL__    REAL    _TYPE   uint    uint2   uint3   uint4   int2    int3    int4    float2  float4      gridIdx blockDim        blockIdx        threadIdx       gridSize        __COMPUTE_QUALIFIER__   __COMPUTE_QUALIFIER_3D__        __CONSTANTREF__         __write_only image2d_t  __read_only image2d_t   constant        texture2d<float, access::write>         texture2d<float, access::sample>        float4* float4 *        float2* float2 *    float*      float * unsigned int*   unsigned int *  uint*   uint *  int*    int *   __DEVICE__      defined  *  const       __SHARED__      __GLOBAL__      constant        __PRIVATE__     __PRIVATE__      __COMPUTE_QUALIFIER_3D__       unsigned int    \(      __KERNEL__.*void.*      ARG_VAL_CONSTANT        ARG_MEM_CONSTANT        ARG_MEM_BUFFER  ARG_MEM_TEXTURE1D       ARG_MEM_TEXTURE2D       ARG_MEM_TEXTURE3D       ARG_MEM_TEXTURE1D_WRITE ARG_MEM_TEXTURE2D_WRITE ARG_MEM_TEXTURE3D_WRITE ARG_MEM_TEXTURE2D_ARRAY_READ    ARG_MEM_TEXTURE2D_ARRAY_WRITE   ARG_UNDEFINED   __CONSTANTREF__ __TEXTURE1D__   __TEXTURE2D__   __TEXTURE3D__   __TEXTURE1D_WRITE__     __TEXTURE2D_WRITE__     __TEXTURE3D_WRITE__     __TEXTURE2D_ARRAY_READ__        __TEXTURE2D_ARRAY_WRITE__                               	   
   Arg: %s - %s    Invalid kernel argument: %s     CLK_NORMALIZED_COORDS_FALSE     CLK_NORMALIZED_COORDS_TRUE      CLK_ADDRESS_CLAMP       CLK_ADDRESS_CLAMP_TO_EDGE       CLK_ADDRESS_MIRRORED_REPEAT     CLK_ADDRESS_REPEAT      CLK_FILTER_NEAREST      CLK_FILTER_LINEAR       const sampler_t RowSampler =    const sampler_t     ;
  coord::pixel    coord::normalized       address::clamp_to_zero  address::clamp_to_edge  address::mirrored_repeat        address::repeat filter::nearest filter::linear  constexpr sampler RowSampler(   constexpr sampler       RowSampler;     __CONSTANT__ __SAMPLER__    (,) sliderFloatParams       sliderIntParams valueBoxParams  checkBoxParams  comboBoxParams  ];       = p_UIParams-> DCTLUI_SLIDER_FLOAT     DCTLUI_SLIDER_INT       DCTLUI_VALUE_BOX        DCTLUI_CHECK_BOX        DCTLUI_COMBO_BOX                Wrong DCTLUIParams Definition: incorrect number of arguments. %s                Wrong DCTLUIParams Definition: incorrect type of DCTLUIParams. %s               Wrong DCTLUIParams Definition: incorrect number of arguments for box ui. %s     Wrong DCTLUIParams Definition: incorrect number of arguments for slider ui. %s  Wrong DCTLUIParams Definition: wrong enum definition for combo box ui. %s       Wrong DCTLUIParams Definition: mismatch enum definitions and display names for combo box ui. %s _tex2D(.*,.*,.*)        _tex2D(.*,\s*p_[XY]\s*,\s*p_[XY]\s*)    p_ArgIdx < argList.size()       DVIP::KernelArgInfo::IsParamMem ..\..\..\DaVinciIP\Common\DeviceCompute\RTCInfo.cpp     DVIP::KernelArgInfo::IsPODArg   DVIP::KernelArgInfo::IsTextureReadMem   DVIP::KernelArgInfo::IsTexture2DArray   DVIP::KernelArgInfo::GetTextureReadDim  DVIP::KernelArgInfo::IsTextureWriteMem  argList argStr  isValid %p  eE  pP      pA0T   0ù 




ChromaticAberration
filter:filter   filter:window   filter:sigma    filter:alpha    filter:kaiser-beta      filter:kaiser-alpha     filter:lobes    filter:blur     filter:support  filter:win-support      filter:b        filter:c        filter:verbose  # Resampling Filter (for graphing) 



Invert Mask     Toggle Mask Overlay Faster  Better  Shape       Clear All Strokes       Clear All Strokes Of Current Frame      Clear All Strokes from In to Out        Clear Selected Stroke from In to Out    Clear Selected Track Data       Use Fast Tracking       Track Selected Stroke Only      Show Strokes    1OnQualityChanged(int)  PersonMaskParamLabel    PersonMaskDualSliderInvisibleSlider     Smart Refine    Iterations      Denoise Blur Radius     In/Out Ratio    Clean Black     Black Clip      Clean White     White Clip      Consistency Grow        Opening Closing Circle  Diamond 1OnModeChanged(int)     1OnShapeChanged(int)    No Selection    HeadingLabel    SubHeadingLabel

```