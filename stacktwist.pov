//CREATE STACK WITH ROTATIONS AND TRANSLATIONS

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
  location  <10,10,10>  //Camera location
  look_at   <0,0,2>    //Where camera is pointing
  angle 30      //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <0,0,5>       //Change this if you want to put the light at a different point
  color White        //Multiplying by 2 doubles the brightness
}  

light_source{ <5,5,5> color White}

//Set a background color
background { color White }

#declare slab=box { <-1, -1, 0>, <1, 1, .05> texture{T_Gold_1A}}; 

#declare A = 0;
  #while (A<90)
    object{slab rotate <0,0,A> translate <0,0,.05*A>}
    #declare A=A+1;
  #end
