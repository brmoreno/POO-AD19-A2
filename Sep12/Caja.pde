class Caja{
  int w;
  int h;
  color c;
  Body b;
  
  Caja(int x_, int y_, int w_, int h_, color c_){
    this.w = w_;
    this.h = h_;
    this.c = c_;
    
    //Primero, necesito definir y configurar mi body;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    //Segundo, creo mi body
    b = box2d.createBody(bd);
    
    //definir condiciones iniciales;
    b.setLinearVelocity(new Vec2(5,10));
    b.setAngularVelocity(5);
   
    //Tercero, defino la forma de mi cuerpo;
    PolygonShape ps = new PolygonShape();
    float anchoBox2d = box2d.scalarPixelsToWorld(w_/2);
    float altoBox2d = box2d.scalarPixelsToWorld(h_/2);
    ps.setAsBox(anchoBox2d,altoBox2d);
    
    //Cuarto, defino mi fixture;
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.4;
    fd.restitution = 1;
    
    //agrego todo al body
    b.createFixture(fd);
  }
  
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(-angulo);
    noStroke();
    fill(this.c);
    rectMode(CENTER);
    rect(0,0,this.w,this.h);
    popMatrix();
  } 
}
