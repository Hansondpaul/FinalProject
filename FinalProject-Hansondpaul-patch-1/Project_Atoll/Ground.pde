public class Ground implements Placeable
{
  PVector location;
  int size;
  boolean revealed;
  
  public Ground(PVector location1, boolean shown)
  {
    location = location1;
    size = 50;
    revealed = shown;
  }
  
  public Ground(PVector location1)
  {
    location = location1;
    size = 50;
    revealed = true;
  }

  public void reveal() {revealed=true;}

  public PVector getLocation() {return location;}
  public boolean getReveal() {return revealed;}
  public PVector getSize() {return new PVector(size, size);}
  
  public void drawBlock()
  {
    noStroke();
    fill(#74F262);
    rect(location.x,location.y, size, size);
  }

  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size && y>=location.y && y<=location.y+size;
  }
}
