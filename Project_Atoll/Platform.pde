public class Platform implements Placeable
{
  private PVector location;
  private PVector size;
  private boolean revealed;
  
  public Platform(PVector location1, boolean shown)
  {
    location = location1;
    size = new PVector(50,10);
    revealed = shown;
  }
  
  public Platform(PVector location1)
  {
    location = location1;
    size = new PVector(50,10);
    revealed = true;
  }
  
  public void reveal(){revealed=true;}
  
  public boolean getLevelEnd() {return false;}
  public PVector getLocation() {return location;}
  public boolean getReveal() {return revealed;}
  public PVector getSize() {return size;}
  
  public void drawBlock()
  {
    noStroke();
    fill(#B4B4B4);
    rect(location.x,location.y, size.x, size.y);
  }

  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size.x && y>=location.y && y<=location.y+size.y;
  }
}
