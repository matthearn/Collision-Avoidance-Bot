//!!!!!!!!!!!!!!!!!! THIS CODE DOES NOT WORK, IT'S JUST HERE FOR MY RECORDS ONLY, MATT H

//M1: Direction for Motor1
//M2: Direction for Motor2
//E1: PWM control for Motor1
//E2: PWM control for Motor2
int E1 = 5;
int M1 = 4;
int E2 = 6;
int M2 = 7;

//Define Analog Pins for the range sensors
int fRangeRight = 0;
int fRangeLeft = 1;

//Define variables for the data from the range sensors to live in
int fRangeRightResult =0;
int fRangeLeftResult =0;
 
void setup()
{
  pinMode(M1, OUTPUT);
  pinMode(M2, OUTPUT);
  Serial.begin(9600); //for debugging
}
void loop()
{

  fRangeRightResult = analogRead(fRangeRight); 
  fRangeLeftResult = analogRead(fRangeLeft); 

  
  if(fRangeRightResult > 280 || fRangeLeftResult > 280)
  {
    //Serial.print("STOP"); //for debugging
    //Serial.print(fRangeRightResult);
    //Serial.print("|");
    //Serial.println(fRangeLeftResult);
    STOP();
  }
  else
  {
    //Serial.print("forward"); //for debugging
    //Serial.print(fRangeRightResult);
    //Serial.print("|");
    //Serial.println(fRangeLeftResult);
    forwardSlow();
  }
}

void forwardSlow()
{
  digitalWrite(M1,HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(E1, 110); //PWM Speed control
  analogWrite(E2, 110); //PWM Speed control
}
void rotate()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, LOW);
  analogWrite(E1, 255);
  analogWrite(E2, 255);
}  
void STOP()
{
  analogWrite(E1, 0); //PWM Speed control
  analogWrite(E2, 0); //PWM Speed control
}
