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
float distanceFromPlayer;
boolean[] keys = new boolean[128];
Island world1;
Player chara;
Level test = new Level(1);

void setup()
{
  //frameRate(10);
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
  showCordinates();
  world1.world[0].drawBackground();
  world1.world[0].drawBlocks();
  chara.setColideMap(world1.world[0].map);
  resolveInput();
  chara.updatePlayer();
  //updateDistance();
  moveScreen();
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
 //println(mouseX+" "+mouseY); 
 println(chara.getLocation().y+" "+chara.getSpeed().y);
}

void updateDistance(){
 for(Block[] row:world1.world[0].map)
   for(Block b:row)
     if(b!=null)
       distanceFromPlayer=chara.getLocation().x-b.getLocation().x;
}

void moveScreen(){ 
  //left
  //println(chara.speed.y);
  if(chara.getSpeed().x<0)
    for(Block[] row:world1.world[0].map)
      for(Block b:row)
        if(b!=null){
          b.getLocation().x=b.getLocation().x-chara.getSpeed().x;     
          chara.getLocation().x=(width/2);
        }
  //right
  if(chara.getSpeed().x>0)
    for(Block[] row:world1.world[0].map)
      for(Block b:row)
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
