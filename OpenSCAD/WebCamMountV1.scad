module WebCamMount(
espCam=16,
dimTor=4.6
){

    difference(){
        
        difference(){
            union(){
                linear_extrude(height=5)
                minkowski(){
                 
                 square([50,0.1],center=true);
                 circle(d=15);   
                }
                 alt=1.4;
                for(e=[0:1]){
                    rotate(180*e)
                    union(){
                        translate([25,0])
                        cylinder(d=14.5,h=6.5-alt);
                        
                        translate([25,0,6.5-alt])
                        cylinder(d1=14.5,d2=10,h=alt);
                    }
                }
            }
            translate([-25,0])
            for(d=[0:1]){
               translate([50*d,0])
               cylinder(d=4,h=100,center=true);
            }
        }
         /*translate([-25,0,3.5])
            for(d=[0:1]){
               translate([50*d,0,0])
               cylinder(d=10,h=10);
            }*/
    }
    
    
    esp=5;
    diam=10;

    lonX=espCam+(2*esp);

    difference(){
        union(){
            translate([0,-24.5,4.9])
            rotate([0,-90,0])
            resize([17.5,32,lonX])
            intersection(){
                difference(){
                     cylinder(d=diam+(2*esp),h=lonX,center=true);
                     scale([0.88,1.1,1])
                     cylinder(d=diam,h=lonX*2,center=true);
                }
                translate([0,0,-lonX*3])
                cube([lonX*6,lonX*6,lonX*6]);
            }
            translate([0,-25,17.5])
            rotate([0,90,0])
            cylinder(d=10,h=lonX,center=true);
        }
        //agujero tornillo 
        translate([0,-25,17.5])
            rotate([0,90,0])
            cylinder(d=dimTor,h=lonX*2,center=true);
        
        //Espacio Camara
         translate([0,-25,0])
        cube([espCam,espCam*2,300],center=true);
    }
}

$fn=200;

intersection(){
    WebCamMount(
    espCam=16,
    dimTor=4.6
    );
        
  cube(500,center=true);    
}