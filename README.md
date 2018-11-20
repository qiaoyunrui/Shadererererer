# Shadererererer
Shader Demo

## Note

所有访问相同数据的方式。（.s，.t，.p 通常被用作贴图空间坐标） 

``` c
vec4 vector;
vector[0] = vector.r = vector.x = vector.s;
vector[1] = vector.g = vector.y = vector.t;
vector[2] = vector.b = vector.z = vector.p;
vector[3] = vector.a = vector.w = vector.q;
```