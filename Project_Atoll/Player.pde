public class Player implements Mob
{
  PVector location; //the location of the player
  PVector speed; //the players speed
  private int Xsize;
  private int Ysize;
  Block[][] map; //imported colision map
  
  public void setColideMap(Block[][] input) {map = input;}
  public PVector getlocation(){return location;}
  
  /*
  *  constructor
  */
  public Player(PVector Startinglocation)
  {
    location = Startinglocation;
    speed = new PVector(0,0);
    Xsize = 40;
    Ysize = 80;
    map = new Block[0][0];
  }

  public void drawPlayer()
  {
    stroke(0);
    fill(#FF0000);
    rect(location.x,location.y,40,80);
  }
  
  public void updatePlayer()
  {
    speed.y += 0.1; //increase the speed of the player or decelerate downward movement
    if(isGrounded()) speed.y = 0; //reset the speed
     
    location.x += speed.x;
    location.y += speed.y;
  }
  
  public void jump(){
    if(isGrounded()) speed.y -= 8;
  }
  
  
  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+Xsize && y>=location.y && y<=location.y+Ysize;
  }
  
  public boolean isGrounded()
  {
    boolean result = false;
    for(Block[] row: map)
      for(Block b: row)
        if(b != null && b.collidesWith((int)location.x+20, (int)location.y+80) && speed.y>=0) result = true;//if the player is moving down and is on ground level
    return result;
  }
   
}
