//THREE DIMENSIONAL SNOWFLAKE FRACTAL
//ANIMATE WITH CLOCK FROM 0 TO 6

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
  location  <10,5,10>  
  look_at   <0,0,0>    
  angle 17             
}

//global_settings { ambient_light White*2 } 

light_source {<0,10,10> color White }
light_source {<0,-5,10> color White }

background { color White }

//Define the coordinates of the three vertices of a tetrahedron
#declare p1 = <1,1,1>;
#declare p2 = <1,-1,-1>;
#declare p3 = <-1,1,-1>;
#declare p4 = <-1,-1,1>;

//Define the tetrahedron
#declare mytetrahedron = object{
union{
polygon { 4, p1, p2, p3, p1}  
polygon { 4, p1, p2, p4, p1} 
polygon { 4, p1, p3, p4, p1} 
polygon { 4, p2, p3, p4, p2} 
}
texture{T_Gold_1A}
};

#declare counter=1;

//Make a loop in which the tetrahedron is shrunk and translated toward eight corners
#while(counter < clock)
  #declare mytetrahedron=union{
    object{mytetrahedron scale .5 translate .5*p1}
    object{mytetrahedron scale .5 translate .5*p2}
    object{mytetrahedron scale .5 translate .5*p3}
    object{mytetrahedron scale .5 translate .5*p4}
    object{mytetrahedron scale -.5 translate -.5*p1}
    object{mytetrahedron scale -.5 translate -.5*p2}
    object{mytetrahedron scale -.5 translate -.5*p3}
    object{mytetrahedron scale -.5 translate -.5*p4}
}
  #declare counter=counter+1;
#end

//Display the snowflake
mytetrahedron
