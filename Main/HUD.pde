void HUD()
{
  //Player 1
  pushMatrix();
  textSize(30);
  fill(#054EFF);
  if (p1.shields>=1)
  {
    ellipse(250, 87, 30, 30);

    if (p1.shields>=2)
    {
      ellipse(300, 87, 30, 30);

      if (p1.shields>=3)
      {
        ellipse(350, 87, 30, 30);
      }
      if (p1.shields>=4)
      {
        ellipse(400, 87, 30, 30);
      }
      if (p1.shields>=5)
      {
        ellipse(450, 87, 30, 30);
      }
    }
  }
  fill(#8E05FF);
  text("Shields: ", 100, 100);
  text("Ammo: "+ p1.ammo, 100, 150);
  rectMode(CORNERS);
  fill(0, 0, 255);
  stroke(255);
  rect(200, 180, 200+p1.boost, 200);
  fill(#8E05FF);
  text("Boost: ", 100, 200);
  rectMode(CENTER);
  textSize(50);
  text("Score: "+p1.score, 500, 200);
  popMatrix();


  //Player 2
  pushMatrix();
  textSize(30);
  fill(#054EFF);
  if (p2.shields>=1)
  {
    ellipse(1650, 87, 30, 30);

    if (p2.shields>=2)
    {
      ellipse(1700, 87, 30, 30);

      if (p2.shields>=3)
      {
        ellipse(1750, 87, 30, 30);
      }
      if (p2.shields>=4)
      {
        ellipse(1800, 87, 30, 30);
      }
      if (p2.shields>=5)
      {
        ellipse(1850, 87, 30, 30);
      }
    }
  }
  fill(#8E05FF);
  text("Shields: ", 1500, 100);
  text("Ammo: "+ p2.ammo, 1500, 150);
  rectMode(CORNERS);
  fill(0, 0, 255);
  stroke(255);
  rect(1600, 180, 1600+p2.boost, 200);
  fill(#8E05FF);
  text("Boost: ", 1500, 200);
  rectMode(CENTER);
  textSize(50);
  text("Score: "+p2.score, 1000, 200);
  popMatrix();
}
