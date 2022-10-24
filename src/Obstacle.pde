static int reposition = rechy; //other obstacle under heading
static int rei; // heading and drop!

// when heading under other obstacle, adjust dropping acceleration
static boolean heading = false;
static boolean heading2 = false;

class Obstacle {
  
  boolean dropping = false;
  
  int arrayorder = 1;
  int j;
  
  int obx, oby, obw, obh;
  
  boolean leftinterrupt = false;
  boolean rightinterrupt = false;
  boolean upinterrupt = false;
  boolean downinterrupt = false;
  
  boolean upstate = false;
  boolean downstate = false;
  boolean updropping = false;
  boolean updownstate = false; // left right && up down overlop preventation

  
  void obstacle() {
    fill(255,0);
    rect(obx, oby, obw, obh);
  }
  
  void interrupt() {
    
    // left right
    if((chy > oby - chh && chy < oby + obh) && updownstate == false) {

      //left      
      if (chx >= (obw/2) + obx && chx < obx + obw){
        leftinterrupt = true;
        chx = obx + obw; 
      }
      
      //right
      if (chx <= (obw/2) + obx - chw && chx > obx - chw) {
        rightinterrupt = true;
        chx = obx - chw;
      }
    } else {
      leftinterrupt = false;
      rightinterrupt = false;
    }
    
    
    // up down
    if(chx > obx - chw && chx < obx + obw) {
      updownstate = true;
      
      //down
      if(chy >= (obh/2) + oby && chy < oby + obh) {
        downinterrupt = true;
        downstate = true;
        chy = oby + obh;
      } else downinterrupt = false;
      
      //up
      if(chy <= (obh/2) + oby - chh && chy > oby - chh) {
        upinterrupt = true;
        upstate = true;
        chy = oby - chh;
      } else upinterrupt = false;
      
    } else updownstate = false;
    
    
  }
  
  
  void interruptmotion() {
    
    //down hit
    if(downstate == true) {
      
      //hit!
      if(ju.jumping == 1) {
        rei = jumparray.length - 1;
        ju.i = jumparray.length -1 ;
        ju.jumping = 2;
        heading = true;
      }
      //and down
      if(chy >= reposition) {
        ju.jumping = 3;
        chy = reposition;
        downstate = false;
        heading2 = true;
      }
    }
    
    
    //up hit
    if(ju.jumping >= 2) {
      
      //on the obstacle
      if(upinterrupt == true) {
        ju.jumping = 3;
        reposition = oby - chh;
        heading = false;
        heading2 = false;
      }
      
    }
    
  }
  
  
  //--------------drop---------------
  
  
  
  void drop() {
    
    //up drop condition
    if(upstate == true) {
        rei = ju.i;
      if((chx <= obx - chw || chx >= obx + obw) && jump == false) {
        
        
        // other heading!
        if(heading == true) { dropping = true; j = rei + 1;}
       else dropping = true; 
      }
      
    }
    
    // prevent dropping 'cut off'
    if(heading2 == true) { chy += jumparray[rei]; heading2 = false;}
    
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
      if(chy > rechy) {
        j = jumparray.length - 1;
        arrayorder = 1;
        dropping = false;
        drop = false;
        chy = rechy;
        upstate = false;
        reposition = rechy;
        updown = "null";
      }
      
    } else {
      
      // when jumping, adjust dropping acceleration
      if(ju.jumping == 3) {
        arrayorder = 2; 
        j = 0;
      } else { 
        arrayorder = 1; 
        j = jumparray.length - 1;
      }
      
    }
    
  }
 Obstacle (int x, int y, int w, int h) {
   obx = x;
   oby = y;
   obw = w;
   obh = h;
 }
}
