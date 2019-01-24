// these are my (Claire) comments on Michael and Nachman's code of the ramp.


module ascrew() {
    radius = 20;
    zstretch = 20;
    trackwidth = 17.5;            
    stepsize = 1;
    stepthickness = 1;
    wallthickness =1;
    wallheight = 10;
    rungfrequency = 25;
    d1 = 0;
    d2 = 360;
    rungheight = 30/100;

// above are all of the values for the length, width (trackwidth), hieght, thickness, length of spiral (d1 and d2),




    module step(trackwidth, stepsize, stepthickness, wallthickness, wallheight) {
        color("green") cube([trackwidth, stepsize, stepthickness], center = true );
        color("blue")translate([trackwidth/2 + 0.5, 0, (wallheight-stepthickness)/2])    cube([wallthickness, stepsize, wallheight], center=true);
        color("blue")translate([-(trackwidth/2 + 0.5), 0, (wallheight-stepthickness)/2]) cube([wallthickness, stepsize, wallheight], center=true);
    }

    module barrier(trackwidth, stepsize, stepthickness, wallthickness, wallheight, rungheight) {
        color("green") translate([0, 0, stepthickness]) cube([trackwidth, stepsize, wallheight * rungheight], center = true );
    }

    module track(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, d1, d2) {
        for (a=[d1:d2]) {
            x = cos(a) * radius;
            y = sin(a) * radius;
            z = a/zstretch +stepthickness;
            translate([x, y, z]) rotate([0, 0, a]) step(trackwidth, stepsize, stepthickness, wallthickness, wallheight);   
        }
    }

    module rungs(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, rungfrequency, d1, d2) {
        for (a=[d1:rungfrequency:d2]) {
            x = cos (a) * radius;
            y = sin(a) * radius;
            z = a/zstretch;
            color("blue") translate([x, y, z+stepthickness]) rotate([0, 0, a]) barrier(trackwidth, stepsize, stepthickness, wallthickness, wallheight, rungheight);
        }
    }

    module center(radius, d1, d2, zstretch, trackwidth) {
        height = (d2-d1)/zstretch;
        cradius = radius-trackwidth/2-0.25;
        color("green") cylinder(r=cradius, h=height, $fn=50);
    }

    module ball(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, d1, d2) {
        for (a=[d1+40:200:d2]) {
            x = cos(a) * radius;
            y = sin(a) * radius;
            z = a/zstretch +stepthickness;
            color("purple") translate([x, y, z+3.5]) rotate([0, 0, a]) sphere(4, $fn=30);
        }
    }


    module screw() {
        track(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, d1, d2);
        rungs(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, rungfrequency, d1, d2, rungheight);
        center(radius, d1, d2, zstretch, trackwidth);
        
    }

    screw();

    //ball(radius, zstretch, trackwidth, stepsize, stepthickness, wallthickness, wallheight, d1, d2);
}
ascrew();

    
    
