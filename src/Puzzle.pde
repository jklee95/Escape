static boolean puzzle = false;
static boolean numkeypress = false;

PImage clock;
PImage question;
PImage[] number = new PImage[10];
PImage[] answernum = new PImage[2];

AudioPlayer rock;

class Puzzle {
  
  boolean sound = true;
  
  int num1;
  int num2;
  int answerblank = 0;
  
  String answer;
  
  int cx1 = -20;
  
  
  void timer() {
    if (cx1 == 40) { 
      cx1 = -20;
      if(answer.equals("03")) solve();
      else { answerblank = 0; sound = true; }
    } else {
      cx1++;
    }
  }
  
  
  void makeimage() {
    clock = loadImage("quiz\\quiz1\\quiz1.jpg");
    question = loadImage("quiz\\quiz1\\word\\question.png");
    for (int i = 0; i < 10; i++) {
      number[i] = loadImage("quiz\\quiz1\\word\\" + i + ".png");
    } 
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
  
  void sound() {
    while (sound == true) {
      rock = minim.loadFile("sound\\rock.wav");
      rock.play();
      sound = false;
    }
  }
  
  void display() {
    image(clock, 0, 0);
    
    switch(answerblank) {
      case 0 :
      num1 = 10; 
      num2 = 10;
      image(question, 570, 110);
      image(question, 610, 110);
      if(keyPressed){
        if(key >= '0' && key <= '9'){
          num1 = (int)key - 48;
          answer = Integer.toString(num1);
          
          //key overlap preventation
          numkeypress = true;
          
          sound = true;
        }
      }
      
      for (int i = 0; i < 10; i++) {
        if(num1 == i) {
          answernum[0] = number[i];
          answerblank ++;
        }
      }
      
      sound();
      break;
      
      
      case 1 :
      image(answernum[0], 570, 110);
      image(question, 610, 110);
      if(keyPressed && numkeypress == false){
        if(key >= '0' && key <= '9'){
          num2 = (int)key - 48;
          answer += Integer.toString(num2);
          sound = true;
        }
      }
      
      for (int i = 0; i < 10; i++) {
        if(num2 == i) {
          answernum[1] = number[i];
          answerblank ++;
        }
      }
      
      sound();
      break;
      
      
      case 2 : 
      image(answernum[0], 570, 110);
      image(answernum[1], 610, 110);
      timer();
      
      sound();
    }
    
    
  }
  
  void solve() {
    blackmode = 1;
    puzzle = false;
  }
}
