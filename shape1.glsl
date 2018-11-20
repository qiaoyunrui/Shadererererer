#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
    float pct = 0.0;
    pct = distance(st, vec2(0.5));
    // pct = step(0.3, pct);   // 精准
    vec3 color = vec3(pct);
    gl_FragColor = vec4(color, 1.0);
}