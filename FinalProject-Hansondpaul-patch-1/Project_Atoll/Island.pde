public class Island
{
  Level[] world;
  Set<Level> keys; 
  Map<Level,PVector> levelMarkers;
  public Island(){
    levelMarkers = new HashMap<Level,PVector>();
    keys = levelMarkers.keySet();
    keys=new HashSet<Level>();
    world = new Level[7];
    keys.add(getLevel(0));
    keys.add(getLevel(1));
    keys.add(getLevel(2));
    world[0] = getLevel(0);
    world[1] = getLevel(1);
    world[2] = getLevel(2);
    world[3] = getLevel(3);
    world[4] = getLevel(4);
    world[5] = getLevel(5);
    world[6] = getLevel(6);
    levelMarkers.put(world[0], new PVector(width/2,height/2));
    levelMarkers.put(world[1], new PVector(width/2+50,height/2-50));
    levelMarkers.put(world[2], new PVector(width/2+25,height/2-125));
    levelMarkers.put(world[3], new PVector(width/2+125,height/2-25));
    levelMarkers.put(world[4], new PVector(width/2-50,height/2+50));
    levelMarkers.put(world[5], new PVector(width/2-25,height/2+125));
    levelMarkers.put(world[6], new PVector(width/2-125,height/2+25));
    
    println(keys);

    //keys.set(0, getLevel(0));
    
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
    File temp = new File("F:\\Project_Atoll\\data\\"+name+".dat");
    if(true){
      try{
        Scanner scan = new Scanner(temp);
        int coinCounter = 0;
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
              case 6: map[parseInt(data[0])][parseInt(data[1])] = new Coin(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),coinCounter); coinCounter++; break;
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
    
    
    public void save(){
        File temp = new File("/Users/779665/Desktop/FinalProject-Hansondpaul-patch-1/Project_Atoll/data/state.dat");
        PrintWriter recorder = createWriter(temp);
        int checkCount = 0;
        
        for(Level l: world)
        {
         //if the level is cleared write 1 else 0
         if(l.isCleared())
         {
           recorder.print("1");
           checkCount++;
         }
         else
           recorder.print("0");
           
         //for every block, if its a coin and is colected, write a 1 else 0
         for(int i = 0; i < l.getMap()[0].length; i++)
           for(int j = 0; i < l.getMap().length; i++)
             if(l.getMap()[i][j] instanceof Coin)
             {
               if(!l.getMap()[i][j].getReveal()) recorder.print("1");
               else 
               {
                 recorder.print("0");
                 checkCount++;
               }
             }
             
          recorder.println("");
        }//for every level
        
        recorder.print(binary(checkCount));
        recorder.flush();
    }
    
    public void load(){
      File temp = new File("/Users/779665/Desktop/FinalProject-Hansondpaul-patch-1/Project_Atoll/data/state.dat");
      try{
      Scanner scan = new Scanner(temp);
      String[] levels = new String[3];
      for(int i = 0; i < levels.length; i++)
      {
        levels[i] = scan.nextLine();
      }
      
      
      scan.close();
      }
      catch(FileNotFoundException e){
       System.out.println("Save File not found"); 
      }
    }
}
