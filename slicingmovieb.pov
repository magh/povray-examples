//SLICING A TORUS
//RENDER WITH CLOCK FROM 0 TO 2

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
  angle 19             //Angle of the view--increase to see more, decrease to see less
}

global_settings { ambient_light White } //Ambient light to "brighten up" darker pictures

//Place a light--you can have more than one!
light_source {
  <0,0,5>           //Change this if you want to put the light at a different point
  color White        //Multiplying by 2 doubles the brightness
}  

light_source{ <5,5,5> color White}

//Set a background color
background { color White }

//plane {<0,0,1>,0 texture {T_Stone24}}

intersection{
// torus {MAJOR, MINOR} // (in the X-Z plane)
// MAJOR = float value giving the major radius
// MINOR = float specifying the minor radius
// The major radius extends from the center of the hole
// to the mid-line of the rim while the minor radius
// is the radius of the cross-section of the rim.
torus { 0.8, 0.4 texture{T_Silver_1A} rotate <90,30,-45>}

plane{<0,0,1>,1-clock pigment { color rgbf <0,0,1,1> }}

}
