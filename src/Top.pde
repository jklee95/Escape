AudioPlayer heli;
AudioPlayer heligo;

boolean End = false;

class Top {
  
  boolean sound = true;
  boolean sound2 = true;
  float resound = 0.00;
  
  void sound() {
    if( start == false ) {
    if(resound > 7.00) { 
      resound = 0.00;
      sound = true;
    } else {
      resound += 0.01;
      while (sound == true) {
        heli = minim.loadFile("sound\\heli.mp3");
        heli.play();
        sound = false;
      }
    }
    }
  }
  
  float recty1 = - 100;
  float recty2 = 300;
  int a = 0;
  
  boolean start = false;
  void endgame() {
    if(ix < -520) {
      black = true;
      
      fill(0);
      rect(0, recty1, 700,100);
      rect(0, recty2, 700,100);
      
      End = true;
      
      if(recty1 < -40.0) {recty1 += 0.5; iy += 0.3; fchy += 0.3;}
      else start = true;
      if(recty2 > 240.0) recty2 -= 0.5;
      
      
      if(start == true) {
        fill(0, a);
        rect(0,0,700,300);
        if(a!= 255) a ++;
        
        while (sound2 == true) {
        heligo = minim.loadFile("sound\\heligo.mp3");
        heligo.play();
        sound2 = false;
        }
      }
      
    } else fchy = (float)chy;
  }
}
