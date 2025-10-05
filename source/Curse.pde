float curseX = 0, curseY = 0, curseMinSize = 5, curseMaxSize = 20, curseSp = 0;

float curseCol = 0;

float dist = 0;

float curseStatus = 0;

boolean goCurse = true;

class curse
{
  boolean grow = true;

  void setup() {
    curseX = constrain(random(width), 0 + curseMaxSize, width - curseMaxSize);
    curseY = constrain(random(height), 0 + curseMaxSize, height - curseMaxSize); 
    
    curseStatus = random(0, 3);
  }

  void draw() {
    if (goCurse) {
      curseSp = circleSp * 0.5;
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
      if (eatСurse(circleX, circleY, circleD, curseX, curseY, curseMinSize)) {
        goCurse = false;
      }
  }
  
  void playercinteract()
  {
    if(startGame && !pauseGame && !goMenu) {
      
      float posX = circleX - curseX;
      float posY = circleY - curseY;
      
      dist = sqrt(sq(posX) + sq(posY));
      
      if (dist > 0){
        posX /= dist;
        posY /= dist;
        
        curseX += posX * curseSp;
        curseY += posY * curseSp;
      }
      else if(eatBonus(circleX, circleY, circleD, bonusX, bonusY, bonusMinSize) && circleSp == 8){
          curseSp = curseSp * 1.75;
      }
    }
  }
  
  void curseEat() 
  {
      if(eatСurse(circleX, circleY, circleD, curseX, curseY, curseMinSize)){
        if (curseStatus <= 1) {
          circleD = 20;
          counterTextSize = 7;
        } else if (curseStatus <= 2) {
          circleSp = 2;
        } else if (curseStatus <= 3) {
          setup();
          goCurse = true;
          createcurse();
        }
      }
  }
}
