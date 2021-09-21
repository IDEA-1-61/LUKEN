
//####Corte eje motor BYJ###

module BYJshaft(tol=1){
            altura=3;
            difference(){
            circle(d=4.95+tol);
            translate([-5,(altura+tol)/2])
                square([10,10]);
                
            translate([-5,-10-(altura+tol)/2])
                square([10,10]);
                }
        }
        
        
   
//#####MOTOR BYJ#####

//corteBYJ(centerShaft=1);

module corteBYJ(centerShaft=1){

    //motor a pasos BYJ
    diamMotor=28;
    distTorMotor=35.4;
    diamTorMotor=3.8;
    tol=1;
    distCenterToShaft=6.5;
    dimCortCuad=18;
         if(centerShaft==1){
            translate([0,distCenterToShaft])
                 union(){
                    circle(d=diamMotor+tol);         //motor
                    square([dimCortCuad+(tol),(dimCortCuad*2)+tol],center=true);      //base
                    square([6+(2*tol),(20*2)+(2*tol)],center=true);      //cables
                    
                    
                    //tronillo motor 1
                    translate([distTorMotor/2,0])
                    circle(d=diamTorMotor+tol);
                    
                    //tronillo motor 2
                    translate([-distTorMotor/2,0])
                    circle(d=diamTorMotor+tol);
                }
            }
            
                     if(centerShaft==0){
          
                 union(){
                    circle(d=diamMotor+tol);         //motor
                    square([17+(tol),(17*2)+tol],center=true);      //base
                    square([6+(2*tol),(19*2)+(2*tol)],center=true);      //cables
                    
                    
                    //tronillo motor 1
                    translate([distTorMotor/2,0])
                    circle(d=diamTorMotor+tol);
                    
                    //tronillo motor 2
                    translate([-distTorMotor/2,0])
                    circle(d=diamTorMotor+tol);
                }
            }
            
        }


//#####POSTE####
   module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }

//#####APOYOS PERFILES#####
module apoyoBase(
diametro=20,
tornillo=4,
tol=1,
altura=10,
altura1=1.25,
anchoCubo=6
){
    difference(){
        union(){
          cylinder(d=diametro,h=altura);
          translate([-diametro/2,-anchoCubo/2,0])
          cube([diametro,anchoCubo,altura+altura1]);
        }
        cylinder(d=tornillo+(tol*2),h=diametro*2,center=true);
    }
}
