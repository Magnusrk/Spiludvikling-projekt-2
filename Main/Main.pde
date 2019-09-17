import java.util.Iterator;
int counter = 0;
//ArrayList<ParticleSystem> systems;
Player p1 = new Player(new PVector(500, 700), #FF0303);
Player p2 = new Player(new PVector(1920-500, 700), #06CB2C);
Powerup pow1 = new Powerup();


float[] numbers = new float[1000];
float[] numbers2 = new float[1000];
float[] numbers3 = new float[1000];

void setup() {
  fullScreen();
  //systems = new ArrayList<ParticleSystem>();
  frameRate(60);
  //systems.add(new ParticleSystem(new PVector(p1.location.x, p1.location.y+40), 255, 108, 10));
  //systems.add(new ParticleSystem(new PVector(p2.location.x, p2.location.y+40), 255, 108, 10));
  
    for (int i=0; i<1000; i++)
  {
    numbers[i] = (random(0, 2000));
    numbers2[i] = (random(0, 2000));
    numbers3[i] = (random(1,3));
    
  }
  
}



void draw() {
  background(0);
  fill(255);

  for (int i=0; i<1000; i++)
  {
   rect(numbers[i],numbers2[i],numbers3[i],numbers3[i]);
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
