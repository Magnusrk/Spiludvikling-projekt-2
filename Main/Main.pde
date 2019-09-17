import java.util.Iterator;
ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
void setup() {
  fullScreen();
  systems = new ArrayList<ParticleSystem>();
}



void draw() {
  background(0);
  p1.render();
  p2.render();
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.run();
  }
}
