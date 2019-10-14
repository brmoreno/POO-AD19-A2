PShape img;
int contador;

void setup(){
  size(400,400);
  img = loadShape("bot1.svg");
  println(img.getChildCount());
  
}

void draw(){
  //img.disableStyle();
  contador++;
  
  if(contador%50 == 0){
  shape(img,mouseX,mouseY,50,50);
  }
}
