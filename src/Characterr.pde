PImage[] rightstand = new PImage[4];
PImage[] leftstand = new PImage[4];

PImage[] rightwalk = new PImage[5];
PImage[] leftwalk = new PImage[5];

PImage[] rightup = new PImage[2];
PImage[] leftup = new PImage[2];

PImage[] rightdown = new PImage[2];
PImage[] leftdown = new PImage[2];

int mode = 1;
String keypress = "right";
String updown = "null";

static float fchy; 

class Characterr {
  
  void setcha() {
    for (int i = 0; i < 4; i++) {
      rightstand[i] = loadImage("guy\\right\\guy_stand" + (i+1) +".png");
      leftstand[i] = loadImage("guy\\left\\guy_stand" + (i+1) +".png");
    } 
    
    for (int i = 0; i < 5; i++) {
      rightwalk[i] = loadImage("guy\\right\\guy_walk" + (i+1) +".png");
      leftwalk[i] = loadImage("guy\\left\\guy_walk" + (i+1) +".png");
    }
   for (int i = 0; i < 2; i++) {
      rightup[i] = loadImage("guy\\right\\guy_up" + (i+1) +".png");
      leftup[i] = loadImage("guy\\left\\guy_up" + (i+1) +".png");
    }
   for (int i = 0; i < 2; i++) {
      rightdown[i] = loadImage("guy\\right\\guy_down" + (i+1) +".png");
      leftdown[i] = loadImage("guy\\left\\guy_down" + (i+1) +".png");
    } 
  }
  
  int cx1 = 35;
  int cx11 = 38;
  
  void timer() {
    if (cx1 == 40) { 
      cx1 = 35;
      mode++;
    } else {
      cx1++;
    }
  }
  
  void timer2() {
    if (cx11 == 40) { 
      cx11 = 38;
      mode++;
    } else {
      cx11++;
    }
  }
  
  void character() {
    
    //right
    if(keycode[2] == true && keypress.equals("right") && updown.equals("null") && black == false) {
      timer2();
      switch(mode) {
        case 1 : image(rightwalk[0], chx - 7, chy);
        break;
        case 2 : image(rightwalk[1], chx - 7, chy);
        break;
        case 3 : image(rightwalk[2], chx - 7, chy);
        break; 
        case 4 : image(rightwalk[3], chx - 7, chy);
        break;
        default : image(rightwalk[4], chx - 7, chy);
        break;
      }
      if(mode > 5) mode = 1;
    } else if ((keycode[2] == false || black == true) && keypress.equals("right") && updown.equals("null")) {
      timer();
      switch(mode) {
        case 1 : image(rightstand[0], chx - 7, chy);
        break;
        case 2 : image(rightstand[1], chx - 7, chy);
        break;
        case 3 : image(rightstand[2], chx - 7, chy);
        break;
        default : image(rightstand[3], chx - 7, chy);
        break;
      }
      if(mode > 4) mode = 1;
    } else if (updown.equals("up") && keypress.equals("right")) {
      timer();
      switch(mode) {
        case 1 : image(rightup[0], chx - 7, chy);
        break;
        default : image(rightup[1], chx - 7, chy);
        break;
      }
      if(mode > 2) mode = 1;
    } else if (updown.equals("down") && keypress.equals("right")) {
      timer();
      switch(mode) {
        case 1 : image(rightdown[0], chx - 7, chy);
        break;
        default : image(rightdown[1], chx - 7, chy);
        break;
      }
      if(mode > 2) mode = 1;
    }
    
    
    //left
    if(keycode[1] == true && keypress.equals("left") && updown.equals("null") && black == false) {
      timer2();
      switch(mode) {
        case 1 : image(leftwalk[0], chx - 7, chy);
        break;
        case 2 : image(leftwalk[1], chx - 7, chy);
        break;
        case 3 : image(leftwalk[2], chx - 7, chy);
        break; 
        case 4 : image(leftwalk[3], chx - 7, chy);
        break;
        default : image(leftwalk[4], chx - 7, chy);
        break;
      }
      if(mode > 5) mode = 1;
    } else if ((keycode[1] == false || black == true) && keypress.equals("left") && updown.equals("null")) {
      timer();
      switch(mode) {
        case 1 : image(leftstand[0], chx - 7, chy);
        break;
        case 2 : image(leftstand[1], chx - 7, chy);
        break;
        case 3 : image(leftstand[2], chx - 7, chy);
        break;
        default : image(leftstand[3], chx - 7, chy);
        break;
      }
      if(mode > 4) mode = 1;
    } else if (updown.equals("up") && keypress.equals("left")) {
      timer();
      switch(mode) {
        case 1 : image(leftup[0], chx - 7, chy);
        break;
        default : image(leftup[1], chx - 7, chy);
        break;
      }
      if(mode > 2) mode = 1;
    } else if (updown.equals("down") && keypress.equals("left")) {
      timer();
      switch(mode) {
        case 1 : image(leftdown[0], chx - 7, chy);
        break;
        default : image(leftdown[1], chx - 7, chy);
        break;
      }
      if(mode > 2) mode = 1;
    }
  }
  
  
  
  void character2() {
    timer2();
      switch(mode) {
        case 1 : image(rightwalk[0], chx - 7, fchy);
        break;
        case 2 : image(rightwalk[1], chx - 7, fchy);
        break;
        case 3 : image(rightwalk[2], chx - 7, fchy);
        break; 
        case 4 : image(rightwalk[3], chx - 7, fchy);
        break;
        default : image(rightwalk[4], chx - 7, fchy);
        break;
      }
  }
}
