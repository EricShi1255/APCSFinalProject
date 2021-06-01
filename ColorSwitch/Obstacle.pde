public class Obstacle extends GameElement {
  private int x, y, dy;
  private color colorful;
  
  public Obstacle(int xcor, int ycor, color COLOR) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
  }
  
}
