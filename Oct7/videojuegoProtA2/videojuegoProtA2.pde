ArrayList <Enemigo> enemigos;

void setup(){
  size(400,400);
  enemigos = new ArrayList<Enemigo>();
  for(int i = 0 ; i<10; i++){
    enemigos.add(new Cuadro(width/2,height/2,random(20,50)));
    if(i%2 == 0){
      enemigos.add(new Circulo(width/2,height/2,random(20,50)));
    }
  }
}

void draw(){
  //background(255);
  for(Enemigo e:enemigos){
    e.display();
    e.mover();
    e.serDisparado();
  }

}
