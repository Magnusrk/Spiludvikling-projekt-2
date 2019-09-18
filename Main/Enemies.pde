class Enemy
{
  PVector location;
  PVector velocity;
  int award;
  int size;
  Enemy() {
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

  void render()
  {
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
  }

  void update()
  {
    location.add(velocity);
  }
}
