use <LUKENlib.scad>







//#####RENDERIZADO#####

/*
apoyoBase(
diametro=20,
tornillo=4,
tol=1,
altura=10,
altura1=1.25
);
*/


$fn=100;



diamShaft=1.7;
distPost=9.5;
//distSwPr=16;
distSwPr=25;


espesor=3;
tornillo=4;
tol=1;



mirror([0,1,0]){

translate([0,30,0])
union(){
    //union apoyos fin de carrera
    translate([espesor,-espesor,0])
    cube([espesor*1.2,espesor*2,5]);

    //poste tornillo
    for(i=[0,1]){
        translate([distPost*i,0])
        Poste(altura=5,espesor=espesor,tol=1,diamShaft=diamShaft);
    }
}

//union con apoyo de perfil
translate([-distSwPr+(espesor*2.3),-espesor*1.5,0])
cube([distSwPr+espesor,espesor*3,5]);


//union 90 con apoyo de perfil
translate([0,-espesor,0])
cube([10,30,5]);




//poste perfil
translate([-distSwPr,0,0])

rotate(90)
 apoyoBase(
//diametro=14,
diametro=20,
//tornillo=tornillo,
tornillo=8,
tol=tol,
altura=10,
altura1=1.25,
anchoCubo=5
);

}
//Poste(altura=10,espesor=espesor,tol=tol,diamShaft=tornillo+(tol*2));

