boolean menuMouse (float boxLeft, float boxRight, float boxUp, float boxDown)
{
  if (mouseX >= boxLeft &&
    mouseX <= boxRight - boxLeft &&
    mouseY >= boxUp &&
    mouseY <= boxDown - boxUp && !startGame)
  {
    return true;
  }
  return false;
}

boolean startButton (float startButtonX, float startButtonY, float startButtonMinWidth, float startButtonMinHeight)
{
  if (mouseX >= startButtonX - startButtonMinWidth / 2 &&
    mouseX <= startButtonX + startButtonMinWidth / 2 &&
    mouseY >= startButtonY - startButtonMinHeight / 2 &&
    mouseY <= startButtonY + startButtonMinHeight / 2)
  {
    return true;
  }
  return false;
}

boolean settingButton (float settingButtonX, float settingButtonY, float settingButtonMinWidth, float settingButtonMinHeight)
{
  if (mouseX >= settingButtonX - settingButtonMinWidth / 2 &&
    mouseX <= settingButtonX + settingButtonMinWidth / 2 &&
    mouseY >= settingButtonY - settingButtonMinHeight / 2 &&
    mouseY <= settingButtonY + settingButtonMinHeight / 2)
  {
    return true;
  }
  return false;
}

boolean eat(float circleX, float circleY, float circleD, float x, float y, float sz)
{
  return circleX - circleD / 3 <= x + sz / 2 &&
    circleX + circleD / 3 >= x - sz / 2 &&
    circleY - circleD / 3 <= y + sz / 2 &&
    circleY + circleD / 3 >= y - sz / 2;
}

boolean eatBonus(float circleX, float circleY, float circleD, float bonusX, float bonusY, float bonusMinSize)
{
  return circleX - circleD / 3 <= bonusX + bonusMinSize/ 2 &&
    circleX + circleD / 3 >= bonusX - bonusMinSize / 2 &&
    circleY - circleD / 3 <= bonusY + bonusMinSize / 2 &&
    circleY + circleD / 3 >= bonusY - bonusMinSize / 2;
}

boolean eatСurse(float circleX, float circleY, float circleD, float curseX, float curseY, float curseMinSize)
{
  return circleX - circleD / 3 <= curseX + curseMinSize/ 2 &&
    circleX + circleD / 3 >= curseX - curseMinSize / 2 &&
    circleY - circleD / 3 <= curseY + curseMinSize / 2 &&
    circleY + circleD / 3 >= curseY - curseMinSize / 2;
}

boolean playerOutOfBorder(float circleX, float circleY, float circleD, float boxLeft, float boxRight, float boxUp, float boxDown)
{
  if (startGame && circleX - circleD / 2 <= boxLeft ||
    circleX + circleD / 2 >= boxLeft + boxRight ||
    circleY - circleD / 2 <= boxUp ||
    circleY + circleD / 2 >= boxUp + boxDown) {
    return true;
  } else {
    return false;
  }
}
