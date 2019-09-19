class Enemy
{
  PVector location;
  PVector velocity;
  int award;
  int size;
  int type;
  Enemy(int ty) {
    type = ty;
    if(type == 0) {
    float r = random(0, 1);
    if (r < 0.5) {
      location = new PVector(0, random(100, 980));
      velocity = new PVector(1, 0);
    }
    if (r >= 0.5) {
      location = new PVector(1920, random(100, 980));
      velocity = new PVector(-1, 0);
    }
    size = 25;
    }
  }

  void render()
  {
    if(type == 0) {
    fill(255, 0, 0);
    textSize(80);
    text("*", location.x, location.y);
    }
  }

  void update()
  {
    location.add(velocity);
  }
}
