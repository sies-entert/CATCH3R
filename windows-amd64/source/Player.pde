float circleX = 0, circleY = 0, circleD = 0, circleSp = 0;

float counterX = 0, counterY = 0, counterTextSize = 0;

int ballcount = 0;
 

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;

class player
{

  void setup() {
    circleX = width/2;
    circleY = height/2;
    circleD = 40;
    circleSp = 4;
    counterTextSize = 14;

    circleX = constrain(circleX, (boxLeft + boxMinHighlight / 2) + circleD / 2, (boxRight - boxMinHighlight / 2) - (circleD / 2));
    circleY = constrain(circleY, (boxUp + boxMinHighlight / 2) + circleD / 2, (boxDown - boxMinHighlight / 2) - (circleD / 2));

    counterX = circleX;
    counterY = circleY;
  }

  void draw() {

    counterX = circleX;
    counterY = circleY;

    fill(fill);
    textSize(counterTextSize);
    strokeWeight(4);
    textAlign(CENTER, CENTER);
    text(ballcount, counterX, counterY);

    noFill();
    stroke(fill);
    strokeWeight(2);
    circle(circleX, circleY, circleD);

    if (leftPressed) {
      circleX -= circleSp;
      if (circleX <= boxLeft + boxMinHighlight / 2) {
        circleX = boxRight - boxMinHighlight / 2;
      }
    }
    if (rightPressed) {
      circleX += circleSp;
      if (circleX >= boxRight - boxMinHighlight / 2) {
        circleX = boxLeft + boxMinHighlight / 2;
      }
    }
    if (upPressed) {
      circleY -= circleSp;
      if (circleY <= boxUp + boxMinHighlight / 2) {
        circleY = boxDown  - boxMinHighlight / 2;
      }
    }
    if (downPressed) {
      circleY += circleSp;
      if (circleY >= boxDown - boxMinHighlight / 2) {
        circleY = boxUp + boxMinHighlight / 2;
      }
    }
  }

  void keyPressed() {
    if (keyCode == LEFT || key == 'a' || key == 'A') {
      leftPressed = true;
    }
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
      rightPressed = true;
    }
    if (keyCode == UP || key == 'w' || key == 'W') {
      upPressed = true;
    }
    if (keyCode == DOWN || key == 's' || key == 'S') {
      downPressed = true;
    }
  }

  void keyReleased() {
    if (keyCode == LEFT || key == 'a' || key == 'A') {
      leftPressed = false;
    }
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
      rightPressed = false;
    }
    if (keyCode == UP || key == 'w' || key == 'W') {
      upPressed = false;
    }
    if (keyCode == DOWN || key == 's' || key == 'S') {
      downPressed = false;
    }
  }
  
}
