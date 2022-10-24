Wheel[] wh = new Wheel[3];

class WheelClass {
  
  void setwheel() {
    wh[0] = new Wheel(230, 230, 100, 100);
    wh[1] = new Wheel(400, 100, 80, 80);
    wh[2] = new Wheel(530, 230, 100, 100);
  }
  
  void makewheel() {
    for(int i = 0; i < wh.length; i++) { 
      wh[i].displaywheel();
      wh[i].hittest();
    }  
  }
  
}
