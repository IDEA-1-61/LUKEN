
$fn=120;

difference(){
import("M2_nuevo.stl");

rotate([90,0,0])
cylinder(d=3,h=100,center=true);
    
    translate([0,0.15,0])
    rotate([90,0,0])
cylinder(d=5.5,h=100,$fn=6);
}