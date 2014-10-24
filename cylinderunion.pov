//UNION OF TWO CYLINDERS

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
  location  <3,2,5>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 40      //Angle of the view--increase to see more, decrease to see less
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }

//Place a light--you can have more than one!
light_source {
  <10,10,5>     //Change this if you want to put the light at a different point
  color White        //Multiplying by 2 doubles the brightness
}  

light_source{ <10,-10,5> color White}

//Set a background color
background { color White }

union{
cylinder { <-5, 0, 0>, <5, 0, 0>, 1 texture {T_Wood1}}
cylinder { <0, -5, 0>, <0, 5, 0>, 1 texture {T_Wood1}}
}
