void renderElements() {
      //Render and update player 1 bullets
    for (Bullets b : p1Bullets) {
      b.render();
      b.update();
    }
    //Render and update player 2 bullets
    for (Bullets b : p2Bullets) {
      b.render();
      b.update();
    }
    //Render and update enemies
    for (Enemy e2 : Enemies2) {
      e2.render();
      e2.update();
    }
    //Render and update enemies
    for (Enemy en : Enemies) {
      en.render();
      en.update();
    }
    //Render and update players
    p1.render();
    p2.render();
    p1.update();
    p2.update();

    //Update particlesystems
    for (ParticleSystem ps : systems) {
      ps.addParticle();
      ps.run();
    }
    //Render Powerups
    for (Powerup pu : PowerUps) {
      pu.render();
    }
  
}
  
