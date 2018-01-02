class Enemy {

  Enemy() {
  }  

  void draw() {

    for (int i=0; i<noOfEnemies; i++) {
      //ellipse(enemyXPos[i], enemyYPos[i]+=enemyMovement, enemySize, enemySize);
      image(sEnemy, enemyXPos[i], enemyYPos[i]+=enemyMovement, enemySize, enemySize);
      //println(enemyXPos[i], enemyYPos[i], enemySize, enemySize);
      if (enemyYPos[i]>= height-enemySize) {
        gameOver = true;
      }
    }
  }
}