//ICOSAHEDRON MOVIE
//ANIMATE WITH CLOCK FROM 0 TO 4

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

global_settings { max_trace_level 5 }

//Place the camera
camera {
  sky <0,0,1>          //Don't change this
  direction <-1,0,0>   //Don't change this  
  right <-4/3,0,0>     //Don't change this
  location  <10,10,10>  //Camera location
  look_at   <0,0,0>    //Where camera is pointing
  angle 15             //Angle of the view--increase to see more, decrease to see less
}

//global_settings { ambient_light White } //Ambient light to "brighten up" darker pictures

//Place a light--you can have more than one!
light_source {<10,5,10> color White }
light_source {<10,-5,10> color White }

//Set a background color
background { color White }

//Create a "floor"
plane {
  <0,0,1>, -1.01           //This represents the plane 0x+0y+z=0
  texture { T_Silver_3A }  //The texture comes from the file "metals.inc"
   }

//The Icosahedron (adapted from Laura Berry)
#macro myicosahedron(tt)
//The 12 vertices
#declare p1 = <tt,0,-1>;
#declare p2 = <-tt,0,-1>;
#declare p3 = <0,-1,tt>;
#declare p4 = <0,-1,-tt>;
#declare p5 = <-1,tt,0>;
#declare p6 = <-1,-tt,0>;
#declare p7 = <0,1,tt>;
#declare p8 = <0,1,-tt>;
#declare p9 = <1,tt,0>;
#declare p10 = <1,-tt,0>;
#declare p11 = <tt,0,1>;
#declare p12 = <-tt,0,1>;
//The 20 triangular faces
#declare f1 = polygon { 4, p1, p8, p9, p1};
#declare f2 = polygon { 4, p1, p10, p9, p1};
#declare f3 = polygon { 4, p1, p10, p4, p1};
#declare f4 = polygon { 4, p1, p2, p8, p1};
#declare f5 = polygon { 4, p1, p2, p4, p1};
#declare f6 = polygon { 4, p12, p7, p11, p12};
#declare f7 = polygon { 4, p12, p7, p5, p12};
#declare f8 = polygon { 4, p12, p5, p6, p12};
#declare f9 = polygon { 4, p12, p6, p3, p12};
#declare f10 = polygon { 4, p12, p3, p11, p12};
#declare f11 = polygon { 4, p3, p10, p11, p3};
#declare f12 = polygon { 4, p9, p10, p11, p9};
#declare f13 = polygon { 4, p7, p9, p11, p7};
#declare f14 = polygon { 4, p7, p8, p9, p7};
#declare f15 = polygon { 4, p5, p8, p7, p5};
#declare f16 = polygon { 4, p5, p2, p6, p5};
#declare f17 = polygon { 4, p2, p6, p4, p2};
#declare f18 = polygon { 4, p2, p5, p8, p2};
#declare f19 = polygon { 4, p3, p4, p10, p3};
#declare f20 = polygon { 4, p3, p4, p6, p3};   
   //Unite the faces to form the icosahedron
object { union {
  object{f1}
  object{f2} 
  object{f3} 
  object{f4} 
  object{f5} 
  object{f6}
  object{f7} 
  object{f8} 
  object{f9} 
  object{f10}
  object{f11}
  object{f12} 
  object{f13} 
  object{f14} 
  object{f15} 
  object{f16}
  object{f17} 
  object{f18} 
  object{f19} 
  object{f20}
  }
  }
#end

#macro rectangles(tt)
#declare p1 = <tt,0,-1>;
#declare p2 = <-tt,0,-1>;
#declare p3 = <0,-1,tt>;
#declare p4 = <0,-1,-tt>;
#declare p5 = <-1,tt,0>;
#declare p6 = <-1,-tt,0>;
#declare p7 = <0,1,tt>;
#declare p8 = <0,1,-tt>;
#declare p9 = <1,tt,0>;
#declare p10 = <1,-tt,0>;
#declare p11 = <tt,0,1>;
#declare p12 = <-tt,0,1>;
union{
object{polygon{5,p1,p2,p12,p11,p1}}
object{polygon{5,p7,p8,p4,p3,p7}}
object{polygon{5,p5,p6,p10,p9,p5}}
}
#end

#declare rate=90;
#declare f=.8;

#switch(clock)

#range(0,1)
#declare s=clock;
#declare tt=0;
union{
box{<-1,-1,-1>,<1,1,1> texture{ pigment{ color rgbf <1,s,s,s*f>}}}
object{myicosahedron(0.0001) texture{pigment {color rgbf <0,1,0,0>}}}
rotate<0,0,clock*rate>
}
#break

#range(1.0001,2)
#declare s=clock-1;
#declare r=s*(sqrt(5)-1)/2;
union{
box{<-1,-1,-1>,<1,1,1> texture{ pigment{ color rgbf <1,1,1,f>}}}
object{myicosahedron(r) texture{pigment {color rgbf <0,1,0,0>}}}
rotate<0,0,clock*rate>
}
#break

#range(2.0001,3)
#declare s=clock-2;
#declare r=(sqrt(5)-1)/2;
union{
object{myicosahedron(r) texture{pigment {color rgbf <s,1,s,s*f>}}}
object{rectangles(r) texture{pigment{color Gold*2}}}
rotate<0,0,clock*rate>
}
#break

#range(3.0001,4)
#declare r=(sqrt(5)-1)/2;
object{rectangles(r) texture{pigment{color Gold*2}} rotate <0,0,clock*rate>}
#break

#end
