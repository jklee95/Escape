Obstacle[] ob = new Obstacle[17];

class ObstacleClass {
  
  void setarray() {
    ob[0] = new Obstacle(170, -200, 114, 300);
    ob[1] = new Obstacle(420, -200, 114, 300);
    
    int wallx = 400;
    int wally = 110;
    int rewally = wally;
    
    for (int i = 2; i < 6; i++) {
      ob[i] = new Obstacle(wallx, wally, 20, 115);
      wallx += 60;
    }
    
    int switchx = 100;
    int switchy = 200;
    int reswitchy = switchy;
    
    for (int i = 6; i < ob.length; i++) {
      ob[i] = new Obstacle(switchx, 200, 25, 25);
      switchx += 60;
    }
    
    ob[10] = new Obstacle(180, 180, 30, 20);
    ob[11] = new Obstacle(480, 180, 30, 20);
    
    ob[12] = new Obstacle(285, 0, 50, 300);
    ob[13] = new Obstacle(515, 0, 50, 300);
    
    ob[14] = new Obstacle(235, 0, 15, 300);
    ob[15] = new Obstacle(455, 0, 15, 300);
    ob[16] = new Obstacle(685, 0, 15, 300);
    
  }
  
  void makearray() {
    for (int i = 0; i < 2; i++) {
      ob[i].obstacle();
      ob[i].interrupt();
      ob[i].interruptmotion();
      ob[i].drop();
      ob[i].dropping();
    }
  }
  
  void makearray2() {
    for (int i = 2; i < 10; i++) {
      ob[i].obstacle();
      ob[i].interrupt();
      ob[i].interruptmotion();
      ob[i].drop();
      ob[i].dropping();
    }
  }
  
  void makearray3() {
    for (int i = 10; i < 12; i++) {
      ob[i].obstacle();
      ob[i].interrupt();
      ob[i].interruptmotion();
      ob[i].drop();
      ob[i].dropping();
    }
  }
  
  void makearray4() {
    for (int i = 14; i < 17; i++) {
      ob[i].obstacle();
      ob[i].interrupt();
      ob[i].interruptmotion();
      ob[i].drop();
      ob[i].dropping();
    }
  }
  
  void overlap() {
    for (int i = 0; i < ob.length - 1; i++) {
      for (int j = i + 1; j < ob.length; j++) {
        if(ob[i].upstate == true) {
          if(ob[i].upstate == true && ob[j].upstate == true)
           {ob[i].upstate = false; ob[i].dropping = false; 
         ob[j].upstate = false; ob[j].dropping = false;}
        }
      }
    }
  }
  
}
