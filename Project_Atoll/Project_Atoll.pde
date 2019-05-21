
/*
* Project Atoll
* Written by Douglas Hanson and Nicholas Moran
*
* v.1.0
* 5/21/2019
*/



//Global Variables
int gameMode;
boolean[] keys = new boolean[128];



void setup()
{
  gameMode = 0;
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
}

void drawLevel()
{
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
