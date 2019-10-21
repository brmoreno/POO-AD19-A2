import processing.video.*;
Movie miVideo;

void setup(){
  size(960,540);
  miVideo =  new Movie(this, "cc.mp4");
  miVideo.loop();
  println(miVideo.duration());
}

void draw(){
 //for(int i = 0; i<miVideo.width; i+=20){
 //  for(int j = 0; j<miVideo.height; j+= 20){
 //    color c = miVideo.get(i,j);
 //    stroke(c);
 //    strokeWeight(random(20));
 //    line(i,j,i+random(-60,60),j+random(-60,60));
 //  }
 //}
 image(miVideo.get(mouseX,mouseY,30,30),mouseX,mouseY);
}

void movieEvent(Movie m) {
  m.read();
}
