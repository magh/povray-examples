//EXAMPLE OF PROJECTION OF 16-CELL
//EDGE FRAMEWORK
//ADAPTED FROM KELCY MONDAY

//Files with predefined colors and textures
#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"
#include "textures.inc"

//Place the camera
camera {
   sky <0,0,1>          //Don't change this
   direction <-1,0,0>   //Don't change this
   right <-4/3,0,0>     //Don't change this
   location  <3,8,13>  //Camera location
   look_at   <0,0,0>    //Where camera is pointing
   angle 25       //Angle of the view
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
#declare n=8;

//List the vertices of the 16-cell
#declare p =
  array[n][4]
  {
   {1,0,0,0},   //0
   {0,1,0,0},   //1
   {0,0,1,0},   //2
   {0,0,0,1},   //3
   {-1,0,0,0},  //4
   {0,-1,0,0},  //5
   {0,0,-1,0},  //6
   {0,0,0,-1},  //7
  };

//Create the array to collect the projected points
#declare q = array[n];

//Specify the direction of projection
#declare a=1;
#declare b=1;
#declare c=1;
#declare d=1;

//Specify the amount of translation away from the origin
//Translating far away (large positive number) lessens perspective

#declare pp=.4;

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

#declare r=.03;

//Edges of the projection
union{
cylinder { q[0], q[1], r }
cylinder { q[0], q[2], r }
cylinder { q[0], q[3], r }

cylinder { q[1], q[0], r }
cylinder { q[1], q[2], r }
cylinder { q[1], q[3], r }

cylinder { q[2], q[0], r }
cylinder { q[2], q[1], r }
cylinder { q[2], q[3], r }

cylinder { q[3], q[0], r }
cylinder { q[3], q[1], r }
cylinder { q[3], q[2], r }

texture{Lightning2}
}
    
    
union{
cylinder { q[0], q[5], r }
cylinder { q[0], q[6], r }
cylinder { q[0], q[7], r }  

cylinder { q[1], q[4], r }
cylinder { q[1], q[6], r }

cylinder { q[2], q[4], r }
cylinder { q[2], q[5], r }
cylinder { q[2], q[7], r }

cylinder { q[3], q[4], r }
cylinder { q[3], q[5], r }
cylinder { q[3], q[6], r }

cylinder { q[4], q[1], r }
cylinder { q[4], q[2], r }
cylinder { q[4], q[3], r }

cylinder { q[5], q[0], r }
cylinder { q[5], q[2], r }
cylinder { q[5], q[3], r }

cylinder { q[6], q[0], r }
cylinder { q[6], q[1], r }
cylinder { q[6], q[3], r }

cylinder { q[7], q[0], r }
cylinder { q[7], q[1], r }
cylinder { q[7], q[2], r }
      
texture {Vicks_Bottle_Glass}
}      


union{
cylinder { q[4], q[5], r }
cylinder { q[4], q[6], r }
cylinder { q[4], q[7], r }

cylinder { q[5], q[4], r }
cylinder { q[5], q[6], r }
cylinder { q[5], q[7], r }

cylinder { q[6], q[4], r }
cylinder { q[6], q[5], r }
cylinder { q[6], q[7], r }

cylinder { q[7], q[4], r }
cylinder { q[7], q[5], r }
cylinder { q[7], q[6], r }

texture {Rust}
}

#declare s=.06;

//Vertices of the projection
union{
sphere{q[0],s}
sphere{q[1],s}
sphere{q[2],s}
sphere{q[3],s}
sphere{q[4],s}
sphere{q[5],s}
sphere{q[6],s}
sphere{q[7],s}
texture {T_Gold_1A}
}
