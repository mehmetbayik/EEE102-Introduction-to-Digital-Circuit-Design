#include <IRremote.h>

#define MAX_TIME 250 // max ms between codes

long lastPressTime = 0;
int state = 0;

int IR_RECEIVE_PIN = 7;


int FORWARD = 8;
int LEFT = 9;
int RIGHT = 10;
int BACKWARD = 11;
byte same;


void setup()
{
  pinMode(FORWARD, OUTPUT);
  pinMode(LEFT, OUTPUT);
  pinMode(RIGHT, OUTPUT);
  pinMode(BACKWARD, OUTPUT);
  Serial.begin(9600);
  IrReceiver.begin(IR_RECEIVE_PIN, ENABLE_LED_FEEDBACK, USE_DEFAULT_FEEDBACK_LED_PIN);
}
void loop() {

  if (IrReceiver.decode())
  {
    IrReceiver.printIRResultMinimal(&Serial);
    Serial.println();
    
      if (IrReceiver.decodedIRData.command == 0x18)
      {
        digitalWrite(LEFT, 0);
        digitalWrite(RIGHT, 0);
        digitalWrite(BACKWARD, 0);
        if (state == 0)
        {
        digitalWrite(FORWARD, 0);
        state = 1;  // Button pressed, so set state to HIGH
        
        }
        digitalWrite(FORWARD, 1);
        lastPressTime = millis();
      }
      if (IrReceiver.decodedIRData.command == 0x8)
      {
        digitalWrite(FORWARD, 0);
        digitalWrite(RIGHT, 0);
        digitalWrite(BACKWARD, 0);
        if (state == 0)
        {
        digitalWrite(LEFT, 0);
        state = 1;  // Button pressed, so set state to HIGH
        
        }
        digitalWrite(LEFT, 1);
        lastPressTime = millis();
      }
      if (IrReceiver.decodedIRData.command == 0x5A)
      {
        digitalWrite(FORWARD, 0);
        digitalWrite(LEFT, 0);
        digitalWrite(BACKWARD, 0);
    
        if (state == 0)
        {
        digitalWrite(RIGHT, 0);
        state = 1;  // Button pressed, so set state to HIGH
        
        }
        digitalWrite(RIGHT, 1);
        lastPressTime = millis();
      }
      
      if (IrReceiver.decodedIRData.command == 0x52)
      {
        digitalWrite(FORWARD, 0);
        digitalWrite(LEFT, 0);
        digitalWrite(RIGHT, 0);
        if (state == 0)
        {
        digitalWrite(BACKWARD, 0);
        state = 1;  // Button pressed, so set state to HIGH
        
        }
        digitalWrite(BACKWARD, 1);
        lastPressTime = millis();
      }
    }
    
  IrReceiver.resume();
  if (state == 1 && millis() - lastPressTime > MAX_TIME) 
    {
      state = 0; // Haven't heard from the button for a while, so not pressed
      digitalWrite(FORWARD, 0);
      digitalWrite(LEFT, 0);
      digitalWrite(RIGHT, 0);
      digitalWrite(BACKWARD, 0);
    }
  }
