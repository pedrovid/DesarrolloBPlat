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
  for(int i=8;i<13;i++){
    arduino.pinMode(i, Arduino.OUTPUT);
  }
  /*for(int i=47;i<53;i+=2){
    arduino.pinMode(i, Arduino.INPUT_PULLUP);
  }*/
  arduino.pinMode(47, Arduino.INPUT_PULLUP);
  arduino.pinMode(49, Arduino.INPUT_PULLUP);
  arduino.pinMode(51, Arduino.INPUT_PULLUP);
  arduino.pinMode(53, Arduino.INPUT_PULLUP);
}

void mousePressed() {
  byte[] index = {(byte) flower.petalPressed()};
  arduino.digitalWrite(flower.petalPressed()+8,1);
  delay(100);
  arduino.digitalWrite(flower.petalPressed()+8,0);
  }

void mouseReleased() {
  byte[] zero = {(byte) -1};
  
}

void draw() {
  if(arduino.digitalRead(53)==arduino.LOW){
    flower.changeColor(0);
  }else if(arduino.digitalRead(51)==arduino.LOW){
    flower.changeColor(1);
  }else if(arduino.digitalRead(49)==arduino.LOW){
    flower.changeColor(2);
  }else if(arduino.digitalRead(47)==arduino.LOW){
    flower.changeColor(3);
  }
  
  if (isConfiguring) {
    isConfiguring = false;
  } else {
    flower.update();
  }
}
