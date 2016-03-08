import processing.serial.*;
char letter;
String words = "";
Serial myPort;  // The serial port
void setup() {
  size(640, 360);
}

void draw() {
  background(0); // Set background to black

  // Draw the letter to the center of the screen
  textSize(14);
  text("Click on the program, then type to add to the String and Enter to send data", 50, 50);
  text("Current key: " + letter, 50, 70);
  text("The String is " + words.length() +  " characters long", 50, 90);
  
  textSize(36);
  text(words, 50, 120, 540, 300);
}

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') && (words.length() < 1)) {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
    
  }
  if( key == ENTER){
     myPort.write(words);
  
  }
  if(key == BACKSPACE){
    words = "";
  }
  
}
