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
    "Player Pos: (" + round(playerX) + ", " + round(playerY) + ")\n" + 
    "Curse Pos: (" + round(curseX) + ", " + round(curseY) + ")\n" +
    "Curse Type: " + round(curseStatus) + "\n" +
    "Curse speed: " + round(curseSp) + "\n" +
    "Bonus Pos: (" + round(bonusX) + ", " + round(bonusY) + ")\n" +
    "Bonus Type: " + round(bonusStatus) + "\n" +
    "Game run: " + startGame + "\n" +
    "Menu run: " + goMenu + "\n" +
    "Game pause: " + pauseGame + "\n" +
    "Game reset: " + resetGame + "\n" +
    "Game Over: " + endGame + "\n" +
    "Bonus: " + goBonus + "\n" +
    "Curse: " + goCurse + "\n";
    
    text(empty, x + boxMaxHighlight, y + boxMaxHighlight);
  }
  
  void drawDebugBack() {
  }
 }   
