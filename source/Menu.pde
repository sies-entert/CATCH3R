float startButtonX = 0, startButtonY = 0,
  startButtonMinWidth = 0, startButtonMaxWidth = 0,
  startButtonMinHeight = 0, startButtonMaxHeight = 0;

float settingButtonX = 0, settingButtonY = 0,
  settingButtonMinWidth = 0, settingButtonMaxWidth = 0,
  settingButtonMinHeight = 0, settingButtonMaxHeight = 0;

float startTextMinSize, startTextMaxSize;

float settingTextMinSize, settingTextMaxSize;

boolean goMenu = true;

boolean goSettings = false;

class menu {

  void setup() {

    size(400, 600);
    background(backgr);
    fill(fill);

    rectMode(CENTER);

    boxRight = width;
    boxDown = height;

    startButtonX = width / 2;
    startButtonY = height / 3;

    startButtonMinWidth = 100;
    startButtonMinHeight = 60;

    startButtonMaxWidth = startButtonMinWidth * 2;
    startButtonMaxHeight = startButtonMinHeight + (startButtonMinHeight / 2);

    startTextMinSize = 24;
    startTextMaxSize = 36;

    settingButtonX = width / 2;
    settingButtonY = height / 2;

    settingButtonMinWidth = 100;
    settingButtonMinHeight = 60;

    settingButtonMaxWidth = settingButtonMinWidth * 2;
    settingButtonMaxHeight = settingButtonMinHeight + (settingButtonMinHeight / 2);

    settingTextMinSize = 24;
    settingTextMaxSize = 36;
  }

  void draw() {
    if (goMenu) {
      background(backgr);
      if (menuMouse(boxLeft, boxRight, boxUp, boxDown)) {
        boxRight = width;
        boxDown = height;

        rectMode(CORNERS);
        stroke(fill);
        strokeWeight(boxMinHighlight);
        noFill();
        rect(boxLeft + boxMinHighlight / 4, boxUp + boxMinHighlight / 4, boxRight - boxMinHighlight / 4, boxDown - boxMinHighlight / 4);

        if (boxMinHighlight <= boxMaxHighlight && menuMouse(boxLeft, boxRight, boxUp, boxDown))
        {
          boxMinHighlight += 0.2;
        } else if (boxMinHighlight == boxMaxHighlight) {
          boxMinHighlight -= 0.2;
        } else if (boxMinHighlight >= 4 && !menuMouse(boxLeft, boxRight, boxUp, boxDown)) {
          boxMinHighlight -= 0.2;
        }
      }
      textAlign(CENTER, CENTER);
      textSize(40);
      fill(fill);
      text("CATCH3R", width / 2, height / 5);

      rectMode(CENTER);
      strokeWeight(4);
      stroke(fill);
      noFill();
      rect(startButtonX, startButtonY, startButtonMinWidth, startButtonMinHeight, 2);

      textAlign(CENTER, CENTER);
      fill(fill);
      textSize(startTextMinSize);
      text("Start", startButtonX, startButtonY);

      if (startButtonMinWidth <= startButtonMaxWidth && startButtonMinHeight <= startButtonMaxHeight && startButton(startButtonX, startButtonY, startButtonMinWidth, startButtonMinHeight) && startTextMinSize <= startTextMaxSize) {
        startButtonMinWidth += 2;
        startButtonMinHeight += 1;
        startTextMinSize += 0.2;
      } else if (startButtonMinWidth == startButtonMaxWidth && startButtonMinHeight == startButtonMaxHeight && startTextMinSize == startTextMaxSize) {
        startButtonMinWidth -= 2;
        startButtonMinHeight -= 1;
        startTextMinSize -= 0.2;
      } else if (startButtonMinWidth >= 100 && startButtonMinHeight >= 60 && !startButton(startButtonX, startButtonY, startButtonMinWidth, startButtonMinHeight) && startTextMinSize >= 24) {
        startButtonMinWidth -= 2;
        startButtonMinHeight -= 1;
        startTextMinSize -= 0.2;
      }

      noFill();
      rect(settingButtonX, settingButtonY, settingButtonMinWidth, settingButtonMinHeight, 2);

      textAlign(CENTER, CENTER);
      fill(fill);
      textSize(settingTextMinSize);
      text("Settings", settingButtonX, settingButtonY);

      if (settingButtonMinWidth <= settingButtonMaxWidth && settingButtonMinHeight <= settingButtonMaxHeight && settingButton(settingButtonX, settingButtonY, settingButtonMinWidth, settingButtonMinHeight) && settingTextMinSize <= settingTextMaxSize) {
        settingButtonMinWidth += 2;
        settingButtonMinHeight += 1;
        settingTextMinSize += 0.2;
      } else if (settingButtonMinWidth == settingButtonMaxWidth && settingButtonMinHeight == settingButtonMaxHeight && settingTextMinSize == settingTextMaxSize) {
        settingButtonMinWidth += 2;
        settingButtonMinHeight += 1;
        settingTextMinSize -= 0.2;
      } else if (settingButtonMinWidth >= 100 && settingButtonMinHeight >= 60 && !settingButton(settingButtonX, settingButtonY, settingButtonMinWidth, settingButtonMinHeight) && settingTextMinSize >= 24) {
        settingButtonMinWidth -= 2;
        settingButtonMinHeight -= 1;
        settingTextMinSize -= 0.2;
      }
    }
  }

  void mouseClicked() {

    if (startButton(startButtonX, startButtonY, startButtonMinWidth, startButtonMinHeight) && mouseButton == LEFT) {
      startGame = true;
      pauseGame = false;
      goMenu = false;
    }

/*    if (settingButton(settingButtonX, settingButtonY, settingButtonMinWidth, settingButtonMinHeight) && mouseButton == LEFT) {
      goMenu = false;
      goSettings = true;
    } */
  }
}
