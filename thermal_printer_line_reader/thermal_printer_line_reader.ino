#include <SoftwareSerial.h>
#include <Thermal.h>

int printer_RX_Pin = 2;
int printer_TX_Pin = 3;

Thermal printer(printer_RX_Pin, printer_TX_Pin);

String incoming = "";
char * out;
void setup(){
  printer.begin();
  printer.feed(); //advance one line 
  Serial.begin(9600);
  Serial.println("setup");
}

void loop(){
  if(Serial.available()){
    int in = Serial.read();
    if(in == 1){
      printer.justify('C');
      printer.doubleHeightOn();
      printer.setSize('L');
      printer.println("ITP");
      printer.println("Thesis Archive");
      printer.doubleHeightOff();
      printer.setSize('M');
      printer.inverseOn();
      //printer.println(" at the Winter Show ");
           printer.println(" 17-18 December 2011 ");
      printer.inverseOff();


      //printer.println("17-18 December 2011");

/*
      printer.underlineOn();
      printer.println("                                ");
      printer.underlineOff();

      */
      printer.justify('L'); 
      printer.setSize('S'); 
            
      printer.println(out);
      
      printer.feed();
            printer.underlineOn();
      printer.println("                                ");
            printer.underlineOff();
      //printer.println("--------------------------------");
            printer.feed();
      printer.println("The ITP Thesis Archive aims to preserve, explore, and share the work of ITP students throughout the program's 30+ year history.");
      printer.feed();
      printer.println("Director: Kate Watson");
      printer.println("Staff: Steve Klise, Greg Borenstein, Carlin Wragg, Matt Epler, Nick Santaniello");
      printer.feed();
      printer.println("Learn more:");
      printer.underlineOn();
      printer.boldOn();
      printer.println("itp-archive.herokuapp.com");
      printer.boldOff();
      printer.underlineOff(); 
      printer.feed();
      printer.feed();
      printer.feed();
      incoming = "";
    }
    else {
      incoming += (char)in;
      out = &incoming[0];
    }
  }
}

