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
// pole left
box { <0,0,0>, <125,125,5250>
	texture {pigment { color Black }}
	translate <0, 0, 0>
}
// pole middle
box { <0,0,0>, <125,125,2450> 
	texture {pigment { color Black }}
	translate <3018, 0, 0>
}
// pole right
box { <0,0,0>, <125,125,5250> 
	texture {pigment { color Black }}
	translate <6168, 0, 0>
}
// house
box { <0,0,0>, <6360,12000,5250>
	texture {pigment { color Grey }}
	translate <0, 2030, 0>
}
// door (870x?)
box { <0,0,0>, <870,50,1900>
	texture {pigment { color Brown }}
	translate <1750, 1990, 190>
}
// window (1540x?)
box { <0,0,0>, <1540,0,810>
	texture {pigment { color Brown }}
	translate <3220, 1990, 1190>
}
// altan
box { <0,0,0>, <6360,2200,300>
	texture {pigment { color Red }}
	translate <0, 0, 2450>
}
// altan plank (55x1900x200)
box { <0,0,0>, <55,1905,300>
	texture {pigment { color Red }}
	translate <3088, 125, 2450>
}
// floor
box { <0,0,0>, <6410,1850,20>
	texture {pigment { color Brown }}
	translate <-50, 350, 0>
}

// new south wall
box { <0,0,0>, <2893,85,2450>
	texture {pigment { color Red }}
	translate <125, 20, 0>
}
// new west wall
box { <0,0,0>, <85,1905,2450>
	texture {pigment { color Red }}
	translate <20, 125, 0>
}
// new east wall
box { <0,0,0>, <85,1905,2450>
	texture {pigment { color Red }}
	translate <3038, 125, 0>
}
// new east door
//box { <0,0,0>, <145,900,1900>
	//texture {pigment { color Brown }}
	//translate <3018, 500, 0>
//}
// new east double door 1900x1600
box { <0,0,0>, <125,1600,1900>
	texture {pigment { color Brown }}
	translate <3018, 275, 0>
}

