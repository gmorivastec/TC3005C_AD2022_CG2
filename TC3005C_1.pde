// processing tiene ciclo de vida
// 2 métodos

// se invoca una vez al inicio
// como dice el nombre es para configuración de sketch

float angulo;

void setup() {
  
  // ancho, alto, renderer
  // P3D - capa de software que usa processing para hacer render en 3D
  // (abajo es OpenGL)
  size(800, 800, P3D);
  angulo = 0;
}

// update, tick, loop
// código que corre 1 vez por cuadro
void draw() {
  
  background(0);
  translate(width/2, height/2);
  
  // NOTA
  //  en todos los contextos gráficos
  // independientemente del API
  // hay una matriz que expresa el estado actual de las transformaciones
  
  // métodos para transformaciones ya existentes
  // translate
  // rotate
  // scale
  
  // como declarar matrices en processing
  float tx = 100;
  float ty = 100;
  float tz = 0;
  PMatrix3D translation = new PMatrix3D(1, 0, 0, tx,
                                        0, 1, 0, ty,
                                        0, 0, 1, tz,
                                        0, 0, 0, 1);
                                        
                 
  angulo += 1;
  float cosAngulo = cos(radians(angulo));
  float sinAngulo = sin(radians(angulo));
  PMatrix3D rotacionZ = new PMatrix3D(cosAngulo, -sinAngulo, 0, 0,
                                      sinAngulo, cosAngulo,  0, 0,
                                      0,         0,          1, 0,
                                      0,         0,          0, 1);
  // en todos los APIS gráficos 
  // 2 cosas - 
  // 1. el orden de las operaciones de matrices es al revés
  // 2. se hacen las transformaciones antes de dibujar
  
  applyMatrix(rotacionZ);
  applyMatrix(translation);
  
  // dibujo directo ! 
  // en processing todavía se puede
  // obsolecido en OpenGL
  beginShape();
  vertex(-50, 50);
  vertex(-50, -50);
  vertex(50, -50);
  vertex(50, 50);
  endShape(CLOSE);
}
