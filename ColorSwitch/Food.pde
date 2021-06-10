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
    stroke(colorful);
    fill(colorful);
    circle(x,y,40);
    fill(20);
    circle(x,y,35);
    
    fill(colorful);
    star(x,y,4,10,3);
    
    //circle(x-8.5,y+8.5,20);
    //circle(x+8.5,y+8.5,20);
    
    stroke(0);
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
  public color getColor() {
     return colorful;
  }
  
  public boolean iscollide(int ix, int iy) {
    return(abs(x-ix) < 30 && abs(y-iy) < 30);
  }
  
  public void move() {
    y += dy;
  }
  
  //borrowed from https://processing.org/examples/star.html
  void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
  }
  
}
