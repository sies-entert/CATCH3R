float playerX = 0, playerY = 0, playerD = 0, playerSp = 0;

float counterX = 0, counterY = 0, counterTextSize = 0;

int ballcount = 0;

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;

class player
{

  void setup() {
    playerX = width/2;
    playerY = height/2;
    playerD = 40;
    playerSp = 4;
    counterTextSize = 14;

    playerX = constrain(playerX, (boxLeft + boxMinHighlight / 2) + playerD / 2, (boxRight - boxMinHighlight / 2) - (playerD / 2));
    playerY = constrain(playerY, (boxUp + boxMinHighlight / 2) + playerD / 2, (boxDown - boxMinHighlight / 2) - (playerD / 2));

    counterX = playerX;
    counterY = playerY;
  }

  void draw() {

    counterX = playerX;
    counterY = playerY;

    fill(fill);
    textSize(counterTextSize);
    strokeWeight(4);
    textAlign(CENTER, CENTER);
    text(ballcount, counterX, counterY);

    noFill();
    stroke(fill);
    strokeWeight(2);
    circle(playerX, playerY, playerD);

    if (leftPressed) {
      playerX -= playerSp;
      if (playerX <= boxLeft + boxMinHighlight / 2) {
        playerX = boxRight - boxMinHighlight / 2;
      }
    }
    if (rightPressed) {
      playerX += playerSp;
      if (playerX >= boxRight - boxMinHighlight / 2) {
        playerX = boxLeft + boxMinHighlight / 2;
      }
    }
    if (upPressed) {
      playerY -= playerSp;
      if (playerY <= boxUp + boxMinHighlight / 2) {
        playerY = boxDown  - boxMinHighlight / 2;
      }
    }
    if (downPressed) {
      playerY += playerSp;
      if (playerY >= boxDown - boxMinHighlight / 2) {
        playerY = boxUp + boxMinHighlight / 2;
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
