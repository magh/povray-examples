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
  location  <1,-1,20>  //Change this to move the camera to a different point
  look_at   <0,0,0>    //Change this to point the camera at a different point
  right <-4/3,0,0>     //Don't change this
  angle 70             //Change this angle to see more or less of the scene
}

//Place a light
light_source {
  <20,-20,0>    //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }

// house
//difference {
	//box { <0,0,0>, <6360,12000,5250>
		//texture {pigment { color Grey }}}
	//box { <200,200,200>, <6160,11800,5050>}
//}
//cylinder { <0.5, 0, -1>, <0.5, 0, 10>, 1 }
difference {
    box { <0, 0, 0>, <5, 5, 5> }
    box { <1, 1, -10>, <4, 4, 10> }
    //cylinder { <2, 2, -10>, <2, 2, 10>, 1 }
    //cylinder { <0.5, 0, -10>, <0.5, 0, 10>, 1 }
  }
