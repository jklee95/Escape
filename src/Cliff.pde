boolean drop = false; // jump invalidation


class Cliff {
  
  boolean dropping = false;
  
  int clx, cly, clw, clh = 20;
  int arrayorder = 1;
  int j;
  
  void cliff() {
    fill(255,0);
    rect(clx, cly, clw, clh);
    rect(clx, cly, clw, clh);
  }
  
  void drop() {
   if((clx <= chx && chx <= clx + (clw - chw))
   && (chy >= cly - chh)) dropping = true;
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
      if(chy > 400) {
        j = jumparray.length - 1;
        arrayorder = 1;
        dropping = false;
        drop = false;
        blackmode = 2;
        a = 300;
      }
      
    } else {
      
      // when jumping, adjust dropping acceleration
      if(ju.jumping == 2) {
        arrayorder = 2; 
        j = 0;
      } else { 
        arrayorder = 1; 
        j = jumparray.length - 1;
      }
      
    }
    
  }
  Cliff(int x, int y, int w) {
    clx = x;
    cly = y;
    clw = w;
  }
}
