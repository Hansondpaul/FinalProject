public class Coin implements Placeable // replace placeable with block if you are unsure if we should use placeable
{
  private PVector location;
  private PVector size;
  private int order;
  private boolean revealed;
  
  public void reveal() {revealed = true;}
  public PVector getSize() {return size;}
  public PVector getLocation() {return location;}
  public boolean getReveal() {return revealed;}
  public int getOrder() {return order;}
  
  public Coin(PVector firstLocation, int order)
  {
    location = firstLocation;
    order = this.order;
    revealed = true;
    size = new PVector(50,50);
  }
  
  public Coin(PVector firstLocation, int order, boolean collected)
  {
    location = firstLocation;
    order = this.order;
    revealed = collected;
    size = new PVector(50,50);
  }
  
  public void drawBlock()
  {
   stroke(#00FFFF);
   ellipse(getLocation().x, getLocation().y, getSize().x, getSize().y); 
  }
  
  public boolean colidesWith(int x, int y)
  {
    boolean result = distance(x,y,(int)getLocation().x, (int)getLocation().y) < getSize().x/2;
    if( result == true ) revealed = false;
    return result;
  }
  
}
