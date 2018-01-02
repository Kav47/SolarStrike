class Game {

  Game() {
  }
  void updateScore() {
    textSize(20);
    text("Score : "+score, width-175, 75);
    text("Level : "+ level, width -175, 50);
  }

  void gameOver() {
    if (gameOver == true) {
      //gameOver = true;
      textAlign(CENTER);
      textSize(40);
      text("GAME OVER! "+ "\n" + "Your score was "+ score+ "\n"+ "Press R to restart", width/2, height/2);
      //noLoop();
      //delay(1000);
    }
  }

  void start() {
    //dark blue
    background(5, 10, 50);
    space.draw();

    if (xPosition <= 0-sizeX) {
      xPosition += sizeX;
    }
    if (xPosition >= width) {
      xPosition -= sizeX;
    }

    updateScore();
    gameOver();

    //cannon
    //rect(xPosition, yPosition, sizeX, sizeY);
    image(sCannon, xPosition, yPosition, sizeX, sizeY);
    enemy.draw();
    bullet.fire();
    engine();
  }

  void engine() {
    if (enemyHit) {
      if (score== 25) {
        level =2;
        enemyMovement = 2;
        for (int i=0; i<space.dustQuantitiy; i++) {
          space.dustSpeed[i] = (int)random(1, 5);
        }
      }

      if (score ==50) {
        level = 3;
        enemyMovement =4;
        for (int i=0; i<space.dustQuantitiy; i++) {
          space.dustSpeed[i] = (int)random(5, 10);
        }
      }
      if (score ==100) {
        level = 4;
        enemyMovement =5;
      }
      //lol
      //I dare you
      //kav
      if (score ==200) {
        level = 5;
        enemyMovement =10;
      }
    }
  }

  void restart() {

    level =1;
    noOfEnemies =5;
    enemyMovement =1;
    for (int i=0; i<space.dustQuantitiy; i++) {
      space.dustSpeed[i] = (int)random(0, 1);
    }
    gamePause = false;
    gameOver = false;
    score = 0;

    for (int i =0; i<noOfEnemies; i++) {
      enemyYPos[i] = 0;
    }
    start();
    restart = false;
  }
}