boolean[] keycode = new boolean[5];
static int chx = 630, chy = 250, chw = 15, chh = 24;
static int rechx = 50, rechy = 200;
static int[] jumparray = new int[0];
static int[] droparray = new int[0];
boolean jump = false;

class Jump {

  int h = 13, d = h - 2;
  int i = -1;  //array number
  int jumping = 1;
  

  void hittest() {
    noStroke();    
    fill(0, 0);
    rect(chx, chy, chw, chh);
  }

  void keyp() {
    if (keyPressed) {
      if (key == ' ' && drop == false && black == false && climb == false && floor15 == false) keycode[0] = true;
      if (keyCode == LEFT) keycode[1] = true;
      else if (keyCode == RIGHT) keycode[2] = true;
      if (keyCode == UP) keycode[3] = true;
      else if (keyCode == DOWN) keycode[4] = true;
    }

    if (keycode[0] == true) jump();
    if (keycode[1] == true && keycode[2] == false 
    && chx >= 20 && black == false) {
      if(f != 15) chx -= 3; 
      else ix += 3;
      keypress = "left";
    } else if (keycode[2] == true && chx <= 670 && black == false) {
      if(f != 15) chx += 3; 
      else ix -= 3; 
      keypress = "right";
    }
    if (keycode[3] == true && climb == true) {
      chy -= 3;
      updown = "up";
      jumping = 3;
      ro.ropestate = true;
    } else if (keycode[4] == true && climb == true) {
      chy += 3;
      updown = "down";
      jumping = 3;
      ro.ropestate = true;
    }
  }
  
  void keyp2() {
    if (keyPressed) {
      if (key == ' '  && drop == false && black == false) keycode[0] = true;
      if (keyCode == LEFT) keycode[1] = true;
      else if (keyCode == RIGHT) keycode[2] = true;
    }

    if (keycode[0] == true) jump();
    if (keycode[1] == true && keycode[2] == false 
    && black == false) {
      chx -= 3;
      keypress = "left";
    } else if (keycode[2] == true && black == false) {
      chx += 3;
      keypress = "right";
    }
  }

  void setarray() {

    // array creation
    for (int i = 0; i >= 0; i++) {
      h -= 1;
      jumparray = append(jumparray, h);
      if (h==0) break;
    }

    for(int i = 0; i < cf.length; i++) { 
      cf[i].j = jumparray.length - 1; //cliff
    }

    for (int i = 0; i < 30; i++) {
      d += 1;
      droparray = append(droparray, d);
    }
  }

  void jump() {
    
    switch(jumping) {
      
      case 1 : i++; chy -= jumparray[i]; updown = "up";
      jump = true;
      
      // hit reset
      if(blackmode == 2) jumping = 3;
      
      //up cancel
      if (i==jumparray.length-1) jumping ++;
      
      if(Swimming == true) jumping = 3;
      break;
      
      
      case 2 : chy += jumparray[i]; i--; updown = "down"; 
      if (i==-1 || blackmode == 2) jumping ++;
      break;
      
      
      case 3 :
      //value(hit) reset
      i=-1;
      jumping = 1;
      keycode[0] = false;
      updown = "null";
      jump = false;
      break;
      
    }
    
  }
}

void keyReleased() {
  if (keyCode == LEFT) keycode[1] = false;
  if (keyCode == RIGHT) keycode[2] = false;
  if (keyCode == UP) { keycode[3] = false; upkey = true; }
  if (keyCode == DOWN) keycode[4] = false;
  if (puzzle == true) numkeypress = false;
}

