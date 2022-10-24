Cliff[] cf = new Cliff[5];

class CliffClass {
  
  void setcliff() {
    cf[0] = new Cliff(175, 224, 70);
    cf[1] = new Cliff(448, 224, 70);
    cf[2] = new Cliff(-60, 224, 70);
    cf[3] = new Cliff(680, 224, 70);
    cf[4] = new Cliff(160, 224, 380);
  } 
  
  void makecliff1() {
    for(int i = 0; i < 2; i++) { 
      cf[i].cliff();
      cf[i].drop();
      cf[i].dropping();
    }  
  }
  
  void makecliff2() {
    for(int i = 2; i < 4; i++) { 
      cf[i].cliff();
      cf[i].drop();
      cf[i].dropping();
    }  
  }
  
}
