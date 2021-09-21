
$fn=200;

//#####POSTE####
   module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }
   
   Xprimero=21.59;
   Yprimero=16.51;
   
   Xsegundo=82.55;
   Ysegundo=52.07;
   
   Xtercero=95.25;
   Ytercero=21.59;
   espesor=2;
   tol=1;
      
   alturaPostes=14;
   diamShaft=1.7;
   
       //poste 1
       translate([Xprimero,Yprimero,0])
       Poste(altura=alturaPostes,espesor=espesor,tol=tol,diamShaft=diamShaft);
       
       //poste 2
       translate([Xsegundo,Ysegundo,0])
       Poste(altura=alturaPostes,espesor=espesor,tol=tol,diamShaft=diamShaft);
       
       //poste 3
       translate([Xtercero,Ytercero,0])
       Poste(altura=alturaPostes,espesor=espesor,tol=tol,diamShaft=diamShaft);
       
            //poste tornillo M4 1
           translate([58,Yprimero+((Ysegundo-Yprimero)*(5/8)),0])
           Poste(altura=espesor*2.5,espesor=espesor*1.5,tol=tol,diamShaft=4);
           
                //poste tornillo M4 2
           translate([86.5,Yprimero+((Ysegundo-Yprimero)*(5/8)),0])
           Poste(altura=espesor*2.5,espesor=espesor*1.5,tol=tol,diamShaft=4);
       
       difference(){
           linear_extrude(height=espesor*2.5)
           minkowski(){
              polygon([[Xprimero,Yprimero],[Xsegundo,Ysegundo],[Xtercero,Ytercero]]);
               circle(d=7);
           }
           translate([0,0,espesor])
           linear_extrude(height=espesor*2.5)
              polygon([[Xprimero,Yprimero],[Xsegundo,Ysegundo],[Xtercero,Ytercero]]);
           
           
       //correccion poste 1
       translate([Xprimero,Yprimero,0])
       cylinder(d=3,h=20,center=true);
       
       //correccion poste 2
       translate([Xsegundo,Ysegundo,0])
       cylinder(d=3,h=20,center=true);
       
       //correccion poste 3
       translate([Xtercero,Ytercero,0])
       cylinder(d=3,h=20,center=true);
                   
            //barreno tornillo 1
       translate([58,Yprimero+((Ysegundo-Yprimero)*(5/8)),0])
       cylinder(d=4+tol,h=20,center=true);
           
           //barreno tornillo 2
       translate([86.5,Yprimero+((Ysegundo-Yprimero)*(5/8)),0])
       cylinder(d=4+tol,h=20,center=true);
       
               
       }