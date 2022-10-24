boolean Swimming = false;
float DrowningBar = 150;
boolean breathing = true;

boolean mouseLife = true;
int Timer = 20;

int[][] DrainBlock = new int[3][4];         //[Avenue][Vertical]






PImage[] BlockLine = new PImage[4];
PImage[] BlockCurve = new PImage[4];
PImage[] BlockCross = new PImage[4];
PImage[] Vector = new PImage[2];
PImage back;





class Flood{
   
/*  DrainBlock[0][0] = 1; DrainBlock[0][1] = 4; DrainBlock[0][2] = 3; DrainBlock[0][3] = 1;
  DrainBlock[1][0] = 4; DrainBlock[1][1] = 1; DrainBlock[1][2] = 4; DrainBlock[1][3] = 1;
  DrainBlock[2][0] = 3; DrainBlock[2][1] = 1; DrainBlock[2][2] = 2; DrainBlock[2][3] = 1; */

  
  float WaterY = 300;
  
  

    
  void makeimage(){
    
    BlockLine[0] = loadImage("quiz\\quiz2\\straight1.png");
    BlockLine[1] = loadImage("quiz\\quiz2\\straight2.png");
    BlockLine[2] = loadImage("quiz\\quiz2\\straight3.png");
    BlockLine[3] = loadImage("quiz\\quiz2\\straight4.png");
    BlockCurve[0] = loadImage("quiz\\quiz2\\corner1.png");
    BlockCurve[1] = loadImage("quiz\\quiz2\\corner2.png");
    BlockCurve[2] = loadImage("quiz\\quiz2\\corner3.png");
    BlockCurve[3] = loadImage("quiz\\quiz2\\corner4.png");
    BlockCross[0] = loadImage("quiz\\quiz2\\cross1.png");
    BlockCross[1] = loadImage("quiz\\quiz2\\cross2.png");
    BlockCross[2] = loadImage("quiz\\quiz2\\cross3.png");
    BlockCross[3] = loadImage("quiz\\quiz2\\cross4.png");
    Vector[0] = loadImage("quiz\\quiz2\\pipein.png");
    Vector[1] = loadImage("quiz\\quiz2\\pipeout.png");
    back = loadImage("quiz\\quiz2\\pipeback.jpg");
  }
  

  
  void Water(){                                                           // ** This is Huge Blue Box sawn through that express WATER **
    fill(0, 0, 255, 100);
    noStroke();
    rect(0, WaterY, 700, 300);
  }
  
  
  
  
  
  
  void flooding(){                                                         // ** This method is expressing UPRISING WATER **
    if(WaterY >= 115) WaterY--;
    
    if(WaterY <= 140) Swimming = true;
    else Swimming = false;
    
    if(Swimming == true) {
     if(chy < rechy) {chy++; updown = "down"; }
     else { updown = "null";}
     
     
     if(chy < 100) chy = 100;
     
     }
    }
    
    
    
    
    
  void Drowning(){                                                          //DrowningGage 
 
    fill(0, 200, 0, 80);
    rect(280, 55, DrowningBar, 15); 
    
    if(Swimming == true && chy > 101){
      breathing = false;
      if(DrowningBar > 0) DrowningBar-=0.3;
    }
    else if(DrowningBar < 150){
       DrowningBar+=1;
    }
    
    if(DrowningBar < 0) {blackmode = 2; a = 300; DrowningBar = 100; puzzle = false; WaterY = 300;}
  }
  
  
  
  
  
  void Move(){                                                                //This makes character slower in water
    
   if(Swimming == true){ 
    if(keycode[1] == true) chx++;
    else if(keycode[2] == true) chx--;}
    
  }
  
  
  
  
  
  
   void play() {
    if(keyPressed) {
      if(keyCode == UP && portal == true) {
       puzzle = true; black = true;
     }
    }
    if(puzzle == true) {
      display();
    }
  }
  
  
  
/*  for(int i=0; i<4; i++){
      for(int j=0; j<3; j++) DrainBlock[i][j] = 0;
    }*/
    

   
  void display() {
    
   
    image(back, 0, 0);
    
    image(Vector[0], 170, 60);
    image(Vector[1], 470, 180);
    
    
  
    
    
 //   image(BlockLine1, 230, 60); image(BlockCurve4, 290, 60); image(BlockCurve3, 350, 60); image(BlockCross, 410, 60);
 //   image(BlockCurve4, 230, 120); image(BlockCross, 290, 120); image(BlockCurve4, 350, 120); image(BlockLine1, 410, 120);
 //   image(BlockCurve3, 230, 180); image(BlockLine1, 290, 180); image(BlockLine2, 350, 180); image(BlockLine1, 410, 180);
   for(int i=0; i<4; i++){ 
    if(DrainBlock[0][0] == (i+1)) image(BlockLine[i], 230, 60); if(DrainBlock[0][1] == (i+1)) image(BlockCurve[i], 290, 60); if(DrainBlock[0][2] == (i+1)) image(BlockCurve[i], 350, 60); if(DrainBlock[0][3] == (i+1)) image(BlockCross[i], 410, 60);
    if(DrainBlock[1][0] == (i+1)) image(BlockCurve[i], 230, 120); if(DrainBlock[1][1] == (i+1)) image(BlockCross[i], 290, 120); if(DrainBlock[1][2] == (i+1)) image(BlockCurve[i], 350, 120); if(DrainBlock[1][3] == (i+1)) image(BlockLine[i], 410, 120);    
    if(DrainBlock[2][0] == (i+1)) image(BlockCurve[i], 230, 180); if(DrainBlock[2][1] == (i+1)) image(BlockLine[i], 290, 180); if(DrainBlock[2][2] == (i+1)) image(BlockLine[i], 350, 180); if(DrainBlock[2][3] == (i+1)) image(BlockLine[i], 410, 180);    }
  }
  
   void BlockSetting(){
    /* for(int i=0; i<4; i++){
       for(int j=0; j<3; j++){ DrainBlock[i][j] = 1; }
     }*/
     
  DrainBlock[0][0] = 1; DrainBlock[0][1] = 4; DrainBlock[0][2] = 3; DrainBlock[0][3] = 1;
  DrainBlock[1][0] = 4; DrainBlock[1][1] = 1; DrainBlock[1][2] = 4; DrainBlock[1][3] = 1;
  DrainBlock[2][0] = 3; DrainBlock[2][1] = 1; DrainBlock[2][2] = 2; DrainBlock[2][3] = 1;

   }
  
   void BlockSystem(){
     
     if(mousePressed && mouseLife == true ){
       
       for(int i=0; i<3; i++){
         for(int j=0; j<4; j++){
            
           if(230 + (j*60) < mouseX && mouseX < 230 + (j+1)*60 && 60 + i*60 < mouseY && mouseY < 60 + (i+1)*60){
             
             if(DrainBlock[i][j] < 4) DrainBlock[i][j]++;
             else if(DrainBlock[i][j]==4) DrainBlock[i][j] = 1;
             
             mouseLife = false;       
           }  
         }        
       }       
       
     }
     
     if(DrainBlock[0][0] % 2 == 0 && DrainBlock[0][1] == 3 && DrainBlock[1][0] == 2 && DrainBlock[2][0] == 1 && DrainBlock[2][1] % 2 == 0 && DrainBlock[2][2] % 2 == 0 && DrainBlock[2][3] % 2 == 0){
       solve();
     }
     
  }
  
  void Timer(){
    if(mouseLife == false) Timer--;
    if(Timer == 0){mouseLife = true; Timer = 20;}
    
  }
  
  void solve() {
   blackmode = 1;
   puzzle = false;
   Swimming = false;  }
   
  
  
}
