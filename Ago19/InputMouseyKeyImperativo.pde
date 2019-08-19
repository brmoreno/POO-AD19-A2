int x;
int y;
int t;

int xt;
int yt;
int tt;



void setup(){
  size(400,400);
  x= 200;
  y=200;
  t= 50;
  xt = 200;
  yt = 200;
  tt = 50;
}

void draw(){
  background(255);
  noStroke();
  fill(255,0,0);
  x = mouseX;
  y = mouseY;
  //mousePressed en un escenario continuo, mientras presiono
  if (mousePressed == true){
   t++; 
  }
  ellipse(x,y,t,t);
  
  fill(0,0,255);
  ellipse(xt,yt,tt,tt);
  
  //teclado en forma continua, mientras presiono
  if(keyPressed == true){
    if(key == 'd'){
      xt++;
    }
    if(key == 'a'){
      xt--;
    }
    if(key == 'w'){
      yt--;
    }
    if(key == 's'){
      yt++;
    }
  }
}

void mousePressed(){
  t++;
}

void keyPressed(){
  if(key == 'd'){
      xt++;
    }
    if(key == 'a'){
      xt--;
    }
    if(key == 'w'){
      yt--;
    }
    if(key == 's'){
      yt++;
    }
}
