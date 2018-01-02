import gab.opencv.*;
import processing.video.*;
import java.awt.*;

class FaceDetection {

  FaceDetection() {
    video.start();
  }

  void draw() {
    opencv.loadImage(video);
    Rectangle[] faces = opencv.detect();
    println(faces.length);
    //if length = 0 means no face detected

    if (faces.length == 0 && !gameOver) {
      gamePause = true;
      if (millis() >7000 && looping) {
        noLoop();
      }
    } else {
      gamePause = false;
      loop();
    }
  }
}