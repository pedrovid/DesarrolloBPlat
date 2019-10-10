boolean status=LOW; //Estado del led
 
void setup()
{
  Serial.begin(9600);
  pinMode(53,OUTPUT);
  pinMode(51,OUTPUT);
  pinMode(49,OUTPUT);
  pinMode(47,OUTPUT);
  pinMode(45,OUTPUT);
}
 
void loop()
{
  delay(100);
  if(Serial.available()>0)//Si el Arduino recibe datos a través del puerto serie
  {
    byte dato = Serial.read(); //Los almacena en la variable "dato"
    switch(dato){
      case 0:
        digitalWrite(53,1);
        delay(100);
        digitalWrite(53,0);
        break;
      case 1:
        digitalWrite(51,1);
        delay(100);
        digitalWrite(51,0);
        break;
      case 2:
        digitalWrite(49,1);
        delay(100);
        digitalWrite(49,0);
        break;
      case 3:
        digitalWrite(47,1);
        delay(100);
        digitalWrite(47,0);
        break;
      case 4:
        digitalWrite(45,1);
        delay(100);
        digitalWrite(45,0);
        break;
      case 5:
        digitalWrite(43,1);
        delay(100);
        digitalWrite(43,0);
        break;
    }
    
    
  }
}
