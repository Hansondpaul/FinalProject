public class Island
{
  Level[] world;
  Map<Level,PVector> levelMarkers;
  public Island(){
    levelMarkers = new HashMap<Level,PVector>();
    world = new Level[2];
    world[0] = getLevel(0);
    world[1] = getLevel(1);
    levelMarkers.put(world[0], new PVector(100,100));
    levelMarkers.put(world[1], new PVector(width/2,height/2));
    
  }
  
  public void drawIsland()
  {
    fill(#c2b280);
    noStroke();
    ellipseMode(CENTER);
    ellipse(width/2, height/2, 450, 450);
    fill(#7ec850);
    ellipse(width/2, height/2, 400,400);
   
    for(int level = 0; level < world.length; level++)
    {
      drawLevelMarker((int)levelMarkers.get(world[level]).x, (int)levelMarkers.get(world[level]).y, world[level].isCleared());
    }
    drawLevelMarker(width/2,height/2, false);
  }
  
  private void drawLevelMarker(int x, int y, boolean complete){
    stroke(0);
    if(overButton(x,y,20))
      stroke(#FFFF00);
    strokeWeight(2);
    fill(#FF0000);
    if(complete) fill(#0000FF);
    ellipseMode(CENTER);
    ellipse(x,y,20,20);
  }
  
  /*
  * returns the requested level
  */
  public Level getLevel(int num){
    Level tempL = new Level(0);
    tempL.map=loadMapData("map"+num);
    return tempL;  
  }
  
  //Option 3 return 2d array with name of file inputted
  Placeable[][] loadMapData(String name){
    File temp = new File("C:\\Users\\Douglas Hanson\\Desktop\\FinalProject-master\\Project_Atoll\\data\\"+name+".dat");
    if(true){
      try{
        Scanner scan = new Scanner(temp);
        String[] size = scan.nextLine().split("-");
        Placeable[][] map = new Placeable[parseInt(size[0])][parseInt(size[1])];
        while(scan.hasNext()){
          size = scan.nextLine().split(" ");
          for(String s : size){
            String[] data = s.split("_");
            switch(parseInt(data[2])){
              case 0: map[parseInt(data[0])][parseInt(data[1])] = null; break;
              case 1: map[parseInt(data[0])][parseInt(data[1])] = new Ground(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              case 2: map[parseInt(data[0])][parseInt(data[1])] = new Platform(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              case 3: map[parseInt(data[0])][parseInt(data[1])] = new Ground(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),false); break;
              case 4: map[parseInt(data[0])][parseInt(data[1])] = new Platform(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),false); break;
              case 5: map[parseInt(data[0])][parseInt(data[1])] = new Box(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              default: map[parseInt(data[0])][parseInt(data[1])] = null; break;
            }
          }          
        }scan.close(); return map; 
      }catch(FileNotFoundException e){
        println("File not found");
      }catch(Exception e){
        e.printStackTrace();
      }
    }return null;     
  }
    
}
