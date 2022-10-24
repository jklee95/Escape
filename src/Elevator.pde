Rope ro = new Rope();

PImage elevatorin;

AudioPlayer elevator;
AudioPlayer ring;

boolean ropetrue = false;

class Elevator {
  
  boolean dark = false;
  boolean sound = true;
  boolean sound2 = false;
  boolean play = false;
  
  
  // =====================
  class Button {
    
    int elx = 305, ely = 30, elw = 25, elh = 25; // + 50,40
    
    void button() {
      fill(0,0);
      rect(elx, ely, elw, elh);
      if(mousePressed) {
        if((mouseX > elx && mouseX < elx+elw) 
        && (mouseY > ely && mouseY < ely + elh)) {
          dark = true;
        }
      }
    }
    
    Button (int x, int y) {
      elx = x;
      ely = y;
    }
  }
  // =====================
  
  
  Button[] button = new Button[12];
  
  float time = 0;
  
  int elxa = 305, elya = 30;
  
  
  void makeimage() {
    
    elevatorin = loadImage("background\\elevator_in.jpg");
    
    // button
    for(int i = 0; i < button.length; i++) {
      
      button[i] = new Button(elxa, elya);
      
      //array
      if(i==5) { elxa += 50; elya = 30; }
      else elya += 43;
    }
  }
  
  void play() {
    if(keyPressed) {
      if(keyCode == UP && portal == true) {
       puzzle = true; 
       black = true;
     }
    }
    if(puzzle == true) {
      display();
    }
    if(play == true) display2();
  }
  
  int a = 0;
  
  void display() {
    
    if(el.time > - 1.0) image(elevatorin, 0, 0);
    
    for(int i = 0; i < button.length; i++) {
      button[i].button();
    }
   
    
    if(dark == true) {
      fill(0, a);
      rect(0,0,700,300);
      if(a!= 255 && time >= 0) a += 5;
      
      //sound
      while (sound == true) {
        elevator = minim.loadFile("sound\\elevator_total.wav");
        elevator.play();
        sound = false;
      }
      
      if(time > 15.0) { sound2 = true; time = - 1.0;}
      else if (time >= 0.0) time += 0.1;
      else if (time < 0)  time -= 0.1;
      
      while (sound2 == true) {
        earthquake = minim.loadFile("sound\\earthquake.wav");
        earthquake.play();
        sound2 = false;
      }
      
      if(time < - 20.0) { 
       a-=3; 
       time = -21.0;
       chy = 185; 
       if(a < 0) { time = -2.0; black = false; dark = false; play = true;}
      }
    }
  }
  
  void display2() {
    ro.rope();
    ro.hittest();
    ro.drop();
    ro.dropping();
    for (int i = 12; i < 14; i++) {
      ob[i].obstacle();
      ob[i].interrupt();
      ob[i].interruptmotion();
      ob[i].drop();
      ob[i].dropping();
    }
    
    if(chy < 0) {  ropetrue = true;}
    if(ropetrue == true) display3();
  }
  
  int num = 0;
  
  int alpha;
  
  void display3() {
    
    ro.rope();
    ro.hittest();
    ro.drop();
    ro.dropping();
    
    switch(num) {
      case 0 :
      alpha = 255;
      chx = 475; 
      chy = 300 - chh;
      updown = "up";
      time = - 3.0;
      black = true;
      num++;
      break;
      
      case 1 :
      fill(0, alpha);
      rect(0,0,700,300);
      if(alpha < 0) num ++;
      else alpha -= 3;
      break;
      
      case 2 : black = false; 
      puzzle = false;
      break;
    }
  }
  
}
