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
    circle(x,y,50);
  }
  
  public void displayScore() {
    textSize(32);
    fill(WHITE);
    text(score, 350, 100);
  }
  public boolean isDead() {
    return false;
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
    dy = -20;
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
