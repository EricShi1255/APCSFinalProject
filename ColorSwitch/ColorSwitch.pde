GameElement[] elements = {};
ArrayList<Bouncy> bouncies = new ArrayList<Bouncy>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Food> foodies = new ArrayList<Food>();

color WHITE = color(255);
color BLUE = color(0,0,255);
boolean mousepressed = false;


void setup() {
  size(700,1000);
  background(20);
  
  Bouncy A = new Bouncy(350,750, WHITE);
  bouncies.add(A);
  
  Obstacle B = new Obstacle(350, 500, BLUE); 
  obstacles.add(B);
   
}
 
void draw() {
  background(20);
  
  Bouncy curr = bouncies.get(bouncies.size()-1);
  curr.move();
  curr.display();
  
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle blockade = obstacles.get(i);
    blockade.display();
    if (mousePressed){
      for (int j = 0; j < 100; j++) {
        blockade.move();
        blockade.display();
      }
    }
  }
  
} 
void mousePressed() {
  
}
void keyPressed() {
  if (keyCode == 32) {
    //Bouncy curr = bouncies.get(bouncies.size()-1);
    //curr.setAy();
    for (int i = 0; i < obstacles.size(); i++) {
    Obstacle blockade = obstacles.get(i);
    
    
  }
    
  }
}
