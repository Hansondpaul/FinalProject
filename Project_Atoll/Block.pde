public interface Block
{
  PVector location = new PVector(); //the blocks location
  boolean revealed=false;
  public void drawBlock(); //draws the block to the screen
  public PVector getLocation();
  public boolean collidesWith(int x, int y); //checks if the block collides with the point
  public void reveal();
}
