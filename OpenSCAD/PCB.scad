distTorX=24.43;

use<LUKENlib.scad>

//monturas modulos ULN2003A //tentativamente obsoletas

diamTorPCB=3;
distTorY=27;
espesor=2;
tol=1;
diamShaft=1.7;


 
//montura JOYSTICK 
  monturaPCB(
    altura=10,
    espesor=1.5,
    tol=1,
    distTorX=20,
    diamTorPCB=3,
    distTorY=26.5,
    modo=1
   );
      
      
      //valores por defecto de montura PCB para modulo ULN2003A
   module monturaPCB(
    altura=10,
    espesor=1.5,
    tol=1,
    distTorX=24.43,
    diamTorPCB=3,
    distTorY=27,
    modo=0
   ){
         
       //poste (1,1)
       translate([(distTorX+diamTorPCB)/2,(distTorY+diamTorPCB)/2,0])
       Poste(altura=altura,espesor=espesor,tol=tol,diamShaft=diamShaft);
       
       //poste (-1,-1)
       translate([-(distTorX+diamTorPCB)/2,-(distTorY+diamTorPCB)/2,0])
       Poste(altura=altura,espesor=espesor,tol=tol,diamShaft=diamShaft);
       
       
       //poste (-1,1)
       translate([-(distTorX+diamTorPCB)/2,(distTorY+diamTorPCB)/2,0])
       Poste(altura=altura,espesor=espesor,tol=tol,diamShaft=diamShaft);
            
       //poste (1,-1)
       translate([(distTorX+diamTorPCB)/2,-(distTorY+diamTorPCB)/2,0])
       Poste(altura=altura,espesor=espesor,tol=tol,diamShaft=diamShaft);
     
     
       if(modo==1){
       //poste apoyo perfil 1
        translate([0,(distTorY/2)-espesor])
        Poste(altura=espesor*2.5,espesor=espesor,tol=tol,diamShaft=4);
         
       
       //poste apoyo perfil 2
        translate([0,-(distTorY/2)+espesor])
        Poste(altura=espesor*2.5,espesor=espesor,tol=tol,diamShaft=4);

        }
     
       difference(){
           linear_extrude(height=2*espesor)
           minkowski(){
             square([distTorX,distTorY],center=true);
             circle(d=9);
           }
           translate([0,0,espesor])
           linear_extrude(height=2*espesor)
           square([distTorX,distTorY],center=true);
           
        //correccion postes
       translate([(distTorX+diamTorPCB)/2,(distTorY+diamTorPCB)/2,0])
       cylinder(d=3,h=20,center=true);
       
       translate([-(distTorX+diamTorPCB)/2,-(distTorY+diamTorPCB)/2,0])
       cylinder(d=3,h=20,center=true);
              
       translate([-(distTorX+diamTorPCB)/2,(distTorY+diamTorPCB)/2,0])
       cylinder(d=3,h=20,center=true);
       
       translate([(distTorX+diamTorPCB)/2,-(distTorY+diamTorPCB)/2,0])
       cylinder(d=3,h=20,center=true);  
         
           
           if(modo==0){
         //estetica y apoyo con cinchos
          union(){
          //corte regulador superior
       translate([0,-(espesor*3)-(distTorY/4),0])
       cube([distTorX,espesor*2,espesor*2],center=true);

          //corte regulador inferior
           translate([0,(espesor*3)+(distTorY/4),0])
       cube([distTorX,espesor*2,espesor*2],center=true);
              
              //corte hexagonal
              cylinder(d=15,$fn=6,h=20,center=true);
          }
        
         }else if(modo==1){
              //corte apoyo perfil 1
             translate([0,(distTorY/2)-espesor])
              cylinder(d=4+tol,h=40,center=true);
            
              //corte apoyo perfil 2
             translate([0,-(distTorY/2)+espesor])
              cylinder(d=4+tol,h=40,center=true);
             
             //corte hexagonal 
              cylinder(d=17,$fn=6,h=20,center=true);
             

         }  
      }
   }   
   
  // separacion=14;
   //cuantoX=(distTorX+diamTorPCB+separacion);
   //cuantoY=(distTorY+diamTorPCB+separacion);
  
      $fn=200;
   /*
difference(){
    union(){       
        for(i=[0:2]){
           translate([0,i*cuantoY,0])   
           monturaULN2003A(altura=12,espesor=1.5,tol=1);
        }

    //cilindros
        translate([0,cuantoY/2,0])
            for(i=[0:1]){
                translate([0,cuantoY*i,0])
                difference(){
                   rotate([0,90,0])
                   scale([1,1.5,1])
                   cylinder(d=12,h=distTorX,center=true);
                   translate([0,0,-20]) 
                   cube([40,40,40],center=true);
                }
            }
        }
        //corte apoyo tornillos M4
        translate([0,cuantoY/2,0])
         for(i=[0:1]){
                translate([0,cuantoY*i,0])        
                cylinder(d=4+tol,h=40,center=true);
            }
}
*/
