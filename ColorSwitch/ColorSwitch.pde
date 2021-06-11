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
  
  //Obstacle B = new Obstacle(350, 200, BLUE, 0); 
  //obstacles.add(B);
  
  Food C = new Food(350, 700, BLUE); 
  foodies.add(C);
   
}

void newObstacle() {
  boolean create = true; 
  for (Obstacle element: obstacles) {
    if (element.getY() < 500) {
      create = false;
    }
  }
  for (Food element: foodies) {
    if (element.getY() < 400) {
      create = false;
    }
  }
  if (create) {
   int rand = new Random().nextInt(5);
   //int rand = 4;
   if (rand == 0) {
     int r = 160 + (int)(Math.random() * 100);
     circley(r,1,1);
   }
   if (rand == 1) {
     plusSign();
   }
   if (rand == 2) {
     gate();
   }
   if (rand == 3) {
     gate2();
   }
   if (rand == 4) {
     circley2();
   }
   
   //Obstacle B = new Obstacle(350, 150); 
   //obstacles.add(B);
   //circley();
    //plusSign();
   //gate();
  }
}

void newFood() {
  boolean create = true; 
  for (Food element: foodies) {
    if (element.getY() < 400) {
      create = false;
    }
  }
  for (Obstacle element: obstacles) {
    if (element.getY() < 400) {
      create = false;
    }
  }
  if (create) {
    Food C = new Food(350, 0); 
    foodies.add(C);
  }
}

void endgame() {
  //if gameover, do something;
  obstacles.clear();
  background(20);
  textSize(48);
  textAlign(CENTER);
  text("GAME OVER", 350, 150);
    
  Bouncy curr = bouncies.get(bouncies.size()-1);
  int finalscore = curr.getScore();
  text("Score: " + finalscore, 350, 300);
}
 
void draw() {
  if (!gameover) {
  background(20);
  newObstacle();
  newFood();
  
  Bouncy curr = bouncies.get(bouncies.size()-1);
  curr.move();
  
  
  int currX = curr.getX();
  int currY = curr.getY();
  color ncolor = curr.getColor();
  
  if (currY > 1300) {
    gameover = true;
  }
  
  //dealing with obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle blockade = obstacles.get(i);
    if (mousepressed > 0){
      blockade.move();
    }
    
    if (blockade.iscollide(currX, currY)) {
      if (blockade.getColor() != ncolor && ncolor != WHITE) {
        gameover = true;
      }
    }
    blockade.moveB();
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
       curr.addScore();
       foodies.remove(i);
     }
     if (Math.random() > 0.995) {
      int index = new Random().nextInt(colors.length);
      edible.setColor(colors[index]);
    }
     edible.display();
  }
  
  mousepressed--;
  curr.displayScore();
  curr.display();
  }
  
  if (gameover) {
    endgame();
  }
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
    

    Bouncy curr = bouncies.get(bouncies.size()-1);
    curr.resetDy();
    
    if (curr.getY() < 820) {
      //only starts scrolling when bouncy goes high enough
      //this lets bouncy hover in place when player wants to wait
      //number of steps obstacle will drop down
      mousepressed = 30;
    }
  }  
}

//---obstacle methods below this line---//
public void gate() {
   //double thirdrow = Math.random(); edit: useless, too hard
   int rnd = 0;
   for (int i = 0; i < 12; i++) {
     if (i % 3 == 0) {
       rnd++;
     }
     if (rnd >= 4) {
       rnd = 0;
     }
     Obstacle A = new Obstacle(i*58, -400, colors[rnd], 1,1, 3);
     obstacles.add(A);
     
     Obstacle B = new Obstacle(i*58, 0, colors[rnd], 1,-1, 2);
     obstacles.add(B);
     /*
     if (thirdrow > 0.7) {
       Obstacle C = new Obstacle(i*70, 200, colors[rnd], 1,-1, 3);
       obstacles.add(C);
     }
     */
    
   }
    Food ALOE = new Food(350,-200);
    foodies.add(ALOE);
}

public void gate2() {
   
   //int rnd = 0;
   int rnd = new Random().nextInt(colors.length);
   for (int xcor = 0; xcor < 4; xcor++) { // x coords
     
     for (int i = 0; i < 12; i++) { // y coords
       
       Obstacle A = new Obstacle(200*xcor, i*-10, colors[rnd], 1,1, 3);
       obstacles.add(A);
     
       Obstacle B = new Obstacle(700-(200*xcor), i*-10, colors[rnd], 1,-1, 3);
       obstacles.add(B); 
     }
     rnd++;
     if (rnd >= 4) {
       rnd = 0;
     }
     
   }
}

public void circley(int r, int directa, int rotspeed) {
  //makes a ring with 4 colors || centered around (350, y);
  //int r = 160 + (int)(Math.random() * 100);
  //int index = new Random().nextInt(colors.length);
  int index = 0;
  
  //chance of food in middle of wheel
    if (Math.random() > 0.2) {
      //check if a food is already there first (from circely2) 
      boolean hasfood = false;
      for (Food element: foodies) {
        if (element.getX() == 350 && element.getY() == 0) {
          hasfood = true;
        }
      }
      if (!hasfood) {
        Food ALOE = new Food(350,0);
        foodies.add(ALOE);
      }
      
    }
  
  for (float theta = 0; theta <= 360; theta+=18) {
    //loops through color array
    if (theta % 90 == 0) {
      index++;
    }
    if (index >= 4) {
      index = 0;
    }
    //creates obstacle
    Obstacle A = new Obstacle(350, 0, colors[index], 2, r, theta, directa, rotspeed);
    obstacles.add(A);
  }
}  
public void circley2() {
  //makes a double ring instead of single ring
  circley(200,1,2);
  circley(250,-1,1);
}  

public void plusSign() {
    //makes a plus sign that spins (yeah)/
    //int index = new Random().nextInt(colors.length);
    int index = 0;
    
      for (int r = 50; r <= 150; r += 50) {
      //creates obstacle
        for (int theta = 0; theta < 360; theta+=90) {
          Obstacle A = new Obstacle(533, 0, colors[index], 2, r, theta, -1,1);
          obstacles.add(A);
          index++;
           if (index >= 4) {
             index = 0;
           }
        }
      }
      for (int r = 50; r <= 150; r += 50) {
      //creates obstacle
        for (int theta = 0; theta < 360; theta+=90) {
          Obstacle A = new Obstacle(177, 0, colors[index], 2, r, theta, 1,1);
          obstacles.add(A);
          index++;
            if (index >= 4) {
             index = 0;
           }
        }
      }
     
}
//x
