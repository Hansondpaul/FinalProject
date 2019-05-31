public class Player implements Mob
{
  PVector location;
  private int size;
  public Player(PVector location)
  {
    location = this.location;
    size = 10;
  }

  public void drawCharacter()
  {
  }

  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size && y>=location.y && y<=location.y+size;
  }
  
   
}
