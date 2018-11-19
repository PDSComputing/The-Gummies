for (x=[-1000:1000]){
    y = sin(x) * 100;
    i = cos(x) *100;
    translate([x,y,i]) sphere(50);
}