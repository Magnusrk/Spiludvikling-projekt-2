Player p1 = new Player(new PVector(500, 500),#FF0303);
Player p2 = new Player(new PVector(700, 500),#06CB2C);
void setup() {
  fullScreen();
  
}



void draw() {
  background(0);
  p1.render();
  p2.render();
}
