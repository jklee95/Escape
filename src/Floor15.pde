static int[] chxarray = {30, 275, 500};
static int[] chyarray = {73, 168, 258};

boolean upkey = true;
boolean floor15 = false;

static int count = 0;

class Floor15 {
  
  // =====================
  class Portal {
    
    int pox = 150, poy = 270, pow = 40, poh = 52; // + 50,40
    
    void portal() {
      floor15 = true;
      fill(255, 0);
      rect(pox, poy, pow, poh);
      if((chx >= pox-chw && chx <= pox+pow) 
      && (chy > poy-chh && chy < poy+poh))  {
         if(keyPressed) {
           if(keyCode == UP) {
             if(upkey == true) {
             
           chx = chxarray[(int)random(0,3)];
           chy = chyarray[(int)random(0,3)]; 
           
           count ++;
           
           
           if(chx == chxarray[0] && chy == chyarray[2]) {
           chx = chxarray[(int)random(2,3)];
           chy = chyarray[(int)random(0,3)]; 
           }
           if(count < 30) {
           if(chx == chxarray[2] && chy == chyarray[0]) {
           chx = chxarray[(int)random(1,2)];
           chy = chyarray[(int)random(1,3)]; 
           }
         }
           upkey = false;
         }
           }
        }
      }
    }
    
    Portal (int x, int y) {
      pox = x;
      poy = y;
    }
  }
  // =====================
  
  Portal[] portal = new Portal[8];
  
  void portalmake() {
    for(int i = 0; i < portal.length; i++) {
      portal[i] = new Portal(170, 230);
      
      portal[0] = new Portal(170, 230);
      portal[1] = new Portal(395, 230);
      portal[2] = new Portal(625, 230);
      
      portal[3] = new Portal(170, 140);
      portal[4] = new Portal(395, 140);
      portal[5] = new Portal(625, 140);
      
      portal[6] = new Portal(170, 45);
      portal[7] = new Portal(395, 45);
    }
    for(int i = 0; i < portal.length; i++) {
      portal[i].portal();
    }
  }
  
  void chyresett() {
  }
  
}
