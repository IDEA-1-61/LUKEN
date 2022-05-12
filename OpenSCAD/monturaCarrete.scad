lonNEMA=42.3;

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

 module monturaExtrusor(){
    tol=1;
    diamTorBal=4.6;
    distBalerosX=40;
    //lonNEMA=42.3;
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
     
      lon20=20;
  
     rec45=sqrt(pow(lonNEMA/2,2)+pow(lonNEMA/2,2));


    //23 mm referido a la altura del motor nema hacia el perfil
     
    //apoyo tornillos a perfil

    difference(){
     
        diamPostes=4+tolM4+(espesor*2);
        
         lonY_c=lon20+(espesor*2)+tol;
         lonX_c=lon20*2;
         lonZ_c=lon20+tol+espesor;
               union(){
                   
                     //postes para tornillos
                   
      //cubo para tornillos
                    //translate([-espesor,-espesor-(lon20/2),-lon20])
                   // cube([lon20*3,espesor,lon20]);
                
               translate([(lonX_c/2)-espesor,0,-lonZ_c/2])
                difference(){   
                   cube([lonX_c,lonY_c,lonZ_c],center=true);
                    translate([0,0,-espesor/2])
                   cube([lonX_c*2,lonY_c-(espesor*2),lonZ_c-espesor],center=true);
                }
                
                  //postes tronillos M4 con 2mm extra
                
              
                  
                 for(g=[0:1]){
                    translate([0,0,g*2*(-(tol/2)-espesor-(lon20/2))])
                   rotate([180*g,0,0])
                   translate([-espesor+(diamPostes/2),-(lon20/2)-(tol/2),(-(tol/2)-espesor-(lon20/2))])
                   
                    for(u=[0:1]){
                      translate([(lonX_c-diamPostes)*u,0,0])
                        rotate([90,0,0])
                      cylinder(d=diamPostes,h=espesor+1.5); 
                    }//for u
                  }//for g
                         
                }
                 //taladros postes tronillos m4
                 translate([-espesor+(diamPostes/2),0,(-(tol/2)-espesor-(lon20/2))])
                for(u=[0:1]){
                  translate([(lonX_c-diamPostes)*u,0,0])
                  rotate([90,0,0])
                  cylinder(d=4+tolM4,h=1000,center=        true); 
                }
                
            }
          
            exAncho=(lon20*2)-espesor;
            
            despX=0;//desplazamiento de apoyoNEMA en X
            despZ=5;
 
 }//fin modulo
 
 
 
 //chaflan de 1mm para los apoyos de los tornillos
 //fillet de 5mm para las orillas
 //fillet de 3mm para las orillas
monturaExtrusor();