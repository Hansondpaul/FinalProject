public class Box implements Mob
{
  
  PVector location = new PVector(); // The location of the mob
  int size;
  int weight;
  
  public Box(PVector startLocation)
  {
    location = startLocation;
    size = 40;
    weight = 1;
  }
  public Box(PVector startLocation, int startWeight)
  {
    location = startLocation;
    size = 40;
    weight = startWeight;
  }
  
  public PVector getLocation()
  {
   return location; 
  }
  
  public void drawPlayer() //draws the mob to the screen
  {
    fill(0);
    rect(location.x,location.y, size, size);
  }
  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size && y>=location.y && y<=location.y+size;
  }
  
}
