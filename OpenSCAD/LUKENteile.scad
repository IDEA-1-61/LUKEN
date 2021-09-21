

use <MCAD/involute_gears.scad>

   piezaCarretillaX();
       
        
  module piezaCarretillaX(){        
        tol=1;
diamTorBal=4.6;
 
 distBalerosX=52;  
//distancia medida a finales de circunferencia
 distEntreTorY=37.6;     

diamTorProf=5.8;

minkow=6;
alturaPoste=8.32;
espesor=5;

//altura perfil
calcePerfil=3.67;
      
      //tuerca presion
      diamTuerca=10.58;

difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
         
                minkowski(){
                    union(){
                    polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY-diamTorBal]]);
                         polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[10,distEntreTorY+diamTorBal],[-10,distEntreTorY+diamTorBal]]);
                        
                              //trayectoria para perfil cuadrado
                       translate([0,distEntreTorY+diamTorBal])
                       square([20-1,20-(2*minkow)],center=true);
                        
                        }
                     circle(r=minkow);
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
             
             //perforación motor a pasos
                 //ajuste de altura
                 translate([0,6])
            corteBYJ(centerShaft=1);
                             
                 
                 //perforación peso triangular
                 translate([0,-(distEntreTorY/2)])
                 rotate(-90)
                 minkowski(){
                    circle(d=28,$fn=3);
                    circle(d=minkow);
                  }     
                     
             }
             
             //cubo para calce del perfil
             translate([-10-(tol/2),distEntreTorY+diamTorBal-10])
             cube([20+tol,20,espesor+calcePerfil]);
             
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
         
         //perforacion Tornillo perfil
              translate([0,distEntreTorY+diamTorBal])
               // circle(d=diamTorProf+tol);
             cylinder(d=diamTorProf+tol,h=20,center=true);
         
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
         translate([0,-distEntreTorY-diamTorBal])
         cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         translate([0,-distEntreTorY-diamTorBal-10])
         cube([20,20,(espesor-tol*2)*2],center=true);
         
     }
         
         //apoyos para perfil en 90 grados
         difference(){
             union(){
               translate([10+(tol/2),distEntreTorY+diamTorBal-10])
               cube([espesor,20,espesor+10]);
                 
                 
                     //parte redonda
                translate([10+(tol/2),distEntreTorY+diamTorBal,espesor+10])
                rotate([0,90,0])
                cylinder(d=20,h=5);
                 
                 mirror([1,0,0]){
                     translate([10+(tol/2),distEntreTorY+diamTorBal-10])
                     cube([espesor,20,espesor+10]);
                     
                     //parte redonda
                       translate([10+(tol/2),distEntreTorY+diamTorBal,espesor+10])
                rotate([0,90,0])
                cylinder(d=20,h=5);
                }
           }
           
            translate([0,distEntreTorY+diamTorBal,espesor+10])
           rotate([0,90,0])
           cylinder(d=5,h=50,center=true);
             
       }
       
     
   }//fin modulo       
        
  
module JumperYZ(
 distBalerosX=52,
 distEntreTorY=37.6,  
 espesor=5,
 diamTuerca=10.58,
 tol=1
 ){
 
    
    difference(){
        union(){
        translate([0,distEntreTorY/2,0])
        Base3(
         modo=0,
         tol=1,
         diamTorBal=4.6,
         distBalerosX=52,   
         distEntreTorY=37.6,   
         distMontY=32,
         distMontX=7,   
         elipse1=1,
         elipse2=1,
         diamTorProf=5.8,
         minkow=6,
         alturaPoste=8.32,
         espesor=5,
         diamTuerca=10.58
        );
       
    rotate([0,180,90])
    translate([0,distEntreTorY/2,-espesor])
    Base3(
     modo=0,
     tol=1,
     diamTorBal=4.6,
     distBalerosX=52,   
     distEntreTorY=37.6,   
     distMontY=32,
     distMontX=7,   
     elipse1=1,
     elipse2=1,
     diamTorProf=5.8,
     minkow=6,
     alturaPoste=8.32,
     espesor=5,
     diamTuerca=10.58
    );
   }
   
   //perforaciones tornillos1
    translate([0,distEntreTorY/2,0])
    Base3(
     modo=1,
     tol=1,
     diamTorBal=4.6,
     distBalerosX=52,   
     distEntreTorY=37.6,   
     distMontY=32,
     distMontX=7,   
     elipse1=1,
     elipse2=1,
     diamTorProf=5.8,
     minkow=6,
     alturaPoste=8.32,
     espesor=5,
     diamTuerca=10.58
    );
   
   //perforaciones tornillos2
    rotate([0,180,90])
    translate([0,distEntreTorY/2,-espesor])
    Base3(
     modo=1,
     tol=1,
     diamTorBal=4.6,
     distBalerosX=52,   
     distEntreTorY=37.6,   
     distMontY=32,
     distMontX=7,   
     elipse1=1,
     elipse2=1,
     diamTorProf=5.8,
     minkow=6,
     alturaPoste=8.32,
     espesor=5,
     diamTuerca=10.58
    );
    
    translate([0,0,-espesor/2])
    linear_extrude(height=espesor*2)
    minkowski(){
       polygon([[6.5,-6.5],[19,14],[-14.5,14.5],[-14,-19]]);
        circle(d=minkow);
    }

   }
    
}




module Base3(
 modo=1,
 tol=1,
 diamTorBal=4.6,
 distBalerosX=52,   
 distEntreTorY=37.6,   
 distMontY=32,
 distMontX=7,   
 elipse1=1,
 elipse2=1,
 diamTorProf=5.8,
 minkow=6,
 alturaPoste=8.32,
 espesor=5,
 diamTuerca=10.58
){
if(modo==0){
    difference(){
         union(){
         linear_extrude(height=espesor)
               difference(){   
                    minkowski(){
                     
                                             //poligono inferior
                        polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY-diamTorBal]]);
                        circle(r=minkow);
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
            }//fin union
            
               //tornillo para perforacionBalero_1
                          translate([distBalerosX/2,0])
                          cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);
                 
              
                  //tornillo para perforacionBalero_2
                  translate([-distBalerosX/2,0])
                          cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);
                 
                 //tornillo para perforacionBalero_3
                 translate([0,-distEntreTorY-diamTorBal])
                 cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);

            
        }
    }else if(modo==1){
                         
                        //perforacionBalero_1
                  translate([ distBalerosX/2,0])
                  cylinder(d=diamTorBal+tol,h=espesor*10,center=true);  
                  //perforacionBalero_2
                  translate([-distBalerosX/2,0])
                  cylinder(d=diamTorBal+tol,h=espesor*10,center=true);   
                  //perforacionBalero_3
                  translate([0,-distEntreTorY-diamTorBal])
                  cylinder(d=diamTorBal+tol,h=espesor*10,center=true);
        
               //tornillo para perforacionBalero_1
                          translate([distBalerosX/2,0])
                          cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);
                 
                
        //tornillo para perforacionBalero_2
                  translate([-distBalerosX/2,0])
                          cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);
                 
                 //tornillo para perforacionBalero_3
                 translate([0,-distEntreTorY-diamTorBal])
                 cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,center=true);
    }        
}
        
   //####CARRETILLA####
    
  //modo          -> modo de renderizado de la pieza
  //              -> 0 para redondeado minkowski
  //              -> 1 para redondeo minkowski superior y rectuangulo inferior
  //              -> 2 para redondeo minkowski superior y recorte elipses inferior
  //              -> 3 para poligono rectangular
  //tol           -> tolerancia de la pieza
  //diamTorBal    -> diametro de tornillo baleros afunta
  //distBalerosX  -> distancia a centros de baleros afunta horizontalmente
  //distEntreTorY -> distancia medida a finales de circunferencia
  //distMontY=27  -> distancia vertical para montura superior motor
  //distMontX=5   -> distancia horizontal para montura superior motor
  //diamTorProf   -> diametro tornillo perfil de aluminio
  //minkow        -> radio de operacion minkowski
  //alturaPoste   -> altura de poste para tornillo a balero afunta
  //espesor       -> espesor del material
  //diamTuerca    -> tuerca presion

module Carretilla(
 modo=0,
 tol=1,
 diamTorBal=4.6,
 distBalerosX=52,   
 distEntreTorY=37.6,   
 distMontY=32,
 distMontX=7,   
 elipse1=1,
 elipse2=1,
 diamTorProf=5.8,
 minkow=6,
 alturaPoste=8.32,
 espesor=5,
 diamTuerca=10.58,
 carrYZ=1
){
   
          dimSqX=distBalerosX+(2*minkow);
          dimSqY=distEntreTorY+minkow+espesor;
          distTorUnion=11;
 difference(){
  union(){
   difference(){
    linear_extrude(height=espesor)
       difference(){   
         if(modo==0){
            minkowski(){
              union(){
                   //poligono superior
                   polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[distMontX,distMontY],[-distMontX,distMontY]]); 
                  //poligono inferior
                polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[0,-distEntreTorY-diamTorBal]]);                                   
               }
               circle(r=minkow);
             }
          }
          
          else if(modo==1){  
            union(){
               minkowski(){           
                  polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[distMontX,distMontY],[-distMontX,distMontY]]);          
                  circle(r=minkow);
               }  
               translate([-dimSqX/2,-dimSqY])
               square([dimSqX,dimSqY]);
            }     
          }
          
          
          else if(modo==2){  
             //difference(){
              union(){
               minkowski(){           
                  polygon([[-distBalerosX/2,0],[distBalerosX/2,0],[distMontX,distMontY],[-distMontX,distMontY]]);          
                  circle(r=minkow);
               }  
               translate([-dimSqX/2,-dimSqY])
               difference(){
               //corte elipse 1 (izquierda)
                 square([dimSqX,dimSqY]);
                   
                 if(elipse1==1){
                     resize([dimSqX-(diamTorBal+(tol*4)+espesor),dimSqY*2]){
                        circle(r=4);
                     }
                 }
                 //corte elipse 2 (derecha)
                 if(elipse2==1){
                     translate([dimSqX,0])
                      resize([dimSqX-(diamTorBal+(tol*4)+espesor),dimSqY*2]){
                        circle(r=4);
                     }
                 }
               }
            }     
          
            
             //}
          }
 
         
  
          else if(modo==3){    
            translate([-(distBalerosX+(2*minkow))/2,-distEntreTorY-diamTorBal-minkow])
            square([distBalerosX+(2*minkow),(2*minkow)+distEntreTorY+diamTorBal+(distEntreTorY-5)]);
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
          
          
          //perforación motor a pasos, ajuste de altura
          translate([0,6])
          corteBYJ(centerShaft=1);       
          
         }
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
         translate([0,-distEntreTorY-diamTorBal])
         cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
         
         translate([0,-distEntreTorY-diamTorBal-6])
         cube([12,12,(espesor-tol*2)*2],center=true);
         
           if(carrYZ==1){
                
                translate([0,-(distEntreTorY/2)+(distTorUnion/2),0])
                  for(i=[0:1]){
                     translate([0,-distTorUnion*i])
                    cylinder(d=diamTorBal,h=20,center=true);
                   }
                   
                   //tuercas para tornillos de union
               translate([0,-(distEntreTorY/2)+(distTorUnion/2),(espesor-tol*2)*1.5])
               for(i=[0:1]){
                   translate([0,-distTorUnion*i])
                   cylinder(d=diamTuerca+tol,h=(espesor-tol*2)*2,$fn=6,center=true);
               }
            }else if(carrYZ==2){
                translate([-(distTorUnion/2),-(distEntreTorY/2),0])
                  for(i=[0:1]){
                    translate([distTorUnion*i,0])
                    cylinder(d=diamTorBal,h=20,center=true);
                   }              
            }else if(carrYZ==3){
                 //perforación peso triangular
                 
                 translate([0,-(distEntreTorY/2),-espesor*2])
                 rotate(-90)
                 linear_extrude(height=espesor*4)
                  minkowski(){
                    circle(d=28,$fn=3);
                    circle(d=minkow);
                  }     
              }
         
     }
     
 }//fin modulo


module barra(largo=20,ancho=4,espesor=3,minkow=1,modo=0,diamTor=3.86,tol=1){
    
          difference(){
            minkowski(){
                cube([largo-(2*minkow),ancho-(2*minkow),espesor],center=true);
                cylinder(r=minkow,h=0.1);
            }
            
            if(modo==0){
            }
            else if(modo==1){
                //barreno 1
              translate([(largo/2)-(minkow/2)-(diamTor+1)/2,0,0])
              cylinder(d=diamTor+1,h=espesor*2,center=true);
              
                //barreno 2
              translate([-(largo/2)+(minkow/2)+(diamTor+1)/2,0,0])
              cylinder(d=diamTor+1,h=espesor*2,center=true);
        
            }
            else if(modo==2){
                //barreno 1
              translate([(largo/2)-(minkow/2)-(diamTor+1)/2,0,0])
              cylinder(d=diamTor+1,h=espesor*2,center=true);
                      
            }
                
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
               
       lonA=30;

//diamTor Valor=3.86 se cambiO por 3.5
 rotate(-60)
translate([(lonA/2)+separaEng-alturaEng,0,alturaEng/2])
barra(largo=lonA,ancho=8,espesor=alturaEng,minkow=2.5,modo=2,diamTor=3.5,tol=1);
        
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
        
           lonA=30;
   
    //diamTor Valor=3.86 se cambiO por 3.5    
         rotate(240)
translate([(lonA/2)+separaEng-alturaEng,0,alturaEng/2])
barra(largo=lonA,ancho=8,espesor=alturaEng,minkow=2.5,modo=2,diamTor=3.5,tol=1);
}

       
 module gripper(){
lonA=40;     
lonB=80;

alturaEng=4;
separaEng=17.7;
 diamTor=3.86;
minkow=3.9;

difference(){
    translate([(lonA+3.5)*cos(30),-(lonA+separaEng+12)*sin(30),0])
    rotate(55)
    translate([(-lonB/2-(-(minkow/2)-(diamTor+1)/2)),0,alturaEng*1.5])

   //diamTor Valor=3.86 se cambiO por 3.5  
    difference(){
    barra(largo=lonB,ancho=8,espesor=alturaEng,minkow=3.9,modo=2,diamTor=3.5,tol=1);

    translate([13.5,0,0])
    cylinder(d=diamTor+1,h=alturaEng*2,center=true);
    }
    
    rotate([90,0,0])
    cube([40,20,200],center=true);
}

dimGrip=1;

largoPinza=24;
translate([20,-56,alturaEng])
difference(){
    linear_extrude(height=alturaEng)
    polygon([[-dimGrip,0],[8,0],[4,-largoPinza],[-dimGrip,-largoPinza]]);
 
    translate([-dimGrip,0])
    for(i=[0:6]){
        translate([0,i*-4])
        cylinder(d=2,h=20,center=true);
    }

}        
        

}

 module basePinza(
diamTor=3.5,
minkow=3.9,
tol=0.5,
espesor=5,
altCenPico=76,
sepTor=40
  ){
  
   posTorPer1=altCenPico-sepTor;
  
    difference(){
        union(){
            minkowski(){
                hull(){ 
               
                    //cubo arriba
                    translate([0,0,-espesor])
                    cube([0.1,altCenPico,5]);
                    
                //cubo central
                  translate([-6,5,-espesor/2])          
                    cube([55,10,espesor],center=true);
            
                    //cubo abajo
                    translate([0,-10,-espesor/2])
                    cube([28,28,5],center=true);
                }
               cylinder(r=6,h=0.1);   
            }
            //poste contra de pieza a motor a pasos
            translate([separaEng,0,-espesor])
           Poste(altura=espesor+6,espesor=espesor,tol=tol,diamShaft=7.86);
            
            //poste barra 1
             translate([9,-25.75,-espesor])
            Poste(altura=espesor+6,espesor=espesor/2,tol=tol,diamShaft=diamTor);
            
            //poste barra 2
             translate([-9,-25.75,-espesor])
            Poste(altura=espesor+6,espesor=espesor/2,tol=tol,diamShaft=diamTor);
       }    
        
            //agujero motor a pasos BYJ
             translate([-separaEng,0,-40])
                linear_extrude(height=80)
              corteBYJ(centerShaft=1);
        
          //barreno barra pinza 1
           translate([9,-25.75,0])
             cylinder(d=diamTor+tol,h=espesor*3,center=true);
        
        //barreno barra pinza 2
           translate([-9,-25.75,0])
             cylinder(d=diamTor+tol,h=espesor*3,center=true);
        
        //agujero tornillo apoyo contra de motor a pasos
         translate([separaEng,0,0])
        cylinder(d=7.86+tol,h=espesor*3,center=true);

       
        //tornillo apoyo perfil 1
         translate([0,posTorPer1,0])
        cylinder(d=4+tol,h=espesor*3,center=true);
        
         //cabeza tornillo apoyo perfil 1
         translate([0,posTorPer1,-espesor/2])
        cylinder(d=7+tol,h=espesor*3);
        
       
        //tornillo apoyo perfil 2
         translate([0,posTorPer1+sepTor,0])
        cylinder(d=4+tol,h=espesor*3,center=true);
        
           //cabeza tornillo apoyo perfil 2
         translate([0,posTorPer1+sepTor,-espesor/2])
        cylinder(d=7+tol,h=espesor*3);
            
    }

}

  //####RENDERIZADOS#####
   
$fn=100;



//##CONJUNTO SISTEMA DE PINZA

alturaEng=4;
separaEng=17.7;

/*
translate([separaEng,0])
 pinzaDer();


//engrane pinza izquierda
translate([-separaEng,0])
       pinzaIzq();
*/
lonA=40;


 //diamTor Valor=3.86 se cambiO por 3.5  
/*
//barra pinza derecha
translate([0,-10,0])
 rotate(-60)
translate([(lonA/2)+separaEng-alturaEng,0,alturaEng/2])
barra(largo=lonA,ancho=8,espesor=alturaEng,minkow=3.9,modo=1,diamTor=3.5,tol=1);
               
//barra pinza izquierda
translate([0,-10,0])
 rotate(240)
translate([(lonA/2)+separaEng-alturaEng,0,alturaEng/2])
barra(largo=lonA,ancho=8,espesor=alturaEng,minkow=3.9,modo=1);
        gripper();
 
       
 mirror([1,0,0]){
        gripper();    
 }
 
 translate([0,0,-6.5])
 basePinza();
 */

//diametro de tornillos 6/32x3/4" en conversion es 4.23mm
//diamTor calculado valor de 4.23

//convencional
//tol=1;
//ajustada

 //diamTor Valor=3.86 se cambiO por 3.5  
 //medido
//diamTor=3.75;
//diamTor=3.86;
 // altCenPico->altura del origen al pico de la pieza
 //sepTor->separacion entre tornillos del apoyo del perfil
 //posTorPer1->separacion de primer tornillo de apoyo de perfil al origen
 
 

/*basePinza(
diamTor=3.5,
minkow=3.9,
tol=0.5,
espesor=5,
altCenPico=76,
sepTor=40
  );*/
  
 

//piezaCarretillaX();

//MEDIDA ANTERIOR
 //distEntreTorY=37.6, 
//carretilla Standard
/*Carretilla(
 modo=0,
 tol=1,
 diamTorBal=4.6,
 distBalerosX=52,   
 distEntreTorY=37, 
 distMontY=32,
 distMontX=7,   
 elipse1=1,
 elipse2=1,
 diamTorProf=5.8,
 minkow=6,
 alturaPoste=8.32,
 espesor=5,
 diamTuerca=10.58,
 carrYZ=3
);*/

/*JumperYZ(
 distBalerosX=52,
 distEntreTorY=37,  
 espesor=5,
 diamTuerca=10.58,
 tol=1
 );*/