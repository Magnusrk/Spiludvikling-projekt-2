class Bullets {
  PVector location;
  PVector velocity;

  Bullets(PVector loc, PVector vel) {
    location = loc.get();
    velocity = vel.get();
  }

  void render() {
    ellipse(location.x, location.y, 5, 5);
  }

  void update() {
    location.add(velocity);
  }
}
