class Enemy
{
  PVector location;
  PVector velocity;
  int award;
  int size;
  int type;
  Enemy(int ty) {
    type = ty;
    float r = random(0, 1);
    if (type == 0) {
      if (r < 0.5) {
        location = new PVector(0, random(100, 980));
        velocity = new PVector(1, 0);
      }
      if (r >= 0.5) {
        location = new PVector(1920, random(100, 980));
        velocity = new PVector(-1, 0);
      }
      size = 25;
      award = 10;
    }
    if (type == 1) {
      if (r < 0.5) {
        location = new PVector(0, random(100, 980));
        velocity = new PVector(0.7, 0);
      }
      if (r >= 0.5) {
        location = new PVector(1920, random(100, 980));
        velocity = new PVector(-0.7, 0);
      }
      size = 75;
      award = 25;
    }
  }
    Enemy(int typ, PVector velo, PVector loca) {
      type = typ;
      if(typ == 0) {
        size = 25;
        award = 10;
        location = loca;
        velocity = velo;
      }
  }

  void render()
  {
    if (type == 0) {
      fill(#AD5309);
      textSize(80);
      text("*", location.x, location.y);
    }
    if(type == 1) {
      fill(#AD5309);
      ellipse(location.x, location.y,size,size);
    }
  }

  void update()
  {
    location.add(velocity);
  }
}
