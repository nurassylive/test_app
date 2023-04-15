#version 460 core

#include <flutter/runtime_effect.glsl>

precision mediump float;

layout(location = 0) uniform float uAnimation;
layout(location = 1) uniform float uResolutionX;
layout(location = 2) uniform float uResolutionY;

out vec4 fragColor;

void main() {
  vec2 st = FlutterFragCoord().xy / vec2(uResolutionX, uResolutionY);
  float angle = 3.14159 / 3; 
  float frequency = 4;

  st.x += uAnimation * 10;

  float pattern = smoothstep(0, 0, sin((st.x * cos(-angle) + st.y * sin(-angle)) * frequency * 3.14159));

  vec3 color1 = vec3(0.190, 0.309, 0.956);
  vec3 color2 = vec3(0.314, 0.510, 0.965);
  vec3 color = mix(color1, color2, pattern);

  fragColor = vec4(color, 1.0);
}