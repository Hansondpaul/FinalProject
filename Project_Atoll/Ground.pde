public class Ground implements Block
{
  PVector location;
  int size;
  
  public Ground(PVector location)
  {
    location = this.location;
    size = 10;
  }

  public void drawBlock()
  {
    
  }

  public boolean collidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size && y>=location.y && y<=location.y+size;
  }
}
