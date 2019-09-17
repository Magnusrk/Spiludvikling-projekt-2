class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float R = 255;
  float G = 0;
  float B = 0;
  float c = 0;

  ParticleSystem(PVector loc) {
    particles = new ArrayList<Particle>();
    origin = loc.get();
  }

  void addParticle() {
    if (c > 1530) { 
      c = 0;
    }
    if ((c >= 0) && (c < 255)) {
      B = B + 1;
    }
    if ((c >= 255) && (c < 510)) {
      R = R - 1;
    }
    if ((c >= 510) && (c < 765)) {
      G = G + 1;
    }
    if ((c >= 765) && (c < 1020)) {
      B = B - 1;
    }
    if ((c >= 1020) && (c < 1275)) {
      R = R + 1;
    }
    if ((c >= 1275) && (c < 1530)) {
      G = G - 1;
    }
    print(c);
    c++;
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
