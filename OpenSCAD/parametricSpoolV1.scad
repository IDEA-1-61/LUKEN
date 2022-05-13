//Enter OpenSCAD code here.
 echo("Version:",version());

//$fn=120;

//borde es de 6mm
altura=64;
altCono=20;
diamBas=95;
espesor=6;

altTot=altura+altCono;
difference (){
   union(){
      cylinder (d=30,h=altTot,center=true);
      translate([0,0,-(altTot/2)+espesor])
      cylinder(d1=diamBas,d2=30,h=altCono-espesor);
       
        translate([0,0,-(altTot/2)])
      cylinder(d=diamBas,h=espesor);
       
       //orilla redondeada 1
       translate ([0,0,(altTot/2)-3])
  rotate_extrude()
    translate ([15,0,0])
     circle (d=6);
      
          //orilla redondeada 2
      translate ([0,0,-(altTot/2)+3])
  rotate_extrude()
    translate ([diamBas/2,0,0])
     circle (d=6);
   }
   
   for(g=[0:1]){
      rotate ([180*g,0,0])
        translate ([0,0,altTot/2])
        cylinder (d=22+0.7,h=(7*2),center=true);
      }

    for(g=[0:1]){
          rotate ([180*g,0,0])
            translate ([0,0,-(altTot/2)+6.99])
            cylinder (d1=22+0.7,d2=10,h=7);
          }
     cylinder (d=10,h=100, center=true);
          
          //recorte estetica
          for(l=[0:7]){
              rotate((360/8)*l)
             translate([0,32,0])
             scale([15,26,1])
             cylinder(d=1,h=100,center=true);
          }
}







   
 