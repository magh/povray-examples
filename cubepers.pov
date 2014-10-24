//EXAMPLE OF PROJECTION OF FOUR-CUBE
//EDGE FRAMEWORK

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
   location  <10,20,30>  //Camera location
   look_at   <0,0,0>    //Where camera is pointing
   angle 15       //Angle of the view
}

//Ambient light to "brighten up" darker pictures
global_settings { ambient_light White }
global_settings { max_trace_level 10 }


//Place a light
light_source {
   <10,20,30>
   color White*2
}

//Set a background color
background { color White }

//Specify the number of vertices
#declare n=16;

//List the vertices of the hypercube
#declare p =
  array[n][4]
  {
   {-1,-1,-1,-1}, //0
   {-1,-1,-1,1},  //1
   {-1,-1,1,-1},  //2
   {-1,-1,1,1},   //3
   {-1,1,-1,-1},  //4
   {-1,1,-1,1},   //5
   {-1,1,1,-1},   //6
   {-1,1,1,1},    //7
   {1,-1,-1,-1},  //8
   {1,-1,-1,1},   //9
   {1,-1,1,-1},   //10
   {1,-1,1,1},    //11
   {1,1,-1,-1},   //12
   {1,1,-1,1},    //13
   {1,1,1,-1},    //14
   {1,1,1,1}      //15
  };

//Create the array to collect the projected points
#declare q = array[n];

//Specify the direction of projection
#declare a=1;
#declare b=0;
#declare c=0;
#declare d=0;

//Specify the amount of translation away from the origin
//Translating far away (large positive number) lessens perspective

#declare pp=3;

//Perform perspective calculations

#declare f=pp*(a*a+b*b+c*c+d*d);
#declare i=0;
#while(i<n)
  #declare p0=p[i][0]+pp*a;
  #declare p1=p[i][1]+pp*b;
  #declare p2=p[i][2]+pp*c;
  #declare p3=p[i][3]+pp*d;
  #declare g=f/(a*p0+b*p1+c*p2+d*p3);
  #declare p[i][0]=p0*g;
  #declare p[i][1]=p1*g;
  #declare p[i][2]=p2*g;
  #declare p[i][3]=p3*g;
  #declare i=i+1;
#end

//Project the points into three dimensions
#declare l=sqrt(a*a+b*b+c*c+d*d);
#declare i=0;
#while(i<n)
  #declare q[i]=
    < (d*p[i][0]+c*p[i][1]-b*p[i][2]-a*p[i][3])/l,
      (-c*p[i][0]+d*p[i][1]+a*p[i][2]-b*p[i][3])/l,
      (b*p[i][0]-a*p[i][1]+d*p[i][2]-c*p[i][3])/l >;
  #declare i=i+1;
#end

#declare r=.1;

//Edges of the projection
union{
cylinder { q[0], q[1], r }
cylinder { q[0], q[2], r }
cylinder { q[0], q[4], r }
cylinder { q[0], q[8], r }
cylinder { q[1], q[3], r }
cylinder { q[1], q[5], r }
cylinder { q[1], q[9], r }
cylinder { q[2], q[3], r }
cylinder { q[2], q[6], r }
cylinder { q[2], q[10], r }
cylinder { q[3], q[7], r }
cylinder { q[3], q[11], r }
cylinder { q[4], q[5], r }
cylinder { q[4], q[6], r }
cylinder { q[4], q[12], r }
cylinder { q[5], q[7], r }
cylinder { q[5], q[13], r }
cylinder { q[6], q[7], r }
cylinder { q[6], q[14], r }
cylinder { q[7], q[15], r }
cylinder { q[8], q[9], r }
cylinder { q[8], q[10], r}
cylinder { q[8], q[12], r }
cylinder { q[9], q[11], r }
cylinder { q[9], q[13], r }
cylinder { q[10], q[11], r }
cylinder { q[10], q[14], r }
cylinder { q[11], q[15], r }
cylinder { q[12], q[13], r }
cylinder { q[12], q[14], r }
cylinder { q[13], q[15], r }
cylinder { q[14], q[15], r }
texture {T_Gold_1A}
}

//Vertices of the projection
union{
sphere{q[0],r}
sphere{q[1],r}
sphere{q[2],r}
sphere{q[3],r}
sphere{q[4],r}
sphere{q[5],r}
sphere{q[6],r}
sphere{q[7],r}
sphere{q[8],r}
sphere{q[9],r}
sphere{q[10],r}
sphere{q[11],r}
sphere{q[12],r}
sphere{q[13],r}
sphere{q[14],r}
sphere{q[15],r}
texture {T_Gold_1A}
}
