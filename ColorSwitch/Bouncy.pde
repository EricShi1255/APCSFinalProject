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
  }
  
  //placeholder return values for now;
  public void display() {
    fill(colorful);
    circle(x,y,50);
  }
  public boolean isDead() {
    return false;
  }
  public void setScore() {
  }
  public void getScore() {
  }
  public void move() {
    y += dy; 
  }
}
