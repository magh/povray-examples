//CAVALIERI EXAMPLE WITH HEMISPHERE AND (CYLINDER MINUS CONE)
//ANIMATE WITH CLOCK FROM .5 TO 0.01

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
  location  <10,0,3>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 15      //Angle of the view--increase to see more, decrease to see less
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

plane {<0,0,1>,0 texture {T_Stone24}}

intersection{

union{
sphere { <0, -.5, 0>, 0.5 texture{T_Silver_1A}}  
difference{
cylinder { <0, .5, 0>, <0, .5, .5>, .5 texture{T_Silver_1A}} 
cone { <0, .5, .5>, .5, <0, .5, 0>, 0 texture{T_Silver_1A}}
}
}

plane{<0,0,1>,clock pigment {color Red}}

}
