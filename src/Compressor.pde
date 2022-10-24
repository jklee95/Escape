static int cox1 = 170, cox2 = 420;
static int coy1 = -200, coy2 = -200;
static int cow = 114, coh = 300;

PImage piston;

AudioPlayer windy;

AudioPlayer piston1;
AudioPlayer piston2;



class Compressor {
  
  
  boolean sound1 = true, sound2 = false;
  
  int time1 = 0, time2 = 0;
  int pistonmode1 = 1, pistonmode2 = 1;
  
  
  
  void makepiston() {
    piston = loadImage("background\\piston.png");
  }
  
  void compress() {
    image(piston, cox1, coy1, cow, coh);
    image(piston, cox2, coy2, cow, coh);
  }
  
  void pistonmove1() {
    
    switch(pistonmode1) {
      case 1 : coy2 += 3; ob[1].oby +=3; time1 = 0; 
      if(coy2 > -76) pistonmode1 ++;
      pistonsound1();
      break;
      
      case 2 : time1 ++;
      if(time1 == 70) { pistonmode1 ++; sound2 = true; }
      break;
      
      case 3 : coy2 -= 1; ob[1].oby -=1; time1 = 0; 
      if(coy2 < -200) pistonmode1 ++;
      pistonsound2();
      break;
      
      case 4 : time1 ++;
      if(time1 == 50) { pistonmode1 = 1; sound1 = true; }
      break;
    }
    
  }
  
  void pistonmove2() {
    
    switch(pistonmode2) {
      case 1 : time2 ++;
      if(time2 == 50) { pistonmode2 ++;  sound1 = true; }
      break;
      
      case 2 : coy1 += 3; ob[0].oby +=3; time2 = 0; 
      if(coy1 > -76) pistonmode2 ++;
      pistonsound1();
      break;
      
      case 3 : time2 ++;
      if(time2 == 70) { pistonmode2 ++;  sound2 = true; }
      break;
      
      case 4 : coy1 -= 1; ob[0].oby -=1; time2 = 0; 
      if(coy1 < -200) pistonmode2 = 1;
      pistonsound2();
      break;
    }
    
  }
  
  void pistonhit() {
    if(chx > cox1 - chw && chx < cox1 + cow) {
      if(pistonmode2 == 3 && time2 == 5) {
        blackmode = 2;
        a = 300;
      }
    }
    
    if(chx > cox2 - chw && chx < cox2 + cow) {
      if(pistonmode1 == 2 && time1 == 5) {
        blackmode = 2;
        a = 300;
      }
    }
    
  }
  
  float resound = 0.00;
  boolean sound = true;
  
  void windy() {
    
    chx -= 1;
    
    if(resound > 7.00) { 
      resound = 0.00;
      sound = true;
    } else {
      resound += 0.01;
      while (sound == true) {
        windy = minim.loadFile("sound\\wind.mp3");
        windy.play();
        sound = false;
      }
    }
  }
  
  void pistonsound1() {
    while (sound1 == true) {
      piston1 = minim.loadFile("sound\\piston1.mp3");
      piston1.play();
      sound1 = false;
    }
  }
  
  void pistonsound2() {
    while (sound2 == true) {
      piston2 = minim.loadFile("sound\\piston2.mp3");
      piston2.play();
      sound2 = false;
    }
  }

}
