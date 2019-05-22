public class Level{
   Block[][] map = {{null,null,null,null,null},
                    {null,null,null,null,null},
                    {null,null,null,null,null},
                    {null,null,null,null,null},
                    {new Ground(new PVector(0,50)),new Ground(new PVector(50,50)),new Ground(new PVector(100,50)),new Ground(new PVector(150,50)),new Ground(new PVector(200,50))}};
   boolean cleared = false;
   
   
   Level(int x, int y){
   }

   public void drawBlocks()
   {
      for(Block[] row: map)
        for(Block b: row) 
          if(b != null) b.drawBlock();
      
    }
}
