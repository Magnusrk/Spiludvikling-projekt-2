import java.util.Iterator;
int counter = 0;
ArrayList<Enemy> Enemies;
ArrayList<Bullets> p1Bullets;
ArrayList<Bullets> p2Bullets;
ArrayList<Powerup> PowerUps;
ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
float test = 0;

int stage =0;

float[] stars = new float[800];
float[] stars2 = new float[800];
float[] stars3 = new float[800];

void setup() {
  fullScreen();
  systems = new ArrayList<ParticleSystem>();
  Enemies = new ArrayList<Enemy>();
  frameRate(60);
  p1Bullets = new ArrayList<Bullets>();
  p2Bullets = new ArrayList<Bullets>();
  PowerUps = new ArrayList<Powerup>();
  systems.add(new ParticleSystem(new PVector(p1.location.x, p1.location.y+40), 255, 108, 10));
  systems.add(new ParticleSystem(new PVector(p2.location.x, p2.location.y+40), 255, 108, 10));

  for (int i=0; i<800; i++)
  {
    stars[i] = (random(0, width));
    stars2[i] = (random(0, height));
    stars3[i] = (random(1, 3));
  }
}



void draw() {
  if (stage == 0)
  {
    background(0);
    for (int i=0; i<800; i++)
    {
      rect(stars[i], stars2[i], stars3[i], stars3[i]);
    }

    rectMode(CENTER);
    rect(width/2, height/2, 300, 100);
    rect(width/2, height/2+150, 300, 100);

    textSize(50);
    fill(0);
    text("Play", width/2-45, height/2+10);
    text("Controls", width/2-100, height/2+170);


    fill(255);
    textSize(100);
    text("TITLE", 800, 300);
  } else if (stage==2)
  {
    background(0);
    fill(255);
    text("Player 1", 100, 500);
    text("Shoot: s", 100, 600);
    text("Boost: w", 100, 700);
    text("Steer: a + d", 100, 800);

    text("Player 2", 1000, 500);
    text("Shoot: Down", 1000, 600);
    text("Boost: Up", 1000, 700);
    text("Steer: Left + Right", 1000, 800);

    rect(200, 100, 300, 100);
    fill(0);
    text("Back", 90, 140);
  } else if (stage ==1) {



    background(0);
    fill(255);
    text(frameRate, 800, 200);

    if (frameCount%30==0)
    {
      bulletbuffer1=true;
      bulletbuffer2=true;
    }

    pushMatrix();
    noStroke();
    for (int i=0; i<800; i++)
    {
      rect(stars[i], stars2[i], stars3[i], stars3[i]);
    }
    popMatrix();

    for (Bullets b1 : p1Bullets) {
      b1.render();
      b1.update();
    }
    for (Bullets b2 : p2Bullets) {
      b2.render();
      b2.update();
    }
    Iterator<Bullets> it1 = p1Bullets.iterator();
    while (it1.hasNext()) {
      Bullets b = it1.next();
      if (b.location.x > 1920 || b.location.x < 0) {
        it1.remove();
      }
      Iterator<Enemy> it5 = Enemies.iterator();
      while (it5.hasNext()) {
        Enemy e = it5.next();
        if(25 > dist(e.location.x+25, e.location.y-25, b.location.x, b.location.y)) {
          it5.remove();
          it1.remove();
        }
      }
    }
    Iterator<Bullets> it2 = p2Bullets.iterator();
    while (it2.hasNext()) {
      Bullets b2 = it2.next();
      if (b2.location.x > 1920 || b2.location.x < 0) {
        it2.remove();
      }
    }
    Iterator<ParticleSystem> it3 = systems.iterator();
    while (it3.hasNext()) {
      ParticleSystem p = it3.next();
      if (test%2==0) {
        p.origin.x = p1.location.x - (p1.velocity.mag()*sin(p1.angle))*15;
        p.origin.y = p1.location.y + (p1.velocity.mag()*cos(p1.angle))*15;
      } else if (test%2==1) {
        p.origin.x = p2.location.x - (p2.velocity.mag()*sin(p2.angle))*15;
        p.origin.y = p2.location.y + (p2.velocity.mag()*cos(p2.angle))*15;
      }
      test++;
    }



    if (frameCount%120 == 0) {
      float fasf = random(0, 1);
      if ( fasf < 0.5) {
        PowerUps.add(new Powerup(new PVector(random(100, 1820), random(100, 980))));
      }
    }

    if (frameCount%100 == 0) {
      Enemies.add(new Enemy(0));
    }

    for (Enemy en : Enemies) {
      en.render();
      en.update();
    }

    p1.render();
    p2.render();
    controls();


    for (ParticleSystem ps : systems) {
      ps.addParticle();
      ps.run();
    }


    p1.update();
    p2.update();




    for (Powerup pu : PowerUps) {
      pu.render();
    }

    Iterator<Powerup> it4 = PowerUps.iterator();

    while (it4.hasNext()) {
      Powerup pow = it4.next();
      if (50 > sqrt(sq(p1.location.x-pow.location.x)+sq(p1.location.y-pow.location.y)))
      {
        if (pow.type == 1&& p1.ammo<100)
        {
          p1.ammo= p1.ammo+10;
          it4.remove();
        }
        if (pow.type == 2)
        {
          p1.boost= p1.boost+50;
          it4.remove();
        }
      }

      if (50 > dist(p2.location.x, p2.location.y, pow.location.x, pow.location.y) )
      {
        if (pow.type == 1 && p2.ammo<100)
        {
          p2.ammo= p2.ammo+10;
          it4.remove();
        }
        if (pow.type == 2)
        {
          p2.boost= p2.boost+50;
          it4.remove();
        }
      }
    }
    HUD();
  }
}
