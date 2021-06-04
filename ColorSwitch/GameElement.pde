public class GameElement {
  private int x, y, dy;
  private color colorful;
  
  //placeholder return values for now
  public GameElement(int xcor, int ycor, color COLOR) {
    x = xcor;
    y = ycor;
    colorful = COLOR;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int iscollide(int ix, int iy) {
    //return true;
    return(abs(y-iy));
      
  }
  public void move() {
    
  }
  
  //cutting off entire class for now;  
}
