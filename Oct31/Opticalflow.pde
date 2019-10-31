import processing.video.*;
import gab.opencv.*;


Capture cam;
OpenCV opencv;

void setup(){
  size(640,360);
  cam = new Capture(this, Capture.list()[3]);
  opencv = new OpenCV(this,640,360);
  cam.start();
}

void draw(){
  //background(0);
  if(cam.height != 0){
    opencv.loadImage(cam);
    opencv.calculateOpticalFlow();
    stroke(0,0,255);
    //opencv.drawOpticalFlow();
    for(int i = 0; i<opencv.width; i+=5){
      for(int j = 0; j<opencv.height; j+=5){
        color c = cam.get(i,j);
        PVector p = opencv.getFlowAt(i,j);
          if(p.mag()>10){
          stroke(c);
          strokeWeight(random(1,10));
          line(i,j,i+p.x,j+p.y);
        }
      }
    }
  }  
}

void captureEvent(Capture c) {
  c.read();
