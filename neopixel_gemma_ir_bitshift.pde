/*
* Some bitshifting, to be used in conjunction with
* http://learn.adafruit.com/trinket-gemma-ir-remote-control/using-ir-codes
* and some neoPixel 16-led rings.
* 
* Why?
* Purely from necessity: Adafruit Gemma or Trinket does not have a serial output
* by default and I don't own FTDI friend or USB serial cable.
*
* Usage idea:
* Input of this script is to be replaced with the received ir code and
* the last println() is replaced with method to blink the neopixel ring.
* Remote controller's code can then be read (in hex) by observing the pattern
* of blinking leds.
*
* (c) Mikko Nieminen 2014
*/

int input = 0xe0c8a2dd;
println("input: "+binary(input)+" in hex: "+ hex(input));

int shift;
int led;

for (int i = 7; i>=0;i--) {  
  // 1. calculate shift amount, 4 bytes per round
  shift = i*4; 
  // 2. get 4 significant bits
  led = input>>shift&0x0f; 
  // 3. print for profit!
  println(binary(led)+" -> " + led + " (hex "+hex(led)+")");   
}
