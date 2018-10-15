module cuber(C_centerX, C_centerY, C_centerZ, C_size, C_CL) {
            center = true;
            translate([C_centerX, C_centerY, C_centerZ])
                color(C_CL, 0.8) cube(C_size, center=true);
}


module spherer(S_centerX, S_centerY, S_centerZ, S_diameter, S_CL) {
            center = true;
            translate([S_centerX, S_centerY, S_centerZ])
                color(S_CL, 0.8) sphere(d=S_diameter);
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

module smoothCylinderer(Cyl_centerX, Cyl_centerY, Cyl_centerZ, diameter, Cyl_height, Cyl_CL) {
    translate([Cyl_centerX, Cyl_centerY, Cyl_centerZ])
        color(Cyl_CL) cylinder(d1= diameter, d2=diameter, Cyl_height, center=true);
}

//sample usage


//make a cube with center at 30, 0, 0, side length 10, color red
cuber(30, 0, 0, 10, "red");

//make a sphere with center at -10, 0, 0, diameter 10, color green
spherer(-10, 0, 0, 10, "green");

//make a cylinder with center at 10, 0, 0, diameter 10, height 10, color "blue"
smoothCylinderer(10, 0, 0, 10, 10, "blue");

//make a rectangular prism with center at -30, -10, 0, length = 10, width = 20, height = 10, color orange
rprismer(-30, -10, 0, 10, 20, 10, "orange");




