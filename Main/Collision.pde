//Collision between enemies and friendly bullets
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
//Collision between enemies and player models
void playerEnemyCollision(Player p, int type, float dist, Enemy ene, float displacement, Iterator i) {
  if (ene.type == type && dist > dist(p.location.x, p.location.y, ene.location.x+displacement, ene.location.y-displacement)) {
    bulletbuffer1 = false;
    i.remove();
    p.shields--;
  }
}
//Collection of all collision checks in the game
void doCollision() {
      Iterator<Enemy> EnemyChecker1 = Enemies.iterator();
    while (EnemyChecker1.hasNext()) {
      Enemy e = EnemyChecker1.next();
      //Player 1 collision with enemy type 0
      playerEnemyCollision(p1, 0, 50, e, 25, EnemyChecker1);
      //Player 2 collision with enemy type 0
      playerEnemyCollision(p2, 0, 50, e, 25, EnemyChecker1);
      //Player 2 collision with enemy type 1
      playerEnemyCollision(p2, 1, 85, e, 0, EnemyChecker1);
      //Player 1 collision with enemy type 1
      playerEnemyCollision(p1, 1, 85, e, 0, EnemyChecker1);

      //Iterates through player 1 bullets to check collisions
      Iterator<Bullets> it1 = p1Bullets.iterator();
      while (it1.hasNext()) {
        Bullets b = it1.next();
        //Check if bullets have left the screen
        if (b.location.x > 1920 || b.location.x < 0) {
          it1.remove();
        }
        //Enemy type 0 collision with player 1 bullets
        bulletEnemyCollision(e, b, 0, 25, EnemyChecker1, it1, 25, p1);

        // Enemy type 1 collision with player 1 bullets
        bulletEnemyCollision(e, b, 1, 55, EnemyChecker1, it1, 0, p1);
      }
    }
    //Iterates through new enemies to check for collisions
    Iterator<Enemy> EnemyChecker2 = Enemies2.iterator();
    while (EnemyChecker2.hasNext()) {
      Enemy e = EnemyChecker2.next();
      playerEnemyCollision(p1, 0, 50, e, 25, EnemyChecker2);
      //Player 2 collision with enemy type 0
      playerEnemyCollision(p2, 0, 50, e, 25, EnemyChecker2);
      //Iterates through player 2 bullets to check collisions with enemies
      Iterator<Bullets> it8 = p2Bullets.iterator();
      while (it8.hasNext()) {
        Bullets b3 = it8.next();
        //Check if bullets have left the screen
        if (b3.location.x > 1920 || b3.location.x < 0) {
          it8.remove();
        }

        //bullet collisions with type 0 enemies
        bulletEnemyCollision(e, b3, 0, 25, EnemyChecker2, it8, 25, p2);
      }
      Iterator<Bullets> it9 = p1Bullets.iterator();
      while (it9.hasNext()) {
        Bullets b4 = it9.next();
        //Check if bullets have left the screen
        if (b4.location.x > 1920 || b4.location.x < 0) {
          it9.remove();
        }
        //bullet collisions with type 0 enemies
        bulletEnemyCollision(e, b4, 0, 25, EnemyChecker2, it9, 25, p1);
      }
    }


    //Iterates through enemies to check for collisions
    Iterator<Enemy> EnemyChecker3 = Enemies.iterator();
    while (EnemyChecker3.hasNext()) {
      Enemy e = EnemyChecker3.next();
      //Iterates through player 2 bullets to check collisions with enemies
      Iterator<Bullets> it2 = p2Bullets.iterator();
      while (it2.hasNext()) {
        Bullets b2 = it2.next();
        //Check if bullets have left the screen
        if (b2.location.x > 1920 || b2.location.x < 0) {
          it2.remove();
        }
        //bullet collisions with type 0 enemies
        bulletEnemyCollision(e, b2, 0, 25, EnemyChecker3, it2, 25, p2);
        //bullet collisions with type 1 enemies
        bulletEnemyCollision(e, b2, 1, 55, EnemyChecker3, it2, 0, p2);
      }
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
        if (pow.type == 3 && p1.shields<5)
        {
          p1.shields= p1.shields+1;
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
        if (pow.type == 3 && p2.shields<5)
        {
          p2.shields= p2.shields+1;
          it4.remove();
        }
      }
    }
}
