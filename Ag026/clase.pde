class Avatar{
  float x,y;
  float d;
  float v = 2;
  
  Avatar(){
    this.x = 200;
    this.y = 200;
    this.d = 0;
  }
  
  
  void display(){
    noStroke();
    fill(255,0,0);
    pushMatrix();
    translate(this.x,this.y);
    rotate(this.d);
    ellipse(0, 0, 10,10);
     stroke(0);
    line(0,0,10,0);
    popMatrix();
   
    
  }
  
  void mover(){
    this.x = this.x + cos(this.d)*this.v;
    this.y = this.y + sin(this.d)*this.v;
    this.x = constrain(this.x,50,width-50);
    this.y = constrain(this.y,50,height-50);
    
  }
  
  void rotar(){
    this.d += 0.05;
  }
  
  void colision(){
    for(Particula p:particulas){
      float distancia = dist(this.x,this.y,p.x,p.y);
      if(distancia < p.r ){
        println("COLISION!!!");
      }
    }
  }
}


class Particula{
  float x,y;
  float dx,dy;
  float r;
  color c;
  float cols[] = new float[3];
  float dcols[] = new float[3];
  
  
  Particula(int x_, int y_, float r_, color c_){
    this.x = x_;
    this.y = y_;
    this.dx = random(-1,1);
    this.dy = random(-1,1);
    this.r = r_;
    this.c = c_;
    
    for(int i = 0; i<3; i++){
      cols[i] = random(TWO_PI);
      dcols[i]= random(-0.05,0.05);
    }
  }
  
  void display(){
    noStroke();
    fill(this.c);
    for(int i = 0; i<3; i++){
      cols[i] += dcols[i];
    }
    float rojo = sin(cols[0]);
    float verde = sin(cols[1]);
    float azul =  sin(cols[2]);
    fill(map(rojo,-1,1,0,255),map(verde,-1,1,0,255),map(azul,-1,1,0,255));
    
    ellipse(this.x,this.y,this.r*2*rojo,this.r*2*rojo);
    
  }
  
  void mover(){
    this.x+=this.dx;
    this.y+=this.dy;
    if(this.x<0+this.r || this.x>width-this.r){
      this.dx *=-1;
    }
    if(this.y<0+this.r || this.y>height-this.r){
      this.dy *=-1;
    }
  }
}

ArrayList <Particula> particulas;
Avatar elAvatar;
float t;
color col;

void setup(){
  size(400,400);
  particulas = new ArrayList <Particula>();
  elAvatar = new Avatar();
}

void draw(){
  background(255);
  for(Particula p: particulas){
    p.display();
    p.mover();
  }
  
  if(mousePressed){
    t++;
    noStroke();
    fill(col);
    ellipse(mouseX,mouseY,t,t);
  }
  
  elAvatar.display();
  elAvatar.colision();
  if(keyPressed){
    if(key == 'a'){
      elAvatar.mover();
    }
    if(key == 's'){
      elAvatar.rotar();
    }
  }
  
}

void mousePressed(){
  col = color(random(255),random(255),random(255));
  t = 1;
}

void mouseReleased(){
  particulas.add(new Particula(mouseX,mouseY,t/2,col));
}
