
class FallObject {
  int fax, fay, faw = 37, fah = 30;
  
  void display() {
    image(rock1, fax, fay, faw, fah);
  }  
  
  void move() {  
    if (fay >= 300) {
      fay = -30; 
      fax = (int)random(0,700); 
    } else {
      fay += 3;
    }
  }
  
  void clash() {
   if (((chx >= fax-chw && chx <= fax+faw) 
   && (chy > fay-chh && chy < fay + fah)) 
   && blackmode == 0){
     blackmode = 2;
     a = 300;
   } 
  }
  
  FallObject (int x, int y) {
    fax = x;
    fay = y;
  }
}
