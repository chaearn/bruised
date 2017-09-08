import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;

Arduino arduino;

int sensePin = 2;
PShader blur;

void setup() {
  size(1000, 300);
  background(220, 199, 170);
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  //arduino.pinMode(ledPin, Arduino.OUTPUT);
  smooth(10000000);
}

void draw() {

  println(arduino.analogRead(sensePin));
  if (arduino.analogRead(sensePin) != 0) 
  {
    int a = arduino.analogRead(sensePin);
    noStroke();
    fill(156, 95, 110, a-200);
    ellipse(random(300, 700), random(300), 20, 20);
    ellipse(random(300, 700), random(300), 20, 20);
    //ellipse(random(0, 500), random(0, 500), (float) (a-500), (float)(a -500));
    fill(161, 66, 66, a-200);
    ellipse(random(300, 700), random(300), 10, 10);
    ellipse(random(300, 700), random(300), 5, 5);
    
    fill(122, 135, 101, a);
    ellipse(mouseX-100, mouseY-50, 10, 10);
    ellipse(random(mouseX-100, mouseX+100), random(mouseY-100, mouseY+100), 10, 10);
    ellipse(random(mouseX-100, mouseX+100), random(mouseY-100, mouseY+100), 10, 10);

    ellipse(random(0, 500), random(500), 15, 15);
    filter(BLUR, 6);
  }
}