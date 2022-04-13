
lonNEMA=42.3;

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

module ApoyoFrontal(
lon20=20,
espesor=5,
tol=1,
elevaRiel=35,
tolM4=0.5//antes 0.25
){
        difference(){
            union(){
                            /*
                "corte" cambia el angulo de ciclo for de 180 a 360, haciendo el corte de la banda de una muezca o de 2
                */
               translate([0,0,(lon20/2)+elevaRiel])
                rotate([0,-90,0])
                ApoyoPoleaSimple(
                lon20=lon20,
                espesor=espesor,
                corte=0);

                //cubo para tornillos
                translate([-espesor,-lon20*(3/2),0])
                cube([lon20,lon20*3,espesor]);
            
                //postes tronillos M4 con 2mm extra
               translate([espesor,-lon20,0])
                for(u=[0:1]){
                  translate([0,lon20*2*u,0])
                  cylinder(d=4+tolM4+(espesor*2),h=espesor+1.5); 
                }
                
                //cubo union polea y base
                translate([-espesor,-lon20/2,0])
                 cube([espesor,lon20,elevaRiel]);
            }
            
            //taladros postes tronillos m4
             translate([espesor,-lon20,0])
            for(u=[0:1]){
              translate([0,lon20*2*u,0])
              cylinder(d=4+tolM4,h=espesor*3,center=        true); 
            }
            
            
            //recorte minkowski para masa y paso de la polea de la cama
            mink_1=2.1;
            altTotMink_1=elevaRiel-espesor;
            
            translate([-espesor*4,-lon20/8,+espesor+mink_1])
            
            for(g=[0:1]){
                translate([0,0,g*((altTotMink_1/2)+espesor)])
                minkowski(){
                    cube([espesor*4,lon20/4,(altTotMink_1/2)-espesor]);
                    rotate([90,0,90])
                    cylinder(r=mink_1,h=0.01,center=true);
                    //sphere(d=espesor);
                }
            }
 
     
        }
        
        translate([espesor,(lon20/2)-(espesor/2),(elevaRiel/2)+(espesor/2)])
       
        translate([0,espesor/2,0])
        rotate([90,0,0])
        linear_extrude(height=espesor)
        ColumnaPoly(tam1=10,tam2=8.25,tam3=3,lon=elevaRiel-espesor,esp=espesor);
        
        mirror([0,1,0]){
                translate([espesor,(lon20/2)-(espesor/2),(elevaRiel/2)+(espesor/2)])
           
            translate([0,espesor/2,0])
            rotate([90,0,0])
            linear_extrude(height=espesor)
            ColumnaPoly(tam1=10,tam2=8.25,tam3=3,lon=   elevaRiel-espesor,esp=espesor);
                 
        }

    }//fin modulo apoyo frontal
    
     module CalzasPolea(
lon20=20,
espesor=5,
ajusteEjePolea=3
){
    
difference(){
    intersection(){
       for(k=[0:1]){
           rotate([0,0,k*180])
     //apoyos tipo rondana
                translate([0,(lon20/2),-(lon20/2)-ajusteEjePolea])
                rotate([90,0,0])
                cylinder(d=lon20*0.75,h=espesor+2);
            }

      //corte entrada tornillo M6
        cylinder(d=10,h=1000,center=true);
        }
        //corte entrada tornillo Eje de polea
    translate([0,0,-(lon20/2)-ajusteEjePolea])
    rotate([90,0,0])
    cylinder(d=4.9,h=1000,center=true);
   }
}//fin module Calzas Polea

module monturaCoreXYNEMA(espesor=5,modo=0){
       ajX=8.5;
    if(modo==0){
           difference(){
            linear_extrude(height=espesor)
            difference(){
                
             
                translate([-(lonNEMA/2)+3-ajX,-10+3])
                minkowski(){
                    square([lonNEMA+ajX-6,(lonNEMA+20)-6]);
                    circle(r=3);
                }
                
                translate([0,(lonNEMA/2)+10])
                agujerosNEMA();

                translate([-(lonNEMA/2)-2.5,0])
                for(g=[0:1]){
                    translate([g*15,0])
                    minkowski(){
                        square([0.01,3],center=true);
                        //agujero tornillos m4
                        circle(d=4.25);   
                    }
                }
            }
               //agujeros montaje
            
            translate([0,(lonNEMA/2)+10,espesor/2])
            linear_extrude(height=20)
            for(v=[0:3]){
              rotate(90*v)
              translate([16,16])
              circle(d=7);
            }
            
            translate([10,0,3])
            linear_extrude(height=10)
            minkowski(){
                //sin espejo lado Y
              text(size=9,font = "Simplex:style=Bold","Y",  halign ="center",valign="center");
                circle(d=1);
            }
            
        }
        //rondanas montaje perfil 2020
         translate([-(lonNEMA/2)-2.5,0])
        linear_extrude(height=espesor+1.5)
        difference(){
             
            for(g=[0:1]){
                    translate([g*15,0])
                    minkowski(){
                        square([0.01,3],center=true);
                        //agujero tornillos m4
                        circle(d=4.25+6);   
                    }
                }
            
                for(g=[0:1]){
                    translate([g*15,0])
                    minkowski(){
                        square([0.01,3],center=true);
                        //agujero tornillos m4
                        circle(d=4.25);   
                    }
                }
            
        }
    }else if(modo==1){
        mirror([0,1,0]){
            difference(){
                linear_extrude(height=espesor)
                difference(){
          
                translate([-(lonNEMA/2)+3-ajX,-10+3])
                minkowski(){
                    square([lonNEMA+ajX-6,(lonNEMA+20)-6]);
                    circle(r=3);
                }
                    
                    translate([0,(lonNEMA/2)+10])
                    agujerosNEMA();

                    translate([-(lonNEMA/2)-2.5,0])
                    for(g=[0:1]){
                        translate([g*15,0])
                        minkowski(){
                            square([0.01,3],center=true);
                            //agujero tornillos m4
                            circle(d=4.25);   
                        }
                    }
                }
                   //agujeros montaje
                
                translate([0,(lonNEMA/2)+10,3])
                linear_extrude(height=20)
                for(v=[0:3]){
                  rotate(90*v)
                  translate([16,16])
                  circle(d=7);
                }
                
                translate([10,0,3])
                linear_extrude(height=10)
                minkowski(){     
                 
                  text(size=9,font = "Simplex:style=Bold","X",  halign ="center",valign="center");
                  circle(d=1);
                }
                
            }
            //rondanas montaje perfil 2020
         translate([-(lonNEMA/2)-2.5,0])
        linear_extrude(height=espesor+1.5)
        difference(){
             
            for(g=[0:1]){
                    translate([g*15,0])
                    minkowski(){
                        square([0.01,3],center=true);
                        //agujero tornillos m4
                        circle(d=4.25+6);   
                    }
                }
            
                for(g=[0:1]){
                    translate([g*15,0])
                    minkowski(){
                        square([0.01,3],center=true);
                        //agujero tornillos m4
                        circle(d=4.25);   
                    }
                }
            
        }
        }//fin mirror
    }//fin if
}//fin module

//CalzasPolea();

//falta polea simple    
//ApoyoFrontal();

//apoyoCama();


//apoyoCamaV0(); 

//faltan agueros NEMA
//monturaCoreXYNEMA(espesor=5,modo=0);