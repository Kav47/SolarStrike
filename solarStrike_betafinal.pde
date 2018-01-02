//_______  _____         _______  ______      _______ _______  ______ _____ _     _ _______
//|______ |     | |      |_____| |_____/      |______    |    |_____/   |   |____/  |______
//______| |_____| |_____ |     | |    \_      ______|    |    |    \_ __|__ |    \_ |______
//                                                                                          
//---------------------------------------------------------------------------------------------
//inspired from http://www.openprocessing.org/sketch/49449
//Solar Strike 
//Version 1.0
//Revised on 06.10.16
//(c)Kavishan
//OpenCV needs so much processor power, so don't run on battery
//
// --------------------------------------------------
//Controls
//A to move left, D to move right, Spacebar to shoot and P to pause
//---------------------------------------------------
//space bar to shoot
//for retro stryle I'm using black and white
//font-http://www.fontspace.com/hxdes/freedom
//-----------------------------------------------------------------------
//sprites
//battleship--credits -MillionthVector- http://millionthvector.blogspot.co.uk/p/free-sprites.html
//bullet - http://www.widgetworx.com/spritelib/
//enemy -http://millionthvector.blogspot.co.uk/p/free-sprites_12.html
//-----------------------------------------------------------------------
//Music
//BGM- http://freemusicarchive.org/genre/Chiptune/
//shoot -https://www.freesound.org/people/LittleRobotSoundFactory/sounds/270343/
//rocket-https://www.freesound.org/people/qubodup/sounds/146770/
//--------------------------------------------------------------------------------------------------
//todo
//facedection (pause when you look away)
//read - 
//http://docs.opencv.org/master/d7/d8b/tutorial_py_face_detection.html#gsc.tab=0
//https://github.com/shiffman/Face-It/blob/master/FaceRekognition/FaceDetectExample/FaceDetectExample.pde
//---------------
import processing.sound.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

SoundFile bgm;
SoundFile shoot;
boolean isPlaying = false;
boolean gamePause = true;
int time = millis();

int score;
boolean gameOver;
PFont font, font2;
int level;
boolean restart = false;

//cannon
int sizeX;
int sizeY;
int x;
int y;
int xPosition;
int yPosition;
int movementX;
int movementY;
int cannonSpeed;
PImage sCannon;

//bullet
int bulletX;
int bulletY;
int bulletSize;
int fireRate;
boolean fireBullet;
boolean canFire;
boolean enemyHit;
PImage sBullet;

//menu
boolean overButton =false;
boolean locked= false;

//enemy
int enemySize = 40;
int noOfEnemies;
int enemyMovement;
PImage sEnemy;



//enemy xy coordinates
//setting width to 1000 as we cant initialize size here
int width = 1000;
int[] enemyXPos={
  (int) random(enemySize, width-enemySize), 
  (int) random(enemySize, width-enemySize), 
  (int) random(enemySize, width-enemySize), 
  (int) random(enemySize, width-enemySize), 
  (int) random(enemySize, width-enemySize)
};
int[] enemyYPos ={0, 0, 0, 0, 0};
//declaring classes
Space space ;
Bullet bullet;
Enemy enemy;
Game game;
Menu menu;
FaceDetection fd;

//face
Capture video;
OpenCV opencv;

void setup() {
  //face
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  //
  //Music
  bgm = new SoundFile(this, "bgm.mp3");
  shoot = new SoundFile(this, "shoot.wav");
  bgm.play();
  isPlaying = true;
  bgm.loop();

  level = 1;

  //initialize values_cannon;  
  movementX =0;
  sizeX = 60;
  sizeY = 45;
  x=(width/2);
  y =height- sizeY;

  gameOver = false;
  enemyHit = false;

  //
  space = new Space();
  bullet = new Bullet();
  enemy = new Enemy();
  game = new Game();
  menu = new Menu();
  fd = new FaceDetection();

  //cannon
  xPosition =x+movementX;
  yPosition = y;
  cannonSpeed = 20;

  //initialize values_bullet
  bulletSize =50;
  fireRate = 200;

  size(1000, 700);  

  //font and sprite
  font = loadFont("FREEDOM-48.vlw");
  font2 = loadFont("Monaco-48.vlw");
  sCannon = loadImage("battleship.png");
  sBullet = loadImage("bullet.png");
  sEnemy = loadImage("enemy.png");


  //enemy
  noOfEnemies = 5;
  enemyMovement = 1;
  fireBullet=false;
}
//
void draw() {
  smooth();
  //to run the game smoothly
  //it scans the face every 1.5 second.
  // 1000 = 1 sec
  if (millis() > time + 1500) {
    fd.draw();
    time = millis();
  }
  //  
  frameRate(30);
  cursor(CROSS);        

  if (locked == false) {
    menu.start();
  } else {
    game.start();
  }
  if (gamePause && millis() > 7000 && !gameOver) {
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text("Game (P)aused!", width/2, height/2);
    textSize(20);
    text("Press P and look at the screen to continue", width/2, height/2+40);
  }

  if (restart) {
    game.restart();
  }
}

void keyPressed() {
  //moving cannon

  if ( (key == 'a') || (key == 'A') ) {
    if (gamePause == false)
      xPosition -= cannonSpeed;
  }

  if ((key == 'D') || (key == 'd')) {
    if (gamePause == false)
      xPosition +=cannonSpeed;
  }
  if (key == ' ') {
    if (gamePause == false) {
      fireBullet=true;
      shoot.play();
    }
  }
  if ((key == 'P' || key == 'p')&& !gameOver) {
    if (looping) {
      textSize(100);
      textAlign(CENTER);
      text("Game (P)aused!", width/2, height/2);
      gamePause = true;
      noLoop();
    } else {
      gamePause = false;
      loop();
    }
  }
  if ((key == 'R' || key == 'r') && gameOver == true) {
    restart = true;
    //this.stop();
    //draw();
  }
}
void captureEvent(Capture c) {
  c.read();
}


void mousePressed() {
  if (overButton) {
    locked = true;
  }
}