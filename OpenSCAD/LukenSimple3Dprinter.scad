module agujerosNEMA(){
    
    //agujero central
    circle(d=22+1+1);
    
    //agujeros montaje  
    for(v=[0:3]){
      rotate(90*v)
      //translate([16,16])
        translate([15.5,15.5])
      circle(d=3.1+0.25);
    }
    
}

module agujerosCamisaTornillo(){
    
    //agujero central
    circle(d=10.2+0.25);
    
    //agujeros montaje  
    for(v=[0:3]){
      rotate(90*v)
      //translate([16,16])
        translate([10.9/2,10.9/2])
      circle(d=3.5+0.25);
    }
  
}

  module Poste(altura=10,espesor=3,tol=1,diamShaft=2){
	   
	   difference(){
	      cylinder(d=(espesor*2)+diamShaft+tol,h=altura);
	   
		  cylinder(d=diamShaft+tol,h=altura*4,center=true);
	      
	   }
   }

lonNEMA=42.3;

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

//translate([30,0,0])
//monturaCoreXYNEMA(modo=0);

//translate([-30,0,0])
//monturaCoreXYNEMA(espesor=6,modo=0);

module carroY(
tol=1,
    diamTorBal=4.6,
    distBalerosX=40,
    distEntreTorY=36.6,
    diamTorProf=5.8,
    minkow=6,
    alturaPoste=8.3,
    espesor=5,
    calcePerfil=3.67,
    diamTuerca=10.58,
    altTuerca=0
){
    esp=3.75;
    altPil=16;
    disXP=24.75;
             
difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
           
                minkowski(){
                      polygon([[-distBalerosX/2,-distEntreTorY/2],[distBalerosX/2,-distEntreTorY/2],[distBalerosX/2,distEntreTorY/2],[-distBalerosX/2,distEntreTorY/2]]);
                     circle(r=minkow);
                 }
             
     
            //perforacionBalero_1
            translate([-distBalerosX/2,-distEntreTorY/2])
             circle(d=diamTorBal+tol);
            
              //perforacionBalero_2
            translate([-distBalerosX/2,+distEntreTorY/2])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_3
            translate([distBalerosX/2,-distEntreTorY/2])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_4
            translate([distBalerosX/2,distEntreTorY/2])
             circle(d=diamTorBal+tol);
                          
                 
           //perforacion Banda
        
                   square([6,2.14],center=true);
                   translate([6,0])
                   square([6,7],center=true);    
                     
             }
             
                 //poste_1
    translate([-distBalerosX/2,-distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([distBalerosX/2,-distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
             
             //poste_4
    translate([distBalerosX/2,distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
       
             
    }            


       if(altTuerca>0){    
               //tuerca para perforacionBalero_1
                      translate([-distBalerosX/2,-distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                   
              //tuerca para perforacionBalero_2
              translate([-distBalerosX/2,distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                       
            //tuerca para perforacionBalero_3
             translate( [distBalerosX/2,-distEntreTorY/2])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
             
             //tuerca para perforacionBalero_4
              translate( [distBalerosX/2,distEntreTorY/2])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
        }
         
         
     }

  }//fin modulo carroY


//entradaPerfil();

//MODULOS UTILIZADO AHORA PROBADO

module entradaPerfil(perfil=20,canal=6,esp=6,ajEsX=4,diamT=7,pieza=0,angulo=90){
    
    if(pieza==0){
        difference(){
            translate([0,0,esp/2])
            cube([perfil,perfil,esp],center=true);
            cylinder(d=diamT,h=perfil*5,center=true);
        }
    }

    
    
    //vastagos para rieles de perfil
     for(i=[0:3]){
         rotate([0,0,angulo*i])
         translate([(perfil/2)-ajEsX,-canal/2,0])
         if(pieza==0){
           cube([ajEsX,canal,canal+esp]);
         }else if(pieza==1){
             cube([ajEsX,canal,canal]);
         }
     }
}//fin entrada Perfil


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

module RodamientoPolea(){
falda=1;
    
   union(){
       difference(){
           union(){
            cylinder(d=17,h=6,center=true);
              
               for(j=[0:1]){
                   rotate([0,180*j,0])
                translate([0,0,3])
                cylinder(d1=17,d2=17+(falda*2),h=falda);
               }
               
           }
          cylinder(d=12.7,h=10,center=true); 
           
           for(j=[0:1]){
                   rotate([0,180*j,0])
                translate([0,0,3])
                cylinder(d1=12.7,d2=12.7+(falda*2),h=falda);
               }
                      
       }
  
   }
 }//fin rodamiento polea
 
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

module ApoyoPoleaSimple(
lon20=20,
espesor=5,
tol=1,
diamTuerca=10.58,
ajusteEjePolea=3,
corte=1
){

    difference(){
       entradaPerfil(perfil=lon20,canal=6,esp=espesor,ajEsX=4,diamT=7,pieza=0,angulo=90);
        
        recorte=lon20-(2*espesor);
        
        //recortes para paso de banda
        for(h=[0:1]){
            if(corte==0){
               rotate([0,0,360*h])
               translate([5.15,-recorte/2,-50])
               cube([100,recorte,100]);
            } else{
               rotate([0,0,180*h])  
               translate([5.15,-recorte/2,-50])
               cube([100,recorte,100]);
            }
            
        }
    }

    difference(){
        for(g=[0:1]){
           rotate([0,0,180*g])
            
            union(){
                //cubos paredes polea
                translate([-lon20/2,-lon20/2,-(lon20/2)-ajusteEjePolea])
                cube([lon20,espesor,(lon20/2)+ajusteEjePolea]);

                 //laterales cilindricos
                translate([0,(lon20/2),-(lon20/2)-ajusteEjePolea])
                rotate([90,0,0])
                cylinder(d=lon20,h=espesor);

                //apoyos tipo rondana
                translate([0,(lon20/2),-(lon20/2)-ajusteEjePolea])
                rotate([90,0,0])
                cylinder(d=lon20*0.75,h=espesor+2);
            }
        }
        //corte entrada tornillo M6
        cylinder(d=10,h=1000,center=true);
        
        //corte entrada tornillo Eje de polea
        translate([0,0,-(lon20/2)-ajusteEjePolea])
        rotate([90,0,0])
        cylinder(d=4.9,h=1000,center=true);
        
        //agujero tuerca
        translate([0,-(lon20/2)+(espesor/3),-(lon20/2)-ajusteEjePolea])
        rotate([90,90,0])
         cylinder(d=diamTuerca+tol,h=espesor,$fn=6);
    }
}//fin modulo apoyo polea simple

module ColumnaPoly(tam1=10,tam2=10,tam3=5,lon=100,esp=5){
    //translate([0,tam/2,0])
    //rotate([90,0,0])
    //linear_extrude(height=tam)
    polygon([[-tam1,0],[-tam1,(lon/2)],[tam2,(lon/2)],[0,(lon/2)-esp-tam3],[0,0],[0,-((lon/2)-esp-tam3)],[tam2,-((lon/2))],[-tam1,-((lon/2))]]);  
}//fin modulo HangarColumn


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


module ApoyoTraseroMotor(){
    
    lon20=20;
    espesor=5;
    tol=1;
    elevaRiel=35;
    tolM4=0.5;//antes 0.25
    mink_1=2.1;
    mink_2=3;
    mink_3=4;

     difference(){
              union(){
                                /*
                    "corte" cambia el angulo de ciclo for de 180 a 360, haciendo el corte de la banda de una muezca o de 2
                    */
                   translate([0,0,(lon20/2)+elevaRiel])
                    rotate([0,-90,0])
                                      
                    
                    entradaPerfil(perfil=lon20,canal=6,esp=espesor,ajEsX=4,diamT=7,pieza=0,angulo=90);

                    //cubo para tornillos
                    translate([-espesor,-lon20*(3/2),0])
                    cube([lon20,lon20*3,espesor]);
                
                    //postes tronillos M4 con 2mm extra
                   translate([espesor,-lon20,0])
                    for(u=[0:1]){
                      translate([0,lon20*2*u,0])
                      cylinder(d=4+tolM4+(espesor*2              ),h=espesor+1.5); 
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
                        
                //recorte para paso de la polea superior
                translate([-espesor*4,-lon20/8,mink_1+elevaRiel+lon20-5])
                minkowski(){
                        cube([espesor*4,lon20/4,lon20]);
                        rotate([90,0,90])
                        cylinder(r=mink_1,h=0.01,center=true);
                        //sphere(d=espesor);
                    }
                
          }
          
           
        
          lonNema=42.3;
          V1y=elevaRiel+lon20+2;
          V2x=espesor;
          V2y=elevaRiel+lon20+((lonNema-lon20)/2);
          V3x=lonNema+espesor;
          //V3y=V2y;
          //V4x=V3x;
          V4y=elevaRiel-((lonNema-lon20)/2);
          V5x=lon20;
        
        
        difference(){
          //Poligono montura motor NEMA17
          translate([-espesor,espesor+(lon20/2),0])
          rotate([90,0,0])
          linear_extrude(height=espesor)
          polygon([[0,0],[0,V1y],[V2x,V2y],[V3x,V2y],[V3x,V4y],[V5x,0]]);
            
            translate([(42.3/2),+(lon20/2)+espesor,elevaRiel+(lon20/2)])
             rotate([90,0,0])
            translate([0,0,-espesor*2])
            linear_extrude(height=espesor*4)
            agujerosNEMA();
        }
       
       diamFastener=1.8;
       distPostLSW=9.5;
       distLSWprof=16;
       ajusteSW=4;
       
       difference(){
               translate([-espesor,-(distLSWprof+ ajusteSW)-(lon20/2),0])
               cube([espesor,distLSWprof+ ajusteSW,elevaRiel+(lon20/2)-3]);
              
           //agujeros pijas fijacion final de carrera
           translate([-espesor/2,-distLSWprof,0])
             for(b=[0:1]){
                 translate([0,-b*distPostLSW,elevaRiel/2])
                cylinder(d=diamFastener,h=elevaRiel);
             }
             
             translate([0,-distLSWprof-(distPostLSW/2),20])
             rotate([0,90,0])
            // minkowski(){
             //cylinder(d=9,h=1000,center=true,$fn=6);
             cylinder(d=9+(mink_3*1.5),h=1000,center=true,$fn=6);
            // sphere(d=mink_3);
          //}
       }
  }
  
  //lonNEMA=42.3;

module ApoyoMotorZ(){
        espesor=5;
        tol=1;
        tolM4=0.5;//antes 0.25
        minkBase=10;
    alturaNema=40+1.3;
       
    difference(){
       cube([lonNEMA+espesor,lonNEMA, alturaNema+espesor]); 
       translate([-lonNEMA,-lonNEMA/2,- alturaNema]) 
       cube([lonNEMA*2,lonNEMA*2, alturaNema*2]); 
        //taladro NEMA
        translate([lonNEMA/2,lonNEMA/2, alturaNema-(espesor*2)])
    linear_extrude(height=espesor*4)
       agujerosNEMA();
    }

    difference(){
        union(){
            translate([lonNEMA+espesor,lonNEMA/2,0])
            rotate(-90)
            linear_extrude(height=espesor)
            difference(){
                minkowski(){
                    polygon([[-(lonNEMA/2)+minkBase,0],[(lonNEMA/2)-minkBase,0],[0,10]]);
                    circle(r=minkBase);
                }
                translate([0,-lonNEMA])
                square([lonNEMA*3,lonNEMA*2],center=true);
            }

            translate([lonNEMA+espesor+10,lonNEMA/2,0])
            cylinder(d=4+tolM4+(espesor*2),h=espesor+1.5); 
        }

              translate([lonNEMA+espesor+10,lonNEMA/2,0])
              cylinder(d=4+tolM4,h=espesor*3,center=true);
     }      

 }
 
 module motorNEMA(){
     
     lonNEMA=42.3;
     cylinder(d=5,h=23.5*2,center=true);
     translate([0,0,-20])
     cube([lonNEMA,lonNEMA,40],center=true);
     
     
 }
 
 module rodamientoV(){
     difference(){
         cylinder(d=24,h=11,center=true);
         cylinder(d=5,h=100,center=true);
         
     }
 }
   
  module carroX_0(){
    tol=1;
    diamTorBal=4.6;
    distBalerosX=40;
    lonNEMA=42.3;
    distEntreTorY=lonNEMA+24+(tol*2);
    diamTorProf=5.8;
    minkow=7;
    alturaPoste=8.3;
    espesor=5;//espesor 6
    calcePerfil=3.67;
    diamTuerca=10.58;
    altTuerca=3.5;

    esp=3.75;
    altPil=16;
    disXP=24.75;
    offNema=35;
    
    tolM4=0.5;//antes 0.25
    minkBase=10;
    alturaNema=40+1.3;
            
    perfil=20;
     canal=6;
     ajEsX=4;
     diamT=7;

     angulo=90;
     ajNema=5;
     ajNemaY=6;
     
     

     
             
difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
           
                minkowski(){
                      polygon([[-offNema-(lonNEMA/2)+ajNema,(lonNEMA/2)-ajNemaY],[-offNema-(lonNEMA/2)+ajNema,-(lonNEMA/2)+ajNemaY],[-distBalerosX/2,-distEntreTorY/2],[0,-(distEntreTorY/2)+20],[(distBalerosX/2),-minkow],[(distBalerosX/2)+14+14+tol,0],[distBalerosX/2,minkow],[0,distEntreTorY/2],[-distBalerosX/2,distEntreTorY/2]]);
                     circle(r=minkow);
                 }
             
     
            //perforacionBalero_1
            translate([-distBalerosX/2,-distEntreTorY/2])
             circle(d=diamTorBal+tol);
            
              //perforacionBalero_2
            translate([-distBalerosX/2,+distEntreTorY/2])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_3
            translate([distBalerosX/2,0])
             circle(d=diamTorBal+tol);
               
                
                   translate([-offNema,0])
                   agujerosNEMA();  
                     
             }
             
                 //poste_1
    translate([-distBalerosX/2,-distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
             
             
      //cubo canal perfil
       
       translate([-perfil/2,-canal/2,-ajEsX])      
        cube([(perfil/2)+(distBalerosX/2),canal,ajEsX]);

       
             
    }//fin union            

       if(altTuerca>0){    
               //tuerca para perforacionBalero_1
                      translate([-distBalerosX/2,-distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                   
              //tuerca para perforacionBalero_2
              translate([-distBalerosX/2,distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                       
            //tuerca para perforacionBalero_3
             translate( [distBalerosX/2,0])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
           
           //tuerca para perforacionBalero_3 CORREXION EXTRA
             translate( [distBalerosX/2,0,-25])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2+50,$fn=6,center=true);
           
           //agujeros m4 soporte
           translate([(distBalerosX/2)+14,0,0])
           for(k=[0:1]){
               translate([(14+tol)*k,0,0])
              cylinder(d=4+tolM4,h=espesor*3,center=true);
           }
             
        
        }
         
         
     }
 

espAp=6;

//apoyo nucleo
  
   recorte=perfil-(2*espesor);
  translate([-perfil/2,0,-perfil/2])
  rotate([0,90,0])
  difference(){ 
    union(){
          
    
       //base de apoyo a nucleo de perfil
        medioPerfil=perfil/2;
        anCan=10.6;
        altTra=7;
        linear_extrude(height=espAp)
        rotate(-90)
        difference(){
            union(){
                polygon([[-medioPerfil,-medioPerfil],[medioPerfil,-medioPerfil],[anCan/2,-medioPerfil+altTra],[anCan/2,0],[-anCan/2,0],[-anCan/2,-medioPerfil+altTra]]);
                circle(d=anCan); 
            }
            circle(d=diamT);         
        }
     
    //vastagos para rieles de perfil
        
        //translate([-(perfil/2),-canal/2,0])      
        //cube([ajEsX,canal,canal+espAp]);
        
   }
   
   
  
   
    
  } //fin entrada Perfil
  
      /*
      rotate([180,0,0])
      translate([-offNema,0,-espesor])
      motorNEMA();*/
      
      
      //translate([-distBalerosX/2,-distEntreTorY/2,16])
      //rodamientoV();
      
      
      //cabeza de tornillo m4 prueba
      //translate([9,0,5])
      //cylinder(d=7,h=3);
}//fin modulo carroX_0

  module carroX_1(){
    tol=1;
    diamTorBal=4.6;
    distBalerosX=40;
    lonNEMA=42.3;
    distEntreTorY=lonNEMA+24+(tol*2);
    diamTorProf=5.8;
    minkow=7;
    alturaPoste=8.3;
    espesor=5;//espesor 6
    calcePerfil=3.67;
    diamTuerca=10.58;
    altTuerca=3.5;

    esp=3.75;
    altPil=16;
    disXP=24.75;
    offNema=35;
    
    tolM4=0.5;//antes 0.25
    minkBase=10;
    alturaNema=40+1.3;
            
    perfil=20;
     canal=6;
     ajEsX=4;
     diamT=7;

     angulo=90;
     ajNema=5;
     ajNemaY=6;
     
     

     
             
difference(){

  union(){

    linear_extrude(height=espesor)
       difference(){   
           
                minkowski(){
                      polygon([[-distBalerosX/2,-distEntreTorY/2],[0,-(distEntreTorY/2)],[(distBalerosX/2),-minkow],[distBalerosX/2,minkow],[0,distEntreTorY/2],[-distBalerosX/2,distEntreTorY/2]]);
                     circle(r=minkow);
                 }
             
     
            //perforacionBalero_1
            translate([-distBalerosX/2,-distEntreTorY/2])
             circle(d=diamTorBal+tol);
            
              //perforacionBalero_2
            translate([-distBalerosX/2,+distEntreTorY/2])
             circle(d=diamTorBal+tol);
             
             //perforacionBalero_3
            translate([distBalerosX/2,0])
             circle(d=diamTorBal+tol);
               
                
                   translate([-offNema,0])
                   //agujerosNEMA(); 
                    minkowski(){
                        square([31,31],center=true);
                        circle(r=5.5);
                    } 
                     
             }
             
                 //poste_1
    translate([-distBalerosX/2,-distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
              
         //poste_2
    translate([-distBalerosX/2,distEntreTorY/2])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
         
               //poste_3
    translate([distBalerosX/2,0])
    Poste(altura=alturaPoste+espesor,espesor=espesor*0.6,tol=1,diamShaft=diamTorBal);
             
             
             
             lonApTor=30;
      //cubo apoyo tornillo acerado
       
       translate([-lonApTor/2,-espesor,-lonApTor])      
        cube([lonApTor,espesor,lonApTor]);

       
             
    }//fin union            

       if(altTuerca>0){    
               //tuerca para perforacionBalero_1
                      translate([-distBalerosX/2,-distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                   
              //tuerca para perforacionBalero_2
              translate([-distBalerosX/2,distEntreTorY/2])
                      cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
                       
            //tuerca para perforacionBalero_3
             translate( [distBalerosX/2,0])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2,$fn=6,center=true);
           
           //tuerca para perforacionBalero_3 CORREXION EXTRA
             translate( [distBalerosX/2,0,-25])
                 cylinder(d=diamTuerca+tol,h=(altTuerca)*2+50,$fn=6,center=true);
          
        }
         
        
        
        //espacio entre tornillo acerado y perfil de aluminio 18mm
        //diametro de tornillo acerado es de 8mm
        //superficie de pieza a perfil es de 8.7mm
        //movimieto es de 18mm-8.7mm+4mm
        translate([0,0,-13.3])
        rotate([90,0,0])
        translate([0,0,-50])
        linear_extrude(height=100)
        agujerosCamisaTornillo();
     }//fin difference
 

espAp=6;

//apoyo nucleo
  /*
   recorte=perfil-(2*espesor);
  translate([-perfil/2,0,-perfil/2])
  rotate([0,90,0])
  difference(){ 
    union(){
          
    
       //base de apoyo a nucleo de perfil
        medioPerfil=perfil/2;
        anCan=10.6;
        altTra=7;
        linear_extrude(height=espAp)
        rotate(-90)
        difference(){
            union(){
                polygon([[-medioPerfil,-medioPerfil],[medioPerfil,-medioPerfil],[anCan/2,-medioPerfil+altTra],[anCan/2,0],[-anCan/2,0],[-anCan/2,-medioPerfil+altTra]]);
                circle(d=anCan); 
            }
            circle(d=diamT);         
        }
     
    //vastagos para rieles de perfil
        
        //translate([-(perfil/2),-canal/2,0])      
        //cube([ajEsX,canal,canal+espAp]);
        
   }
   
   
  
   
    
  } //fin entrada Perfil
  */
  
      /*
      rotate([180,0,0])
      translate([-offNema,0,-espesor])
      motorNEMA();*/
      
      
      //translate([-distBalerosX/2,-distEntreTorY/2,16])
      //rodamientoV();
      
      
      //cabeza de tornillo m4 prueba
      //translate([9,0,5])
      //cylinder(d=7,h=3);
}//fin modulo carroX_1
  
    //#######RENDERIZADOS######

$fn=150; 

/*apoyoCama(
lon20=20,
altura=30,
espesor=5,
 tolM4=0.25);*/

//pruebas polea y tornillo M6
/* translate([0,0,-(lon20/2)-ajusteEjePolea])
rotate([90,0,0])
cylinder(d=12.7,h=5,center=true);

rotate([180,0,0])

cylinder(d=9,h=3.8);
*/

//RodamientoPolea();

//No se han utlizado
//CalzasPolea();

//ApoyoPoleaSimple();

//ApoyoFrontal();

//ApoyoTraseroMotor();

  //Notas Carro Y
  //chaflAn aplicado a postes es de 1.7mm
  //chaflAn aplicado a entrada banda es de 3mm
//carroY();


//lonNEMA=42.3;

//ApoyoMotorZ();
  
//carroX_0(); chaflan de postes para rodamientos de 2 mm.
 

// carroX_1();
 

  
  
