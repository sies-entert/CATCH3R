float boxLeft = 0, boxUp = 0, boxDown = 0, boxRight = 0;

float boxMinHighlight = 4;

float boxMaxHighlight = 10;

class border {

  void setup() {

    boxRight = width;
    boxDown = height;
  }

  void draw() {

    boxRight = width;
    boxDown = height;

    rectMode(CORNERS);
    stroke(fill);
    strokeWeight(boxMinHighlight);
    noFill();
    rect(boxLeft + boxMinHighlight / 4, boxUp + boxMinHighlight / 4, boxRight - boxMinHighlight / 4, boxDown - boxMinHighlight / 4);

    if (boxMinHighlight <= boxMaxHighlight && playerOutOfBorder(playerX, playerY, playerD, boxLeft, boxRight, boxUp, boxDown))
    {
      boxMinHighlight += 0.2;
    } else if (boxMinHighlight == boxMaxHighlight) {
      boxMinHighlight -= 0.2;
    } else if (boxMinHighlight >= 4 && !playerOutOfBorder(playerX, playerY, playerD, boxLeft, boxRight, boxUp, boxDown)) {
      boxMinHighlight -= 0.2;
    }
  }
}
