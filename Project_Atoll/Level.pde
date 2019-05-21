public class Level{
   Block[][] map;

   Level(int x, int y){
      map = new Block[x][y];
   }

   public void drawBlocks()
   {
      int i = 0; int j = 0;
      //TODO write the loop
      for(;;/*every block in the camera*/){
         map[i][j].drawBlock();}
    }
}
