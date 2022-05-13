//Enter OpenSCAD code here.
 echo("Version:",version());

$fn=120;

//borde es de 6mm
altura=64;

difference (){
   cylinder (d=30,h=altura,center=true);
   for(g=[0:1]){
      rotate ([180*g,0,0])
        translate ([0,0,altura/2])
        cylinder (d=22+0.7,h=(7*2),center=true);
      }

    for(g=[0:1]){
          rotate ([180*g,0,0])
            translate ([0,0,-(altura/2)+6.99])
            cylinder (d1=22+0.7,d2=10,h=7);
          }
     cylinder (d=10,h=100, center=true);
}

for(g=[0:1]){
   rotate ([180*g,0,0])
   translate ([0,0,(altura/2)-3])
  rotate_extrude(){
    translate ([15,0,0])
     circle (d=6);
  }
}