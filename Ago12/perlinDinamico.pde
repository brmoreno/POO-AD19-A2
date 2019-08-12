//variables globales
float delta;

//condiciones de inicio
void setup(){
  size(400,400);
  background(255);
}

//se repite en cada ciclo de cómputo, mientras el programa esté activo
void draw(){
  delta +=0.01;
  for(int i = 0; i<400; i+=10){
    for(int j= 0; j<400; j+=10){
      fill(noise(i*0.01+delta,j*0.01,delta)*255);
      noStroke();
      rect(i,j,10,10);
    }
  }
}
