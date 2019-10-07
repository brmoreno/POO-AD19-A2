class Circulo implements Enemigo{
  float x;
  float y;
  float t;
  int vida;
  
  Circulo(float x_, float y_, float t_){
    this.x = x_;
    this.y = y_;
    this.t = t_;
    this.vida = 3;
  }

  
  void mover(){
    this.x+=random(-2,2);
    this.y+=random(-2,2);
    if(this.x<0){
      this.x = 0;
    }
    if(this.x>width){
      this.x = width;
    }
    if(this.y<0){
      this.y = 0;
    }
    if(this.y>height){
      this.x = height;
    }
  }
  void display(){
    fill(0,0,255);
    noStroke();
    ellipse(this.x,this.y,this.t,this.t);
  }
  void serDisparado(){
    this.vida -= 1;
  }
}
