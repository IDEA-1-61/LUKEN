 //espaciadorYZ();
   
   module espaciadorYZ(
   distTorUnion=11,
   tol=1,
   diamTorBal=4.6,
   altura=7.5,
   espesor=5 ){
     
       difference(){
           minkowski(){
            cube([distTorUnion,0.1,altura]);
            cylinder(r=espesor+(tol/2),h=0.1);               
           }
          for(i=[0:1]){ 
              translate([distTorUnion*i,0])
              cylinder(d=diamTorBal+tol,h=altura*3,center=true);
          }
       }
 }
 
         
//!carretillaYZ();

//Revisar explicación de variables del modulo de Carretilla 
// en carretilla orginalmente se usa distEntreTorY=37.6
// y esta cantidad se cambiara por 36.5 por último se cambió por 37
module carretillaYZ(
   tol=1,
   diamTorBal=4.6,
   distBalerosX=52,   
   distEntreTorY=36.5,
   distMontY=32,
   distMontX=7, 
   diamTorProf=5.8,
   minkow=6,
   alturaPoste=8.32,
   espesor=5,
   diamTuerca=10.58 
 ){

//alturaBYJ (separacion de placas)
alturaBYJ=18;

difference(){
    union(){
         difference(){
            //carretilla orientada con el origen
            Carretilla(
             modo=2,
             tol=tol,
             diamTorBal=diamTorBal,
             distBalerosX=distBalerosX,   
             distEntreTorY=distEntreTorY,
             distMontY=distMontY,
             distMontX=distMontX,
             elipse1=1,
             elipse2=0,         
             diamTorProf=diamTorProf,
             minkow=minkow,
             alturaPoste=alturaPoste,
             espesor=espesor,
             diamTuerca=diamTuerca
            );

        //desplazamiento antes de mirror
           translate([0,- distBalerosX/2,-alturaBYJ-tol+espesor])
           rotate([0,0,90])
           translate([0,(distEntreTorY+diamTorBal)/2,0])
        //sin desplazamientos
             translate([0,6,-40])
               //ajuste de altura
            linear_extrude(height=80)
          corteBYJ(centerShaft=1);
         }

        difference(){
            translate([0,- distBalerosX/2,-alturaBYJ+(2*espesor)])
            rotate([0,0,90])
            translate([0,(distEntreTorY+diamTorBal)/2,0])
            mirror([0,0,1]){
                
              Carretilla(
               modo=2,
               tol=tol,
               diamTorBal=diamTorBal,
               distBalerosX=distBalerosX,   
               distEntreTorY=distEntreTorY,
               distMontY=distMontY,
               distMontX=distMontX,
               elipse1=0,
               elipse2=1,         
               diamTorProf=diamTorProf,
               minkow=minkow,
               alturaPoste=alturaPoste,
               espesor=espesor,
               diamTuerca=diamTuerca
              );   
            }
         
            translate([0,6,-40])
            linear_extrude(height=80)
          corteBYJ(centerShaft=1);
            
        }

        //poste union triangular
        translate([0,-(distEntreTorY+diamTorBal)/2-4,-4])
        cylinder(d=30,h=alturaBYJ,$fn=3,center=true);
        
        //poste union triangular
        translate([-13.5,-(distEntreTorY+diamTorBal)/2+11,-4])
        cylinder(d=12,h=alturaBYJ,center=true);
        
        
    }//fin union       
           
 trim=200;
 despCuad1=19;
   
     //recortador cuadrante 4
    translate([0,-despCuad1*3])
    rotate(-45)
    translate([trim/2,0])
    cube([trim,trim,trim],center=true);
    
    

    
}    

}
