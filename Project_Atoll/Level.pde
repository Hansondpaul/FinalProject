public class Level
{
   Placeable[][] map;
   private boolean cleared = false;
   private int levelTheme;
   private PVector startLocation/* = new PVector(0,0)*/;
   
   Level(int theme){levelTheme = theme;}
   Placeable[][] getMap(){ return map; }

   public boolean isCleared() {return cleared;}
   public int getTheme() {return levelTheme;}
   public PVector getLocation(){return startLocation;}
   public void setLocation(PVector l){startLocation=l;}
   public void cleared() {cleared = true;}
   public void drawBlocks()
   {    
     for(Placeable[] row: map)
       for(Placeable b: row)
         if(b != null && b instanceof Placeable) b.drawBlock(); 
   }
    
   public void drawBackground()
   {
     switch(levelTheme){
       case 0:
       {
         background(#70DDFC);
         break;
       }
       case 1:
       {
         background(0);
         break; 
       }
        
     }
   }
}
