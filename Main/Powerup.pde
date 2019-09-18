class Powerup 
{
  PVector location;
    
  Powerup(PVector loc)
  {
    location = loc;
  }
  
  
  void render()
  {
   pushMatrix();
   translate(location.x,location.y);
   fill(255);
   ellipse(0,0,40,40);
   fill(#0556FF);
   textSize(25);
   text("A",-9,7);
   popMatrix();

  }
  
}
