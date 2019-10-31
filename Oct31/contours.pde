import processing.video.*;
import gab.opencv.*;
import java.awt.*;


Capture cam;
OpenCV opencv;
ArrayList <Contour> contours;

void setup(){
  size(640,360);
  cam = new Capture(this, Capture.list()[3]);
  opencv = new OpenCV(this,640,360);
  cam.start();
}

void draw(){
  background(255);
  if(cam.height != 0){
    opencv.loadImage(cam);
    opencv.threshold(190);
    image(opencv.getOutput(),0,0);
    contours = opencv.findContours();
    for(Contour c:contours){
      noFill();
      Rectangle r= c.getBoundingBox();
      color col = cam.get(r.x+r.width/2,r.y+r.height/2);
      stroke(col);
      strokeWeight(5);
      c.draw();
    }
  }  
}

void captureEvent(Capture c) {
  c.read();
}
