PImage eye1;
PImage eye2;

class Traffic {
  float time=0.0;
  
  int light = 0;
  
  void setimage() {
    eye1 = loadImage("background\\eye1.png");
    eye2 = loadImage("background\\eye2.png");
  }
  void sign() {
    time+=0.1;
  
    switch(light) {
      //redlight
      case 0:
      image(eye1, 312, 60, 70, 70); 
      
      if(keycode[0] == true || keycode[1]== true || keycode[2]== true ) {
        blackmode=2;
        a=300;
      }
      
      if(time>5.0) light++;
      break;
      
      //greenlight
      case 1:
     image(eye2, 312, 60, 70 , 70); 
      
      if(time>13.0){light--; time=0.0;}
      break;
    }
  }
}

