//
module soporteFrontal(pieza=1){
    minkow=6;
    
    tol=1;
    diamTuerca=10.58;
    espesor=5;

    if(pieza==1){
        
        difference(){
            linear_extrude(height=espesor)
            difference(){
                
                translate([minkow,minkow])

                    minkowski(){
                        square([50-(minkow*2),36-(minkow*2)]);
                        circle(r=minkow);
                    }
                    
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                   circle(d=4);
                }
                
                translate([40,32])
                circle(d=4);
                
                translate([18,26])
                circle(d=4.9);
                       
             }
                 translate([38,15,2.5])
            linear_extrude(height=5)
            text("R",halign ="center",valign="center");
             
             translate([18,26,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
        }
                    
        //postes tornillos m4
        difference(){
            union(){
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=8,h=7);
                }
                translate([40,32])
                cylinder(d=8,h=7);
            }
            //huecos postes
            translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=4,h=100,center=true);
                }
                translate([40,32])
                cylinder(d=4,h=100,center=true);
        }
           
    }
    else if(pieza==2){

       difference(){
          mirror([1,0,0]){
              difference(){
            linear_extrude(height=espesor)
            difference(){
                
                translate([minkow,minkow])
                //union(){
                    minkowski(){
                        square([50-(minkow*2),36-(minkow*2)]);
                        circle(r=minkow);
                    }
                    
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                   circle(d=4);
                }
                
                translate([40,32])
                circle(d=4);
                
                translate([18,26])
                circle(d=4.9);
                       
             }
            
        }
            
          
        //postes tornillos m4
        difference(){
            union(){
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=8,h=7);
                }
                translate([40,32])
                cylinder(d=8,h=7);
            }
            //huecos postes
            translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=4,h=100,center=true);
                }
                translate([40,32])
                cylinder(d=4,h=100,center=true);
         }
       }
      
             translate([-38,15,2.5])
            linear_extrude(height=5)
            text("L",halign ="center",valign="center");
       
       translate([-18,26,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
      }//fin difference
    }//fin if
    
}

module soporteFrontalV3(){
    
     minkow=6;
    
    tol=1;
    diamTuerca=10.58;
    espesor=5;
     difference(){
            linear_extrude(height=espesor)
            difference(){
                
                translate([minkow,minkow])

                    minkowski(){
                        square([36-(minkow*2),36-(minkow*2)]);
                        circle(r=minkow);
                    }
                    
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                   circle(d=4);
                }

                translate([18,26])
                circle(d=4.9);
                       
             }
           
             
             translate([18,26,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
        }
                    
        //postes tornillos m4
        difference(){
                 translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=8,h=7);
                }

            //huecos postes
            translate([10,10])
                for(s=[0:1]){
                   translate([16*s,0])
                  cylinder(d=4,h=100,center=true);
                }

        }
        
        translate([18,26])
        difference(){
            cylinder(d1=14,d2=10,h=11);
            cylinder(d=4.9,h=100,center=true);
        }
    
}

$fn=100;

//soporteFrontal(pieza=1);
//soporteFrontal(pieza=2);

 //soporteFrontalV3();