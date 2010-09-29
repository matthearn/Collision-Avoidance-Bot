//Collision Avoidance Code 
//by Matt Hearn 
//24 Sept 2010 
//released under a yet to be decided opensource liscence

//Designed with a 2 wheeled tank steering robot in mind

//Arduino PWM Code：
//M1: Direction for Motor1
//M2: Direction for Motor2
//E1: PWM control for Motor1
//E2: PWM control for Motor2
int E1 = 5;
int M1 = 4;
int E2 = 6;
int M2 = 7;

int fRange = 0;
int fRangeResult =0;

int forwardEnable = 3;

void setup()
{
    pinMode(M1, OUTPUT);
    pinMode(M2, OUTPUT);
   // Serial.begin(9600); 
}
void loop()
{
  digitalWrite(forwardEnable, HIGH);
  delay(100);
  fRangeResult = analogRead(fRange); 
  digitalWrite(forwardEnable, LOW);

  if(fRangeResult < 200)
  {
    forwardSlow();
  }
  else
  {
    rotate();
  }
}

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
int rangerForwardRead()
{

}
