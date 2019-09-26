
float x;
float y;
boolean aparecio = false;
int contador;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  if(random(1)>0.99){
     aparecio = true;
     x = random(400);
     y = random(400);
  }
  
  if(aparecio == true){
    ellipse(x,y,10,10);
    contador++;
  }
  
  if(contador>100){
    aparecio = false;
    contador = 0;
  }
}
