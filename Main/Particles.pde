class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float R;
  float G;
  float B;


  Particle(PVector l, float r, float g, float b) {
    location = l.get();
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    lifespan = 255;
    R = r;
    G = g;
    B = b;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
  }

  void display() {
    stroke(R, G, B, lifespan);
    fill(R, G, B, lifespan);
    ellipse(location.x, location.y, 13, 13);
  }
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  void run() {
    update();
    display();
  }
}
