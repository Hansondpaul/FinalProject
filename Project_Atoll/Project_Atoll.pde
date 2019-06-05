/*
* Project Atoll
* Written by Douglas Hanson and Nicholas Moran
*
* v.1.0
* 5/21/2019-5/?/2019
*/

//Imports
import java.io.File;//needed to load in a file
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;


//Global Variables
int gameMode;
int currentLevel;
float distanceFromPlayer;
boolean pause=false;
boolean[] keys;
Island world1;
Player chara;

void setup()
{
  //frameRate(10);
  System.out.println("initializing:");
  gameMode = 0;
  System.out.println("gamemode");
  keys = new boolean[128];
  System.out.println("input");
  chara = new Player(new PVector(10,130));
  System.out.println("player");
  size(600,600);
  System.out.println("window");
  world1 = new Island();
  System.out.println("levels");
  
}

void draw()
{
  println(pause);
  switch(gameMode){
    case 0:{
      drawTitleScreen();
      break;
    }
    
    case 1:{
      drawWorldMap();
      break;
    }
    
    case 2:{
      drawLevel();
      break;
    }
  }
}



/*
*  draw methods based on gamemode
*/
void drawTitleScreen()
{
  background(0);
  textAlign(CENTER,CENTER);
  textSize(100);
  fill(255);
  rectMode(CENTER);
  
  text("ATOLL",width/2,height/4); //Title
  
  for(int i=0;i<4;i++) //prints boxes
    rect(width/2,height/2+(i*75),200,50);

  fill(0);
  textSize(20);
  String[] names = {"New Game","Load Game","Options","null"};
  for(int i=0;i<4;i++) //fills boxes with text
    text(names[i],width/2,height/2+(i*75),200,50);

  if(mousePressed)  
    if(overButton(200,275,200,50)){ gameMode=1; delay(100); }
    if(overButton(200,350,200,50));
    if(overButton(200,425,200,50));
    if(overButton(200,600,200,50)); 
  }


void drawWorldMap()
{
  background(#2036A2);
  world1.drawIsland();
  if(mousePressed)
    for(int level = 0; level < world1.world.length; level++)
      if(overButton((int)world1.levelMarkers.get(world1.world[level]).x,(int)world1.levelMarkers.get(world1.world[level]).y,20)){
        currentLevel=level;
        gameMode=2;
        System.out.println("Switching gamemode to 2");
      }
}


void drawLevel()
{
  if(pause)
  {
    
  }
  else
  {
  showCordinates();
  world1.world[currentLevel].drawBackground();
  world1.world[currentLevel].drawBlocks();
  chara.setColideMap(world1.world[currentLevel].map);
  resolveInput();
  chara.updatePlayer();
  //updateDistance();
  moveScreen();
  drawStats();
  
  if(chara.getCleared())
  {
    world1.world[currentLevel].cleared(); 
    gameMode = 1;
  }
  
  }
}

/*
* input detection
*/
public void resolveInput(){
  if(keys[' ']) chara.jump();
  if(keys['d']) chara.moveRight();
  if(keys['a']) chara.moveLeft();
  if(keys['p']) pause=pause?false:true;
}

void keyPressed()
{
 if(key < 129)
   keys[key] = true;
}

void keyReleased()
{
 if(key < 129)
   keys[key] = false;
}

void showCordinates(){
 println(mouseX+" "+mouseY); 
 //println(chara.getLocation().y+" "+chara.getSpeed().y);
}

void updateDistance(){
 for(Placeable[] row:world1.world[currentLevel].map)
   for(Placeable b:row)
     if(b!=null)
       distanceFromPlayer=chara.getLocation().x-b.getLocation().x;
}

void moveScreen(){ 
  //left
  //println(chara.speed.y);
  if(chara.getSpeed().x<0)
    for(Placeable[] row:world1.world[currentLevel].map)
      for(Placeable b:row)
        if(b!=null){
          b.getLocation().x=b.getLocation().x-chara.getSpeed().x;     
          chara.getLocation().x=(width/2);
        }
  //right
  if(chara.getSpeed().x>0)
    for(Placeable[] row:world1.world[currentLevel].map)
      for(Placeable b:row)
        if(b!=null){
          b.getLocation().x=b.getLocation().x-chara.getSpeed().x;
          chara.getLocation().x=(width/2);
        }
  //if(chara.isGrounded())
  //   for(Block[] row:world1.world[0].map)
  //      for(Block b:row)
  //        if(b!=null)
  //          b.getLocation().y=(b.getLocation().y+/*Math.abs*/(height/2-chara.getLocation().y));                          
}

public double distance(int x1, int y1, int x2, int y2){
  int dx=x1-x2;
  int dy=y1-y2;
  return Math.sqrt(dx*dx+dy*dy);
}

public boolean overButton(int x,int y,int xs,int ys){
  if(mouseX>=x && mouseX<=x+xs && mouseY>=y && mouseY<=y+ys)
    return true;
  return false;
}

public boolean overButton(int x, int y,int s){
  double dist = distance(mouseX,mouseY,x,y);
  if(dist<=s)
    return true;
  return false;
}

void drawStats(){
  
  fill(0);
  textSize(20);
  text("dummy: 00"/*+varible+*/,width-70,20);

}
