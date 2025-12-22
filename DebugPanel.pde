class debugPanel {
  
  int debugtextsize = 12;
  color debugtextcol = color(0, 255, 0);
  float x = 10;
  float y = 10;
  String empty;
  
  void setup(){
  }
  
  void draw(){
    drawDebugPanel();
  }
  
  void drawDebugPanel() {
    fill(debugtextcol);
    textSize(debugtextsize);
    textAlign(LEFT);
    empty =
    "PlayerPos: (" + playerX + ", " + playerY + ")\n" + 
    "CursePos: (" + curseX + ", " + curseY + ")\n" +
    "Curse speed: " + curseSp + "\n" +
    "Game run: " + startGame + "\n" +
    "Menu run: " + goMenu + "\n" +
    "Game pause: " + pauseGame + "\n" +
    "Game reset: " + resetGame + "\n" +
    "Game Over: " + endGame + "\n" +
    "Bonus: " + goBonus + "\n" +
    "Curse: " + goCurse + "\n" +
    "Curse Type: " + curseStatus;
    
    text(empty, x + boxMaxHighlight, y + boxMaxHighlight);
    }
 }   
    
    /*println("-------------------");
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
    */
