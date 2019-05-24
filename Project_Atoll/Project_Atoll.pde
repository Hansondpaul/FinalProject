
/*
* Project Atoll
* Written by Douglas Hanson and Nicholas Moran
*
* v.1.0
* 5/21/2019
*/

//Imports
import java.util.TreeSet;

//Global Variables
int gameMode;
boolean[] keys = new boolean[128];
Island world1 = new Island();
Level test = new Level(0);
Player chara;

void setup()
{
  gameMode = 2;
  chara = new Player(new PVector(10,130));
  size(600,600);
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
  background(#70DDFC);
  test.drawBlocks();
  chara.setColideMap(test.map);
  resolveInput();
  chara.updatePlayer();
  
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
