Flower flower;
boolean isConfiguring = true;
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

byte[] index;

void setup()
{
  size(displayWidth, displayHeight); 
  smooth();
  frameRate(10);
  orientation(PORTRAIT);
  isConfiguring = true;           
  flower = new Flower(width/2f, height/2f);
  arduino = new Arduino(this, "COM11", 57600);
  arduino.pinMode(4, Arduino.SERVO);
}

void mousePressed() {
  byte[] index = {(byte) flower.petalPressed()};
}

void mouseReleased() {
  byte[] zero = {(byte) -1};
  
}

void draw() {
  if (isConfiguring) {
    isConfiguring = false;
  } else {
    flower.update();
  }
}
