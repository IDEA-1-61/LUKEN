
$fn=120;

translate([44,-20,0])
import("C:/Users/pablo/Downloads/FillerWallMount.stl");

alt=1.5;
for(i=[0:1]){
    rotate(180*i)
    translate([34,0,0])
    difference(){
        
        union(){
          cylinder(d=17,h=7.5-alt);
           translate([0,0,7.5-alt])
          cylinder(d1=17,d2=14,h=alt);
        }
         cylinder(d=4.5,h=100,center=true);
    }
}