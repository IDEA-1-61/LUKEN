
module canalPerfil2020(medida=2,tol=0){
   polygon(points=[[0,-medida],[3+tol,-medida],[3+tol,medida-tol],[5+tol,medida-tol],[5+tol,3+tol],[3+tol,5+tol],[-3-tol,5+tol],[-5-tol,3+tol],[-5-tol,medida-tol],[-3-tol,medida-tol],[-3-tol,-medida]]);  
}


module perfil1(){
    //control del espesor del alumnio en las orillas
    medida=2;
    difference(){
      square([20,20],center=true);
      circle(r=2);
      for(i=[1:4]){
      rotate(i*90)
      translate([0,-20/2])
      canalPerfil2020(medida=medida);
       
       //cuadrado detalle para rodamiento balero*
        rotate(i*90)
       translate([0,-20/2])
       square([7,0.7*2],center=true);   
       }
       
       //square([7,0.7*2],center=true)
       
    }
}


module entradaPerfil(perfil=20,canal=6,esp=6,ajEsX=4,diamT=7,pieza=0,angulo=90){
    
    if(pieza==0){
        difference(){
            translate([0,0,esp/2])
            cube([perfil,perfil,esp],center=true);
            cylinder(d=diamT,h=perfil*5,center=true);
        }
    }


     for(i=[0:3]){
         rotate([0,0,angulo*i])
         translate([(perfil/2)-ajEsX,-canal/2,0])
         if(pieza==0){
           cube([ajEsX,canal,canal+esp]);
         }else if(pieza==1){
             cube([ajEsX,canal,canal]);
         }
     }
}


  module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }


module baleroPatineta(){
    difference(){
    cylinder(r=22/2,h=7,center=true);
    cylinder(r=8/2,h=7+2,center=true);
    }    
}


module chumacera(){
    tol=1;
    altChu=4;
    difference(){
        hull(){
            cylinder(d=25,h=altChu);

            translate([20,0,0])
            cylinder(d=11,h=altChu);

            translate([-20,0,0])
            cylinder(d=11,h=altChu);
        }
        //recorte balero
        cylinder(d=22+tol,h=7.5,center=true);
        
         translate([20,0,0])
            cylinder(d=4.5,h=100,center=true);

            translate([-20,0,0])
            cylinder(d=4.5,h=100,center=true);
        
          cylinder(r=(8/2)+tol,h=100,center=true);
        
        translate([20,0,altChu/2])
            cylinder(d=6.5+tol,h=100);

            translate([-20,0,altChu/2])
            cylinder(d=6.5+tol,h=100);
        
        
       translate([20,0,altChu/2-1])
            cylinder(d2=6.5+tol,d1=4.5,h=1);

            translate([-20,0,altChu/2-1])
            cylinder(d2=6.5+tol,d1=4.5,h=1);
    }
}

       
        
module CarretillaTriangular(
    tol=1,
    diamTorBal=4.6,
    distBalerosX=52,
    distEntreTorY=37.6,
    diamTorProf=5.8,
    minkow=6,
    r1=6,
    r2=6,
    r3=12,
    alturaPoste=8.3,
    espesor=5,
    calcePerfil=3.67,
    diamTuerca=10.58,
    tuerca3=1
){        
       
difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
           
           if(minkow==0){
               hull(){
                   translate([-distBalerosX/2,0])
                   circle(r=r1);
                   translate([distBalerosX/2,0])
                   circle(r=r2);
                   translate([0,-distEntreTorY-diamTorBal])
                   circle(r=r3);
                  
               }
               
           }   
           else if(minkow>0){
                minkowski(){
                      polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY-diamTorBal]]);
                     circle(r=minkow);
                 }
             }
     
            //perforacionBalero_1
            translate([ distBalerosX/2,0])
             circle(d=diamTorBal+tol);
            
              //perforacionBalero_2
            translate([-distBalerosX/2,0])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_3
            translate([0,-distEntreTorY-diamTorBal])
             circle(d=diamTorBal+tol);
                          
                 
                 //perforación peso triangular
                 //translate([0,-(distEntreTorY/2)])
    //             rotate(-90)
      //           minkowski(){
        //            circle(d=28,$fn=3);
          //          circle(d=minkow);
            //      }     
                     
             }
             
                 //poste_1
    translate([ distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([0,-distEntreTorY-diamTorBal])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
       
             
         }             
                  
           //tuerca para perforacionBalero_1
                  translate([distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
          translate([distBalerosX/2+espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         
          //tuerca para perforacionBalero_2
          translate([-distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
                  translate([-distBalerosX/2-espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         //tuerca para perforacionBalero_3
         if(tuerca3==1){
             translate([0,-distEntreTorY-diamTorBal])
             cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
             
             translate([0,-distEntreTorY-diamTorBal-10])
             cube([20,20,(espesor-tol*2)*2],center=true);
         }
         
     }
 
   }//fin modulo  
   
   
module CarroZ(
   tol=1,
    diamTorBal=4.6,
    distBalerosX=40,
    distEntreTorY=36.6,
    diamTorProf=5.8,
    minkow=6,
    alturaPoste=8.3,
    espesor=5,
    calcePerfil=3.67,
    diamTuerca=10.58
   ){
    
       //distEntreTorY=37.6;
    

   altRodGoma=10;
   //longitud de puente
   //lonApoyo=41.7-((distEntreTorY+diamTorBal)/2-10);
       
       lonApoyo=40.5-((distEntreTorY+diamTorBal)/2-10);
   
 
   //apoyo perfil
   translate([0, espesor-distEntreTorY-diamTorBal-lonApoyo,(altRodGoma/2)+alturaPoste+espesor])
   rotate([90,0,0])
   entradaPerfil(perfil=20,esp=espesor,ajEsX=4,diamT=7);

   LonConect=diamTorBal+distEntreTorY+lonApoyo;

   difference(){
       union(){
           CarretillaTriangular(
               tol=tol,
                diamTorBal=diamTorBal,
                distBalerosX=distBalerosX,
                distEntreTorY=distEntreTorY,
                diamTorProf=   diamTorProf,
                minkow=minkow,
                alturaPoste=alturaPoste,
                espesor=espesor,
                calcePerfil=calcePerfil,
                diamTuerca=diamTuerca,
                tuerca3=1
           );
            
           //puente a apoyo
          //translate([-10,- LonConect,0])
           //cube([20,LonConect,espesor]);
           
           translate([10,-distEntreTorY-diamTorBal+20,0])
           rotate([0,0,180])
           cube([20,30,espesor]);
           
           //puente resorte
           translate([0,-distEntreTorY-diamTorBal-20+espesor,espesor/2])
           minkowski(){
               cube([20,0.01,espesor],center=true);
               cylinder(d=20,h=0.01);
           }
           
           //conexion puente a apoyo
           translate([-10,- LonConect,0])
           cube([20,espesor,espesor*2]);
       }//fin union
       
       //tuerca para perforacionBalero_3
         translate([0,-distEntreTorY-diamTorBal])
         cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
       
       //tornillo para perforacionBalero_3
         translate([0,-distEntreTorY-diamTorBal])
         cylinder(d=diamTorBal+tol,h=espesor*4,center=true);
       
          //perforación peso triangular
            translate([0,-(distEntreTorY/2)+espesor])
            rotate([0,0,-90])
            scale([1.3,1,1])
            minkowski(){
                cylinder(d=25,$fn=3,h=espesor*4,center=true);
                cylinder(d=minkow,h=0.01);
            }
          
          //perforacion puente resorte
          
           translate([0,-distEntreTorY-diamTorBal-20+espesor,espesor/2])
           minkowski(){
               cube([20,0.01,espesor*4],center=true);
               cylinder(d=20-(espesor/2),h=0.01);
           }  
   }
}//fin module carro Z

module CarroY(
 tol=1,
    diamTorBal=4.6,
    distBalerosX=40,
    distEntreTorY=36.6,
    diamTorProf=5.8,
    minkow=6,
    alturaPoste=8.3,
    espesor=5,
    calcePerfil=3.67,
    diamTuerca=10.58
){ 
   r3=12;
   posXAp=(distBalerosX/2);
   posYAp=-distEntreTorY-diamTorBal;
  difference(){
   
    union(){
     CarretillaTriangular(
               tol=tol,
                diamTorBal=diamTorBal,
                distBalerosX=distBalerosX,
                distEntreTorY=distEntreTorY,
                diamTorProf=   diamTorProf,
                minkow=0,
                r1=6,
                r2=6,
                r3=r3,
                alturaPoste=alturaPoste,
                espesor=espesor,
                calcePerfil=calcePerfil,
                diamTuerca=diamTuerca,
                tuerca3=0
           );
        
      
         // linear_extrude(height=espesor)
        //polygon([[0,0],[posXAp,posYAp+10],[posXAp,posYAp-26],[espesor*2,posYAp-r3],[0,posYAp-r3]]);
          translate([0,posYAp-10,0])
          cube([posXAp,-posYAp+10,espesor]);
      
       }//fin union
              
          //perforación peso triangular
            translate([0,-(distEntreTorY/2)+espesor])
            rotate([0,0,-90])
            scale([1.3,1,1])
            minkowski(){
                cylinder(d=25,$fn=3,h=espesor*4,center=true);
                cylinder(d=minkow,h=0.01);
            }
            
            //tuerca para perforacionBalero_1
                  translate([distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
          translate([distBalerosX/2+espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         
          //tuerca para perforacionBalero_2
          translate([-distBalerosX/2,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
                  translate([-distBalerosX/2-espesor,0])
                  cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
     
            
         //tornillo_1
    translate([ distBalerosX/2,0])
    cylinder(d=5.6,h=100,center=true);
              
         //tornillo_2
    translate([-distBalerosX/2,0])
    cylinder(d=5.6,h=100,center=true);
         
          //tornillo_3
    translate([0,-distEntreTorY-diamTorBal])
    cylinder(d=5.6,h=100,center=true);
             
      
   }//fin difference
   
    //para tornillos m4 en perfil 2020
       //translate([(distBalerosX/2),-distEntreTorY-diamTorBal,0])
   //translate([posXAp,posYAp,10+espesor+3])
   
   translate([posXAp,posYAp,10+espesor+3])
   rotate([0,90,0])
   difference(){
       translate([-10,-10,0])
       cube([20+espesor+3,20,espesor]);
          cylinder(d=4.5,h=100,center=true);
   }
   
 
   translate([posXAp+10+espesor,posYAp,0])
   difference(){
       translate([-10-espesor,-10,0])
       cube([20+espesor,20,espesor+3]);
           
          cylinder(d=4.5,h=100,center=true);

   }
   
   //translate([posXAp+10+espesor,posYAp,10+espesor+3])
   //color("blue")
   //cube([20,20,20],center=true);
   
     //poste
     translate([posXAp-2,posYAp,10+espesor+3])
   rotate([0,90,0])
     difference(){
         cylinder(d=8,h=7);
         cylinder(d=4,h=100,center=true);
     }
    
      //translate([posXAp+10+espesor,posYAp,0])
      //difference(){
      //   cylinder(d=8,h=7);
       //  cylinder(d=4,h=100,center=true);
     //}
   
   
   
}

module rondana(altura=4){
    
    difference(){
        cylinder(d1=22,d2=20,h=altura/2);
        cylinder(d=5.6,h=100,center=true);
    }
    
     difference(){
        cylinder(d1=12.7,d2=9.5,h=altura);
        cylinder(d=5.6,h=100,center=true);
    }
}


module spoporteFrontal(){

    sepY=5;
    tol=0.5;
    difference(){
       union(){
         cube([20,20,20]);
         
          translate([4.5,-sepY,6])
          cube([11,20,14]);
       }
        translate([10,30,0])
        rotate([90,0,0])
        linear_extrude(height=40)
        canalPerfil2020(medida=2,tol=tol);
        
        translate([0,30,10])
        rotate([90,90,0])
        linear_extrude(height=40)
        canalPerfil2020(medida=2,tol=tol);
        
        translate([10,10,10])
        for(v=[0:1]){
            rotate([0,v*90,0])
            cylinder(d=6,h=100,center=true);
        }
        
        //taladro cilindro
         translate([10,-sepY,6])
        cylinder(d=4.9,h=100,center=true);
    }
    
           
    translate([0,10,10])
           rotate([0,-90,0,])
            entradaPerfil(perfil=20,canal=6,esp=6,ajEsX=4,diamT=7,pieza=1,angulo=180);
    
        translate([10,10,0])
           rotate([0,180,0,])
            entradaPerfil(perfil=20,canal=6,esp=6,ajEsX=4,diamT=7,pieza=1,angulo=180);
    
    translate([10,-sepY,6])
    Poste(altura=14,espesor=3,tol=0,diamShaft=4.9);
        
    
  
    
    

       
}


module fijaPolea(sep=2,alt=8,esp=3){
    cylinder(d=6+sep,h=alt+esp);

   translate([-16,-3-(sep/2),0])
   cube([16,6+sep,esp]);
    
    translate([-12,0])
    difference(){
        translate([0,0,(alt+esp)/2])
        cube([8,6+sep,alt+esp],center=true);
        
        cube([100,sep,100],center=true);
    }
}




/*
thet=7.25;

translate([0,8,-3])
union(){
    translate([0,-9,8])
    rotate([0,0,-thet])
    fijaPolea(sep=2,alt=8,esp=3);
    
    rotate([0,0,thet])
    fijaPolea(sep=2,alt=8,esp=3);


    translate([0,-9,0])
    cylinder(d=8,h=11);

    translate([0,-9,0])
    minkowski(){
        cube([0.01,9,3]);
        cylinder(d=8,h=0.01);
    }
}
*/
module carroX(
tol=1,
    diamTorBal=4.6,
    distBalerosX=40,
    distEntreTorY=36.6,
    diamTorProf=5.8,
    minkow=6,
    alturaPoste=8.3,
    espesor=5,
    calcePerfil=3.67,
    diamTuerca=10.58
){
    esp=3.75;
    altPil=16;
    disXP=24.75;

    rotate([90,0,0])
    CarretillaTriangular(
        tol=1,
        diamTorBal=4.6,
        distBalerosX=40,
        distEntreTorY=36.6,
        diamTorProf=5.8,
        minkow=6,
        r1=6,
        r2=6,
        r3=12,
        alturaPoste=8.3,
        espesor=5,
        calcePerfil=3.67,
        diamTuerca=10.58,
        tuerca3=1
    );


    translate([disXP,-5,-esp])
    for(g=[0:1]){
        translate([0,0,(altPil)*g])
        minkowski(){
                cube([6,0.01,esp]);
                cylinder(d=esp,h=0.01);
            }
    }

    translate([disXP,-5,-esp])
    for(w=[0:1]){
        translate([6*w,0,0])
        cylinder(d=esp,altPil+esp);
    }

    mirror([1,0,0]){
            translate([disXP,-5,-esp])
        for(g=[0:1]){
            translate([0,0,(altPil)*g])
            minkowski(){
                    cube([6,0.01,esp]);
                    cylinder(d=esp,h=0.01);
                }
        }

        translate([disXP,-5,-esp])
        for(w=[0:1]){
            translate([6*w,0,0])
            cylinder(d=esp,altPil+esp);
        }

    }

    
      //realce triangular
    translate([0,4,0])
       rotate([90,0,0])
       translate([0,-(distEntreTorY/2)+espesor,0])
                rotate([0,0,-90])
                scale([1.3,1,1])
                minkowski(){
                    cylinder(d=25,$fn=3,h=espesor+4);
                    cylinder(d=minkow,h=0.01);
                }

    //apoyosHOTEND=14.5mm
            }//fin modulo carroX

//################RENDERIZADOS#################
   
   $fn=100;
   
//CarroZ();
//CarroY();
//rondana(altura=4);
//Poste(altura=2,espesor=3,tol=0.5,diamShaft=4);
//spoporteFron
            carroX();




//baleroPatineta();
