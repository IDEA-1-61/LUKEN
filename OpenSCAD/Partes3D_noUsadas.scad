


module apoyoCama(
lon20=20,
altura=30,
espesor=5,
 tolM4=0.25){

    difference(){
        union(){
            //cubo apoyo
            translate([-lon20/2,-lon20/2,0])
            cube([lon20,lon20,altura]);

            //cubo para tornillos
            translate([-lon20*2.5,-lon20/2,0])
            cube([lon20*2,lon20,espesor]);
        
            //postes tronillos M4 con 2mm extra
           translate([-lon20*2,0])
            for(u=[0:1]){
              translate([lon20*u,0,0])
              cylinder(d=4+tolM4+(espesor*2),h=espesor+2); 
            }
            
            //cubo cuNYa inferior
            translate([-lon20*2.5,-5/2,-2])
            cube([lon20*3,5,2]);
             
            //cubo cuNYa superior
            translate([-5/2,-lon20/2,altura])
            cube([5,lon20,2]);
        }
        
       translate([-lon20*2,0])
        for(u=[0:1]){
          translate([lon20*u,0,0])
          cylinder(d=4+tolM4,h=espesor*3,center=true); 
        }
        
        //agujero tornillos m4
        cylinder(d=4+tolM4,h=lon20*4,center=true);
        
        //viaje extra de 7mm 
        cylinder(d=10,h=(altura-7)*2,center=true);

    }

}//fin moduloApoyoCama



module apoyoCamaV0(
lon20=20,
altura=35,
espesor=5,
 tolM4=0.25){

    difference(){
        union(){
            //cubo apoyo
            translate([-lon20/2,-lon20/2,0])
            cube([lon20,lon20,altura]);

            //cubo para tornillos
            translate([-lon20*1.5,-lon20/2,0])
            cube([lon20*3,lon20,espesor]);
        
            //postes tronillos M4 con 2mm extra
          translate([-lon20,0])
            for(u=[0:1]){
              translate([lon20*2*u,0,0])
              cylinder(d=4+tolM4+(espesor*2),h=espesor+2); 
            }
            
            //cubo cuNYa inferior
            //translate([-lon20*1.5,-5/2,-2])
            //cube([lon20*3,5,2]);
             
            //cubo cuNYa superior
           // translate([-5/2,-lon20/2,altura])
            //cube([5,lon20,2]);
        }
        
       translate([-lon20,0])
        for(u=[0:1]){
          translate([lon20*2*u,0,0])
          cylinder(d=4+tolM4,h=espesor*3,center=true); 
        }
        
        //agujero tornillos m4
        cylinder(d=4+tolM4,h=altura*3,center=true);
        
        //viaje extra de 7mm 
        cylinder(d=10,h=(altura-7)*2,center=true);

    }

}//fin moduloApoyoCamaV0

//apoyoCama();


//apoyoCamaV0(); 