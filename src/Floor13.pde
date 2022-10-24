class Floor13 {
  
  boolean crash = false;
  boolean sound2 = true;
  int number = 0;
  int a = 0;
  
  void crash() {
    if(chx > 400 && blackmode == 0) crash = true;
  }
  
  void crashplay() {
    
    if(crash == true) {
    while (sound2 == true) {
      earthquake = minim.loadFile("sound\\earthquake.wav");
      earthquake.play();
      sound2 = false;
    }
    
    
    switch(number) {
      case 0 :
      
      
      black = true;
      fill(0, a);
      rect(0,0,700,300);
      a += 3;
      
      if(a > 300) number++;
      break;
      
      case 1 :
      
      fill(0, a);
      rect(0,0,700,300);
      a -= 3;
      if( a < 0) number ++;
      break;
      
      case 2 : 
      black = false;
      break;
    }
    
    }
  }
}
