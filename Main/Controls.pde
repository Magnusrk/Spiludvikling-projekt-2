//Player 1 wasd
Boolean wPressed;
Boolean aPressed;
Boolean sPressed;
Boolean dPressed;

//Player2 Arrowkeys
Boolean upPressed;
Boolean leftPressed;
Boolean downPressed;
Boolean rightPressed;

void keyPressed() 
{
  //Player 1 
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
  
  //Player 2
    if(key == UP)
  {
    upPressed = true;
  }
   if(key == LEFT)
  {
    leftPressed = true;
  }
   if(key == DOWN)
  {
    downPressed = true;
  }
   if(key == RIGHT)
  {
    rightPressed = true;
  }

}

void keyReleased() 
{
  //Player 1
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

//Player 2
  if(key == UP)
  {
    upPressed = false;
  } 
     if(key == LEFT)
  {
    leftPressed = false;
  }
   if(key == DOWN)
  {
    downPressed = false;
  }
   if(key == RIGHT)
  {
    rightPressed = false;
  }

}
