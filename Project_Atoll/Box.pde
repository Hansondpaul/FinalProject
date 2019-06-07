public class Box implements Placeable
{
  
  PVector location = new PVector(); // The location of the mob
  PVector size;
  int weight;
  private boolean reveal;
  
  public Box(PVector startLocation)
  {
    location = startLocation;
    size = new PVector(40,40);
    weight = 1;
    reveal = true;
  }
  
  public Box(PVector startLocation, int startWeight)
  {
    location = startLocation;
    size = new PVector(40,40);
    weight = startWeight;
    reveal = true;
  }
  
  public void reveal() {}
  
  public boolean getLevelEnd(){return false;}
  public PVector getLocation() {return location;}
  public boolean getReveal() {return reveal;}
  public PVector getSize() {return size;}
  
  public void drawBlock() //draws the mob to the screen
  {
    fill(0);
    rect(location.x,location.y, size.x, size.y);
  }
  
  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size.x && y>=location.y && y<=location.y+size.y;
  }
  
}
