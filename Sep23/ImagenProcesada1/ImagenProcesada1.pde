PImage gato;
int resolucion = 10;

void setup(){
  size(970,450);
  gato = loadImage("gato.jpg");

}

void draw(){
  background(255);
  for(int  i = 0; i<width; i+= resolucion){
    for(int j = 0; j<height; j+= resolucion){
      color c = gato.get(i,j);
      
      //rects;
      //noStroke();
      //fill(c);
      //rect(i,j,resolucion,resolucion);
      
      //circulos;
      //noStroke();
      //fill(c);
      //ellipse(i,j,resolucion,resolucion);
      
      //texto
      //fill(c);
      //textAlign(CENTER,CENTER);
      //textSize(random(resolucion,resolucion*5));
      //text(char(int(random(64,127))),i,j);
      
      //lineas
      //stroke(c);
      //strokeWeight(random(resolucion*2));
      //line(i,j,i+random(-resolucion*5,resolucion*5),j+random(-resolucion*5,resolucion*5));
      
    }
  }
  
}

void keyPressed(){
  //guarda la imagen en el disco duro
  saveFrame();
}
