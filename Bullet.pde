class Bullet {

  Bullet() {
  }
  void Movement() {
    if (fireBullet) {
     // ellipse(bulletX, bulletY, bulletSize, bulletSize ); 
     //image(sBullet,bulletX, bulletY, bulletSize, bulletSize );
      bulletY -= fireRate;
    }
  }

  void Hit() {

    for (int i =0; i<noOfEnemies; i++) {
      //ignoring y coordinate, assuming bullet is laser fast.
      if ((bulletX<enemyXPos[i]+enemySize) && (bulletX>enemyXPos[i]-15)) {
        enemyHit = true;
        enemyYPos[i] =0;
        enemyXPos[i] = (int) random(enemySize, width-enemySize);
        score++;
      }
    }
  }

  void fire() {
    if ((bulletY <= 0) || fireBullet == false) {
      bulletX=xPosition;
      bulletY =yPosition -(bulletSize);
      fireBullet = false;
    }
    if (fireBullet) {
      //ellipse(bulletX, bulletY, bulletSize, bulletSize );
      image(sBullet,bulletX, bulletY, bulletSize, bulletSize );
      bullet.Movement();
      bullet.Hit();
    }
  }
}