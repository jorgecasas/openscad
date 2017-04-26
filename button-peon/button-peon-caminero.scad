
// Datos del boton 
diameter = 25;
logo_side = 19;
logo_height = 3.5;
border_height = 2;
$fn = 60;

module logo_peon() {
    import ("logo-peon-caminero.stl");
};

module cylinder_empty(diameter1,diameter2, height){
    difference() {
        cylinder( d=diameter1 , h=height);
        cylinder( d=diameter2 , h=height);
    }
};



union() {
    difference() {
        resize([ diameter,diameter, diameter/4]) sphere(d=diameter);
        translate([-diameter/2,-diameter/2,-diameter ]) cube(diameter);
    }
    
    union() {
        cylinder_empty( diameter, diameter - 2, border_height);
//        intersection() {
            resize(newsize=[ logo_side, logo_side, logo_height]) logo_peon();
//            translate([0,0,0.25]) resize([ diameter,diameter, diameter/4]) sphere(d=diameter);
//        }
        translate([-1.5, 0,-1]) rotate( [0,90,0] ) cylinder_empty( 4, 2, 3 );

    }

}
