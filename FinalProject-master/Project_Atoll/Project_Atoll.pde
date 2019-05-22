
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
Level test = new Level(5,5);

void setup()
{
  gameMode = 2;
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
  test.drawBlocks();
}


/*
* input detection
*/
void keyPressed()
{
 keys[key] = true;
}

void keyReleased()
{
 keys[key] = false;
}
