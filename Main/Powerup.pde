class Powerup 
{
  PVector location;
  float r = random(0, 1.33);
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
    ellipse(0, 0, 20, 20);
    fill(#0556FF);
    textSize(20);


    if ( r < 0.5)
    {
      text("A", -7, 7);

      type =1;
    } else if(r >0.5 && r<1)
    {
      text("B", -7, 7);
      type=2;
    } else if (r > 1)
    {
      fill(0,0,255);
      ellipse(0, 0, 20, 20);
      type=3;
    }
    
    
    popMatrix();
  }
}
