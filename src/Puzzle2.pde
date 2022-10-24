PImage ironwall;
PImage switch_up;
PImage switch_down;

class Puzzle2 {
  
  int doororder = 0;
  int doorstate = 0;
  int time = 0;
  int answer = 0;
  
  String[] switchimage = {"up", "up", "up", "up"};
  
  void makeimage() {
    ironwall = loadImage("background\\ironwall.jpg");
    switch_up = loadImage("background\\switch_up.png");
    switch_down = loadImage("background\\switch_down.png");
  }

  void puzzle() {
    
    //wall
    for (int i = 2; i < 6; i++) {
      image(ironwall, ob[i].obx, ob[i].oby, 20, 115);
    }
    
    //swtich & hittest
    for (int i = 6; i < 10; i++) {
      
      //display
      if(switchimage[i-6].equals("up")) image(switch_up, ob[i].obx, ob[i].oby, 25, 25);
      else if(switchimage[i-6].equals("down")) image(switch_down, ob[i].obx, 200, 25, 25);
      
      //action
      if(ob[i].upstate == true) {
        ob[i].oby = 400;
        ob[i].upstate = false;
        ob[i].dropping = true;
        doororder = i;
        switchimage[i-6] = "down";
      }
    }
    
     switch(doororder) {
      case 6 : if(ob[2].oby == 110) { ob[2].oby = 400; answer ++; doororder = 5; }
               else if(ob[2].oby != 110) { ob[2].oby = 110; answer --; doororder = 5; }
               
               if(ob[3].oby == 110) { ob[3].oby = 400; answer ++; doororder = 5; }
               else if(ob[3].oby != 110) { ob[3].oby = 110; answer --; doororder = 5; }
               
               doorstate ++;
      break;
      
      case 7 : if(ob[3].oby == 110) { ob[3].oby = 400; answer ++; doororder = 5; }
               else if(ob[3].oby != 110) { ob[3].oby = 110; answer --; doororder = 5; }
               
               if(ob[4].oby == 110) { ob[4].oby = 400; answer ++; doororder = 5; }
               else if(ob[4].oby != 110) { ob[4].oby = 110; answer --; doororder = 5; }
               
               doorstate ++;
      break;
      
      case 8 : if(ob[4].oby == 110) { ob[4].oby = 400; answer ++; doororder = 5; }
               else if(ob[4].oby != 110) { ob[4].oby = 110; answer --; doororder = 5; }
               
    
               if(ob[5].oby == 110) { ob[5].oby = 400; answer ++; doororder = 5; }
               else if(ob[5].oby != 110) { ob[5].oby = 110; answer --; doororder = 5; }
               
               doorstate ++;
      break;
      
      case 9 : if(ob[5].oby == 110) { ob[5].oby = 400; answer ++; doororder = 5; }
               else if(ob[5].oby != 110) { ob[5].oby = 110; answer --; doororder = 5; }
               
               if(ob[2].oby == 110) { ob[2].oby = 400; answer ++; doororder = 5; }
               else if(ob[2].oby != 110) { ob[2].oby = 110; answer --; doororder = 5; }
               
               doorstate ++;
      break;
    }
    
    if(doorstate == 4) {
      time ++;
      if(time > 30 && answer != 4) {
      
        //door reset
        for (int i = 2; i < 6; i++) {
          ob[i].oby = 110;
        }
        
        //switch reset
        for (int i = 6; i < 10; i++) {
          ob[i].oby = 200;
          switchimage[i-6] = "up";
        }
        
        doorstate = 0;
        time = 0;
        answer = 0;
      }
    }
  }
}
