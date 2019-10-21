import processing.video.*;

Capture cam;

void setup(){
  size(640,360);
  println(Capture.list());
  cam = new Capture(this,Capture.list()[3] );
  cam.start();
}

void draw(){
  //image(cam,0,0);
  background(0);
  for(int i = 0; i<cam.width; i+=20){
   for(int j = 0; j<cam.height; j+= 20){
     color c = cam.get(i,j);
     fill(c);
     textSize(40);
     text(char(int(random(65,127))),i,j);
   }
 }
}

void captureEvent(Capture c) {
  c.read();
}
