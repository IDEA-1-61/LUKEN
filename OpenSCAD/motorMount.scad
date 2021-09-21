
scale([25,25])
import("C:/Users/pablo/Documents/PROYECTOS/Mantenimiento/TRONXYX5Sreplacements/2D_drawings/X5S-monturaStepper.dxf");

module NEMA(){
union(){
  translate([0,0,20])
  cube([42,42,40],center=true);
  cylinder(r=16/2,h=62);
}

}




circle(d=22);


for(f=[0:3]){
    rotate(90)
    translate([31/2,31
    /2])
    circle(d=3);
}