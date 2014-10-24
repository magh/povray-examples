//EXAMPLE OF TRANSPARENT OBJECTS

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
  location  <100,0,.5>  //Camera location
  look_at   <0,0,.5>    //Where camera is pointing
  angle 3       //Angle of the view--increase to see more, decrease to see less
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

//Create three cylinders, giving centers of ends and radus for each
cylinder { <0,-1,0>, <0,-1,2>,  .1 texture{T_Stone1}}
cylinder { <0,0,0>, <0,0,2>,  .1 texture{T_Stone1}}
cylinder { <0,1,0>, <0,1,2>,  .1 texture{T_Stone1}}

//Create three transparent spheres
//Give center and radius,and index of refraction for each
sphere { <2, -1, 1>, 0.5  texture{T_Ruby_Glass} interior { ior 1 } }
sphere { <2, 0, 1>, 0.5  texture{T_Ruby_Glass} interior { ior 1.5 } }
sphere { <2, 1, 1>, 0.5  texture{T_Ruby_Glass} interior { ior 2 } }
