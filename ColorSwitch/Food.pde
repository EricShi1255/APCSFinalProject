public class Food extends GameElement{
  private int x, y, dy;
  private color colorful;
  
  public Food(int xcor, int ycor, color COLOR) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = 5;
  }
  public Food(int xcor, int ycor) {
    super(xcor,ycor);
    x = xcor;
    y = ycor;
    int rnd = new Random().nextInt(colors.length);
    colorful = colors[rnd];
    dy = 5;
  }
  
   public void display() {
    fill(colorful);
    circle(x,y,20);
  }
  
  public boolean iscollide(int ix, int iy) {
    return(abs(x-ix) < 20 && abs(y-iy) < 20);
  }
  
  public void move() {
    y += dy;
  }
  
}
