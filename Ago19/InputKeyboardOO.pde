class Elipse {
  //Atributos
  float x,y;
  float t;
  color c;
  
  Elipse(float x_, float y_, float t_, float r_, float g_, float b_){
    this.x = x_;
    this.y = y_;
    this. t = t_;
    this.c = color(r_,g_,b_);
  }
  
  void display(){
    noStroke();
    fill(this.c);
    ellipse(this.x, this.y, this.t, this.t);
  }
  
  void mover(int adonde_){
    switch(adonde_){
      case 0:
      //arriba
      this.y--;
      break;
      case 1:
      //abajo
      this.y++;
      break;
      case 2:
      //derecha
      this.x++;
      break;
      case 3:
      //izquierda
      this.x--;
      break;
    }
  }
  
}


Elipse avatar;

void setup(){
  size(400,400);
  avatar = new Elipse(200,200,100,0,255,0);
}

void draw(){
  background(255);
  avatar.display();
  if(keyPressed){
    switch(key){
      case 'w':
        avatar.mover(0);
      break;
      case 's':
        avatar.mover(1);
      break;
      case 'a':
        avatar.mover(3);
      break;
      case 'd':
        avatar.mover(2);
      break;
    }
  }  
}

