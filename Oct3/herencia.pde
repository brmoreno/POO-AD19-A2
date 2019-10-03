class Boton{
  int x,y;
  float r;
  boolean isOver;
  boolean isPressed;
  
  Boton(int x_, int y_, float r_){
    this.x = x_;
    this.y = y_;
    this.r = r_;
    this.isOver = false;
    this.isPressed = false;
  }
  
  void display(){
    this.funcionamiento();
    ellipse(this.x, this.y, this.r,this.r);
    //println("isOver = " + this.isOver + " isPressed = " + isPressed);
  }
  
  void funcionamiento(){
    float distancia = dist(this.x,this.y,mouseX,mouseY);
    
    if(distancia< this.r/2){
      this.isOver = true;
      if(mousePressed){
        this.isPressed = true;
      }
      else{
        this.isPressed = false;
      }
    }
    else{
      this.isOver = false;
      this.isPressed = false;
    }
  }
}

class Boton2 extends Boton{
  
  Boton2(int x_, int y_, int r_){
    super(x_,y_,r_);
  }
  
  void display(){
    this.crecer();
    super.display();
  }
  void crecer(){
    if(this.isPressed){
      this.r += 1;
    }
  }
}

class Boton3 extends Boton{  
  Boton3(int x_, int y_, float r_){
    super(x_,y_,r_);
  }  
  void display(){
    if(this.isOver){
      fill(0,255,0);
    }
    if(this.isPressed){
      fill(0,0,255);
    }
    if(!this.isOver && !this.isPressed){
      fill(255);
    }
    super.display();
  }
}

class Boton4 extends Boton{
  color c;
  Boton4(int x_, int y_, float r_){
    super(x_,y_,r_);
    this.c = color(random(255),random(255),random(255));
  }
  
  void display(){
    if(isPressed){
      this.c = color(random(255),random(255),random(255));
    }
    fill(c);
    super.display();
  }
  
}

Boton2 otro;
Boton3 uno;
Boton4 otromas;

void setup(){
  size(400,400);
  uno = new Boton3(200,200,50);
  otro = new Boton2(100,100,25);
  otromas= new Boton4(300,300,50);
}

void draw(){
  background(255);
  uno.display();
  fill(255);
   otro.display();
   otromas.display();
}
