
class Caja{
  float x,y,z;
  float rx,ry,rz;
  color c;
  float t;
  float dx;
  float dy;
  float dz;
  float ddx;
  float ddy;
  float ddz;
  float dxa;
  float dya;
  float dza;
  float dr;
  
  Caja(){
    this.x = 0;
    this.y = 0;
    this.z = 0;
    c = color(random(255),random(255),random(255));
    this.t = random(20,40);
    this.rx = random(TWO_PI);
    this.ry = random(TWO_PI);
    this.rz = random(TWO_PI);
    this.ddx= random(-0.1,0.1);
    this.ddy= random(-0.1,0.1);
    this.ddz= random(-0.1,0.1);
    this.dxa= random(20,100);
    this.dya= random(20,100);
    this.dza= random(20,100);
    this.dr= random(-0.1,0.1);
  }
  
  void display(){
    dx+=ddx;
    dy+=ddy;
    dz+=ddz;
    this.x = sin(dx)*dxa;
    this.y = sin(dy)*dya;
    this.z = sin(dz)*dza;
    this.rx+= this.dr;
    this.rx+= this.dr;
    pushMatrix();
    translate(this.x,this.y,this.z);
    rotateX(rx);
    rotateY(ry);
    noStroke();
    fill(this.c);
    box(this.t);
    popMatrix();
  }
}


Caja una;
ArrayList <Caja> cajas;
void setup(){
  size(400,400,P3D);
  cajas= new ArrayList<Caja>();
  for(int i = 0; i<100; i++){
    cajas.add(new Caja());
  }
  
 
}

void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
  rotate(mouseX*0.01);
  for(Caja c: cajas){
    c.display();
  }
}
