GameElement[] elements = {};
ArrayList<Bouncy> bouncies = new ArrayList<Bouncy>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Food> foodies = new ArrayList<Food>();

color WHITE = color(255);
color BLUE = color(144, 13, 255);
color YELLOW = color(250, 225, 0);
color RED = color(255, 1, 129);
color TURQ = color(50, 219, 240);
color[] colors = {BLUE, YELLOW, RED, TURQ};

int mousepressed = 0;
boolean startgame = false;
boolean gameover = false;


void setup() {
  size(700,1000);
  background(20);
  
  Bouncy A = new Bouncy(350,750, WHITE);
  bouncies.add(A);
  
  Obstacle B = new Obstacle(350, 200, BLUE); 
  obstacles.add(B);
  
  Food C = new Food(350, 600, BLUE); 
  foodies.add(C);
   
}

void newObstacle() {
  if (Math.random() > 0.993) {
    Obstacle B = new Obstacle(350, 100); 
    obstacles.add(B);
  }
}
void newFood() {
  if (Math.random() > 0.993) {
    Food C = new Food(350, 100); 
    foodies.add(C);
  }
}
void endgame() {
  //if gameover, do something;
}
 
void draw() {
  background(20);
  newObstacle();
  newFood();
  
  Bouncy curr = bouncies.get(bouncies.size()-1);
  curr.move();
  
  
  int currX = curr.getX();
  int currY = curr.getY();
  color ncolor = curr.getColor();
  
  if (currY > 1200) {
    gameover = true;
  }
  
  //dealing with obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle blockade = obstacles.get(i);
    if (mousepressed > 0){
      blockade.move();
    }
    
    if (blockade.iscollide(currX, currY)) {
      if (blockade.getColor() != ncolor || ncolor != WHITE) {
        gameover = true;
      }
    }
 
    blockade.display();
  }
  
  //dealing with food
  for (int i = 0; i < foodies.size(); i++) {
     Food edible = foodies.get(i);
     if (mousepressed > 0){
      edible.move();
     }
     if (edible.iscollide(currX, currY)) {
       curr.setColor(edible.getColor());
     }
     edible.display();
  }
  
  mousepressed--;
  curr.display();
  System.out.println(gameover);
} 

void mousePressed() {
  
}
void keyPressed() {
  //pressing spacebar
  if (keyCode == 32) {
    
    if (!startgame) {
      startgame = true;
    }
    
    //number of steps obstacle will drop down
    mousepressed = 30;
    Bouncy curr = bouncies.get(bouncies.size()-1);
    curr.resetDy();
  }
    
}
