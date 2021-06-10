import java.util.Random;

public class Obstacle extends GameElement {
  private int x, y, dy; //for rectangular
  private int cx, cy; //for polar, coords for center (not 0,0)
  private int r;
  private float theta; //for polar, theta in radians
  private color colorful;
 
  // 0 --> none || 1 --> horizontal || 2 --> rotational
  private int orient;
  
  //rectangular
  public Obstacle(int xcor, int ycor, color COLOR, int orienta) {
    super(xcor,ycor,COLOR);
    x = xcor;
    y = ycor;
    colorful = COLOR;
    dy = 5;
    orient = orienta;
  }
  
  //polar
  public Obstacle(int xcor, int ycor, color COLOR, int orienta, int xr, float xtheta) {
    super(xcor,ycor,COLOR);
    cx = xcor;
    cy = ycor;
    colorful = COLOR;
    dy = 5;
    orient = orienta;
    r = xr;
    //theta given in degrees just bc
    theta = xtheta * PI / 180;
    
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
  public void moveB() {
    //horizontal x-directional
    if (orient == 1) {
      x += dy;
      if (x > 700) {
        x = 0;
      }
    }
    if (orient == 0) {
      //do nothing special
    }
    
    if (orient == -1) {
      //convert to polar
      //centered around: (350,y);
      float diffy = y - 500;
      float diffx = x - 350;
      if (diffx == 0 && diffy > 0) {
        diffx = 0.0000001;
      }
      if (diffx == 0 && diffy > 0) {
        diffx = -0.0000001;
      }
      float theta = atan(diffy / diffx);
      
      int r = (int)( sqrt((x*x - 350*350) + (y*y - 500*500)) );
      
      theta+=0.005;
      //theta = (int)(theta);     
      
     //convert & set to rectangular
     x = x + (int)(r * cos(theta));
     y = y + (int)(r * sin(theta));  
    }
 
  }
  public void move() {
    //general movement
    y += dy;
  }
  
  public void move(int nx, int ny) {
    x = nx;
    y = ny;
  }
  
}
