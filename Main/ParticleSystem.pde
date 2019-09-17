class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float R = 0;
  float G = 0;
  float B = 0;
  float c = 0;

  ParticleSystem(PVector loc, int r, int g, int b) {
    particles = new ArrayList<Particle>();
    origin = loc.get();
    R = r;
    G = g;
    B = b;
  }

  void addParticle() {
    particles.add(new Particle(origin, R, G, B));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  } 
}
