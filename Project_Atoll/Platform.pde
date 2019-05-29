public class Platform implements Block
{
  PVector location;
  int xSize;
  int ySize;
  boolean revealed;
  
  public Platform(PVector location1, boolean shown)
  {
    location = location1;
    xSize = 50;
    ySize = 10;
    revealed = shown;
  }
  
  public Platform(PVector location1)
  {
    location = location1;
    xSize = 50;
    ySize = 10;
  }
  
  public void reveal(){ revealed=true; }
  
  public PVector getLocation() {return location;}
  
  public void drawBlock()
  {
    noStroke();
    fill(#B4B4B4);
    rect(location.x,location.y, xSize, ySize);
  }

  public boolean collidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+xSize && y>=location.y && y<=location.y+ySize;
  }
}
