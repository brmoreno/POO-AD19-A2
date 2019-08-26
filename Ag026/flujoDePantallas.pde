class flujoPantallas{
  int estado;
  
  flujoPantallas(){
    this.estado = 0;
  }
  
  void display(){
    switch(this.estado){
    case 0:
      background(0,0,255);
    break;
    case 1:
      background(255,0,0);
    break;
    case 2:
      background(0,255,0);
    break;
    case 3:
      background(255);
    break;
  }
  }
  
  void cambioPantalla(){
    estado++;
  if(estado>3){
    estado = 0;
  }
  }
  
  
}

flujoPantallas uno;

void setup(){
  size(400,400);
  uno = new flujoPantallas();
}

void draw(){
  uno.display();
}

void keyPressed(){
  uno.cambioPantalla();
}
