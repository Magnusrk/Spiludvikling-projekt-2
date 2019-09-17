//Player 1 wasd
Boolean wPressed;
Boolean aPressed;
Boolean sPressed;
Boolean dPressed;
Boolean shiftPressed;

//Player2 Arrowkeys


void keyPressed() 
{
  if(key == 'w')
  {
    wPressed = true;
  }
   if(key == 'a')
  {
    aPressed = true;
  }
   if(key == 's')
  {
    sPressed = true;
  }
   if(key == 'd')
  {
    dPressed = true;
  }
   if(keyCode == SHIFT)
  {
    shiftPressed = true;
  }
}

void keyReleased() 
{
  if(key == 'w')
  {
    wPressed = false;
  } 
     if(key == 'a')
  {
    aPressed = false;
  }
   if(key == 's')
  {
    sPressed = false;
  }
   if(key == 'd')
  {
    dPressed = false;
  }
   if(keyCode == SHIFT)
  {
    shiftPressed = false;
  }
}
