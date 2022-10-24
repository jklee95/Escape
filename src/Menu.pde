AudioPlayer earthquake;

class Menu {
  
  int bux = 430, buy = 170, buw = 150, buh = 50;
  int aa = 0;
  int mex = 0, mey = 0; 
  
  boolean dark = false;
  boolean sound = true;
  
  void menu() {
    image(floor[0], mex, mey);
  }
  
  void button() {
    fill(0,0);
    rect(bux, buy, buw, buh);
  }
  
  void click() {
    if(mousePressed) {
      if((mouseX > bux && mouseX < bux + buw) 
      && (mouseY > buy && mouseY < buy + buh)) {
        dark = true;
      }
    }
    
    if(dark == true) {
      
      //sound
      while (sound == true) {
        earthquake = minim.loadFile("sound\\earthquake.wav");
        earthquake.play();
        sound = false;
      }
      
      //black
      fill(0, aa);
      rect(0,0,700,300);
      
      //vibration
      mex = (int)random(-10, 10);
      mey = (int)random(-10, 10);
      
      //end
      if(aa < 300) aa += 1;
      else {
        blackmode = 3;
        a = 255;
        f++;
      }
    }
    
  }
}
