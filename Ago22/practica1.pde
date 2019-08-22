class Particula{
  float x,y;
  float dx,dy;
  float r;
  color c;
  
  Particula(int x_, int y_, float r_, color c_){
    this.x = x_;
    this.y = y_;
    this.dx = random(-1,1);
    this.dy = random(-1,1);
    this.r = r_;
    this.c = c_;
  }
  
  void display(){
    noStroke();
    fill(this.c);
    ellipse(this.x,this.y,this.r*2,this.r*2);
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
float t;
color col;

void setup(){
  size(400,400);
  particulas = new ArrayList <Particula>();
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
  
}

void mousePressed(){
  col = color(random(255),random(255),random(255));
  t = 1;
}

void mouseReleased(){
  particulas.add(new Particula(mouseX,mouseY,t/2,col));
}
