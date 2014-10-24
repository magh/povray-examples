//EXAMPLE OF PYRAMID DEFINED BY THE COORDINATES OF ITS VERTICES AND POLYGONS

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

//Place the camera
camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  right <-4/3,0,0>     //Don't change this
  location  <30,10,10>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 5       //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <10,-10,10>   //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }

//Create a "floor"
plane {
  <0,0,1>, 0           //This represents the plane 0x+0y+z=0
  texture { T_Silver_3A }  //The texture comes from the file "metals.inc"
}

//Construct a square-based pyramid by describing its polygons

//Define the coordinates of the five vertices
#declare p1 = <1,0,0>;
#declare p2 = <0,1,0>;
#declare p3 = <-1,0,0>;
#declare p4 = <0,-1,0>;
#declare p5 = <0,0,1>;

//Define the polygons for each of the five sides.
//Notice that the last point must be a repetition of the first.
//The first number indicates how many points will be listed.
#declare f1 = polygon { 5, p1, p2, p4, p3, p1 };
#declare f2 = polygon { 4, p1, p2, p5, p1 };
#declare f3 = polygon { 4, p2, p3, p5, p2 };
#declare f4 = polygon { 4, p3, p4, p5, p3 };
#declare f5 = polygon { 4, p4, p1, p5, p4 };

//Define the pyramid to be the union of its faces.
#declare mypyramid = object { union {
  object{f1}
  object{f2} 
  object{f3} 
  object{f4} 
  object{f5}
  }
  texture {T_Stone1}
  };

//List the defined object(s) to be displayed
mypyramid
