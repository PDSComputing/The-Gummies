module stand(length, width, thickness) { 
    difference () 
        cube ( [ length, width, thickness ] ) ;
    translate ( [ 5, 5, 0] ) {
        cylinder (r = 0.5, h = 1, $fn = 30) ;
    }
}
stand (100, 100, 40) ;

difference () { 
    stand (100, 100, 40) ;  {
        stand (50, 50, 80) ;
    }
}