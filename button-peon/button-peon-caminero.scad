
// Datos del boton 
diameter = 15;
logo_side = 10;
logo_height = 2;
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
        cylinder_empty( diameter, diameter - 2, logo_height/2);
        resize(newsize=[ logo_side, logo_side, logo_height]) logo_peon();
        translate([-1.5, 0,-1]) rotate( [0,90,0] ) cylinder_empty( 4, 2, 3 );

    }

}
