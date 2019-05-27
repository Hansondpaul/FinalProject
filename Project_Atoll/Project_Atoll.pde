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

//Global Variables
int gameMode;
boolean[] keys = new boolean[128];
Island world1;
Player chara;
boolean yes=true;
Level test = new Level(1);

void setup()
{
  gameMode = 2;
  chara = new Player(new PVector(10,130));
  size(600,600);
  world1 = new Island();
  world1.world[0]=world1.getLevel(0);
  
}

void draw()
{
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
}

void drawWorldMap()
{
  background(#2036A2);
  world1.drawIsland();
}

void drawLevel()
{
  if(yes)
  for(Block[] x: world1.world[0].map){
    for(Block y:x)
      print(y);
    println();
    yes=false;
  }
  showCordinates();
        
  world1.world[0].drawBackground();
  world1.world[0].drawBlocks();
  chara.setColideMap(world1.world[0].map);
  resolveInput();
  chara.updatePlayer();
  //background(#70DDFC);
  //if(yes)
  //for(Block[] x: world1.world[0].map){
  //  println();
  //  for(Block y:x)
  //    print(y);
  //}
  //yes=false;
  //world1.world[0].drawBlocks();
  ////test.drawBlocks();
  //chara.setColideMap(test.map);
  //resolveInput();
  //chara.updatePlayer();
  //chara.drawPlayer();
  
}


/*
* input detection
*/
public void resolveInput(){
  if(keys[' ']) chara.jump();
  if(keys['d']) chara.moveRight();
  if(keys['a']) chara.moveLeft();
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
}
