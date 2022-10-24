static int blackmode = 0;
static int a = 0;

boolean portal = false;
boolean black = false; // because of puzzle


AudioPlayer door;

class BlackMode {
  
  int ptx = 600, pty = 142, ptw = 67, pth = 83;
  int ptx2 = 310, pty2 = 133, ptw2 = 75, pth2 = 92;
  int ptx3 = 30, pty3 = 195, ptw3 = 63, pth3 = 80;
  int ptx4 = 400, pty4 = 150, ptw4 = 63, pth4 = 83;
  
  int ptx5 = 100, pty5 = 150, ptw5 = 50, pth5 = 70;
  int ptx6 = 625, pty6 = 40, ptw6 = 40, pth6 = 54;
  
  boolean sound = true;
  
  void black() {
    switch(blackmode) {
      case 0 : 
      break;
      
      case 1 :
      
      //key invalidation
      black = true;
      
      fill(0, a);
      rect(0,0,700,300);
      a += 10;
      
      while (sound == true) {
        door = minim.loadFile("sound\\door3.wav");
        door.play();
        sound = false;
      }
      
      if(a>=400) {
        blackmode ++; 
        if( f == 12 && chyreset2 == true) f = 15;
        else f++;
      }
      
      break;
      
      
      
      case 2 : 
      fill(0, a);
      rect(0,0,700,300);
      blackmode ++;
      if(f==13) {chy = 258; chx = 30;}
      else if (f == 11) {chx = 300; chy = rechy; }
      else if(f == 12 && chyreset2 == true) { chx = 550; chy = rechy;} 
      else if(f==15) {chx = 200; chy = rechy;}
      else {chx = rechx; chy = rechy;}
      sound = true;
      
      updown = "null";
      
      //blackout reset
      da.dark = false;
      da.darkmode = true;
      f10 = 0.0;
      da.a = 0;
      for (int i = 10; i < 12; i++) {
        ob[i].upstate = false;
      }
      
      //fall reset
      fall.setfall();
      
      //key invalidation(dying)
      black = true;
      
      //pipe reset
      fl.BlockSetting();
      break;
      
      
      case 3 :  
      fill(0, a);
      rect(0,0,700,300);
      if(f!=1) a-=10;
      else a -= 1;
      
      if(a==0) { blackmode = 0; black = false; }
      break;
    }
  }
  
  void portal() {
    fill(0, 0);
    if(f == 12 && el.time == 0.0 ) rect(ptx2, pty2, ptw2, pth2);
    else if(f == 1) rect(ptx3, pty3, ptw3, pth3);
    else if(f == 10 && ropetrue == true) rect(ptx4, pty4, ptw4, pth4);
    else if(f == 12 && chyreset2 == false) rect(ptx5, pty5, ptw5, pth5);
    else if(f == 13) rect(ptx6, pty6, ptw6, pth6);
    else rect(ptx, pty, ptw, pth);
  }
  
  void hittest() {
    if(
    (  ((chx >= ptx-chw && chx <= ptx+ptw) && (f != 1 && f != 10  && f != 13)) 
    || ((chx >= ptx2-chw && chx <= ptx2+ptw2) && f == 10 && ropetrue == false && f != 13) 
    || ((chx >= ptx3-chw && chx <= ptx3+ptw3) && f == 1 && f != 13)
    || ((chx >= ptx4-chw && chx <= ptx4+ptw4) && ropetrue == true && f != 13)
    || ((chx >= ptx5-chw && chx <= ptx5+ptw5) && f == 12 && f != 15 && chyreset2 == false)
    || ((chx >= ptx6-chw && chx <= ptx6+ptw6) && f == 13)) && black == false) portal = true;
    else portal = false;
  }
  
  void portalkey() {
    if(keyPressed) {
      if(keyCode == UP && portal == true && puzzle == false) blackmode = 1;
    }
  }
}
