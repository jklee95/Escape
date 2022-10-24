boolean climb = false;

class Rope {
  
  int rox = 475, roy = 0, row = 5, roh = 175;
  boolean ropestate = false;
  boolean dropping = false;
  int arrayorder = 1;
  int j;
  
  void rope() {
    fill(0, 0);
    if(ropetrue == true) roh = 300;
    rect(rox, roy, row, roh);
  }
  
  void hittest() {
    if ((chx >= rox-chw && chx <= rox+row) 
    && (chy > roy-roh && chy < roy + roh)) {
      climb = true;
   } else climb = false;
 }
 
  void drop() {
   if(climb == false && ropestate == true) dropping = true;
   else if(climb == true && (keyCode == UP || keyCode == DOWN)) {
     j = jumparray.length - 1;
     arrayorder = 1;
     dropping = false;
     drop = false;
   }
  }
  
  void dropping() {
    
    if(dropping == true) {
      
      drop = true;
      updown = "down";
      
      switch(arrayorder) {
        case 1 : chy += jumparray[j]; j--;
        if(j == 0) arrayorder ++;
        break;
        
        case 2 : chy += droparray[j]; j++;
        break;
      }
      
      //position reset
      if(chy > 185 && ropetrue == false) {
        chy = 185;
        j = jumparray.length - 1;
        arrayorder = 1;
        dropping = false;
        drop = false;
        ropestate = false;
        updown = "null";
      }
      
      if(chy > 400 && ropetrue == true) {
        el.num = 0;
        j = jumparray.length - 1;
        arrayorder = 1;
        dropping = false;
        drop = false;
        ropestate = false;
        updown = "null";
      }
      
    }
  }
}
