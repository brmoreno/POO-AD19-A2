class Particula{
  float x,y,v,a;
  int t;
  color c;
  int comportamiento =1;
  Particula(float x_, float y_, float v_, float a_, int t_, color c_){
    this.x = x_;
    this.y = y_;
    this.v = v_;
    this.a = a_;
    this.t = t_;
    this.c = c_;
  }
  
  Particula(){
    this.x = width/2;
    this.y = height/2;
    this.v= 1;
    this.a= 0;
    this.t = 10;
    this.c = color(255,0,0);
  }
  
  void setComportamiento(){
   //recibe un dato que cambia el comportamiento
  }
  
  void movimiento(){
    switch (comportamiento){
      case 0:
        //sin movimiento
      break;
      case 1:
        this.movimientoLineal();
      break;
      case 2:
        this.movimientoEnEspiral();
      break;
      case 3:
        this.movimientoAleatorio();
      break;
      case 4:
        this.movimientoCaotico();
      break;
    }
    //la partícula debe permanecer en pantalla
  }
  
  void movimientoLineal(){
    this.x+= cos(this.a)*this.v;
    this.y+= sin(this.a)*this.v;
  }
  
  void movimientoEnEspiral(){
    //especificar 
  }
  
  void movimientoAleatorio(){
    //especificar
  }
  
  void movimientoCaotico(){
    //especificar
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(this.x,this.y,this.t,this.t);
  }
}

Particula foo;

void setup(){
  size(400,400);
  foo= new Particula();
}

void draw(){
  background(255);
  foo.display();
  foo.movimiento();
}

void keyPressed(){
  //cambia el comportamiento de las particulas con los números de 0 a 4
}
