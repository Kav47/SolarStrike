class Menu {

  float bx=width/2 -225;
  float by=height/2 -50;
  float boxSizeX =500;
  //float time = millis();
  float boxSizeY=100;
  int lx;
  Menu() {
    // background(0);
    //size(1000,700,P3D);
    loadScreen();
  }

  void start() {
    background(0);
    if (millis()<3000) {
      loadScreen();
    } else {

      space.draw();
      //filter(BLUR,4);
      fill(255, 100);  
      ellipse(width, height, 500, 500);  
      fill(255);

      textAlign(CENTER);
      fill(100);
      textFont(font, 100);
      text("SOLAR STRIKE", width/2, height/2- 200);
      textFont(font2);

      if (mouseX > bx && mouseX < bx+boxSizeX && mouseY > by && mouseY < by+boxSizeY) {
        fill(150, 100);
        rect(bx, by, boxSizeX, boxSizeY);
        fill(255);
        text("Start game", width/2, height/2+10);
      } else {
        fill(255, 200);
        rect(bx, by, boxSizeX, boxSizeY);
        fill(0);
        text("Start game", width/2, height/2+10);
      }

      fill(255, 200);
      textSize(20);
      textAlign(LEFT);
      text("A to move left, D to move right,P to Pause and Spacebar to shoot.", 10, height-50);
      fill(255);  

      if (mouseX > bx && mouseX < bx+boxSizeX && mouseY > by && mouseY < by+boxSizeY) {
        overButton = true;
      } else {
        overButton = false;
      }
    }
  }
  void loadScreen() {
    background(0);
    fill(255);
    //3 loading bars
    //    x    y     x     y      x     y    x    y
    quad(0+lx, height/2, 24+lx, height/2, 24+lx, height/2 +50, 0+lx, height/2 +50);
    quad(29+lx, height/2, 53+lx, height/2, 53+lx, height/2 +50, 29+lx, height/2 +50);
    quad(58+lx, height/2, 82+lx, height/2, 82+lx, height/2 +50, 58+lx, height/2 +50);
    lx+=20;
    if (lx>width)
    {
      lx=10;
    }
    fill(255);
    textSize(60);
    text("Loading......", width/3, height/2+200);
  }
}