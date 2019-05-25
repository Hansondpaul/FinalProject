public class Player implements Mob
{
  PVector location; //the location of the player
  PVector speed; //the players speed
  private int Xsize;
  private int Ysize;
  Block[][] map; //imported colision map
  private boolean isGrounded;
  private boolean isWalled;
  private boolean isWalledLeft;
  private boolean isBonked;
  
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
    isGrounded = false;
    isWalled = false;
    isWalledLeft = false;
    isBonked = false;
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
    blockColision();
    speed.y += 0.2; //increase the speed of the player or decelerate downward movement
    if(isGrounded)
    {
      speed.y = 0; //reset the speed
      if(speed.x>0) speed.x -=0.5;
      else if(speed.x<0) speed.x+=0.5;
    }
    else
    {
      if(speed.x>0) speed.x -=0.25;
      else if(speed.x<0) speed.x+=0.25;
    }
    
    if(isWalled)
    {
      if(speed.x>0) speed.x -= speed.x;
    } 
    if(isWalledLeft)
    {
     if(speed.x<0) speed.x += abs(speed.x); 
    }
    
    if(isBonked)
    {
      speed.y = 0;
    }
    
    location.x += speed.x;
    location.y += speed.y;
    drawPlayer();
  }
  
  /*
  * Movement
  */
  public void jump()
  {
    if(isGrounded) speed.y -= 10;
  }
  
  public void moveRight()
  {
    if(!isWalled)
      if(speed.x<5) speed.x+= 1;
  }
  
  public void moveLeft()
  {
    if(!isWalledLeft)
      if(speed.x>-5) speed.x-=1;
  }
  
  /*
  * Colision with player
  */
  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+Xsize && y>=location.y && y<=location.y+Ysize;
  }
  
  public void blockColision()
  {
    for(Block[] row: map)
      for(Block b: row)
        if(b != null) 
          {
            isXClipped(b);
            isYClipped(b);         
          }
     isGrounded();
     isWalled();
     isBonked();
  }
  
  /*
  * Testing if the player has hit a wall or is on the floor
  */
  public boolean isGrounded()
  {
    
    boolean result = false;
    for(Block[] row: map)
      for(Block b: row)
        if(b != null) 
          {
            if(b.collidesWith((int)location.x+1, (int)location.y+80) && speed.y>=0) result = true;
            if(b.collidesWith((int)location.x+39, (int)location.y+81) && speed.y>=0) result = true;
          }
    isGrounded = result;
    return result;
  }
  
  public boolean isWalled() 
  {
    boolean result = false;
    boolean result2 = false;
    for(Block[] row: map)
      for(Block b: row)
        if(b != null && !(b instanceof Platform)) 
          {
             if(b.collidesWith((int)location.x, (int)location.y+40)) result2 = true;
             if(b.collidesWith((int)location.x+40, (int)location.y+40)) result = true;
             if(b.collidesWith((int)location.x, (int)location.y)) result2 = true;
             if(b.collidesWith((int)location.x+40, (int)location.y)) result = true;
             if(b.collidesWith((int)location.x, (int)location.y+79)) result2 = true;
             if(b.collidesWith((int)location.x+40, (int)location.y+79)) result = true;
          }
    isWalled = result;
    isWalledLeft = result2;
    return result;
  }
  
  public boolean isBonked()
  {
    boolean result = false;
    for(Block[] row: map)
      for(Block b: row)
        if(b != null && !(b instanceof Platform)) 
          {
            if(b.collidesWith((int)location.x+1, (int)location.y) && speed.y<0) result = true;
            if(b.collidesWith((int)location.x+39, (int)location.y)&& speed.y<0) result = true;
          }
    isBonked = result;
    return result;
  }
  
  
  /*
  * Handleing for when a player clips into a block
  */
  public void isYClipped(Block b)
  {
    if(b.collidesWith((int)location.x+1, (int)location.y+Ysize-1)) location.y -= 1;
    if(b.collidesWith((int)location.x+Xsize-1, (int)location.y+Ysize-1)) location.y -= 1;
  }
  
  public void isXClipped(Block b)
  {
    if(!(b instanceof Platform)){
      if(b.collidesWith((int)location.x+1, (int)location.y+Ysize-1)) location.x += 1;
      if(b.collidesWith((int)location.x+Xsize-1, (int)location.y+Ysize-1)) location.x -= 1;
    }
  }
  
  
   
}
