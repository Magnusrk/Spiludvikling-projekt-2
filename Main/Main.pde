import java.util.Iterator;
int counter = 0;
ArrayList<Bullets> p1Bullets;
ArrayList<Bullets> p2Bullets;
//ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
Powerup pow1 = new Powerup();

void setup() {
  fullScreen();
  //systems = new ArrayList<ParticleSystem>();
  frameRate(60);
  p1Bullets = new ArrayList<Bullets>();
  p2Bullets = new ArrayList<Bullets>();
  //systems.add(new ParticleSystem(new PVector(p1.location.x, p1.location.y+40), 255, 108, 10));
  //systems.add(new ParticleSystem(new PVector(p2.location.x, p2.location.y+40), 255, 108, 10));
}



void draw() {
  background(0);
  fill(255);
  text(frameRate,800, 200);
  for (Bullets b1 : p1Bullets) {
    b1.render();
    b1.update();
  }
  Iterator<Bullets> it1 = p1Bullets.iterator();
  while (it1.hasNext()) {
    Bullets b = it1.next();
    if (b.location.x > 1920 || b.location.x < 0) {
      it1.remove();
    }
  }

    //for (ParticleSystem ps : systems) {
    //ps.addParticle();
    //ps.run();
    //}


    if (frameCount >200)
    {
      pow1.render();
    }
    p1.render();
    p2.render();
    controls();

    p1.update();
    p2.update();


    HUD();
  }
