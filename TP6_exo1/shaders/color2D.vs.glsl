#version 330 core

layout(location = 0) in vec2 aVertexPosition;
layout(location = 1) in vec3 aVertexColor;

out vec3 vFragColor;

mat3 translate(float tx, float ty) {
  return mat3(
      vec3(1, 0, tx),
      vec3(0, 1, ty),
      vec3(0, 0, 1)
  );
};
mat3 scale(float sx, float sy) {
  return mat3(
    vec3(sx, 0, 0),
    vec3(0, sy, 0),
    vec3(0, 0, 1)
  );
};
mat3 rotate(float a) { 
  float c = cos(a);
  float s = sin(a);
  return mat3(
    vec3(c, -s, 0),
    vec3(s, c, 0),
    vec3(0, 0, 0)
  );
};

void main() {
  vFragColor = aVertexColor;
  // Définir la matrice de transformation en combinant les translations, échelles et rotations
  mat3 transformationMatrix = translate(1.0, 1.0) * scale(0.5, 0.5) * rotate(0.5);
  
  // Appliquer la transformation à la position du sommet
  vec3 transformed = transformationMatrix * vec3(aVertexPosition, 1.0);
  
  gl_Position = vec4(transformed.xy, 0.0, 1.0);
};

