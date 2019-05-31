public class Island{
  TreeSet<Level> world;
  
  public Island(){
    world = new TreeSet<Level>();
  }
  
  public void drawIsland(){
    fill(#c2b280);
    noStroke();
    ellipseMode(CENTER);
    ellipse(width/2, height/2, 450, 450);
    fill(#7ec850);
    ellipse(width/2, height/2, 400,400);
    
    drawLevelMarker(width/2,height/2, false);
  }
  
  private void drawLevelMarker(int x, int y, boolean complete){
    stroke(0);
    strokeWeight(2);
    fill(#FF0000);
    if(complete) fill(#0000FF);
    ellipseMode(CENTER);
    ellipse(x,y,20,20);
  }
}
