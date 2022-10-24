
class Wheel {
  
  int whx, why, whw, whh;
  int wheelnum = 0;
  
  void displaywheel() {
    image(wheel[wheelnum],whx - (whw/2), why - (whh/2), whw, whh );
    fill(10,0);
    ellipse(whx, why, whw, whh);
    if(wheelnum >= wheel.length-1) wheelnum = 0;
    else wheelnum ++;
    
    image(obstacle, 180, 180, 30, 20);
    image(obstacle, 480, 180, 30, 20);
  }
  
  void hittest() {
    if(
    //rect upside, downside, inside
    ((chx<=whx && whx<=(chx+chw)) //rect range of x
    && //rect range of y (up~downside)
    ((chy-(whh/2))<=why && why<=(chy+chh+(whh/2))))
    
    ||
    
    //rect side, inside
    ((chy<=why && why<=(chy+chh)) // rect range of y
    && 
    // rect range of x (left~right)
    ((chx-(whw/2))<=whx && whx <=(chx+chw+(whw/2))))
    
    ||
    
    //rect corner
    (sq(chx-whx)+sq(chy-why)<=sq(whw/2) // up - left
    || sq((chx + chw)-whx)+sq(chy-why)<=sq(whw/2) // up - right
    || sq(chx-whx)+sq((chy+ chh)-why)<=sq(whw/2) // down - left
    || sq((chx + chw) - whx)+sq((chy+ chh)-why)<=sq(whw/2) // down - right
    )) {
      blackmode = 2;
      a = 300;
    }
  }
  
  Wheel (int x, int y, int w, int h) {
   whx = x;
   why = y;
   whw = w;
   whh = h;
 }
  
}
