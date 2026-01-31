float nameX, nameY, nameBoxWidth, nameBoxHeight; 

float creditsX, creditsY, creditsBoxWidth, creditsBoxHeight;

float startButtonX, startButtonY,
      startButtonMinWidth, startButtonMaxWidth,
      startButtonMinHeight, startButtonMaxHeight,
      currentStartButtonWidth, currentStartButtonHeight;

float settingButtonX, settingButtonY,
      settingButtonMinWidth, settingButtonMaxWidth,
      settingButtonMinHeight, settingButtonMaxHeight,
      currentSettingButtonWidth, currentSettingButtonHeight;

float exitButtonX, exitButtonY,
      exitButtonMinWidth, exitButtonMaxWidth,
      exitButtonMinHeight, exitButtonMaxHeight,
      currentExitButtonWidth, currentExitButtonHeight;
      
float creditsButtonX, creditsButtonY,
      creditsButtonMinW, creditsButtonMinH,
      creditsButtonMaxW, creditsButtonMaxH,
      curcreditsButtonW, curcreditsButtonH;
  
float startTextMinSize, startTextMaxSize,
      currentStartTextSize;

float settingTextMinSize, settingTextMaxSize,
      currentSettingTextSize;

float exitTextMinSize, exitTextMaxSize,
      currentExitTextSize;

float creditsTextMinSize, creditsTextMaxSize,
      curcreditsTextSize;

String creditsText;

String[] creditsButtonText = new String[2];

float showCreditsX, showCreditsY,
      showCreditsW, showCreditsH;

boolean goMenu = true;

boolean goSettings = false;

enum StateOfMenu {
    MAIN,
    SETTINGS,
    CREDITS,
    STOP,
};  

StateOfMenu currentMState = StateOfMenu.MAIN;

class menu {
  
  balls ballsObject;
  
  void setup() {
    background(backgr);
    fill(fill);

    rectMode(CENTER);
    
    nameX = width / 2;
    nameY = height / 8;
    nameBoxWidth = width;
    nameBoxHeight = height / 8.5;
    
    creditsX = width / 2;
    creditsY = height / 1.05;
    creditsBoxWidth = width;
    creditsBoxHeight = height / 4;

    boxRight = width;
    boxDown = height;

    startButtonX = width / 2;
    startButtonY = height / 3;

    startButtonMinWidth = 140;
    startButtonMinHeight = 60;
    currentStartButtonWidth = startButtonMinWidth;
    currentStartButtonHeight = startButtonMinHeight;

    startButtonMaxWidth = startButtonMinWidth * 1.5;
    startButtonMaxHeight = startButtonMinHeight + (startButtonMinHeight / 2.5);

    startTextMinSize = 24;
    startTextMaxSize = 36;
    currentStartTextSize = startTextMinSize;

    settingButtonX = width / 2;
    settingButtonY = height / 2;

    settingButtonMinWidth = 140;
    settingButtonMinHeight = 60;
    currentSettingButtonWidth = settingButtonMinWidth;
    currentSettingButtonHeight = settingButtonMinHeight;

    settingButtonMaxWidth = settingButtonMinWidth * 1.5;
    settingButtonMaxHeight = settingButtonMinHeight + (settingButtonMinHeight / 2.5);

    settingTextMinSize = 24;
    settingTextMaxSize = 36;
    currentSettingTextSize = settingTextMinSize; 
    
    exitButtonX = width / 2;
    exitButtonY = height / 1.5;
    
    exitButtonMinWidth = 140;
    exitButtonMinHeight = 60;
    currentExitButtonWidth = exitButtonMinWidth;
    currentExitButtonHeight = exitButtonMinHeight;
    
    exitButtonMaxWidth = exitButtonMinWidth * 1.5;
    exitButtonMaxHeight = exitButtonMinHeight + (exitButtonMinHeight / 2.5);
    
    exitTextMinSize = 24;
    exitTextMaxSize = 36;
    currentExitTextSize = exitTextMinSize;
    
    creditsButtonX = width / 2;
    creditsButtonY = height / 1.15;
    
    creditsButtonMinW = 240;
    creditsButtonMinH = 60;    
    curcreditsButtonW = creditsButtonMinW;
    curcreditsButtonH = creditsButtonMinH;
    
    creditsButtonMaxW = creditsButtonMinW * 1.5;
    creditsButtonMaxH = creditsButtonMinH + (creditsButtonMinH / 2.5);
    
    creditsTextMinSize = 24;
    creditsTextMaxSize = 36;
    curcreditsTextSize = creditsTextMinSize;
    
    showCreditsX = width / 2;
    showCreditsY = height / 2;
    
    showCreditsW = width / 2;
    showCreditsH = height / 2;
    
    creditsButtonText[0] = "Credits";
    creditsButtonText[1] = "Return";
    }

  void draw() {
      background(backgr);
      drawName();
      
      switch (currentMState){
        case MAIN:
          drawStartButton();
          drawSettingsButton();
          drawExitButton();
          drawCreditsButton();
          break;
        case SETTINGS:
          break;
        case STOP:
          exit();
          break;
        case CREDITS:
          showCredits();
          drawCreditsButton();
      }
      
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
    }
  
  void drawName(){
      rectMode(CENTER);
      fill(backgr);
      strokeWeight(4);
      rect(nameX, nameY, nameBoxWidth, nameBoxHeight);
  
      textAlign(CENTER, CENTER);
      textSize(40);
      fill(fill);
      text("CATCH3R", nameX, nameY);
  }
  
  void showCredits(){
    if (currentMState == StateOfMenu.CREDITS){
      rectMode(CENTER);
      fill(backgr);
      strokeWeight(4);
      rect(showCreditsX, showCreditsY, showCreditsW, showCreditsH);
        
      textAlign(CENTER, CENTER);
      fill(fill);
      textSize(20);
      text("Made by sies-entert.\n No copyrights, just make fun", showCreditsX, showCreditsY);
    }
  }
  
  void drawButton(float ButtonX, float ButtonY, float currentButtonWidth, float currentButtonHeight, float currentTextSize, String ButtonText) {
      rectMode(CENTER);
      strokeWeight(4);
      stroke(fill);
      noFill();
      rect(ButtonX, ButtonY, currentButtonWidth, currentButtonHeight, 2);

      textAlign(CENTER, CENTER);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              fill(fill);
      textSize(currentTextSize);
      text(ButtonText, ButtonX, ButtonY);
  }
  
  void drawStartButton(){
      drawButton(startButtonX, startButtonY, currentStartButtonWidth, currentStartButtonHeight, currentStartTextSize, "Start"); 
      
      boolean hovering = OverButton(startButtonX, startButtonY, currentStartButtonWidth, currentStartButtonHeight);
      
      if (hovering) {
        if (currentStartButtonWidth < startButtonMaxWidth && 
            currentStartButtonHeight < startButtonMaxHeight && 
            currentStartTextSize < startTextMaxSize) {
          currentStartButtonWidth += 2.25;
          currentStartButtonHeight += 1.25;
          currentStartTextSize += 0.2;
        }
      } else {
        if (currentStartButtonWidth > startButtonMinWidth || 
            currentStartButtonHeight > startButtonMinHeight || 
            currentStartTextSize > startTextMinSize) {
          currentStartButtonWidth -= 2.25;
          currentStartButtonHeight -= 1.25;
          currentStartTextSize -= 0.2;
        }
      }
      currentStartButtonWidth = constrain(currentStartButtonWidth, startButtonMinWidth, startButtonMaxWidth);
      currentStartButtonHeight = constrain(currentStartButtonHeight, startButtonMinHeight, startButtonMaxHeight);
      currentStartTextSize = constrain(currentStartTextSize, startTextMinSize, startTextMaxSize);
   }
  
  void drawSettingsButton() {
      drawButton(settingButtonX, settingButtonY, currentSettingButtonWidth, currentSettingButtonHeight, currentSettingTextSize, "Settings"); 
      boolean hovering = OverButton(settingButtonX, settingButtonY, currentSettingButtonWidth, currentSettingButtonHeight);
      
      if (hovering) {
        if (currentSettingButtonWidth < settingButtonMaxWidth && 
            currentSettingButtonHeight < settingButtonMaxHeight && 
            currentSettingTextSize < settingTextMaxSize) {
          currentSettingButtonWidth += 2.25;
          currentSettingButtonHeight += 1.25;
          currentSettingTextSize += 0.2;
        }
      } else {
        if (currentSettingButtonWidth > settingButtonMinWidth || 
            currentSettingButtonHeight > settingButtonMinHeight || 
            currentSettingTextSize > settingTextMinSize) {
          currentSettingButtonWidth -= 2.25;
          currentSettingButtonHeight -= 1.25;
          currentSettingTextSize -= 0.2;
        }
      }
      currentSettingButtonWidth = constrain(currentSettingButtonWidth, settingButtonMinWidth, settingButtonMaxWidth);
      currentSettingButtonHeight = constrain(currentSettingButtonHeight, settingButtonMinHeight, settingButtonMaxHeight);
      currentSettingTextSize = constrain(currentSettingTextSize, settingTextMinSize, settingTextMaxSize);
  }
  
  void drawExitButton() {
    drawButton(exitButtonX, exitButtonY, currentExitButtonWidth, currentExitButtonHeight, currentExitTextSize, "Exit");
    boolean hovering = OverButton(exitButtonX, exitButtonY, currentExitButtonWidth, currentExitButtonHeight);
    if (hovering) {
        if (currentExitButtonWidth < exitButtonMaxWidth && 
            currentExitButtonHeight < exitButtonMaxHeight && 
            currentExitTextSize < exitTextMaxSize) {
          currentExitButtonWidth += 2.25;
          currentExitButtonHeight += 1.25;
          currentExitTextSize += 0.2;
        }
      } else {
        if (currentExitButtonWidth > exitButtonMinWidth || 
            currentExitButtonHeight > exitButtonMinHeight || 
            currentExitTextSize > exitTextMinSize) {
          currentExitButtonWidth -= 2.25;
          currentExitButtonHeight -= 1.25;
          currentExitTextSize -= 0.2;
        }
      }
      currentExitButtonWidth = constrain(currentExitButtonWidth, exitButtonMinWidth, exitButtonMaxWidth);
      currentExitButtonHeight = constrain(currentExitButtonHeight, exitButtonMinHeight, exitButtonMaxHeight);
      currentExitTextSize = constrain(currentExitTextSize, exitTextMinSize, exitTextMaxSize);
  }
  
  void drawCreditsButton() 
  {
    drawButton(creditsButtonX, creditsButtonY, curcreditsButtonW, curcreditsButtonH, curcreditsTextSize, creditsButtonText[0]);
    boolean hovering = OverButton(creditsButtonX, creditsButtonY, curcreditsButtonW, curcreditsButtonH);
    if (hovering) {
        if (curcreditsButtonW < creditsButtonMaxW && 
            curcreditsButtonH < creditsButtonMaxH && 
            curcreditsTextSize < creditsTextMaxSize) {
          curcreditsButtonW += 2.25;
          curcreditsButtonH += 1.25;
          curcreditsTextSize += 0.2;
        }
      } else {
        if (curcreditsButtonW > creditsButtonMinW || 
            curcreditsButtonH > creditsButtonMinH || 
            curcreditsTextSize > creditsTextMinSize) {
          curcreditsButtonW -= 2.25;
          curcreditsButtonH -= 1.25;
          curcreditsTextSize -= 0.2;
        }
      }
      curcreditsButtonW = constrain(curcreditsButtonW, creditsButtonMinW, creditsButtonMaxW);
      curcreditsButtonH = constrain(curcreditsButtonH, creditsButtonMinH, creditsButtonMaxH);
      curcreditsTextSize = constrain(curcreditsTextSize, creditsTextMinSize, creditsTextMaxSize);
      
      if (currentMState == StateOfMenu.CREDITS) {
        creditsButtonText[0] = creditsButtonText[1];
      }
      else {
        creditsButtonText[0] = "Credits";
      }
  }

  void mouseClicked() {
    if (OverButton(startButtonX, startButtonY, currentStartButtonWidth, currentStartButtonHeight) && mouseButton == LEFT) {
      currentState = StateOfGame.GAME;
    }
    if (OverButton(settingButtonX, settingButtonY, currentSettingButtonWidth, currentSettingButtonHeight) && mouseButton == LEFT) {
      currentMState = StateOfMenu.SETTINGS;
    } 
    if (OverButton(exitButtonX, exitButtonY, currentExitButtonWidth, currentExitButtonHeight) && mouseButton == LEFT) {
      currentMState = StateOfMenu.STOP;
    }
    if (OverButton(creditsButtonX, creditsButtonY, curcreditsButtonW, curcreditsButtonH) && mouseButton == LEFT) {
      currentMState = StateOfMenu.CREDITS;
      if (OverButton(creditsButtonX, creditsButtonY, curcreditsButtonW, curcreditsButtonH) && mouseButton == LEFT) {
          if (creditsButtonText[0] == creditsButtonText[1]){
          currentMState = StateOfMenu.MAIN;
        } 
      } 
    }
  }
}
