//variables globales
float x;
float dx;
float r;
float dr;

//condiciones de inicio
void setup(){
  size(400,400);
  background(255);
  x = 100;
  dx = 1;
  r= 0;
  dr = 0.02;
  frameRate(60);
}

//se repite
void draw(){
  println(frameRate);
  background(255);
  x+=dx;
  r+= dr;
  particula2(x,200);
  if(x>400){
    dx*= -1;
  }
  if(x<0){
    dx*= -1;
  }
  particula2(220,200);
}

//estas son funciones declaradas por mi.
void particula(float x_, float y_){
  pushMatrix();
  translate(-50,-50);  
  for(int i = 0; i<100; i+=10){
    for(int j = 0; j<100; j+=10){
      noStroke();
      fill(random(255));
      rect(x_+i,y_+j,10,10);
    }
  }
  popMatrix();
}

void particula2(float x_, float y_){
  rectMode(CENTER);
  pushMatrix();
  translate(x_,y_);
  rotate(r);
  for(int i = 200; i>0; i-= 20){
    rotate(i*0.002);
    stroke(255);
    fill(i,0,0);
    rect(0,0,i,i);
  }
  popMatrix();
}

