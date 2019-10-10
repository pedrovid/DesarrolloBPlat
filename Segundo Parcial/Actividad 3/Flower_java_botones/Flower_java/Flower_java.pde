
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
  }

void mouseReleased() {
  byte[] zero = {(byte) -1};
  
}

void draw() {
  int petalo=puerto.readChar();
  if(petalo=='0'||petalo=='1'||petalo=='2'||petalo=='3'){
    print(petalo);
    flower.changeColor(petalo-48);
    delay(200);  
    if (isConfiguring) {
    
      isConfiguring = false;
    } else {
      flower.update();
    }
  }
}
