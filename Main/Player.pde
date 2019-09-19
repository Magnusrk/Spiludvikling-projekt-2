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
  int player;
  boolean dead=false;

  Player(PVector loc, int col, int p) {
    location = loc.get();
    velocity = new PVector(0, -1);
    acceleration = new PVector(0, 0);
    ammo = 100;
    score = 0;
    boost = 100;
    shields = 3;
    colour = col;
    angle = 2*PI;
    player = p;
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
    if (dead == false)
    {
    velocity.x = sin(angle);
    velocity.y = -cos(angle);
    velocity.mult(3);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    }
    if (ammo > 100) {
      ammo = 100;
    }
    if (boost > 100) {
      boost = 100;
    }
    if ( location.x <25 || location.x>width-25)
    {
      shields = 0;
      dead = true;
    }
    if ( location.y <25 || location.y>height-25)
    {
      shields = 0;
      dead=true;
    }
  }

  void shoot() {
    if(player == 1) {
    p1Bullets.add(new Bullets(location.get(), velocity.get().mult(5)));
    } else if(player == 2) {
      p2Bullets.add(new Bullets(location.get(), velocity.get().mult(5)));
    }
  }

  void boost()
  {
    if (dead==false)
    {
    velocity.x = sin(angle);
    velocity.y = -cos(angle);
    velocity.mult(10);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    boost = boost-1;
    }
  }
}
