int timeSeconds, timeMinutes;

boolean[] aus = new boolean[21];

enum StateOfGame {
    MENU,
    SETTINGS,
    GAME,
    PAUSE,
    RESET
};  

StateOfGame currentState = StateOfGame.MENU;

boolean darkwhite = true;

menu menuObject;
gameplay gameplayObject;

void setup() {
  size(400, 600);
  
  timeSeconds = 0;

  surface.setTitle("CATCH3R");
  surface.setResizable(false);

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
      debugPanelObject.draw();
      break;
    case PAUSE:
      break;
    case RESET:
      break;
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
    currentState = StateOfGame.PAUSE;
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text("Press LMB to continue", width/2, height/2);
    if(mouseButton == LEFT && currentState == StateOfGame.PAUSE) {
      currentState = StateOfGame.GAME;
    }
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
    println("PlayerPos: (" + playerX + ", " + playerY + ")");
    println("CursePos: (" + curseX + ", " + curseY + ")");
    println("Curse speed: " + curseSp);
    println("Menu run: " + goMenu);
    println("Balls: " + ballcount);
    println("Bonus: " + goBonus);
    println("Curse: " + goCurse);
    println("Curse Type: " + curseStatus);
    println("-------------------");
}
