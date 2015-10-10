import diewald_PS3.PS3;
import diewald_PS3.constants.*;
import diewald_PS3.logger.PS3Logger;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

PS3 ps3;
PImage img;
PImage img1;
OpenCV opencv;
float avoidR = 10;
FloatList avoidZone;
int brightPx = 0;
PVector temp;
PVector pA;
PVector pB;

/*define the special position*/
FloatList leftRed;
FloatList rightRed;
FloatList yellow_1;
FloatList yellow_2;
FloatList yellow_3;
FloatList door_1;
FloatList door_2;
FloatList redFinal;
FloatList specialPTemp;



int size_x = 640;
int size_y = 480;

public void setup() {

  //ps3 settings
  PS3Logger.TYPE.DEBUG  .active(true);
  PS3Logger.TYPE.ERROR  .active(true);
  PS3Logger.TYPE.INFO   .active(true);
  PS3Logger.TYPE.WARNING.active(true);

  size(size_x, size_y);

  println("PS3.getCameraCount() = " + PS3.getCameraCount());

  ps3 = PS3.create( 0 );
  ps3.init(VIDEO_MODE.VGA, COLOR_MODE.COLOR_PROCESSED, 30);
  ps3.start();
  ps3.setLed(true);
  //opencv settings
  opencv = new OpenCV(this, 640, 480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  img = createImage(ps3.getWidth(), ps3.getHeight(), ARGB);
  temp = new PVector(0, 0);

  initial_special_position();

}

public void draw() { 
  
  draw_Positioning_box();
  avoidZone = new FloatList();
  scale(1);
  assignPixels(ps3, img);
  opencv.loadImage(img);
  image(img, 0, 0);
  //draw_Positioning_box();

  /*First find the brightess spot in the frame*/
  pA = opencv.max();
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  ellipse(pA.x, pA.y, 10, 10);
  //  println("pA.x = " + pA.x + " pA.y = " + pA.y + " Pixel = "+ (pA.x + pA.y*width) + " Bright = " + brightness(int(pA.x + pA.y*width)));
  if (temp != pA) {
    /*Create an array to hold the pixels you don't want to detect*/
    avoidZone.clear();
    for (float x = pA.x - avoidR; x <= pA.x+avoidR; x = x + 1.0) {
      for (float y = pA.y - avoidR; y <= pA.y+avoidR; y = y + 1.0 ) {
        avoidZone.append(x + y * width);
      }
    }
    temp = pA;
  }

  pB = new PVector(0, 0); 
  loadPixels();
  float brightness = 0.0;
  int brightwx = 0;
  int brighthy = 0;
  for (int hy = 0; hy < height; hy++) {
    for (int wx = 0; wx < width; wx++) {
      if (avoidZone.hasValue(float(wx + hy * width)) == false) {  
        if (brightness(pixels[wx + hy * width])> brightness) {
          brightness = brightness(pixels[int(wx + hy * width )]);
          //pB = new PVector(, 0.0);
          pB.x = wx;
          pB.y = hy;
        }
      }
    }
  }
  stroke(0, 255, 0);
  strokeWeight(2);
  noFill();
  ellipse(pB.x, pB.y, 10, 10);
}

void captureEvent(Capture c) {
  c.read();
}
public void assignPixels(PS3 ps3, PImage img) {
  img.loadPixels();
  ps3.getFrame(img.pixels);
  img.updatePixels();
}


public void dispose() {
  PS3.shutDown();
}

