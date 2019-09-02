class Particula{
  float x,y,v,a;
  int t;
  color c;
  int comportamiento =0;
  float da;
  int contador;
  Particula(float x_, float y_, float v_, float a_, int t_, color c_){
    this.x = x_;
    this.y = y_;
    this.v = v_;
    this.a = a_;
    this.t = t_;
    this.c = c_;
  }
  
  Particula(){
    this.x = 200;
    this.y = 200;
    this.v= 2;
    this.a= 0;
    this.t = 15;
    this.c = color(255,0,0);
    this.da = 0.1;
  }
  
  void setComportamiento( int c_){
    this.comportamiento = c_;
  }
  
  void movimiento(){
    switch (this.comportamiento){
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
    this.x = constrain(this.x,0,400);
    this.y = constrain(this.y,0,400);
  }
  
  void movimientoLineal(){
    this.x+= cos(a)*v;
    this.y+= sin(a)*v;
  }
  
  void movimientoEnEspiral(){
    //especificar 
    this.x+= cos(this.a)*this.v;
    this.y+= sin(this.a)*this.v;
    this.a+=this.da;
    this.da-=0.0001;
  }
  
  void movimientoAleatorio(){
    //especificar
    this.x+= cos(this.a)*this.v;
    this.y+= sin(this.a)*this.v;
    this.a = random(TWO_PI);
  }
  
  void movimientoCaotico(){
    //especificar
    this.x+= cos(this.a)*this.v;
    this.y+= sin(this.a)*this.v;
    this.a+= this.da;
    this.contador++;
    if (this.contador % 20 == 0){
      this.da =random(-0.1,0.1);
    }
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
  background(255);
}

void draw(){
  //background(255);
  foo.display();
  foo.movimiento();
}

void keyPressed(){
  //cambia el comportamiento de las particulas con los números de 0 a 4
  switch(key){
    case '0':
      foo.setComportamiento(0);
    break;
    case '1':
      foo.setComportamiento(1);
    break;
    case '2':
      foo.setComportamiento(2);
    break;
    case '3':
      foo.setComportamiento(3);
    break;
    case '4':
      foo.setComportamiento(4);
    break;
  }
}
