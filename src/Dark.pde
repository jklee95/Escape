AudioPlayer electronic;
AudioPlayer bomb;

class Dark {
  
  boolean dark = false;
  boolean darkmode = true; // no one more
  
  
  boolean sound1 = true;
  boolean sound2 = true;
  
  int a = 0;
  
  void dark() {
    if(chx >= 200 && darkmode == true) {
      dark = true;
      darkmode = false;
      
      //sound
      sound2 = true;
      
      //bomb
      f10 = 3.0;
    }
  }
  
  void blackout() {
    if(dark == true) {
      fill(0, a);
      rect(0,0,700,300);
      if(a!= 255) a += 10;
    }
  }
  
  void sound() {
    if(dark == true && blackmode != 2) {
      while (sound2 == true) {
        bomb = minim.loadFile("sound\\blackout.wav");
        bomb.play();
        sound2 = false;
      }
    } 
  }
  
  
}
