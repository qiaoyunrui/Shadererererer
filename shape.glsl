#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// 读懂了
void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    // bottom-left
    vec2 bl = step(vec2(0.1, 0.2), st);
    // vec2 bl = smoothstep(vec2(0.2), vec2(0.9), st);  
    float pct = bl.x * bl.y;

    // top-right
    // vec2 tr = smoothstep(vec2(0.05),vec2(0.95),1.0 - st);
    vec2 tr = step(vec2(0.05, 0.3), 1.0 - st);
    pct *= tr.x * tr.y;

    color = vec3(pct);
    gl_FragColor = vec4(color, 1.0);
}
// 绘制长方形

// step() function
// The step function returns 0.0 if x is smaller then edge and otherwise 1.0. 
// The input parameters can be floating scalars or float vectors.
// In case of float vectors the operation is done component-wise.