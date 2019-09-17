class Powerup 
{
  PVector location;
  
  
  Powerup()
  {
    location = new PVector (random(100,900),random(100,900));
  }
  
  
  void render()
  {
   pushMatrix();
   translate(location.x,location.y);
   fill(255);
   ellipse(0,0,40,40);
   fill(#0556FF);
   textSize(25);
   text("P",-8,5);
   popMatrix();
  }
  
  void update()
  {
    
  }
}
