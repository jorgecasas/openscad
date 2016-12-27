
// Ancho - alto - profundo: Dimensiones interiores
box_thick = 2;
box_width = 70 + 2 *  box_thick;
box_height = 80 + 2 *  box_thick;
box_depth = 24 + 2 *  box_thick;
n_rejillas_bottom = 8;
n_rejillas_lateral = 8;


// Exterior (bottom)
difference() {
    // Parte exterior - interior (caja hueca)
    cube( [ box_width,  box_height,  box_depth] );
    translate([ box_thick,  box_thick, 2 *  box_thick] ) cube( [ box_width - 2 *  box_thick,  box_height - 2 *  box_thick,  box_depth ] );
 
    // Rejilla inferior
    translate( [ ( 1 + n_rejillas_bottom ) * 2 * box_thick ,  box_thick * 2 , 0]) rotate([0,0,90])  rejilla( n_rejillas_bottom,  box_thick+2,  box_thick / 2,  box_height - 4 *  box_thick, 4 *  box_thick );

    // Rejillas laterales
    translate( [ box_width - box_thick * 2.25 ,  box_thick * 2 ,  box_thick * 2.25]) 
        rotate([0,-90,90]) 
            rejilla( n_rejillas_lateral,  box_thick+2,  box_thick / 2,  box_depth - 4 *  box_thick, 4 *  box_thick );
    
    translate( [ box_width - box_thick * 2.25 ,  box_height + box_thick  ,  box_thick * 2.25]) 
        rotate([0,-90,90]) 
            rejilla( n_rejillas_lateral,  box_thick+2,  box_thick / 2,  box_depth - 4 *  box_thick, 4 *  box_thick );
    
    // Logo ITERNOVA
        translate( [box_width / 1.2,  ( box_height + box_thick ) / 2, 0.5 * box_thick]) rotate([0,180,90]) resize([ (box_width - 3 * box_thick) ,0,0], auto=true) logo(); 
    
}

// Tapa
translate([100,0,0]) {
    difference() {
       
        // Tapa + reborde de tapa
        union() {
            cube( [ box_width,  box_height,  box_thick] );
            translate([box_thick, box_thick, 0]) cube( [ box_width - 2 * box_thick,  box_height- 2 * box_thick, 2 * box_thick] );
        
        }

        // Rejilla tapa
        translate( [ ( 2 + n_rejillas_bottom ) * 2 * box_thick ,  box_thick * 2 , 0]) rotate([0,0,90])  rejilla( n_rejillas_bottom,  box_thick+2,  box_thick / 2,  box_height - 4 *  box_thick, 4 *  box_thick );
        
        // Logo ITERNOVA
        translate( [box_width / 1.2,  ( box_height + box_thick ) / 2, 0.5 * box_thick]) rotate([0,180,90]) resize([ (box_width - 3 * box_thick) ,0,0], auto=true) logo(); 

    }
    
}
// Modulo para crear el logo desde fichero logo-iternova.stl
module logo(){
    import("logo-iternova.stl");
}


// Modulo para crear rejillas 
module rejilla( number, separation, width, height, depth ) {
  for(distance = [ 0 : separation  : (number - 1 ) * separation ])
        translate([ 0, distance , 0]) rotate([-30,0,0]) cube([ height, width, depth]);
}
