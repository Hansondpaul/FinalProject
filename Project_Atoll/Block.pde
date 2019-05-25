public interface Block
{
  PVector location = new PVector(); //the blocks location
  public void drawBlock(); //draws the block to the screen
  public boolean collidesWith(int x, int y); //checks if the block collides with the point
}
