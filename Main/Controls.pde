//Player 1 wasd
Boolean wPressed = false;
Boolean aPressed = false;
Boolean sPressed = false;
Boolean dPressed = false;

//Player2 Arrowkeys
Boolean upPressed = false;
Boolean leftPressed = false;
Boolean downPressed = false;
Boolean rightPressed = false;


float AddAngle = 0.1;

void keyPressed() 
{
  //Player 1 
  if (key == 'w')
  {
    wPressed = true;
  }
  if (key == 'a')
  {
    aPressed = true;
  }
  if (key == 's')
  {
    sPressed = true;
  }
  if (key == 'd')
  {
    dPressed = true;
  }

  //Player 2
  if (keyCode == UP)
  {
    upPressed = true;
  }
  if (keyCode == LEFT)
  {
    leftPressed = true;
  }
  if (keyCode == DOWN)
  {
    downPressed = true;
  }
  if (keyCode == RIGHT)
  {
    rightPressed = true;
  }
}

void keyReleased() 
{
  //Player 1
  if (key == 'w')
  {
    wPressed = false;
  } 
  if (key == 'a')
  {
    aPressed = false;
  }
  if (key == 's')
  {
    sPressed = false;
  }
  if (key == 'd')
  {
    dPressed = false;
  }

  //Player 2
  if (keyCode == UP)
  {
    upPressed = false;
  } 
  if (keyCode == LEFT)
  {
    leftPressed = false;
  }
  if (keyCode == DOWN)
  {
    downPressed = false;
  }
  if (keyCode == RIGHT)
  {
    rightPressed = false;
  }
}


void controls()
{
  //Player 1
  if (wPressed==true)
  {
  }
  if (aPressed==true)
  {
    p1.angle = p1.angle -AddAngle;
  }
  if (sPressed==true)
  {
  }
  if (dPressed==true)
  {
    p1.angle = p1.angle +AddAngle;
  }
  
  //Player 2
    if (upPressed==true)
  {
  }
  if (leftPressed==true)
  {
    p2.angle = p2.angle -AddAngle;
  }
  if (downPressed==true)
  {
  }
  if (rightPressed==true)
  {
    p2.angle = p2.angle +AddAngle;
  }
}
