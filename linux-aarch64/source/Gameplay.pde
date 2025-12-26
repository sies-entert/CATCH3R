border borderObject;
bonus bonusObject;
curse curseObject;
player playerObject;
balls ballsObject;

class gameplay{

  void setup() {
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
    
    background(backgr);
    noStroke();

    textSize(24);
    textSize(15);
    text(ceil(frameRate), width/20, height / 20); 

    borderObject.draw();

    ballsObject.draw();
     
    curseObject.draw();

    bonusObject.draw();
 
    playerObject.draw();
    
    debugpanel();

    for (int i = 0; i < ballsn.length; i++)
    {
      if (aus[i] && eat(playerX, playerY, playerD, x[i], y[i], sz))
      {
        aus[i] = false;
        if (!aus[i])
        {
          ballcount--;
          if (ballcount == 0)
          {
            currentState = StateOfGame.PAUSE;
              if (currentState == StateOfGame.PAUSE){
                fill(fill);
                textSize(40);
                text("GameOver", width/2, height/3);
                textSize(30);
                text("Press SPACE to Restart", width/2, height/2);
              }
          }
        }
      }
    }
  }
  
  void resetGame() {
    borderObject.setup();
    bonusObject.setup();
    curseObject.setup();
    playerObject.setup();
    ballsObject.setup();
  }
}
