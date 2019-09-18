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
    acceleration = new PVector(random(-0.5, 0.5), 1);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    lifespan = 255;
    R = r;
    G = g;
    B = b;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 30;
  }

  void display() {
    stroke(R, G, B, lifespan);
    fill(R, G, B, lifespan);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0+random(-10, 10), 0+random(-10, 10), 13, 13);
    popMatrix();
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
