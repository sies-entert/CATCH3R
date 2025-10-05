float bonusX = 0, bonusY = 0, bonusMinSize = 5, bonusMaxSize = 20;

float bonusCol = 0;

boolean goBonus = true;

class bonus
{
  boolean grow = true;

  void setup()
  {
    bonusX = constrain(random(width), 0 + bonusMaxSize, width - bonusMaxSize);
    bonusY = constrain(random(height), 0 + bonusMaxSize, height - bonusMaxSize);

    bonusStatus = random(0, 2);
  }

  void draw()
  {
    if (goBonus) {
      drawbonus();
      bonusEat();
    }
  }
  
  void drawbonus() { 
    noStroke();
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(bonusX, bonusY, bonusMinSize, bonusMinSize, 3);

    if (grow)
      {
        bonusMinSize += 0.2;
      }
      if (bonusMinSize >= bonusMaxSize)
      {
        grow = false;
        bonusMinSize -= 0.2;
      }
      if (bonusMinSize >= 5 && !grow)
      {
        bonusMinSize -= 0.2;
      }
      if (bonusMinSize <= 5)
      {
        grow = true;
      }
      if (eatBonus(circleX, circleY, circleD, bonusX, bonusY, bonusMinSize))
      {
        goBonus = false;
      }
  }
  void bonusEat() {
    if (eatBonus(circleX, circleY, circleD, bonusX, bonusY, bonusMinSize)){
      if (bonusStatus <= 1) {
        circleD = 80;
        counterTextSize = 28;
      } else if (bonusStatus <= 2) {
          circleSp = 8;
      }
    }
  }
}

float bonusStatus = 0;
