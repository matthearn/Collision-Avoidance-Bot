#define DEBUG_OUTPUT //uncomment to activate debug mode

//M1: Direction for Motor1
//M2: Direction for Motor2
//E1: PWM control for Motor1
//E2: PWM control for Motor2
int E1 = 5;
int M1 = 4;
int E2 = 6;
int M2 = 7;

//Define Analog Pins for the range sensors
int fRangeRight = 0; //Front Right Sensor
int fRangeLeft = 1;  //Front Left Sensor
int sRangeRight = 2; //Side Right Sensor
int sRangeLeft = 3;  //Side Left Sensor

//Define variables for the data from the range sensors to live in
int fRangeRightResult = 0;
int fRangeLeftResult = 0;
int sRangeRightResult= 0;
int sRangeLeftResult= 0;
 
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
  
  sRangeRightResult= analogRead(sRangeRight);
  sRangeLeftResult= analogRead(sRangeLeft);
  #ifdef DEBUG_OUTPUT
  Serial.print(fRangeRightResult);
  Serial.print("|");
  Serial.print(fRangeLeftResult);
  Serial.print("|");
  Serial.print(sRangeRightResult);
  Serial.print("|");
  Serial.println(sRangeLeftResult);
  #endif
  if(fRangeRightResult > 280 || fRangeLeftResult > 280)
  {
    #ifdef DEBUG_OUTPUT
    Serial.print("Twirl"); //for debugging
    #endif
    STOP();
  }
  else if(sRangeRightResult > 350)
  {
    #ifdef DEBUG_OUTPUT
    Serial.print("Steering Right"); //for debugging
    #endif
    forwardRight();
  }
    else if(sRangeLeftResult > 350)
  {
    #ifdef DEBUG_OUTPUT
    Serial.print("Steering Left"); //for debugging
    #endif
    forwardLeft();
  }
  else
  {
    #ifdef DEBUG_OUTPUT
    Serial.print("forward"); //for debugging
    Serial.println(sRangeLeftResult);
    #endif
    STOP();
  }
}

void forwardSlow()
{
  digitalWrite(M1,HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(E1, 110); //PWM Speed control
  analogWrite(E2, 110); //PWM Speed control
}
void forwardRight()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(E1, 160);
  analogWrite(E2, 100);
  
}
void forwardLeft()
{
  digitalWrite(M1, HIGH);
  digitalWrite(M2, HIGH);
  analogWrite(E1, 100);
  analogWrite(E2, 160);
  
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

