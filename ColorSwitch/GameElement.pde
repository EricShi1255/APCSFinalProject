public class GameElement {
  private int x, y, dy;
  private color colorful;
  
  //placeholder return values for now
  public GameElement() {
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public void setColor(color c) {
    colorful = c;
  }
  public boolean isCollided() {
    return true;
  }
  public void move() {
  }
  
  
    
}
