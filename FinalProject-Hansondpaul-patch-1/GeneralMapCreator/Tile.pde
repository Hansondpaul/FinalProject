class Tile{
  int num;
  PVector pos;
  Tile(){
    num = 0;
    pos = new PVector(0, 0);
  }
  Tile(int x, int y){
    num = 0;
    pos = new PVector(x, y);
  }
  Tile(int n, int x, int y){
    num = n;
    pos = new PVector(x, y);
  }
}
