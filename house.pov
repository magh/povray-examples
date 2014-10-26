//EXAMPLE OF VARIOUS SHAPES
#include "colors.inc"
#include "woods.inc"
#include "stones.inc"
#include "metals.inc"
#include "golds.inc"
#include "glass.inc"

//Place the camera
camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  location  <14000,-6000,1800>  //Change this to move the camera to a different point
  look_at   <3180,1900,1300>    //Change this to point the camera at a different point
  right <-4/3,0,0>     //Don't change this
  angle 70             //Change this angle to see more or less of the scene
}

//Place a light
light_source {
  <4230,-3000,2000>    //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }

//Create a "floor"
plane {
  <0,0,-1>, 0.0001
  texture { pigment { color Green } }  //You can change this texture if you want
}

// width*depth*height
// pole left (125x125x2450)
box { <0,0,0>, <125,125,5250> texture {pigment { color Black }} }
// pole middle (125x125x2450)
box { <3018,0,0>, <3143,125,2450> texture {pigment { color Black }} }
// pole right (125x125x2450)
box { <6168,0,0>, <6293,125,5250> texture {pigment { color Black }} }
// house
box { <0,2030,0>, <6360,14000,5250> texture {pigment { color Grey }} }
// door (870x?)
box { <1750,1990,190>, <2620,1990,2160> texture {pigment { color Brown }} }
// window (1540x?)
box { <3220,1990,1190>, <4760,1990,2000> texture {pigment { color Brown }} }
// altan
box { <0,0,2450>, <6360,2200,2750> texture {pigment { color Red }} }
// altan plank (55x1900x200)
box { <3088,125,2450>, <3143,2030,2750> texture {pigment { color Red }} }
// floor
box { <-50,350,0>, <6360,2200,20> texture {pigment { color Brown }} }

// new south wall
box { <125,20,0>, <3018,105,2450> texture {pigment { color Red }} }
// new west wall
box { <20,125,0>, <105,2030,2450> texture {pigment { color Red }} }
// new east wall
box { <3038,125,0>, <3123,2030,2450> texture {pigment { color Red }} }
// new east door 1900x900
//box { <3018,500,0>, <3163,1400,1900> texture {pigment { color Brown }} }
// new east double door 1900x1600
box { <3018,275,0>, <3143,1875,1900> texture {pigment { color Brown }} }

