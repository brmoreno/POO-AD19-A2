class Particula{
  float x,y,v,a;
  int t;
  color c;
  int comportamiento =1;
  Particula(float x_, float y_, float v_, float a_, int t_, color c_){
    x = x_;
    y = y_;
    v = v_;
    a = a_;
    t = t_;
    c = c_;
  }
  
  Particula(){
    x = width/2;
    y = height/2;
    v= 1;
    a= 0;
    t = 10;
    c = color(255,0,0);
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
        movimientoLineal();
      break;
      case 2:
        movimientoEnEspiral();
      break;
      case 3:
        movimientoAleatorio();
      break;
      case 4:
        movimientoCaotico();
      break;
    }
    //la partícula debe permanecer en pantalla
  }
  
  void movimientoLineal(){
    x+= cos(a)*v;
    y+= sin(a)*v;
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
    ellipse(x,y,t,t);
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
