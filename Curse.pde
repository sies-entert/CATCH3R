float curseX, curseY, curseMinSize = 5, curseMaxSize = 20, curseSp;

float curseCol = 0;

float dist = 0;

float curseStatus = 0;

boolean goCurse = false;

class curse
{
  boolean grow = true;

  void setup() {
    curseX = constrain(random(width), 0 + curseMaxSize, width - curseMaxSize);
    curseY = constrain(random(height), 0 + curseMaxSize, height - curseMaxSize); 
    
    goCurse = true;
    curseStatus = int(random(1, 4));
  }

  void draw() {
    if (currentState == StateOfGame.GAME && goCurse) {
      curseSp = playerSp * 0.5;
      createcurse();
      playercinteract();
      curseEat();
    }
  }
  
  void createcurse()
  {
      noStroke();
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(curseX, curseY, curseMinSize, curseMinSize, 3);
      
      if (grow) {
        curseMinSize += 0.2;
      }
      if (curseMinSize >= curseMaxSize) {
        grow = false;
        curseMinSize -= 0.2;
      }
      if (curseMinSize >= 5 && !grow) {
        curseMinSize -= 0.2;
      }
      if (curseMinSize <= 5) {
        grow = true;
      }
  }
  
  void playercinteract()
  {
    if(currentState == StateOfGame.GAME) {
      
      float posX = playerX - curseX;
      float posY = playerY - curseY;
      
      dist = sqrt(sq(posX) + sq(posY));
      
      if (dist > 0){
        posX /= dist;
        posY /= dist;
        
        curseX += posX * curseSp;
        curseY += posY * curseSp;
      }
      else if(eatBonus(playerX, playerY, playerD, bonusX, bonusY, bonusMinSize) && playerSp == 8){
          curseSp = curseSp * 1.75;
      }
    }
  }
  
  void curseEat() 
  {
   if(eatСurse(playerX, playerY, playerD, curseX, curseY, curseMinSize)){
      goCurse = false;
      if (curseStatus == 1) {
        playerD = 20;
        counterTextSize = 7;
      } 
      if (curseStatus == 2) {
        playerSp = 2;
      } 

      if (curseStatus == 3) {
        setup();
        redraw();
      }
      //if (curseStatus == 4) {}
    }
  }
}
