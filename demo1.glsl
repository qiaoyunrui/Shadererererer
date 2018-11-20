#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2 u_resolution; // 宽高
uniform vec3 u_mouse;
uniform float u_time;

// Plot a line on y using a Value between 0.0 - 1.0
float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) - 
    smoothstep(pct, pct + 0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;   // 当前片段着色器的坐标 [x, y] 定义域和作用域的范围都是 0.0 - 1.0

    // y = x
    float y = st.x;
    // 背景色
    vec3 color = vec3(st.x);   // 根据 x 坐标定义当前背景的颜色，所以同一 x 坐标的时候，背景的颜色是一样的。

    // plot a line
    float pct = plot(st, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);    // 原理不明白！阿西

    gl_FragColor = vec4(color, 1.0);
}
// 线性插值
