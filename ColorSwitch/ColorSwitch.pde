GameElement[] elements = {};
Bouncy[] bouncies = {};
Food[] foodies = {};
Obstacle[] obstacles = {};
void setup() {
  size(700,1000);
  background(50);
  Bouncy A = new Bouncy(500,500,0);
  A.display();

  System.out.println(A.getX());
  
}
void draw() {
  
  setup();
  
}
void mousePressed() {}
void keyPressed() {}
