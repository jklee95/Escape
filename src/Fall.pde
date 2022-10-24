FallObject[] group = new FallObject[20];

class Fall {  

  void setfall() {
    for(int i = 0; i < group.length; i++){
      group[i] = new FallObject((int)random(0,700), (int)random(-600,-100));  
    }  
  } 
  
  void makefall() {
    for(int i = 0; i < group.length; i++) {
      group[i].move();  
      group[i].display();  
      group[i].clash();
    }  
  }
  
  
}

