import java.util.Random;

public class Obstacle extends GameElement {
  private int x, y, dy, dx; //for rectangular
  private int cx, cy; //for polar, coords for center (not 0,0)
  private int r;
  private float theta; //for polar, theta in radians
  private int directn; //-1 --> counterclkwise, 1 --> clockwise
  private color colorful;
 
  // 0 --> none || 1 --> horizontal || 2 --> rotational
  private int orient;
  
  //rectangular
  public Obstacle(int xcor, int ycor, color COLOR, int orienta, int directa, int dx) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = 5;
    orient = orienta;
    /*
    int[] directions = {-1,1};
    int rnd = new Random().nextInt(directions.length);
    directn = directions[rnd];
    */
    directn = directa;
    this.dx = dx;
  }
  
  //polar
  public Obstacle(int xcor, int ycor, color COLOR, int orienta, int xr, float xtheta, int directa) {
    super(xcor,ycor,COLOR);
    cx = xcor;
    cy = ycor;
    colorful = COLOR;
    dy = 5;
    orient = orienta;
    r = xr;
    //theta given in degrees just bc
    theta = xtheta * PI / 180;
    directn = directa;
    
    x = cx + (int)(r * cos(theta)); 
    y = cy + (int)(r * sin(theta));
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
    stroke(colorful);
    fill(colorful);
    circle(x,y,50);
    //rect(x,y,80,50);
    stroke(0);
  }
  
  public void display2() {
    fill(colorful);
    //circle(x,y,50);
    rect(x,y,80,50);
  }
  
  //y-direction movement
  public void moveB() {
    //horizontal x-directional
    if (orient == 1) {
      x += dx * directn;
      if (x > 700) {
        x = 0;
      }
      if (x < 0) {
        x = 700;
      }
    }
    if (orient == 0) {
      //do nothing special
    }
    
    if (orient == 2) {
     
     //swapping to degrees bc
     //i hate radians 
     theta = theta * 180 / PI;
     theta += 1 * directn;
     theta = theta * PI / 180;
      
     //convert & set to rectangular
     x = cx + (int)(r * cos(theta));
     y = cy + (int)(r * sin(theta));  
    }
 
  }
  public void move() {
    //general movement
    if (orient != 2) {
      y += dy;
    }
    if (orient == 2) {
      cy += dy;
    }
  }
  
  public void move(int nx, int ny) {
    x = nx;
    y = ny;
  }
  
}
