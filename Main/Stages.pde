void setStages() {
   if (stage == 0)
  {
    background(0);
    for (int i=0; i<800; i++)
    {
      rect(stars[i], stars2[i], stars3[i], stars3[i]);
    }
    rectMode(CENTER);
    rect(width/2, height/2, 300, 100);
    rect(width/2, height/2+150, 300, 100);
    textSize(50);
    fill(0);
    text("Play", width/2-60, height/2+15);
    text("Controls", width/2-120, height/2+170);
    fill(255);
    textSize(100);
    textFont(font100);
    text("Asteroid Field", 570, 300);
  } else if (stage==2)
  {
    background(0);
    fill(255);
    textSize(70);
    text("Player 1", 100, 500);
    text("Shoot: s", 100, 600);
    text("Boost: w", 100, 700);
    text("Steer: a + d", 100, 800);
    text("Player 2", 1000, 500);
    text("Shoot: Down", 1000, 600);
    text("Boost: Up", 1000, 700);
    text("Steer: Left + Right", 1000, 800);
    rect(200, 100, 300, 100);
    fill(0);
    textSize(100);
    text("Back", 90, 140);
  }
  pushMatrix();
  textSize(100);
  if (stage==3)
  {
    background(0);
    fill(255);
    text("Player 1 Wins", width/2-400, height/2);
  } else if (stage ==4)
  {
    background(0);
    fill(255);
    text("Player 2 Wins", width/2-400, height/2);
  } else if (stage ==5)
  {
    background(0);
    fill(255);
    text("Draw", width/2-120, height/2);
  } 
  popMatrix();
}
