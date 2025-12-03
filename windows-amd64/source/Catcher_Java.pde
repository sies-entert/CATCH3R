int timeSeconds = 0;
int timeMinutes = 0;

boolean[] aus = new boolean[21];

boolean startGame = false;
boolean stateGame = false;
boolean pauseGame = false;
boolean resetGame = false;
boolean endGame = false;
boolean darkwhite = true;

border borderObject;
bonus bonusObject;
curse curseObject;
player playerObject;
balls ballsObject;
menu menuObject;

void setup() {
  size(400, 600);

  surface.setTitle("Catcher");
  surface.setResizable(true);

  smooth(10);

  menuObject = new menu();
  menuObject.setup();

  borderObject = new border();
  borderObject.setup();

  bonusObject = new bonus();
  bonusObject.setup();

  curseObject = new curse();
  curseObject.setup();

  ballsObject = new balls();
  ballsObject.setup();

  playerObject = new player();
  playerObject.setup();
}

void draw() {
  if (goMenu) {
    menuObject.draw();
  }

    if (startGame && !pauseGame && !goMenu)
    {
      //int millis = millis();//

      background(backgr);
      noStroke();

      textSize(24);
      /*timeSeconds = millis / 1000;
      text(timeMinutes + " : " + timeSeconds, width / 2, height / 20);*/

      textSize(15);
      text(ceil(frameRate), width/20, height / 20); 

      borderObject.draw();

      if (goBonus) {
        bonusObject.draw();
      }
      if (goCurse) {
        curseObject.draw();
      }

      ballsObject.draw();

      playerObject.draw();
      
      debugpanel();
    }
   
  if (darkwhite == true) {
    fill = 255;
    backgr = 0;
  } else if (darkwhite == false) {
    fill = 0;
    backgr = 255;
  }
}

void mouseClicked()
{
  if (mouseButton == CENTER)
  {
    startGame = !startGame;
    pauseGame = !pauseGame;
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text("Press CMB or LMB to continue", width/2, height/2);
  }

  menuObject.mouseClicked();
}

void keyTyped() {

  if (pauseGame && ballcount == 0) {

    if (key == ' ') {
      resetGame = !resetGame;
      if (resetGame) {
        resetGame();
      }
    }
  }
  if (key == 't' || key == 'T') {
    darkwhite = !darkwhite;
  }
}

void keyPressed() {

  playerObject.keyPressed();
}

void keyReleased() {

  playerObject.keyReleased();
}

void resetGame() {
  startGame = true;
  pauseGame = false;

  /*timeSeconds = 0;
  timeMinutes = 0;*/

  goBonus = true;
  goCurse = true;

  borderObject.setup();
  bonusObject.setup();
  curseObject.setup();
  playerObject.setup();
  ballsObject.setup();
}

void debugpanel() {
    println("-------------------");
    println("PlayerPos: (" + circleX + ", " + circleY + ")");
    println("CursePos: (" + curseX + ", " + curseY + ")");
    println("Curse speed: " + curseSp);
    println("Balls: " + ballcount);
    println("Bonus: " + goBonus);
    println("Curse: " + goCurse);
    println("-------------------");
}
