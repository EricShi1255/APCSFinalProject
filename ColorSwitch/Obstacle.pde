import java.util.Random;

public class Obstacle extends GameElement {
  private int x, y, dy;
  private color colorful;
  
  public Obstacle(int xcor, int ycor, color COLOR) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = 5;
  }
  //no color given, so random one is chosen
  public Obstacle(int xcor, int ycor) {
    super(xcor,ycor);
    x = xcor;
    y = ycor;
    int rnd = new Random().nextInt(colors.length);
    colorful = colors[rnd];
    dy = 5;
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
  public boolean iscollide(int ix, int iy) {
    return(abs(x-ix) < 20 && abs(y-iy) < 20);
  }
  
  public void display() {
    fill(colorful);
    //circle(x,y,50);
    rect(0,y,700,50);
  }
  
  public void move() {
    y += dy;
  }
  
}
