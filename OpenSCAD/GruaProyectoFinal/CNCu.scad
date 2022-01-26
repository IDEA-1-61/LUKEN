//PRIMER DISEÑO INTEGRADO EN MODELO 3D
use<elementosDiseNio.scad>
use<3Dteile.scad>
/*
import("./STL/torreUnionPinza.stl");
import("./STL/torreUnion.stl");
import("./STL/singProfMount.stl");
import("./STL/postePinza.stl");
import("./STL/pinzaIzq.stl");
import("./STL/pinzaDer.stl");
import("./STL/monturaY.stl");
import("./STL/monturaX.stl");
import("./STL/monturaPinza.stl");
import("./STL/CNCu.stl");
*/


$fn=20;
//medida del perfil estructural, esta medida es fija pero es importante para las transformaciones
medidaPerfil=20;

//diseño principal la medida X es 210 [mm]
medidaX=210;
//diseño principal la medida Y es 275 [mm], esta medida fue cambiada por 305 [mm] ya que tenía un error de medicion
medidaY=300;
//diseño principal la medida Y es 275 [mm]
medidaZ=210;

//horizontal sencillo
color("gray")
rotate([0,90,0])
translate([0,0,-medidaX/2])
linear_extrude(height=medidaX)
perfil1();

//PERFIL DOBLE TRANSVERSAL
color("gray")
translate([-medidaX/2-(medidaPerfil),-(medidaY/2)-(medidaPerfil/2),+(3.75*medidaPerfil)])
rotate([0,90,0])
linear_extrude(height=medidaX+(medidaPerfil*2))
perfil2();

//esquinero lateral
color("gray")
translate([medidaX/2-(medidaPerfil/2),-medidaPerfil,0])
rotate([0,180,90])
esquinero();

//perfil
color("gray")
translate([medidaX/2+(medidaPerfil/2),(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,0])
linear_extrude(height=medidaY)
perfil2();

alturaTorre=13;
ditYTorProfDoble=40;
ajusteVertCorrDoble=12;
ajusteHorCorrDoble=2.5;


//CORREDERA LATERAL EJE X (CODIGO)
color("blue")
translate([medidaX/2+(medidaPerfil/2)+alturaTorre-ajusteHorCorrDoble,-(medidaY/2)-(medidaPerfil/2),ditYTorProfDoble/2])
rotate([90,0,-90])
monturaPerfil();

//piezas en espejo
mirror([1,0,0]){
    //esquinero lateral
color("gray")
translate([medidaX/2-(medidaPerfil/2),-medidaPerfil,0])
rotate([0,180,90])
esquinero();

//perfil
color("gray")
translate([medidaX/2+(medidaPerfil/2),(medidaPerfil/2),-(medidaPerfil/2)])
rotate([90,90,0])
linear_extrude(height=medidaY)
perfil2();
	
	
//COPIA CORREDERA LATERAL EJE X (CODIGO)
color("blue")
translate([medidaX/2+(medidaPerfil/2)+alturaTorre-ajusteHorCorrDoble,-(medidaY/2)-(medidaPerfil/2),ditYTorProfDoble/2])
rotate([90,0,-90])
monturaPerfil();
	
}





espBarra=5;
distTorY=37.75;
sepPlacas=17;

//###SISTEMA EJE VERTICAL (Z)
color("blue")
translate([0,-(medidaY/2)-(medidaPerfil/2)-alturaTorre,+(3.75*medidaPerfil)+(ditYTorProfDoble*0.75)])
rotate([-90,180,0])
union(){
monturaPerfil(corteTriangulo=0,fijacion=1,  distTorYProf=40);

translate([distTorY/2,-25,-espBarra*2-sepPlacas])
rotate([180,0,90])
 monturaPerfilVertical();

translate([0,-25,-sepPlacas-espBarra])
torreUnion();
}

//horizontal sencillo
color("gray")
//rotate([0,90,0])
translate([0,-(medidaY/2)-(medidaPerfil/2)-alturaTorre-40,0])
linear_extrude(height=medidaX)
perfil1();


alturaEng=4;
separaEng=17.7;



//##CONJUNTO SISTEMA DE PINZA
color("blue")
//rotate([0,90,0])
translate([0,-(medidaY/2)-(medidaPerfil/2)-alturaTorre-70,16])
rotate([90,0,0])
union(){
   // alturaTorre=13.5;
     alturaTorre=13;
   monturaPinza();
    translate([0,54.5,-alturaTorre-5])
    torreUnion( sepTuer=20, diamTorBal=4,  altura=alturaTorre,tol=1, espesor=3);

     translate([0,-15,-alturaTorre-5])
   Poste(altura=alturaTorre,espesor=3,tol=1,diamShaft=4);

  //pinzas
	union(){
	translate([separaEng,0])
	  pinzaDer();
			
			
	translate([-separaEng,0])
		   pinzaIzq();
   }
}
    

