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





module Cylinderer(Cyl_centerX, Cyl_centerY, Cyl_centerZ, Cyl_baseD, Cyl_topD, Cyl_height, Cyl_CL) {
    translate([Cyl_centerX, Cyl_centerY, Cyl_centerZ])
        color(Cyl_CL) cylinder(d1= Cyl_baseD, d2=Cyl_topD, Cyl_height, center=true);
}


module columner(height, base, x, y, z, color) {
    for (c=[0:height]){
        cuber(x, y, c, base, color);
    }
}


module spiraler (r, A, B, xshift, yshift, zshift, color, grain) {
    
    
    for (a = [A : B]) {
        x = r * cos(a) + xshift;
        y = r * sin(a) + yshift;
        z = (a + zshift);
        
        cuber(x, y, z, grain, color);
   
    }
}

p1 = 0;
p2 = 1;


module spiralsections (p1, p2, r, width, wall, grain) {
    for (w=[0:grain:width]) {
        spiraler(r, p1, p2, w, 0, 0,  "green", grain);    
    }
   
    for (w2 = [0, width]) {
        for (w3 = [0:grain:wall]) {
            spiraler(r, p1, p2, w2, 0, w3, "blue", grain);
            spiraler(r, p1, p2, w2, 0, w3, "blue", grain);
        }
    }
    
    
}


var = 1;

module PenultimateSpiral(r, b, t, zstretch, width, wall, grain) {
    for (section = [b:var:t]) {
        n = section * zstretch;
        rotate([0, 0, section]){
            translate([0, 0, n]){
                //color("blue", 0.9) resize ([rsx, rsy, 0]) 
                spiralsections(0, 1, r, width, wall, grain);
            }
        }
        
    }
}




module spiral(r, b, t, sx, sy, sz, zstretch, width, wall, grain) {
    
    translate([sx, sy, sz]) {
        PenultimateSpiral(r, b, t, zstretch, width, wall, grain);
        
    }
}



module drawstructure () {
    Cylinderer(65, 0, 150, 30, 30, 290, "blue");
    Cylinderer(0, 0, 0, 250, 280, 5, "green");

    columner(250, 10, 135, 0, 0, "purple");
    columner(180, 10, 0, 135, 0, "purple");
    columner(220, 10, 0, -135, 0, "purple");
    columner(200, 10, -135, 0, 0, "purple");  

    columner(250, 10, 95, 0, 0, "purple");
    columner(180, 10, 0, 95, 0, "purple");
    columner(220, 10, 0, -95, 0, "purple");
    columner(200, 10, -95, 0, 0, "purple");  
}




module drawramp () {
    spiral(100, 0, 720, 0, 0, 50, 1/4, 30, 15, 5);
    spiral(10, 0, 180, 90, 0, 230, 1/4, 30, 15, 5);
    spiral(10, -180, 0, 90, 0, 50, 1/4, 30, 15, 5);
}

drawstructure();
drawramp();


//spherer(80, -80, 180, 30, "red");