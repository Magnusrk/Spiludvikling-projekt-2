void bulletEnemyCollision(Enemy ene, Bullets bul, int type, float dist, Iterator i, Iterator i2, float displacement, Player p) {
  if (ene.type == type && dist > dist(ene.location.x+displacement, ene.location.y-displacement, bul.location.x, bul.location.y)) {
    i.remove();
    i2.remove();
    p.score = p.score + ene.award;
    if (type == 1) {
      Enemies2.add(new Enemy(0, new PVector(1, 1), ene.location.get()));
      Enemies2.add(new Enemy(0, new PVector(1, -1), ene.location.get()));
      Enemies2.add(new Enemy(0, new PVector(-1, 1), ene.location.get()));
      Enemies2.add(new Enemy(0, new PVector(-1, -1), ene.location.get()));
    }
  }
}

void playerEnemyCollision(Player p, int type, float dist, Enemy ene, float displacement, Iterator i) {
  if (ene.type == type && dist > dist(p.location.x, p.location.y, ene.location.x+displacement, ene.location.y-displacement)) {
    bulletbuffer1 = false;
    i.remove();
    p.shields--;
  }
}
