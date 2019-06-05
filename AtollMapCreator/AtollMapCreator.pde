/********************
This map creator uses different color choices to indicate the type of Object that the map will be dealing with
-changing between colors is done with 0-9 keys as those numbers will correspond to how the data is saved
-This map assumes that each box is a tile object of some sort just used to represent the location of it
-once a map has been made to the users liking it can be saved to a file and loaded later on with the loadMapData() method below
-This is all just a base template to go off of, change it to work better with each individual project
-ALL PATHS NEED TO BE ADJUSTED TO WORK TO YOUR ENVIRONMENT
-set mac to true if one a mac, set it to false if on a PC, and change your paths to be correct to where this is stored
********************/
import java.io.File;//needed to load in a file
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.Scanner;
ArrayList<ArrayList<Tile>> tiles;
int colCount=20, rowCount=20, selected = 1;
float tileWidth=40, tileHeight=40;
boolean bucketFill=false, colUp=false, colDown=false, rowUp=false, rowDown=false, mac=false;//Mac when false is for PC paths, true is for Mac usb paths
PrintWriter output;
ArrayList<Tile[][]> allMaps;
void setup(){
  size(800, 600);
  tiles = new ArrayList<ArrayList<Tile>>();
  for(int i=0; i<colCount; i++){
    tiles.add(i, new ArrayList<Tile>());
    for(int j=0; j<rowCount; j++){
      tiles.get(i).add(j, new Tile(i, j));
    }
  }
}

void draw(){
  background(0);
  for(int i=0; i<colCount; i++){
     for(int j=0; j<rowCount; j++){
       Tile temp = tiles.get(i).get(j);
       selectedColor(temp.num);
       rect(temp.pos.x*tileWidth, temp.pos.y*tileHeight, tileWidth-2, tileHeight-2);
     }
   }showButtons();
   println("MouseX: "+mouseX+"  MouseY: "+mouseY);
}

void selectedColor(int num){
  switch(num){//use a switch case to specify what color should appear for each tile type represented by num
  //an easy way to find color rgb is by using the Tools>Color Selector located at the top for changing the colors to ones you prefer
  case 0:
    fill(50);//grey
    break;
  case 1:
    fill(232, 23, 23);//red
    break;
  case 2:
    fill(232, 131, 23);//orange
    break;
  case 3:
    fill(215, 222, 0);//yellow
    break;
  case 4:
    fill(70, 210, 30);//green
    break;
  case 5:
    fill(32, 100, 210);//blue
    break;
  case 6:
    fill(120, 40, 210);//purple
    break;
  case 7:
    fill(224, 28, 206);//pink
    break;
  case 8:
    fill(105, 70, 30);//brown
    break;
  case 9:
    fill(250);//white
    break;
  }
}

void showButtons(){//displays the buttons to interact with changing the map settings
  fill(250);
  textAlign(LEFT);
  text("Number of \nColumns: "+colCount, width-76, 12);
  text("Number of \nRows: "+rowCount, width-72, 72);
  //fill(colUp);
  colDown = button(width-65, 30, 20, 20);
  colUp = button(width-40, 30, 20, 20);
  rowDown = button(width-65, 90, 20, 20);
  rowUp = button(width-40, 90, 20, 20);
  fill(255);
  text("-", width-57, 43);
  text("+", width-33, 43);
  text("-", width-57, 104);
  text("+", width-33, 104);
  selectedColor(selected);
  rect(width-60, 144, 38, 38);
  
  textAlign(LEFT);
  fill(232, 23, 23);
  rect(width-75, 202, 38, 38);
  text("=G",width-33,222);
  fill(232, 131, 23);
  rect(width-75, 250, 38, 38);
  text("=P",width-33,270);
  fill(215, 222, 0);
  rect(width-75, 298, 38, 38);
  text("=HG",width-33,318);
  fill(70, 210, 30);
  rect(width-75, 346, 38, 38);
  text("=HP",width-33,366);
  fill(32, 100, 210);
  rect(width-75, 394, 38, 38);
  text("=B",width-33,414);

}

boolean button(float x, float y, float w, float h){
  if(mouseX<x+w&&mouseX>x&&mouseY<y+h&&mouseY>y){
    fill(100);
    rect(x, y, w, h);
    return true;
  }else{
    fill(60);
    rect(x, y, w, h);
    return false;
  }
}

void mouseDragged(){
  try{
    if(mouseX<width-80&&mouseX>0&&mouseY<height-80&&mouseY>0)//if mouse is where tiles are located
      tiles.get((int)(mouseX/tileWidth)).get((int)(mouseY/tileHeight)).num = selected;
  } 
  catch (IndexOutOfBoundsException e)
  {
    print("Please select a tile shown on screen");
  }
}

void mousePressed(){
  try{
    if(mouseX<width-80&&mouseY<height-80){//if mouse is where tiles are located
      tiles.get((int)(mouseX/tileWidth)).get((int)(mouseY/tileHeight)).num = selected;//sets the num of the tile the mouse is hovering over to whatever color/num is currently selected
      if(bucketFill)//bucketFill mode
        for(int i=0; i<colCount; i++)
          for(int j=0; j<rowCount; j++)
            tiles.get(i).get(j).num = selected;
    }if(mouseX<width&&mouseX>width-60){//buttons for the right side of screen
      if(colUp){//increase columns button
        colCount++;
        tiles.add(new ArrayList<Tile>());
        for(int j=0; j<rowCount; j++){
          tiles.get(colCount-1).add(new Tile(colCount-1, j));
        }tileWidth=(width-80)/colCount;
      }if(colDown&&colCount>0){//decrease columns button
        colCount--;
        tiles.remove(colCount);
        tileWidth=(width-80)/colCount;
      }if(rowUp){//increase rows button
        rowCount++;
        for(int i=0; i<colCount; i++){
          tiles.get(i).add(new Tile(i, rowCount-1));
        }tileHeight=(height-80)/rowCount;
      }if(rowDown&&rowCount>0){//decrease rows button
        rowCount--;
        for(int i=0; i<colCount; i++){
          tiles.get(i).remove(rowCount);
        }tileHeight=(height-80)/rowCount;
      }
    }if(allMaps!=null){//prins out all the maps laoded
      for(Tile[][] t : allMaps){
        println("\n\n");
        for(int i=0; i<t.length; i++){
          for(int j=0; j<t[i].length; j++){
            print(t[i][j].pos+" "+t[i][j].num+"  ");
          }println();
        }
      }
    }
  }
  catch (IndexOutOfBoundsException e)
  {
    print("Please select a tile shown on screen");
  }
}

void keyPressed(){
  switch(keyCode){
  case 48:
    selected = 0;
    break;
  case 49:
    selected = 1;
    break;
  case 50:
    selected = 2;
    break;
  case 51:
    selected = 3;
    break;
  case 52:
    selected = 4;
    break;
  case 53:
    selected = 5;
    break;
  case 54:
    selected = 6;
    break;
  case 55:
    selected = 7;
    break;
  case 56:
    selected = 8;
    break;
  case 57:
    selected = 9;
    break;
  case 66://B
    bucketFill=!bucketFill;
    break;
  case 80://P
    writeData();
    break;
  case 76://L
    allMaps = loadMapData();
    break;
  }
}

void writeData(){
  int count = 0;
  File reader = new File((mac?"/Volumes/NO_NAME":"G:")+"/FinalProject/GeneralMapCreator/map1.dat");
  while(reader.exists()){
    println("Reached "+count);
    reader = new File((mac?"/Volumes/NO_NAME":"G:")+"/FinalProject/GeneralMapCreator/map"+(++count)+".dat");
  }output = createWriter("map"+(count)+".dat");
  output.println(colCount+"-"+rowCount);
  for(int i=0; i<colCount; i++){
    for(int j=0; j<rowCount; j++){
      output.print(""+i+"_"+j+"_"+tiles.get(i).get(j).num+" ");
    }output.println();
  }output.flush();
  output.close();
  exit();
}

//return 2d array with name of file inputted
Tile[][] loadMapData(String name){
  File temp = new File((mac?"/Volumes/NO_NAME":"G:")+"/FinalProject/GeneralMapCreator/"+name+".dat");
  if(temp.exists()){
    try{
      Scanner scan = new Scanner(temp);
      String[] size = scan.nextLine().split("-");
      Tile[][] map = new Tile[parseInt(size[0])][parseInt(size[1])];
      while(scan.hasNext()){
        size = scan.nextLine().split(" ");
        for(String s : size){
          String[] data = s.split("_");
          map[parseInt(data[0])][parseInt(data[1])] = new Tile(parseInt(data[2]), parseInt(data[0]), parseInt(data[1]));
        }
      }scan.close();
      return map;
    }catch(FileNotFoundException e){
      println("File not found");
    }catch(Exception e){
      e.printStackTrace();
    }
  }return null;
}

//loads all maps into an arrayList of 2d arrays
ArrayList<Tile[][]> loadMapData(){
  ArrayList<Tile[][]> result = new ArrayList<Tile[][]>();
  int count = 1;
  File temp = new File((mac?"/Volumes/NO_NAME":"G:")+"/FinalProject/GeneralMapCreator/map"+count+".dat");
  while(temp.exists()){
    result.add(loadMapData("map"+(count++)));
    println("added");
    temp = new File((mac?"/Volumes/NO_NAME":"G:")+"/FinalProject/GeneralMapCreator/map"+count+".dat");
  }return result;
}
