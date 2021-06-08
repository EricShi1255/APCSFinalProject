import java.util.Random;

public class Obstacle extends GameElement {
  private int x, y, dy;
  private color colorful;
 
  // 0 --> none 1 --> horizontal 2 --> rotational
  private int orient;
  
  public Obstacle(int xcor, int ycor, color COLOR, int orienta) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = 5;
    orient = orienta;
  }
  //no color given, so random one is chosen
  public Obstacle(int xcor, int ycor) {
    super(xcor,ycor);
    x = xcor;
    y = ycor;
    int rnd = new Random().nextInt(colors.length);
    colorful = colors[rnd];
    dy = 5;
    orient = 0;
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
    return(abs(x-ix) < 30 && abs(y-iy) < 30);
  }
  
  public void display() {
    fill(colorful);
    circle(x,y,50);
    //rect(x,y,80,50);
  }
  
  public void display2() {
    fill(colorful);
    //circle(x,y,50);
    rect(x,y,80,50);
  }
  
  //y-direction movement
  public void move() {
    y += dy;
  }
  //x-direction movement
  public void moveB() {
    x += dy;
    if (x > 700) {
      x = 0;
    }
  }
  public void move(int nx, int ny) {
    x = nx;
    y = ny;
  }
  
}
