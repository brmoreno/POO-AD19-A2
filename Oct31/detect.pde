import processing.video.*;
import gab.opencv.*;
import java.awt.*;

Capture cam;
OpenCV opencv;

void setup(){
  size(640,360);
  cam = new Capture(this, Capture.list()[3]);
  opencv = new OpenCV(this,640,360);
  opencv.loadCascade(OpenCV.CASCADE_EYE );
  cam.start();
}

void draw(){
  if(cam.height != 0){
    opencv.loadImage(cam);
    //opencv.threshold(50);
    image(cam,0,0);
    Rectangle[] caras = opencv.detect();
    for(int i = 0; i<caras.length; i++){
      noFill();
      stroke(255,0,0);
      strokeWeight(4);
      //rect(caras[i].x,caras[i].y,caras[i].width,caras[i].height);
      opencv.threshold(50);
      image(opencv.getOutput().get(caras[i].x,caras[i].y,caras[i].width,caras[i].height),caras[i].x,caras[i].y);
    }
    
  }
}

void captureEvent(Capture c) {
  c.read();
}

void keyPressed(){
  if(key == 'a'){
     opencv.loadCascade(OpenCV.CASCADE_EYE );
  }
  if(key == 'b'){
     opencv.loadCascade(OpenCV.CASCADE_MOUTH);
  }
}
