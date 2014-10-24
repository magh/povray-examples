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
  location  <10,10,5>  //Change this to move the camera to a different point
  look_at   <0,0,0>    //Change this to point the camera at a different point
  right <-4/3,0,0>     //Don't change this
  angle 70             //Change this angle to see more or less of the scene
}

//Place a light
light_source {
  <10,-4,10>    //Change this if you want to put the light at a different point
  color White*2        //Multiplying by 2 doubles the brightness
}

//Set a background color
background { color White }

//Create a "floor"
plane {
  <0,0,-1>, 0.0001
  texture { T_Silver_3A }  //You can change this texture if you want
}

//Box (rectangular prism) that extends between the 2 specified opposite points
box { <0,0,0> , <3,2,.8> texture {T_Stone8} }

//Sphere with specified center point and radius
sphere { <0,-3,1> , 1 texture {T_Stone1} }

//Cone with specified center and radius of each end
cone { <0,4,0> , 2 , <0,4,3> , 0 texture {T_Stone2} }

//Cone with end caps removed
cone { <-2,0,1> , 1 , <-3,0,1/2> , 1/2  open texture {T_Stone3} }

//Cylinder with specified centers of each end and radius
cylinder { <4,0,0>, <4,0,1>, 1 texture {T_Stone4} }

//Cylinder with end caps removed
cylinder { <4,3,0>, <4,3,1>, 1 open texture {T_Stone5} }

//Pyramid	
//Define the coordinates of the vertices
//In this case the points are the vertices of a regular hexagon and an apex
#declare p1 = <1,0,0>;
#declare p2 = <1/2,sqrt(3)/2,0>;
#declare p3 = <-1/2,sqrt(3)/2,0>;
#declare p4 = <-1,0,0>;
#declare p5 = <-1/2,-sqrt(3)/2,0>;
#declare p6 = <1/2,-sqrt(3)/2,0>;
#declare p7 = <0,0,2>;
//List the faces
//In each case the first number is one plus the number of vertices on the face
//List the points IN ORDER around the face, repeating the first point at the end
union{
polygon { 7, p1, p2, p3, p4, p5, p6, p1 } //This is the bottom
polygon { 4, p1, p2, p7, p1 } //This is one of the triangular sides
polygon { 4, p2, p3, p7, p2 }
polygon { 4, p3, p4, p7, p3 }
polygon { 4, p4, p5, p7, p4 }
polygon { 4, p5, p6, p7, p5 }
polygon { 4, p6, p1, p7, p6 }
texture {T_Stone6}
scale <2,2,2> //This doubles the size in every direction
translate <2,-5,0> //This translates it to a different location
}

//Prism	
//Define the coordinates of the vertices
//In this case the points are the vertices of two regular hexagons--
//one lower, and one upper
//You could also just type in decimal approximations
#declare p1 = <1,0,0>;
#declare p2 = <1/2,sqrt(3)/2,0>;
#declare p3 = <-1/2,sqrt(3)/2,0>;
#declare p4 = <-1,0,0>;
#declare p5 = <-1/2,-sqrt(3)/2,0>;
#declare p6 = <1/2,-sqrt(3)/2,0>;
#declare p7 = <1,0,1>;
#declare p8 = <1/2,sqrt(3)/2,1>;
#declare p9 = <-1/2,sqrt(3)/2,1>;
#declare p10 = <-1,0,1>;
#declare p11 = <-1/2,-sqrt(3)/2,1>;
#declare p12 = <1/2,-sqrt(3)/2,1>;
//List the faces
//In each case the first number is one plus the number of vertices on the face
//List the points IN ORDER around the face, repeating the first point at the end
union{
polygon { 7, p1, p2, p3, p4, p5, p6, p1 } //This is the bottom
polygon { 7, p7, p8, p9, p10, p11, p12, p7 } //This is the top
polygon { 5, p1, p2, p8, p7, p1 } //This is one of the rectangular sides
polygon { 5, p2, p3, p9, p8, p2 }
polygon { 5, p3, p4, p10, p9, p3 }
polygon { 5, p4, p5, p11, p10, p4 }
polygon { 5, p5, p6, p12, p11, p5 }
polygon { 5, p6, p1, p7, p12, p6 }
texture {T_Stone7}
scale <3/2,3/2,3/2> //This scales the object by a factor of 3/2
translate <6,-2,0> //This translates it to a different location
}
