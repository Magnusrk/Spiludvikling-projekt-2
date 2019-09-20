//Import processing/java libraries 
import java.util.Iterator;
import processing.sound.*;
//Sound files
SoundFile blast;
SoundFile enemydeath;
SoundFile playerdeath;
SoundFile music;
//Font used for EVERYTHING
PFont font100;
ArrayList<Enemy> Enemies;
ArrayList<Enemy> Enemies2;
ArrayList<Bullets> p1Bullets;
ArrayList<Bullets> p2Bullets;
ArrayList<Powerup> PowerUps;
ArrayList<ParticleSystem> systems;
Player p1; 
Player p2; 
int particleDecider;
int stage;
float[] stars;
float[] stars2;
float[] stars3;
void setup() {
  p1 = new Player(new PVector(500, 700), #FF0303, 1);
  p2 = new Player(new PVector(1920-500, 700), #06CB2C, 2);
  particleDecider = 0;
  stage = 0;
  fullScreen();
  stars = new float[800];
  stars2 =  new float[800];
  stars3 = new float[800];

  font100 = loadFont("font100.vlw");
  blast = new SoundFile(this, "blast.mp3");
  enemydeath = new SoundFile(this, "enemydeath.mp3");
  playerdeath = new SoundFile(this, "playerdeath.mp3");
  music = new SoundFile(this, "music.mp3");
  music.play();
  systems = new ArrayList<ParticleSystem>();
  Enemies = new ArrayList<Enemy>();
  frameRate(60);
  p1Bullets = new ArrayList<Bullets>();
  p2Bullets = new ArrayList<Bullets>();
  PowerUps = new ArrayList<Powerup>();
  Enemies2 = new ArrayList<Enemy>();
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
  endGame();
  setStages();
  if (stage == 1) 
  {
    background(0);
    //load controls
    controls();
    //Determines wheter the player can shoot
    if (frameCount%30==0)
    {
      bulletbuffer1=true;
      bulletbuffer2=true;
    }
    //Spawns powerups
    if (frameCount%120 == 0) {
      float fasf = random(0, 1);
      if ( fasf < 0.5) {
        PowerUps.add(new Powerup(new PVector(random(100, 1820), random(100, 980))));
      }
    }
    //Spawns enemies
    if (frameCount%100 == 0) {
      float random = random(0, 1);
      if (random < 0.5) {
        Enemies.add(new Enemy(0));
      } else {
        Enemies.add(new Enemy(1));
      }
    }
    //Generates Stars
    pushMatrix();
    noStroke();
    for (int i=0; i<800; i++)
    {
      fill(255);
      rect(stars[i], stars2[i], stars3[i], stars3[i]);
    }
    popMatrix();
    //Renders elements(Enemies, powerups, bullets and players)
    renderElements();
    //Control collisions with enemies players and bullets


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
    Iterator<Enemy> it7 = Enemies2.iterator();
    while (it7.hasNext()) {
      Enemy e3 = it7.next();
      if (e3.type == 0 && 50 > dist(p1.location.x, p1.location.y, e3.location.x+25, e3.location.y-25)) {
        bulletbuffer1 = false;
        it7.remove();
        p1.shields--;
        //Player 2 collision with enemy type 0
      } else if (e3.type == 0 && 50 > dist(p2.location.x, p2.location.y, e3.location.x+25, e3.location.y-25)) {
        bulletbuffer2 = false;
        it7.remove();
        p2.shields--;
      }
      //Player 2 collision with enemy type 1
      else if (e3.type == 1 && 85 > dist(p2.location.x, p2.location.y, e3.location.x, e3.location.y)) {
        bulletbuffer2 = false;
        it7.remove();
        p2.shields--;
      }
      //Player 1 collision with enemy type 1
      else if (e3.type == 1 && 85 > dist(p1.location.x, p1.location.y, e3.location.x, e3.location.y)) {
        bulletbuffer1 = false;
        it7.remove();
        p1.shields--;
      }
      //Iterates through player 2 bullets to check collisions with enemies
      Iterator<Bullets> it8 = p2Bullets.iterator();
      while (it8.hasNext()) {
        Bullets b3 = it8.next();
        //Check if bullets have left the screen
        if (b3.location.x > 1920 || b3.location.x < 0) {
          it8.remove();
        }
        //bullet collisions with type 0 enemies
        if (e3.type == 0 && 25 > dist(e3.location.x+25, e3.location.y-25, b3.location.x, b3.location.y)) {
          it7.remove();
          it8.remove();
          p2.score = p2.score + e3.award;
          //bullet collisions with type 1 enemies
        } else if (e3.type == 1 && 55 > dist(e3.location.x, e3.location.y, b3.location.x, b3.location.y)) {
          it7.remove();
          it8.remove();
          p2.score = p2.score + e3.award;
        }
      }
      Iterator<Bullets> it9 = p1Bullets.iterator();
      while (it9.hasNext()) {
        Bullets b4 = it9.next();
        //Check if bullets have left the screen
        if (b4.location.x > 1920 || b4.location.x < 0) {
          it9.remove();
        }
        //bullet collisions with type 0 enemies
        if (e3.type == 0 && 25 > dist(e3.location.x+25, e3.location.y-25, b4.location.x, b4.location.y)) {
          it7.remove();
          it9.remove();
          p1.score = p1.score + e3.award;
          //bullet collisions with type 1 enemies
        } else if (e3.type == 1 && 55 > dist(e3.location.x, e3.location.y, b4.location.x, b4.location.y)) {
          it7.remove();
          it9.remove();
          p1.score = p1.score + e3.award;
        }
      }
    }


    //Iterates through enemies to check for collisions
    Iterator<Enemy> it6 = Enemies.iterator();
    while (it6.hasNext()) {
      Enemy e = it6.next();
      //Iterates through player 2 bullets to check collisions with enemies
      Iterator<Bullets> it2 = p2Bullets.iterator();
      while (it2.hasNext()) {
        Bullets b2 = it2.next();
        //Check if bullets have left the screen
        if (b2.location.x > 1920 || b2.location.x < 0) {
          it2.remove();
        }
        //bullet collisions with type 0 enemies
        if (e.type == 0 && 25 > dist(e.location.x+25, e.location.y-25, b2.location.x, b2.location.y)) {
          it6.remove();
          it2.remove();
          p2.score = p2.score + e.award;
          //bullet collisions with type 1 enemies
        } else if (e.type == 1 && 55 > dist(e.location.x, e.location.y, b2.location.x, b2.location.y)) {
          it6.remove();
          it2.remove();
          p2.score = p2.score + e.award;
          Enemies2.add(new Enemy(0, new PVector(1, 1), e.location.get()));
          Enemies2.add(new Enemy(0, new PVector(1, -1), e.location.get()));
          Enemies2.add(new Enemy(0, new PVector(-1, 1), e.location.get()));
          Enemies2.add(new Enemy(0, new PVector(-1, -1), e.location.get()));
        }
      }
    }
    Iterator<ParticleSystem> it3 = systems.iterator();
    while (it3.hasNext()) {
      ParticleSystem p = it3.next();
      if (particleDecider%2==0) {
        p.origin.x = p1.location.x - (p1.velocity.mag()*sin(p1.angle))*15;
        p.origin.y = p1.location.y + (p1.velocity.mag()*cos(p1.angle))*15;
      } else if (particleDecider%2==1) {
        p.origin.x = p2.location.x - (p2.velocity.mag()*sin(p2.angle))*15;
        p.origin.y = p2.location.y + (p2.velocity.mag()*cos(p2.angle))*15;
      }
      particleDecider++;
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
    HUD();
  }
}
