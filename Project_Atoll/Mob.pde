public interface Mob //anything mobile, such as the player, projectiles, and enemies.
{
  PVector location = new PVector(); // The location of the mob
  public void drawPlayer(); //draws the mob to the screen
  public boolean colidesWith(int x, int y);
}
