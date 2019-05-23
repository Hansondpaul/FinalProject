public class Level{
   Block[][] map = {{null,null,null,null,null},
                    {null,null,null,null,null},
                    {null,null,null,null,null},
                    {null,null,null,null,null},
                    {new Ground(new PVector(0,500)), new Ground(new PVector(50,550)), new Ground(new PVector(100,550)), new Ground(new PVector(150,550)), new Ground(new PVector(200,550))}};
   private boolean cleared = false;
   private int levelTheme;
   
   Level(int theme){
     levelTheme = theme;
   }
   
   public boolean isCleared(){return cleared;}
   public int getTheme(){return levelTheme;}
   
   public void drawBlocks()
   {
      for(Block[] row: map)
        for(Block b: row) 
          if(b != null) b.drawBlock();
      
    }
}
