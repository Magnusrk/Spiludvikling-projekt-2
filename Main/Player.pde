class Player {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int ammo;
  int score;
  float boost;
  int shields;
  int colour;

  Player(PVector loc, int col) {
    location = loc;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    ammo = 100;
    score = 0;
    boost = 100;
    shields = 3;
    colour = col;
  }

  void render() {
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    noStroke();
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
}
