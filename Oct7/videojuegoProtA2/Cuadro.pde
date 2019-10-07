class Cuadro implements Enemigo{
  float x;
  float y;
  float t;
  float dx;
  float dy;
  int vida;
  
  Cuadro(float x_, float y_, float t_){
    this.x = x_;
    this.y = y_;
    this.t = t_;
    this.dx = random(-1,1);
    this.dy = random(-1,1);
    this.vida = 1;
  }
  void mover(){
    this.x += this.dx;
    this.y += this.dy;
    if(this.x>width){
      this.x = 0;
    }
    if(this.x<0){
      this.x = width;
    }
    if(this.y>height){
      this.y = 0;
    }
    if(this.y<0){
      this.y = height;
    }
  }
  void display(){
    fill(255,0,0);
    noStroke();
    rectMode(CENTER);
    rect(this.x,this.y,this.t,this.t);
  }
  void serDisparado(){
    this.vida = 0;
  }
  
}
