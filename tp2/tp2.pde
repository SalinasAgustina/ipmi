//Salinas Agustina
//Comision 3
//Legajo 93058/0

PImage imagenP1, imagenP2, imagenP3, boton;
PFont fuenteP1, fuenteP2, fuenteP3;
int pantalla = 1;
int segundos = 0;
int movimientoYTextoP1 = -25;
int transparenciaTextoP3 = 0;
float escaladoTextoP2 = 0.1;

void setup() {
  size(640, 480);
  textSize(30);

  imagenP1 = loadImage("levedad.jpg");
  imagenP2 = loadImage("levedad1.jpg");
  imagenP3 = loadImage("levedad2.jpg");
  boton = loadImage("boton.jpeg");
  
  //Fuentes para las pantallas
  fuenteP1 = loadFont("Cambria-BoldItalic-48.vlw");
  fuenteP2 = loadFont("TimesNewRomanPSMT-48.vlw");
  fuenteP3 = loadFont("TwCenMT-CondensedBold-48.vlw");
}

void draw() {
  background(200);

  if (frameCount % 60 == 0) {
    segundos = segundos + 1;
  }

  if (segundos <= 5) {
    image(imagenP1, 0, 0, 640, 480);
    fill(0);

    //texto pantalla 1
    textFont(fuenteP1, 24);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Obra Levedad del año 2009, instalacion de hilos y video \nHecha por Duvier del Dago (1976)", 320, movimientoYTextoP1);
    
    //movimiento del texto
    movimientoYTextoP1++;
    
  } else if (segundos <= 10) {
    pantalla = 2;
    image(imagenP2, 0, 0, 640, 480);
    
    //texto pantalla 2
    textFont(fuenteP2, escaladoTextoP2);
    fill(255);
    text("Obra presentada en la Bienal de Cuenca, Ecuador, en 2009, \nLevedad continúa la sui géneris metodología de Duvier del Dago \nconsistente en dibujar con hilos.", 320, 30);
    
    //escalado de texto 
   escaladoTextoP2 = escaladoTextoP2 + 0.1;
    
  } else if (segundos > 10) {
    pantalla = 3;
    image(imagenP3, 0, 0, 640, 480);
    
    //transparencia texto pantalla 3
    textFont(fuenteP3);
    fill(255,255, 255,transparenciaTextoP3);
    textFont(fuenteP3, 16);
    textAlign(CENTER, CENTER);
    text("En esta video-instalación Duvier “replica” el tanque M1 A2 Abhrams usado en la operación \nTormenta del Desierto y que constituyó un fiasco tecnológico, mientras en la pared \nvemos pasar, como en los créditos de una película", 320, 45);
    
    //escalado de texto 
   transparenciaTextoP3++;  

    //boton de reinicio
    image(boton, 530, 420, 100, 50);
  }
}


//reinicia los valores de las variables
void mousePressed() {
  //para que el evento funcione se tienen que cumplir todas las condiciones
  if (segundos > 6 && pantalla == 3 && mouseX > 530 && mouseX < 630 && mouseY > 420 && mouseY < 470) {
    segundos = 0;
    pantalla = 1;
    movimientoYTextoP1 = -25;
    escaladoTextoP2 = 0.1;
    transparenciaTextoP3 = 0;
  }
}
