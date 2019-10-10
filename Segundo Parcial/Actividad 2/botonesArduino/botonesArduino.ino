void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13,INPUT_PULLUP);
  pinMode(12,INPUT_PULLUP);
  pinMode(11,INPUT_PULLUP);
  pinMode(10,INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly: 
  
  if(digitalRead(10)==LOW){
    Serial.print(0);
  }else if(digitalRead(11)==LOW){
    Serial.print(1);
  }else if(digitalRead(12)==LOW){
    Serial.print(2);
  }else if(digitalRead(13)==LOW){
    Serial.print(3);
  }else{
    Serial.print(4);
  }
  Serial.flush();
  delay(100);
}
