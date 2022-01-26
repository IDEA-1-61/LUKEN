//####PIEZAS ANTIGUAS DE PRIMER PROTOTIPO#####

use <MCAD/involute_gears.scad>

   module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }

//prueba
   //monturaPerfil(corteTriangulo=1,fijacion=0,  distTorYProf=65);

module monturaPerfil(corteTriangulo=1,fijacion=0,  distTorYProf=65){

espesor=2;

distTorX=63;
    //primer intento
//distTorY=56.5;
    //segundo intento
 distTorY=57;

diamTorBal=4.6;

tol=1;
mink=10;

//motor a pasos BYJ
diamMotor=28;
distTorMotor=35.4;
diamTorMotor=3.8;

//apoyoPerfil
diamTorProf=5.8;
//diamTorProf=7;
distTorProf=20;
//    distTorYProf=65;

//recorte triangulo minkowski
espBarra=5;

difference(){
    translate([0,0,-espBarra+0.1])
    linear_extrude(height=espBarra)
    difference(){
        minkowski(){
            polygon([[(-distTorX/2)+(mink/2),0],[0,distTorYProf-(mink/2)],[(distTorX/2)-(mink/2),0],[0,-distTorY+(mink/2)]]);
            circle(r=mink);
        }
        
        offTriang=12;
        offTriangAlt=14;
        minkTriang=5;
        
        
        if(corteTriangulo==1){
              minkowski(){
              polygon([[(-distTorX/2)+(minkTriang/2)+offTriang,-offTriangAlt],[(distTorX/2)-(minkTriang/2)-offTriang,-offTriangAlt],[0,-distTorY+(minkTriang/2)+(offTriang*0.75)]]);
              circle(r=minkTriang);
           }
       }
        
            if(  distTorYProf>50){
            //apoyos perfil
            translate([0,(distTorYProf/2)+(diamMotor/2)-espesor])
            union(){
            //tornillo perfil 1
                circle(d=diamTorProf+tol);
            
            //tornillo perfil 2
                translate([0,distTorProf])
               circle(d=diamTorProf+tol);
            }
        
        }
        
        //motor BYJ
        translate([0,diamMotor/2])
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
            
     
        //balero 1
        translate([-distTorX/2,0])
        circle(d=diamTorBal+tol);
        
        //balero 2
        translate([distTorX/2,0])
        circle(d=diamTorBal+tol);
        
        //balero 3
        translate([0,-distTorY])
        circle(d=diamTorBal+tol);
        
        if(fijacion==1){
            
         translate([0,-15])   
            union(){
            //fijacion 1
           circle(d=diamTorBal+tol);   
            
            //fijacion 1
            translate([0,-sepTuer])
           circle(d=diamTorBal+tol);   
            }
        }
        
    }
    
       if(fijacion==1){
            
         translate([0,-15,-espBarra/2])   
            union(){
            //fijacion 1
           cylinder(d=diamTuer+tol,h=espBarra*2);
            
            //fijacion 1
            translate([0,-sepTuer])
            cylinder(d=diamTuer+tol,h=espBarra*2);
            }
        }
    
    
}

//tornillos de fijacion   
         sepTuer=20;
        diamTuer=10.5;

//postes baleros
    alturaPostes=10;

    //poste balero 1
       translate([-distTorX/2,0])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);


    //poste balero 2
     translate([distTorX/2,0])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);

    //poste balero 3
         translate([0,-distTorY])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);
}

//!monturaPerfilVertical();

module monturaPerfilVertical(){

espesor=2;

distTorX=63;
    //primer intento
//distTorY=37.75;
//segundo intento
//distTorY=37.25;
    //tercer intento
distTorY=36.75;
diamTorBal=4.6;
tol=1;
mink=10;

//motor a pasos BYJ
diamMotor=28;
distTorMotor=35.4;
diamTorMotor=3.8;

    distTorYProf=40;

//recorte triangulo minkowski
espBarra=5;

difference(){
    translate([0,0,-espBarra+0.1])
    linear_extrude(height=espBarra)
    difference(){
        minkowski(){
            polygon([[(-distTorX/2)+(mink/2),0],[0,distTorYProf-(mink/2)],[(distTorX/2)-(mink/2),0],[0,-distTorY+(mink/2)]]);
            circle(r=mink);
        }
               
        //motor BYJ
        translate([0,diamMotor/2])
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
            
     
        //balero 1
        translate([-distTorX/2,0])
        circle(d=diamTorBal+tol);
        
        //balero 2
        translate([distTorX/2,0])
        circle(d=diamTorBal+tol);
        
        //balero 3
        translate([0,-distTorY])
        circle(d=diamTorBal+tol);
        
        //fijacion 1
        translate([sepTuer/2,-distTorY/2])
      circle(d=diamTorBal+tol);
        
           //fijacion 2
        translate([-sepTuer/2,-distTorY/2])
      circle(d=diamTorBal+tol);
       
    }
    
         sepTuer=20;
        diamTuer=10.5;
        
        //tuerca 1
               translate([sepTuer/2,-distTorY/2,-espBarra/2])
        cylinder(d=diamTuer+tol,h=espBarra*2,$fn=6);
    
     //tuerca 2
               translate([-sepTuer/2,-distTorY/2,-espBarra/2])
        cylinder(d=diamTuer+tol,h=espBarra*2,$fn=6);
    
}

    alturaPostes=10;

    //poste balero 1
       translate([-distTorX/2,0])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);

    //poste balero 2
     translate([distTorX/2,0])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);

    //poste balero 3
         translate([0,-distTorY])
    Poste(altura=alturaPostes,espesor=espesor,tol=1,diamShaft=diamTorBal);
}



module torreUnion( sepTuer=20, diamTorBal=4.6,  altura=17,tol=1, espesor=2){
 // diamTorBal=4.6;

  
    
   
    
    difference(){
        linear_extrude(height=altura)
        minkowski(){
        square([0.1,sepTuer],center=true);
            circle(d=diamTorBal+(2*espesor)+(2*tol));
            }
            
            //Conducto 1
            translate([0,sepTuer/2,0])
            cylinder(d=diamTorBal+tol,h=altura*4,center=true);
            
            
            //Conducto 2
            translate([0,-sepTuer/2,0])
            cylinder(d=diamTorBal+tol,h=altura*4,center=true);
    }
    
}


module pinzaDer(){
    alturaEng=4;
separaEng=17.7;
    rotate(360/32)
        gear(circular_pitch = 400,
		number_of_teeth = 16,
		gear_thickness = alturaEng,
		rim_thickness = alturaEng,
		hub_thickness = alturaEng,
		bore_diameter = 22);
               
       lonA=40;
        lonB=60;
        desvio=8;

        difference(){
            //pieza
            translate([-separaEng,0])
            linear_extrude(height=alturaEng*1.25,scale=0.9)
            polygon([[0,0],[(separaEng*2),0],[(separaEng*2),-lonA],[0,-lonB]]);
            //secundario
             translate([-separaEng-(desvio*2),desvio,-alturaEng*2])
            linear_extrude(height=alturaEng*4)
            polygon([[0,0],[(separaEng*2),0],[(separaEng*2),-lonA],[0,-lonB]]);
           //balero
            cylinder(d=22,h=80,center=true);
        }
}

module pinzaIzq(){
    tol=0.25;
     difference(){
        gear(circular_pitch = 400,
		number_of_teeth = 16,
		gear_thickness = alturaEng,
		rim_thickness = alturaEng,
		hub_thickness = alturaEng,
		bore_diameter = 0);
            
             translate([0,0,-alturaEng])
            		linear_extrude(alturaEng*2)
                   BYJshaft(tol=tol);
		}
        
           lonA=40;
        lonB=60;
        desvio=8;

        difference(){
            //pieza
            translate([separaEng,0])
            linear_extrude(height=alturaEng*1.25,scale=0.9)
            polygon([[0,0],[(-separaEng*2),0],[(-separaEng*2),-lonA],[0,-lonB]]);
            //secundario
             translate([separaEng+(desvio*2),desvio,-alturaEng*2])
            linear_extrude(height=alturaEng*4)
            polygon([[0,0],[(-separaEng*2),0],[(-separaEng*2),-lonA],[0,-lonB]]);
           //shaft
            translate([0,0,-alturaEng*2])
            		linear_extrude(alturaEng*4)
                   BYJshaft(tol=tol);
        }
        
    
}
        
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

module monturaPinza(){
    
    espesor=2;
distTorX=80;
    //primer intento
//distTorY=56.5;
    //segundo intento
 distTorY=18;
diamTorBal=4.6;
tol=1;
mink=10;

//motor a pasos BYJ
diamMotor=28;
distTorMotor=35.4;
diamTorMotor=3.8;

//apoyoPerfil
//diamTorProf=5.8;
diamTorProf=4;
distTorProf=20;
distTorYProf=65;

//recorte triangulo minkowski
espBarra=5;
//engrane
separaEng=17.7;
desvMot=8;
basPin=20;

difference(){
    translate([0,0,-espBarra+0.1])
    linear_extrude(height=espBarra)
    difference(){
        minkowski(){
            polygon([[(-distTorX/2)+(mink/2),desvMot],[0,distTorYProf-(mink/2)],[(distTorX/2)-(mink/2),desvMot],[basPin,-distTorY+(mink/2)],[-basPin,-distTorY+(mink/2)]]);
            circle(r=mink);
        }
        
            //apoyos perfil
            translate([0,(distTorYProf/2)+(diamMotor/2)-espesor])
            union(){
            //tornillo perfil 1
                circle(d=diamTorProf+tol);
            
            //tornillo perfil 2
                translate([0,distTorProf])
               circle(d=diamTorProf+tol);
            
            }
            
            //tornillo perfil 34
            translate([0,-15])
               circle(d=diamTorProf+tol);
        
        //motor BYJ
            //8mm desvio del centro del shaft al centro del motor
        translate([-separaEng,8])
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
        
          translate([separaEng,0])
           circle(d=8+tol);

    }
    
    //cabeza perfiles
    translate([0,(distTorYProf/2)+(diamMotor/2)-espesor,-espBarra/2])
    union(){
            //tornillo perfil 1
              cylinder(d=7.5+tol,h=espBarra);
            
            //tornillo perfil 2
                translate([0,distTorProf])
               cylinder(d=7.5+tol,h=espBarra);
            }
    
            //tornillo perfil 3
             translate([0,-15,-espBarra/2])
               cylinder(d=7.5+tol,h=espBarra);
    
 } 

 //poste balero 1
    translate([separaEng,0])
   Poste(altura=2,espesor=espesor,tol=1,diamShaft=8);

//Poste(altura=2,espesor=espesor,tol=1,diamShaft=diamTorProf);

}

//#####RENDERIZADOS#####

//$fn=100;

espBarra=5;
distTorY=37.75;
sepPlacas=17;

//monturaPerfil();


monturaPerfil(corteTriangulo=0,fijacion=1,  distTorYProf=40);

translate([distTorY/2,-25,-espBarra*2-sepPlacas])
rotate([180,0,90])
 monturaPerfilVertical();

translate([0,-25,-sepPlacas-espBarra])
torreUnion();


alturaEng=4;
separaEng=17.7;


//##CONJUNTO SISTEMA DE PINZA
union(){
   // alturaTorre=13.5;
     alturaTorre=13;
   monturaPinza();
    translate([0,54.5,-alturaTorre-5])
    torreUnion( sepTuer=20, diamTorBal=4,  altura=alturaTorre,tol=1, espesor=3);

     translate([0,-15,-alturaTorre-5])
    Poste(altura=alturaTorre,espesor=3,tol=1,diamShaft=4);

//piezas mOviles
    
    union(){
translate([separaEng,0])

  pinzaDer();
        
        
translate([-separaEng,0])
       pinzaIzq();

}

}
  

