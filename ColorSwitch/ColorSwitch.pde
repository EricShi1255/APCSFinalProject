GameElement[] elements = {};
ArrayList<Bouncy> bouncies = new ArrayList<Bouncy>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Food> foodies = new ArrayList<Food>();

color WHITE = color(255);
color BLUE = color(0,0,255);
int mousepressed = 0;


void setup() {
  size(700,1000);
  background(20);
  
  Bouncy A = new Bouncy(350,750, WHITE);
  bouncies.add(A);
  
  Obstacle B = new Obstacle(350, 200, BLUE); 
  obstacles.add(B);
   
}

void newObstacle() {
  if (Math.random() > 0.99) {
    Obstacle B = new Obstacle(350, 200); 
    obstacles.add(B);
  }
}
 
void draw() {
  background(20);
  newObstacle();
  
  Bouncy curr = bouncies.get(bouncies.size()-1);
  curr.move();
  
  
  int currX = curr.getX();
  int currY = curr.getY();
  
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle blockade = obstacles.get(i);
    if (mousepressed > 0){
      blockade.move();
      
    }
    
    if (blockade.iscollide(currX, currY)) {
      curr.setColor(BLUE);
    }
    System.out.println(blockade.iscollide(currX, currY));
    System.out.println(curr.getY() + " " + blockade.getY());
 
    blockade.display();
  }
  mousepressed--;
 
  curr.display();
} 

void mousePressed() {
  
}
void keyPressed() {
  //pressing spacebar
  if (keyCode == 32) {
    //number of steps obstacle will drop down
    mousepressed = 20;
  }
    
}
