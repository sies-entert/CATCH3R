int timeSeconds = 0;
int timeMinutes = 0;

boolean[] aus = new boolean[21];

enum StateOfGame {
    MENU,
    SETTINGS,
    GAME,
    PAUSE,
    RESET
};  

StateOfGame currentState = StateOfGame.MENU;

boolean startGame = false;
boolean stateGame = false;
boolean pauseGame = false;
boolean resetGame = false;
boolean endGame = false;
boolean darkwhite = true;

menu menuObject;
gameplay gameplayObject;
debugPanel debugPanelObject;

void setup() {
  size(400, 600);

  surface.setTitle("Catcher");
  surface.setResizable(true);

  smooth(10);
  
  menuObject = new menu();
  menuObject.setup();
  
  gameplayObject = new gameplay();
  gameplayObject.setup();

  debugPanelObject = new debugPanel();
  debugPanelObject.setup();
}

void draw() {
  switch (currentState){
    case MENU:
      menuObject.draw();
      break;
    case SETTINGS:
      break;
    case GAME:
      gameplayObject.draw();
      break;
    case PAUSE:
      break;
    case RESET:
      break;
  }
  
  debugPanelObject.draw();
  
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

  if (currentState == StateOfGame.PAUSE) {
    if (key == ' ') {
      currentState = StateOfGame.GAME;
      if (currentState == StateOfGame.GAME) {
        gameplayObject.resetGame();
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

void debugpanel() {
    println("-------------------");
    //println("PlayerPos: (" + playerX + ", " + playerY + ")");
    println("CursePos: (" + curseX + ", " + curseY + ")");
    println("Curse speed: " + curseSp);
    println("Game run: " + startGame);
    println("Menu run: " + goMenu);
    println("Game pause:" + pauseGame);
    println("Game reset: " + resetGame);
    println("Game Over: " + endGame);
    //println("Balls: " + ballcount);
    println("Bonus: " + goBonus);
    println("Curse: " + goCurse);
    println("Curse Type: " + curseStatus);
    println("-------------------");
}
