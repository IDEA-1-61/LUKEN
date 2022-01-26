long_Tapoyo=208;
tol=1;
diamTorBal=4.6;
    distBalerosX=40;
    distEntreTorY=36.6;
    
    
    minkow=3;
    

    difference(){
        minkowski(){
            square([long_Tapoyo,long_Tapoyo],center=true);
            circle(r=minkow);
        }
        
        translate([distBalerosX/2,distEntreTorY/2])
        circle(d=diamTorBal+tol);
        
        translate([-distBalerosX/2,distEntreTorY/2])
        circle(d=diamTorBal+tol);
        
        translate([distBalerosX/2,-distEntreTorY/2])
        circle(d=diamTorBal+tol);
        
        translate([-distBalerosX/2,-distEntreTorY/2])
        circle(d=diamTorBal+tol);
        
        
 
        minkowski(){    
            square([distBalerosX-(minkow*4),distEntreTorY-(minkow*4)],center=true);
             circle(r=minkow);
        }
        
        
        FI=(1+sqrt(5))/2;
        
        
        //corte triangulo central
            translate([0,-70])
            rotate(90)    
            minkowski(){  
              scale([1,FI*1])  
                circle(d=50,$fn=3);
                 circle(r=minkow*3);
            }
            
            translate([-40-42,0])
            minkowski(){  
          
                polygon([[0,0],[38,0],[0,-38]]);
                 circle(r=minkow*3);
            }
            
            mirror([1,0]){
                    translate([-40-42,0])
                minkowski(){  
              
                    polygon([[0,0],[38,0],[0,-38]]);
                     circle(r=minkow*3);
                }
            }
        
        
        
        
  
        //cortes cama
        for(r=[0:3]){
            rotate(90*r)
            translate([long_Tapoyo/2,long_Tapoyo/2])
            circle(d=3);
        }
        
        //cortes diagonales
        rotate(180+45)
        for(s=[0:1]){
            rotate(s*90)
            translate([65,0])
            for(t=[0:1]){
                translate([50*t,0])
                minkowski(){
                      square([25,0.01],center=true);
                      circle(r=minkow*2);
                }
            }
        }
        
        corteMotor=75;
        minkowski(){
        translate([-56,(long_Tapoyo/2)-corteMotor])
           square([112,20+corteMotor]);
            circle(r=minkow);
        }
             
    }
    
    