//SNOWFLAKE FRACTAL

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
  location  <0,0,10>  
  look_at   <0,0,0>    
  angle 16             
}

global_settings { ambient_light White } 

light_source {
  <0,0,10>           
  color White        
}

background { color White }

//Define the coordinates of the three vertices of a triangle
#declare p1 = <cos(90*pi/180),sin(90*pi/180),0>;
#declare p2 = <cos(210*pi/180),sin(210*pi/180),0>;
#declare p3 = <cos(330*pi/180),sin(330*pi/180),0>;

//Define the triangle
#declare mytriangle = object{polygon { 4, p1, p2, p3, p1} texture {pigment{Red}} };

#declare counter=1;

//Shrink and translate the triangle in six directions
#while(counter < 6)
  #declare mytriangle=union{
  	object{mytriangle}
    object{mytriangle scale 1/3 rotate z*180 translate -2/3*p1}
    object{mytriangle scale 1/3 rotate z*180 translate -2/3*p2}
    object{mytriangle scale 1/3 rotate z*180 translate -2/3*p3}
    object{mytriangle scale 1/3 translate 2/3*p1}
    object{mytriangle scale 1/3 translate 2/3*p2}
    object{mytriangle scale 1/3 translate 2/3*p3}
}
  #declare counter=counter+1;
#end

//Display the triangle
mytriangle
