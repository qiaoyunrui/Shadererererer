#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float circle(in vec2 _st, in float _radius) {
    vec2 l = _st - vec2(0.5);   // 到圆心的距离
    return 1.0 - smoothstep(_radius - (_radius * 0.01), 
            _radius + (_radius * 0.01), 
            dot(l, l) * 4.0);  
}

void main() {
    vec2 st = gl_FragCoord.xy / u_resolution;
    vec3 color = vec3(0.0);

    st *= 3.0;  // 坐标系扩大为 3 倍
    st = fract(st); // 取小数部分
    
    // color = vec3(st, 0.0);
    color = vec3(circle(st, 0.5));
    gl_FragColor = vec4(color,1.0);
}