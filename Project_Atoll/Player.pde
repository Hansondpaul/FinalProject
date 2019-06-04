public class Player implements Placeable
{
  PVector location; //the location of the player
  PVector speed; //the players speed
  PVector size;
  Placeable[][] map; //imported colision map
  private boolean isGrounded;
  private boolean isWalled;
  private boolean isWalledLeft;
  private boolean isBonked;
  private boolean revealed;
  private int collected;
  
  public void collect() {collected++;}
  public void reveal() {}
  public void setColideMap(Placeable[][] input) {map = input;}
  public PVector getLocation() {return location;}
  public PVector getSpeed() {return speed;}
  public PVector getSize() {return size;}
  public boolean getReveal() {return revealed;}
  public int getCollected() {return collected;}
  /*
  *  constructor
  */
  public Player(PVector Startinglocation)
  {
    location = Startinglocation;
    speed = new PVector(0,0);
    size = new PVector(40,80);
    isGrounded = false;
    isWalled = false;
    isWalledLeft = false;
    isBonked = false;
    map = new Placeable[0][0];
  }

  public void drawBlock()
  {
    stroke(0);
    fill(#FF0000);
    rectMode(CORNER);
    rect(location.x,location.y,size.x,size.y);
  }
  
  public void updatePlayer()
  {
    blockColision(); //check for colision with a block
    
    //speed.y=constrain(speed.y,-7,7);
    
    speed.y += 0.3; //increase the speed of the player or decelerate downward movement
    if(isGrounded) //if the player is on the ground
    {
      speed.y = 0; //reset the Yspeed
      if(speed.x>0) speed.x -=0.5;//then cause horizontal drag
      else if(speed.x<0) speed.x+=0.5;
    }
    else //if they are in the air
    {
      if(speed.x>0) speed.x -=0.25; //cause less horizontal drag
      else if(speed.x<0) speed.x+=0.25;
    }
    
    if(isWalled)//if they are next to a wall to the right
    {
      if(speed.x>0) speed.x -= speed.x; //and moving toward the wall, stop them
    } 
    
    if(isWalledLeft) //same for if they are next to a left wall
    {
     if(speed.x<0) speed.x += abs(speed.x);  // and moving toward it, stop them.
    }
    
    if(isBonked) //if they are hitting the bottom of a block
    {
      speed.y = 0; //stop them moving upward, they can only be bonked if they are moving up
    }
    
    //location.x += speed.x;// move the player
    location.y += speed.y;
    
    drawBlock(); // draw the player to the screen
  }
  
  /*
  * Movement
  */
  public void jump()
  {
    if(isGrounded)// if the player is on the ground
    {
      speed.y-=10; // increase the yspeed
    }
    //if(speed.y<0)
    //  speed.y-=.3;
    //speed.y=constrain(speed.y,-10,10);

  } 
  
  public void moveRight()
  {
    if(!isWalled) // if the player is not next to a wall to the right
      if(speed.x<5) speed.x+= 1; // if they are not moving at max speed, increase speed
  }
  
  public void moveLeft()
  {
    if(!isWalledLeft) // if the player is not next to a wall to the right
      if(speed.x>-5) speed.x-=1; // if they are not moving at max speed, increase speed
  }
  
  /*
  * Colision with player
  */
  public boolean colidesWith(int x, int y)
  {
    return x>=location.x && x<=location.x+size.x && y>=location.y && y<=location.y+size.y;
  }
  
  public void blockColision()
  {
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
    for(Placeable[] row: map)
      for(Placeable b: row)
        if(b != null && b.getReveal()) 
          {
            if(b.colidesWith((int)location.x+1, (int)(location.y+size.y+1)) && speed.y>=0)
            {
              result = true;
              location.y = b.getLocation().y-size.y;
            }
            if(b.colidesWith((int)location.x+39, (int)location.y+81) && speed.y>=0)
            {
              result = true;
              if(location.y < b.getLocation().y) location.y = b.getLocation().y-size.y;
            }
            if((result) && b instanceof Coin){
               result = false;
               collected++;
             }
          }
    isGrounded = result;
    return result;
  }
  
  public boolean isWalled() 
  {
    boolean result = false;
    boolean result2 = false;
    for(Placeable[] row: map)
      for(Placeable b: row)
        if(b != null && !(b instanceof Platform) && b.getReveal())  // for every non null and non platform block
          {  // check to see if they are hitting a wall
             if(b.colidesWith((int)location.x, (int)location.y+40)) result2 = true;
             if(b.colidesWith((int)location.x+40, (int)location.y+40)) result = true;
             if(b.colidesWith((int)location.x, (int)location.y)) result2 = true;
             if(b.colidesWith((int)location.x+40, (int)location.y)) result = true;
             if(b.colidesWith((int)location.x, (int)location.y+79)) result2 = true;
             if(b.colidesWith((int)location.x+40, (int)location.y+79)) result = true;
             if((result || result2) && b instanceof Coin){
               result = false;
               result2 = false;
               collected++;
             }
          }

    isWalled = result; // report the results
    isWalledLeft = result2;
    return result;
  }
  
  public boolean isBonked()
  {
    boolean result = false;
    for(Placeable[] row: map)
      for(Placeable b: row)
        if(b != null && !(b instanceof Platform) && !(b instanceof Coin && !(b.getReveal()) )) // for every non null and non platform block
          { // check to see if they are hitting a block
            if(b.colidesWith((int)location.x+1, (int)location.y) && speed.y<0)
            {
              result = true;
              location.y = b.getLocation().y;
            }
            if(b.colidesWith((int)location.x+39, (int)location.y)&& speed.y<0)
            {
              location.y = b.getLocation().y;
              result = true;
            }
            if(result && !b.getReveal() && !(b instanceof Coin))
            {
              b.reveal();
            }
            if(result && b instanceof Coin){
               result = false;
               collected++;
             }
          }
    isBonked = result;
    return result;
  }
   
}
