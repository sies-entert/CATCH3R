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
  
float startTextMinSize, startTextMaxSize,
      currentStartTextSize;

float settingTextMinSize, settingTextMaxSize,
      currentSettingTextSize;

boolean goMenu = true;

boolean goSettings = false;

class menu {

  void setup() {

    size(400, 600);
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

    startButtonMinWidth = 100;
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

    settingButtonMinWidth = 100;
    settingButtonMinHeight = 60;
    currentSettingButtonWidth = settingButtonMinWidth;
    currentSettingButtonHeight = settingButtonMinHeight;

    settingButtonMaxWidth = settingButtonMinWidth * 1.5;
    settingButtonMaxHeight = settingButtonMinHeight + (settingButtonMinHeight / 2.5);

    settingTextMinSize = 24;
    settingTextMaxSize = 36;
    currentSettingTextSize = settingTextMinSize; 
    }

  void draw() {
      background(backgr);
      
      drawName();
      drawStartButton();
      drawSettingsButton();
      drawCredits();
      
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
  
  void drawCredits(){
      rectMode(CENTER);
      fill(backgr);
      strokeWeight(4);
      rect(creditsX, creditsY, creditsBoxWidth, creditsBoxHeight);
        
      textAlign(CENTER, CENTER);
      fill(fill);
      textSize(20);
      text("Made by sies-entert. No copyrights, just make fun", creditsX, creditsY - (creditsY / 15));
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

  void mouseClicked() {
    if (OverButton(startButtonX, startButtonY, currentStartButtonWidth, currentStartButtonHeight) && mouseButton == LEFT) {
      currentState = StateOfGame.GAME;
    }

    if (OverButton(settingButtonX, settingButtonY, currentSettingButtonWidth, currentSettingButtonHeight) && mouseButton == LEFT) {
      currentState = StateOfGame.SETTINGS;
    } 
  }
}
