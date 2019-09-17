import java.util.Iterator;
ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
void setup() {
  fullScreen();
  systems = new ArrayList<ParticleSystem>();
  frameRate(60);
  systems.add(new ParticleSystem(new PVector(p1.location.x, p1.location.y+40), 255, 108, 10));
  systems.add(new ParticleSystem(new PVector(p2.location.x, p2.location.y+40), 255, 108, 10));
}



void draw() {
  background(0);
  fill(255);
  text(frameRate, 600, 600);
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.run();
  }
    p1.render();
    p2.render();
}
