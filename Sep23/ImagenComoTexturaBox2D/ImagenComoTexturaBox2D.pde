import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Caja una;
Limite uno;
ArrayList <Caja> cajas;

//cargo la imagen
PImage textura;

void setup(){
  size(970,450);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  una = new Caja(200,200,100,50,color(255,0,0));
  uno = new Limite(width/2,height,width,20);

  cajas = new ArrayList<Caja>();
  
  //inicializo el objeto
  textura= loadImage("gato.jpg");
  
}


void draw(){
  
  box2d.step();
  if (mousePressed){
    cajas.add(new Caja(mouseX,mouseY,int(random(20,50)),int(random(20,50)),color(255,0,0)));
  }
  background(255);
  una.display();
  uno.display();
  for(Caja c:cajas){
    c.display();
  }
  
  
  
}
