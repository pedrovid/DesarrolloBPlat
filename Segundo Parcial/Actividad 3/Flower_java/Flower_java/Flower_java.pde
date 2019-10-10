
Flower flower;
color petalArduinoPressed = #aa23e0;
boolean isConfiguring = true;
import processing.serial.*;
Serial puerto;


byte[] index;

void setup()
{
  size(displayWidth, displayHeight); 
  smooth();
  frameRate(10);
  orientation(PORTRAIT);
  isConfiguring = true;           
  flower = new Flower(width/2f, height/2f);
  puerto=new Serial(this,"COM8", 9600);
}

void mousePressed() {
  byte[] index = {(byte) flower.petalPressed()};
  puerto.write(flower.petalPressed());
  }

void mouseReleased() {
  byte[] zero = {(byte) -1};
  
}

void draw() {
  //flower.changeColor(2);  

  if (isConfiguring) {
    isConfiguring = false;
  } else {
    flower.update();
  }
}
