GameElement[] elements = {};
ArrayList<Bouncy> bouncies = new ArrayList<Bouncy>();
Food[] foodies = {};
Obstacle[] obstacles = {};

void setup() {
  size(700,1000);
  background(20);
  
  color neutral = color(255);
  Bouncy A = new Bouncy(350,750, neutral);
  bouncies.add(A);
   
}
 
void draw() {
  
  Bouncy curr = bouncies.get(bouncies.size()-1);
  curr.move();
  curr.display();
  
} 
void mousePressed() {}
void keyPressed() {}
