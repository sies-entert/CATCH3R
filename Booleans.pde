boolean menuMouse (float boxLeft, float boxRight, float boxUp, float boxDown)
{
  if (mouseX >= boxLeft &&
    mouseX <= boxRight - boxLeft &&
    mouseY >= boxUp &&
    mouseY <= boxDown - boxUp && currentState == StateOfGame.MENU)
  {
    return true;
  }
  return false;
}

boolean OverButton(float ButtonX, float ButtonY, float ButtonMinWidth, float ButtonMinHeight) {
  if (mouseX >= ButtonX - ButtonMinWidth / 2 &&
    mouseX <= ButtonX + ButtonMinWidth / 2 &&
    mouseY >= ButtonY - ButtonMinHeight / 2 &&
    mouseY <= ButtonY + ButtonMinHeight / 2)
  {
    return true;
  }
  return false;
}

boolean eat(float playerX, float playerY, float playerD, float x, float y, float sz)
{
  return playerX - playerD / 3 <= x + sz / 2 &&
    playerX + playerD / 3 >= x - sz / 2 &&
    playerY - playerD / 3 <= y + sz / 2 &&
    playerY + playerD / 3 >= y - sz / 2;
}

boolean eatBonus(float playerX, float playerY, float playerD, float bonusX, float bonusY, float bonusMinSize)
{
  return playerX - playerD / 3 <= bonusX + bonusMinSize/ 2 &&
    playerX + playerD / 3 >= bonusX - bonusMinSize / 2 &&
    playerY - playerD / 3 <= bonusY + bonusMinSize / 2 &&
    playerY + playerD / 3 >= bonusY - bonusMinSize / 2;
}

boolean eatСurse(float playerX, float playerY, float playerD, float curseX, float curseY, float curseMinSize)
{
  return playerX - playerD / 3 <= curseX + curseMinSize/ 2 &&
    playerX + playerD / 3 >= curseX - curseMinSize / 2 &&
    playerY - playerD / 3 <= curseY + curseMinSize / 2 &&
    playerY + playerD / 3 >= curseY - curseMinSize / 2;
}

boolean playerOutOfBorder(float playerX, float playerY, float playerD, float boxLeft, float boxRight, float boxUp, float boxDown)
{
  if (currentState == StateOfGame.GAME && playerX - playerD / 2 <= boxLeft ||
    playerX + playerD / 2 >= boxLeft + boxRight ||
    playerY - playerD / 2 <= boxUp ||
    playerY + playerD / 2 >= boxUp + boxDown) {
    return true;
  } else {
    return false;
  }
}
