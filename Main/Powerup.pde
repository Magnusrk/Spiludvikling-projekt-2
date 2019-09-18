class Powerup 
{
  PVector location;
  float r = random(0, 1);
  int type;

  Powerup(PVector loc)
  {
    location = loc;
  }


  void render()
  {
    pushMatrix();
    translate(location.x, location.y);
    fill(255);
    ellipse(0, 0, 40, 40);
    fill(#0556FF);
    textSize(25);


    if ( r < 0.5)
    {
      text("A", -9, 7);

      type =1;
    } else
    {
      text("B", -9, 7);
      type=2;
    }
    popMatrix();
  }
}
