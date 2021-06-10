public class Bouncy extends GameElement {
  private int score;
  private int ay;
  private int x,y,dy;
  private color colorful;
  
  public Bouncy(int xcor, int ycor, color COLOR) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = -5;
    ay = 1;
    score = 0;
  }
  
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public color getColor() {
     return colorful;
  }
  
  public void display() {
    fill(colorful);
    stroke(colorful);
    circle(x,y,50);
    stroke(0);
  }
  
  public void displayScore() {
    stroke(WHITE);
    fill(WHITE);
    
    //square(620, 50,100,70);
    
    circle (80, 100, 75);
    //rect(200,108,100,5,5);
    //rect(400,108,100,5,5);
    fill(20);
    circle (80, 100, 70);
    fill(WHITE);
    textSize(32);
    textAlign(CENTER);
    text(score, 80, 110);
    
    //reset stroke
    stroke(0);
    
    //marks for hover limit
    circle(0,850,10);
    circle(700,850,10);
  }
  public void addScore() {
    score++;
  }
  public int getScore() {
    return score;
  }
  public void setColor(color c) {
    colorful = c;
  }
  public void resetDy() {
    dy = -15;
  }
  public void move() {
    //bouncing
    y += dy; 
    dy += ay;
    
    if (y > 900 && !startgame) {
      dy = -20;
    }
    //colors
  }
  
}
