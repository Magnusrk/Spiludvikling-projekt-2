import java.util.Iterator;
int counter = 0;
ArrayList<Bullets> p1Bullets;
ArrayList<Bullets> p2Bullets;
ArrayList<Powerup> PowerUps;
ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
Powerup pow1 = new Powerup();
float test = 0;

int stage =0;

float[] stars = new float[800];
float[] stars2 = new float[800];
float[] stars3 = new float[800];

void setup() {
  fullScreen();
  systems = new ArrayList<ParticleSystem>();
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
    background(255);
  }
  else 
  {
    
  }
  
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





  pow1.render();

  if (50 > sqrt(sq(p1.location.x-pow1.location.x)+sq(p1.location.y-pow1.location.y)))
  {
    p1.ammo= p1.ammo+10;
  }

  if (50 > sqrt(sq(p2.location.x-pow1.location.x)+sq(p2.location.y-pow1.location.y)))
  {
    p2.ammo= p2.ammo+10;
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



  HUD();
  for (Powerup pu : PowerUps) {
    pu.render();
  }

  if (frameRate%120==0) {
    PowerUps.add(new Powerup());
  }
}
