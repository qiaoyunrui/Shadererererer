#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x / u_resolution.y;
    vec3 color = vec3(0.0);
    float d = 0.0;

    st = st * 2.0 - 1.0;

    d = length(abs(st) - 0.3);
    // d = length( min(abs(st)-.3,0.) );
    // d = length( max(abs(st)-.3,0.) );
    
    gl_FragColor = vec4(vec3(fract(d * 10.0)), 1.0);
}