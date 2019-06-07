# FinalProject
Final Project for APCS: Project Atoll;
A side-scrolling exploration based platforming game engine.

# Project Title and purpose

The purpose of Project Atoll is to create a side scrolling platforming video game. Project Atoll is the engine for this game. It consists of a game engine and level creator, with the ability to import images for the character, health icons, and to import level map files. 

### Difficulties or opportunities you encountered along the way.

The toughest parts were to create the data structure's orginization in a way that was most efficiant and accessable, and to create colision detection and colision resolution with the player.

### Most interesting piece of your code and explanation for what it does.

```Java
 Placeable[][] loadMapData(String name){
    File temp = new File(dataPath(name+".dat"));
    if(true){
      try{
        Scanner scan = new Scanner(temp);
        int coinCounter = 0;
        String[] size = scan.nextLine().split("-");
        Placeable[][] map = new Placeable[parseInt(size[0])][parseInt(size[1])];
        while(scan.hasNext()){
          size = scan.nextLine().split(" ");
          for(String s : size){
            String[] data = s.split("_");
            switch(parseInt(data[2])){
              case 0: map[parseInt(data[0])][parseInt(data[1])] = null; break;
              case 1: map[parseInt(data[0])][parseInt(data[1])] = new Ground(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              case 2: map[parseInt(data[0])][parseInt(data[1])] = new Platform(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              case 3: map[parseInt(data[0])][parseInt(data[1])] = new Ground(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),false); break;
              case 4: map[parseInt(data[0])][parseInt(data[1])] = new Platform(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),false); break;
              case 5: map[parseInt(data[0])][parseInt(data[1])] = new Box(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              case 6: map[parseInt(data[0])][parseInt(data[1])] = new Coin(new PVector(parseInt(data[0])*50,parseInt(data[1])*50),coinCounter); coinCounter++; break;
              case 7: map[parseInt(data[0])][parseInt(data[1])] = new Ground(new PVector(parseInt(data[0])*50,parseInt(data[1])*50), true, true); coinCounter++; break;
              case 9: setLocation(new PVector(parseInt(data[0])*50,parseInt(data[1])*50)); break;
              default: map[parseInt(data[0])][parseInt(data[1])] = null; break;
            }
          }          
        }scan.close(); return map; 
      }catch(FileNotFoundException e){
        println("File not found");
      }catch(Exception e){
        e.printStackTrace();
      }
    }return null;     
  }
```
This is the code that reads in the level data from the map file for the level. First the file is loaded in to the method, then a Placeable matrix is created with the size of the level read in from the file. Then the file is read, with each triplet of integers representing a placeable object type, such as a Ground block or a coin, and the location is read in from the other 2 integers. If the file is not found, it simply prints that into the console and moves on. Otherwise it returns the map matrix that was created in this process.

## Built With

* [Processing](https://processing.org/) - The IDE used
* General Map Creator by Alex Moran

## Authors

* Nicholas Moran
* Douglas Hanson

## Acknowledgments

* Thanks to Alex Moran for the base program for our level editor
