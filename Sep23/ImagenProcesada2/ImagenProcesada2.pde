PImage gato;
int resolucion = 1;

void setup(){
  size(970,450);
  gato = loadImage("gato.jpg");

}

void draw(){
  background(255);
  for(int  i = 0; i<width; i+= resolucion){
    for(int j = 0; j<height; j+= resolucion){
      color c = gato.get(i,j);
      //proceso los canales RGB por separado
      float rojo = red(c);
      float verde = green(c);
      float azul = blue(c);
      
      //proceso los canales por separado
      
      //cambio los canales de orden
      //fill(verde,azul,rojo);
      
      //sumo o resto de manera general
      //fill(rojo+50,verde-50,azul-30);
      
      //proceso los canales con una funcion
      //fill(rojo+sin(i*0.01)*50,verde+sin(j*0.05)*60,azul+sin(i*1)*30);
      

      
      noStroke();
      rect(i,j,resolucion,resolucion);
    }
  }
  
}

void keyPressed(){
  //guarda la imagen en el disco duro
  saveFrame();
}
