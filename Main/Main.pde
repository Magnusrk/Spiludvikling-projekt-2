//Import processing/java libraries 
import java.util.Iterator;
import processing.sound.*;
//Sound files
SoundFile blast;
SoundFile enemydeath;
SoundFile playerdeath;
SoundFile music;
//Font
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
float wut;
void setup() {
  p1 = new Player(new PVector(500, 700), #FF0303, 1);
  p2 = new Player(new PVector(1920-500, 700), #06CB2C, 2);
  particleDecider = 0;
  stage = 0;
  fullScreen();
  stars = new float[800];
  stars2 =  new float[800];
  stars3 = new float[800];
  wut = 255;
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
  //Initializes stars
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
    //Design for main game
    background(0);
    rectMode(CORNERS);
    noStroke();
    fill(255, 0, 0, 100);
    rect(0,0,1920, 10);
    rect(0,0,10, 1080);
    rect(0,1080, 1920, 1070);
    rect(1920, 1080,1910, 0);
    rectMode(CENTER);
    //Load controls
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
    doCollision();
    //Determines location of particlesystems behind player models
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
    //Displays HUD over the rest of the game
    HUD();
  }
}
