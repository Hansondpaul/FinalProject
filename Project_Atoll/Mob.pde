public interface Mob //anything mobile, such as the player, projectiles, and enemies.
{
  PVector location; // The location of the mob
  public void drawCharacter(); //draws the mob to the screen
  public boolean colidesWith(int x, int y);
}
