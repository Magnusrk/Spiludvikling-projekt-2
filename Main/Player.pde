class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int ammo;
  int score;
  float boost;
  int shields;
  int colour;
  float angle;

  Player(PVector loc, int col) {
    location = loc.get();
    velocity = new PVector(0, -1);
    acceleration = new PVector(0, 0);
    ammo = 1;
    score = 0;
    boost = 100;
    shields = 3;
    colour = col;
    angle = 2*PI;
  }

  void render() {
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    noStroke();
    fill(#009FFF, 40);
    ellipse(0, 0, 90, 110);
    fill(255);
    //Bottom
    triangle(0, 10, 20, 40, -20, 40);
    fill(colour);
    //Top
    ellipse(0, -25, 20, 20);
    rect(0, 0, 20, 50);
    fill(#29A4FF);
    //Windows
    stroke(1);
    ellipse(0, 10, 9, 9);
    ellipse(0, -10, 9, 9);
    popMatrix();
  }
  void update() {
    velocity.x = sin(angle);
    velocity.y = -cos(angle);
    velocity.mult(3);
    println(velocity.x);
    println(velocity.y);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void shoot() {
    p1Bullets.add(new Bullets(location.get(), velocity.get().mult(5)));
  }
    
}
