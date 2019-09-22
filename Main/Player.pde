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
  boolean playing =false;

  Player(PVector loc, int col, int p) {
    location = loc.get();
    velocity = new PVector(0, -1);
    acceleration = new PVector(0, 0);
    ammo = 30;
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
    if ( location.x <20 || location.x>width-25)
    {
      shields = 0;
      dead = true;
    }
    if ( location.y <20 || location.y>height-25)
    {
      shields = 0;
      dead=true;
    }
    if (shields ==0)
    {
      dead = true;
    
      ellipse(location.x, location.y, 150, 150);
      if (frameCount %60==0)
      {
        location.x=location.x+10000;
        location.y=location.y+10000;
      }
      
      if(playing==false)
      {
      playerdeath.play();
      shields=-1;
      }
      
      if(playerdeath.isPlaying())
      {
        playing=true;
      }
    }
  }

  void shoot() {

    if (dead==false)
    {
      if (player == 1) 
      {  
        p1Bullets.add(new Bullets(location.get(), velocity.get().mult(5)));
      } else if (player == 2) 
      {
        p2Bullets.add(new Bullets(location.get(), velocity.get().mult(5)));
      }
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
