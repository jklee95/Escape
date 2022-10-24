import ddf.minim.*;

Characterr ch = new Characterr();
Jump ju = new Jump();
CliffClass clc = new CliffClass();
BlackMode BM = new BlackMode();
Fall fall = new Fall();
Puzzle pu = new Puzzle();
Compressor co = new Compressor();
ObstacleClass obc = new ObstacleClass();
Puzzle2 pu2 = new Puzzle2();
WheelClass whc = new WheelClass();
Dark da = new Dark();
Elevator el = new Elevator();
Menu me = new Menu();
Floor13 fr13 = new Floor13();
Floor15 fr15 = new Floor15();
Flood fl = new Flood();
Traffic tr = new Traffic();
Top tp = new Top();

Minim minim;
AudioPlayer player;

String hint;
int tx;

PImage[] floor = new PImage[18];
PImage[] floor5 = new PImage[4];
PImage[] floor10 = new PImage[9];
PImage rock1;
PImage wheel[] = new PImage[12];
PImage obstacle;
PImage elevatorout1;
PImage elevatorout2;
PImage floor132;
PImage top;

PFont font;

static int f = 0; 
boolean chyreset2 = false;

void setup() {
  for (int i = 0; i <= 15; i++) {
    floor[i] = loadImage("background\\floor" + i +".jpg");
    
  }
  for (int i = 0; i <= 3; i++) {
    floor5[i] = loadImage("background\\floor5(" + (i+1) +").jpg");
    
  }
  for (int i = 0; i <= 8; i++) {
    floor10[i] = loadImage("background\\floor10 (" + (i+1) +").jpg");
    
  }
  for (int i = 0; i < wheel.length; i++) {
    wheel[i] = loadImage("background\\wheel\\wheel" + (i+1) + ".png");
  }
  rock1 = loadImage("background\\rock.png");
  obstacle = loadImage("background\\obstacle.jpg");
  elevatorout1 = loadImage("background\\elevator_out1.jpg");
  elevatorout2 = loadImage("background\\elevator_out2.jpg");
  floor132 = loadImage("background\\floor13_2.jpg");
  top = loadImage("background\\top.jpg");
  font = loadFont("font\\8bit.vlw");
  size(700, 300);
  
  clc.setcliff();
  ju.setarray();
  ch.setcha();
  fall.setfall();
  pu.makeimage();
  co.makepiston();
  obc.setarray();
  pu2.makeimage();
  whc.setwheel();
  el.makeimage();
  fl.BlockSetting();
  fl.makeimage();
  tr.setimage();
  
  minim = new Minim(this);
  
  
}

// floor5
float f5 = 0.0;

void floor5() {
  
  image(floor5[(int)f5], 0, 0);
  if(f5 > 3.0) f5 = 0.0;
  else f5 += 0.3;
}

// floor10
float f10 = 0.0;
float time = 0.0;

void floor10() {
  
  image(floor10[(int)f10], 0, 0);
  
  if(da.dark == false) {
    if(f10 > 2.0) {
      time += 0.1;
      if(time > 5.0) {
        f10 = 0.0;
        time = 0.0;
      }
    } else f10 += 0.19;
  } else if(da.dark == true) {
    if(f10 < floor10.length - 1) f10 += 0.2;
  }
}



boolean sound = true;
float resound = 0.00;

static int ix = -80;
static float iy = -50.0;

void draw() {
  
  //bgm
  if(resound > 160.00) {
    resound = 0.00;
    sound = true;
  } else {
    resound += 0.01;
    while (sound == true) {
      player = minim.loadFile("music\\mystery.mp3");
      player.play();
      sound = false;
    }
  }
  
  
  //background
  if(f == 15) image(top, ix, iy, 900, 368);
  else image(floor[f], 0, 0);
  
  if(fr13.number == 0 && fr13.crash == true) image(floor[f], (int)random(-10,10), (int)random(-10,10));
  if(f == 5) floor5();
  else if(f == 9) floor10();
  
  if(fr13.number > 0) image(floor132, 0,0);
  
  if(f != 0 && f != 13 && f != 15) {
    fill(100);
    textFont(font);
    textSize(35);
    fill(138, 0, 0);
    text("Floor " + f, 25, 55);
  }

  //elevator
  if(el.time < - 1.0 && el.time != -3.0) image(elevatorout1, 0, 0);
  else if(el.time == -3.0) image(elevatorout2, 0, 0);
  
  if (End == true) ch.character2();
  else ch.character();
    
  switch (f) {
    case 0 :
    black = true;
    me.menu();
    me.button();
    me.click();
    
    hint = "Start";
    tx = 305;
    break;
    
    case 1 :
    hint = "Start";
    tx = 305;
    break;
    
    case 2 :
    clc.makecliff1();
    hint = "Cliff";
    tx = 310;
    break;
    
    case 3 :
    pu.play();
    hint = "12";
    if(puzzle == true) tx = 800; 
    else tx = 330;
    break;
    
    case 4 :
    fall.makefall();
    hint = "Stone";
    tx = 300;
    break;
    
    case 5 :
    clc.makecliff2();
    co.windy();
    hint = "Windy";
    co.compress();
    obc.makearray();
    co.pistonmove1();
    co.pistonmove2();
    co.pistonhit();
    tx = 310;
    break;
    
    case 6 :
    // sound off 
    windy.pause(); 
    piston1.pause(); 
    piston2.pause();
    
    hint = "4 wall";
    obc.makearray2();
    pu2.puzzle();
    break;
    
    case 7 :
    hint="Eye";
    tx=320;
    tr.sign();
    break;
    
    case 8 :
    fl.Water();
    fl.flooding();
    fl.Drowning();
    fl.Move();
    fl.play();
    fl.BlockSystem();
    fl.Timer();
    tx=310;
    hint = "Breath";
    break;
    
    case 9 :
    whc.makewheel();
    obc.makearray3();
    da.dark();
    da.sound();
    
    hint = "Dark";
    tx = 310;
    break;
    
    case 10 :
    el.play();
    
    hint = "Break";
    if(puzzle == true || ropetrue == true) tx = 800; 
    else tx = 310;
    break;
    
    case 11 :
    el.time = 0.0;
    climb = false;
    
    fr13.crash();
    fr13.crashplay();
    
    
    hint = "bomb";
    tx = 310;
    break;
    
    case 12 :
    fr13.number = 0;
    fr13.crash = false;
    
    cf[4].cliff();
    cf[4].drop();
    cf[4].dropping();
    hint = "Doors";
    tx = 310;
    break;
    
    case 13 : fr15.portalmake();
    fr15.chyresett();
    obc.makearray4();
    chyreset2 = true;
    break;
    
    case 14 :  f = 12; 
    break;
    
    case 15 : tp.sound();
    tp.endgame();
    break;
    
  }
  
  if(f != 0 && f != 13 && f != 15 && puzzle == false) {
    fill(100);
    textFont(font);
    textSize(45);
    text(hint, tx, 55);
  }
  
  da.blackout();
  
    
  ju.hittest();
  
  if(f == 5) ju.keyp2();
  else ju.keyp();
  
  BM.black();
  BM.portal();
  BM.hittest();
  BM.portalkey();

}

