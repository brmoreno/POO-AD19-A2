PShape modelo;
  
void setup() {
  size(400, 400, P3D); 
  modelo = loadShape("untitled.obj");
  for(int i = 0; i<modelo.getChildCount();i++){
    modelo.getChild(i).setFill(color(random(255),random(255),random(255)));
  }
}

 void draw() {
  background(0);
  lights();
  translate(width/2, height/2,0);
  rotateZ(PI);
  rotateY(mouseX/50f);
  rotateX(mouseY/50f);
  //modelo.disableStyle();
  //fill(255,0,0);
  //noFill();
  //strokeWeight(1.5);
  //stroke(255);
  if(mousePressed){
    for(int i = 0; i<modelo.getChildCount();i++){  
      modelo.getChild(i).translate(random(-1,1),random(-1,1),random(-1,1));
    }
  }
  else{
    for(int i = 0; i<modelo.getChildCount();i++){
      modelo.getChild(i).resetMatrix();
    }
  }
  shape(modelo);
}
