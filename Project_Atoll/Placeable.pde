public interface Placeable
{
  public boolean getReveal();
  public PVector getLocation();
  public PVector getSize();
  public void reveal();
  public void drawBlock(); //draws the mob to the screen
  public boolean colidesWith(int x, int y);
  public boolean getLevelEnd();
}
