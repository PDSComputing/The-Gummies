module cuber(C_centerX, C_centerY, C_centerZ, C_size, C_CL) {
            center = true;
            translate([C_centerX, C_centerY, C_centerZ])
                color(C_CL, 0.8) cube(C_size, center=true);
}



module rprismer (C_centerX, C_centerY, C_centerZ, l, w, h, R_CL) {
   for (length = [0:l]) {
       for (width = [0:w]) {
           for (height = [0:h]) {
               translate([C_centerX, C_centerY, C_centerZ]) {
                    cuber(length, width, height, 1, R_CL);
               }
           }
       }
   }
}



module halfhex() {
    rprismer(0, 0, 0, 10, 1, 30, "green");
    rotate([0, 0, 60]) {
        rprismer(-10, 0, 0, 10, 1, 30, "green");
        rotate([0, 0, 60]) {
            rprismer(-15, 9, 0, 10, 1, 30, "green");
        }
        
    }
}

module hex(hx,hy, hz) {
    tx = hx -5;
    ty = hy +9;
    translate([tx, ty, hz]) {
        halfhex();
        rotate([0, 0, -60]){
            translate([15, 9, 0]){
                mirror([1, 0, 0]) halfhex();
            }
        }
    }
}

module foamcore() {
    
        hex(0, 0, 0);

        rotate([0, 15, -180]) {
            rprismer(-7.5, 10, 6, 12, 2, 1, "blue");
            rprismer(-8.5, 13, 6, 13.5, 0, 2, "green");
        }

        rotate([0, 15, -120]) {
            rprismer(-8.5, 10, 9.5, 12, 2, 1, "blue");
            rprismer(-9.5, 13, 9.5, 14.5, 0, 2, "green");
        }

        rotate([0, 15, -60]) {
            rprismer(-9.5, 10, 13, 12, 2, 1, "blue");
            rprismer(-10.5, 13, 13, 14.5, 0, 2, "green");
        }

        rotate([0, 15, 0]) {
            rprismer(-10.5, 10, 16.5, 12, 2, 1, "blue");
            rprismer(-11.5, 13, 16.5, 14.5, 0, 2, "green");
        }

        rotate([0, 15, 60]) {
            rprismer(-11.5, 10, 20, 12, 2, 1, "blue");
            rprismer(-12.5, 13, 20, 14.5, 0, 2, "green");
        }

        rotate([0, 15, 120]) {
            rprismer(-12.5, 10, 23.5, 12, 2, 1, "blue");
            rprismer(-12.5, 13, 23.5, 13.5, 0, 2, "green");
        }

}

foamcore();
translate([0, 0, 21.5]){
    foamcore();
}




//for (i = [0:6:30]) {
//    for (an = [0:60:360]) {
 //       rotate([0, i, an]) {
  //          rprismer(-7, 10, 25, 12, 2, 1, "blue"); 
  //      }
  //  }
//}
  
 


