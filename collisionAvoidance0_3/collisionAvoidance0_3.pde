//!!!!!!!!!!!!!!!!!! THIS CODE DOES NOT WORK, IT'S JUST HERE FOR MY RECORDS ONLY, MATT H

//Arduino PWM Code：
//M1: Direction for Motor1
//M2: Direction for Motor2
//E1: PWM control for Motor1
//E2: PWM control for Motor2
int E1 = 5;
int M1 = 4;
int E2 = 6;
int M2 = 7;

void setup()
{
    pinMode(M1, OUTPUT);
    pinMode(M2, OUTPUT);
    Serial.begin(9600); 
}
void loop()
{
  int fRangeRight = 0;
  int fRangeLeft = 1;
  int fRangeResultRight = 0;
  int fRangeResultLeft = 0;
  fRangeResultRight = analogRead(fRangeRight);
  fRangeResultLeft = analogRead(fRangeLeft); 
  
  if(fRangeResultLeft < 200 && fRangeResultRight < 200)
  {
    forwardSlow();
  }
 else
  {
    reverseRight();
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

int forwardSlow()
{
  digitalWrite(M1,HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(E1, 110); //PWM Speed control
  analogWrite(E2, 110); //PWM Speed control
}
int rotate()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, LOW);
  analogWrite(E1, 125);
  analogWrite(E2, 125);
}  
int STOP()
{
  analogWrite(E1, 0); //PWM Speed control
  analogWrite(E2, 0); //PWM Speed control
}

int reverseLeft()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, LOW);
  analogWrite(E1, 125);
  analogWrite(E2, 0);  
}
int reverseRight()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, LOW);
  analogWrite(E1, 0);
  analogWrite(E2, 125);  
}
int rangerForwardRead()
{

}
