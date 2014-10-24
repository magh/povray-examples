//EXAMPLE OF ANIMATION
//Render with clock 0 to 80

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
  location  <5,3,5> //Camera location
  look_at   <0,0,.5>    //Where camera is pointing
  angle 90      //Angle of the view--increase to see more, decrease to see less
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

#declare mybox= box { <-1, -1, -1>, <1, 1, 1> texture {T_Silver_1A}};
#declare r=.05;
object{mybox rotate <0,0,clock> translate <1,1,1>*(1+clock*r)}
object{mybox rotate <0,0,clock> translate <-1,-1,1>*(1+clock*r)}
object{mybox rotate <0,0,clock> translate <-1,1,-1>*(1+clock*r)}
object{mybox rotate <0,0,clock> translate <1,-1,-1>*(1+clock*r)}
object{mybox rotate <0,0,-clock> translate <1,1,-1>*(1+clock*r)}
object{mybox rotate <0,0,-clock> translate <-1,-1,-1>*(1+clock*r)}
object{mybox rotate <0,0,-clock> translate <-1,1,1>*(1+clock*r)}
object{mybox rotate <0,0,-clock> translate <1,-1,1>*(1+clock*r)}
