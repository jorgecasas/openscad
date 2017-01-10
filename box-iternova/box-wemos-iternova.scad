
// Ancho - alto - profundo: Dimensiones interiores
box_thick = 2;
box_width = 70 + 2 *  box_thick;
box_height = 80 + 2 *  box_thick;
box_depth = 24 + 2 *  box_thick;
n_grid_rectangulars_bottom = 8;
n_grid_rectangulars_lateral = 8;
box_thick_margin = box_thick / 10;

// Exterior (bottom)
difference() {
    // Parte exterior - interior (caja hueca)
    cube( [ box_width,  box_height,  box_depth] );
    translate([ box_thick,  box_thick, 2 *  box_thick] ) cube( [ box_width - 2 *  box_thick,  box_height - 2 *  box_thick,  box_depth ] );
 
    // grid_rectangular inferior
    translate( [ ( 1 + n_grid_rectangulars_bottom ) * 2 * box_thick ,  box_thick * 2 , 0]) rotate([0,0,90])  grid_rectangular( n_grid_rectangulars_bottom,  box_thick+2,  box_thick / 2,  box_height - 4 *  box_thick, 4 *  box_thick );

    // grid_rectangulars laterales
    translate( [ box_width - box_thick * 2.25 ,  box_thick * 2 ,  box_thick * 2.25]) 
        rotate([0,-90,90]) 
            grid_rectangular( n_grid_rectangulars_lateral,  box_thick+2,  box_thick / 2,  box_depth - 4 *  box_thick, 4 *  box_thick );
    
    translate( [ box_width - box_thick * 2.25 ,  box_height + box_thick  ,  box_thick * 2.25]) 
        rotate([0,-90,90]) 
            grid_rectangular( n_grid_rectangulars_lateral,  box_thick+2,  box_thick / 2,  box_depth - 4 *  box_thick, 4 *  box_thick );
    
    // Logo ITERNOVA
        translate( [box_width / 1.2,  ( box_height + box_thick ) / 2, 0.5 * box_thick]) rotate([0,180,90]) resize([ (box_width - 3 * box_thick) ,0,0], auto=true) logo(); 
    
}

// Tapa
translate([100,0,0]) {
    difference() {
       
        // Tapa + reborde de tapa
        union() {
            cube( [ box_width,  box_height,  box_thick] );
            difference() {
                translate([box_thick + box_thick_margin, box_thick + box_thick_margin, 0]) cube( [ box_width - 2 * (box_thick + box_thick_margin),  box_height - 2 * (box_thick + box_thick_margin), 2 * box_thick] );
                translate([box_thick * 2 , box_thick * 2, 0]) cube( [ box_width - 4 * box_thick,  box_height- 4 * box_thick, 3 * box_thick] );
            }
        
        }

        // Grid hexagonal tapa
       translate( [box_thick, box_thick, -1 ]) grid_hexagonal( (box_width / 2) - ( 2 * box_thick ), box_height - ( 2 * box_thick ), box_thick + 2, 4 );
        
        // grid_rectangular tapa
        //translate( [ ( 2 + n_grid_rectangulars_bottom ) * 2 * box_thick ,  box_thick * 2 , 0]) rotate([0,0,90])  grid_rectangular( n_grid_rectangulars_bottom,  box_thick+2,  box_thick / 2,  box_height - 4 *  box_thick, 4 *  box_thick );
        
        // Logo ITERNOVA
        translate( [box_width / 1.2,  ( box_height + box_thick ) / 2, 0.5 * box_thick]) rotate([0,180,90]) resize([ (box_width - 3 * box_thick) ,0,0], auto=true) logo(); 

    }
    
}
// Modulo para crear el logo desde fichero logo-iternova.stl
module logo(){
    import("logo-iternova.stl");
}


       
// Modulo para crear grid_rectangulars 
module grid_rectangular( number, separation, width, height, depth ) {
  for(distance = [ 0 : separation  : (number - 1 ) * separation ])
        translate([ 0, distance , 0]) rotate([-30,0,0]) cube([ height, width, depth]);
}

/**
 * Modulo para crear rejillas hexagonales. Compuesto de 2 modulos (grid_hexagonal, y array_hexagons)
 */
module grid_hexagonal( width, height, depth , hexagons_width ) {    
    separation = ( width / hexagons_width ) / 2.25;
    intersection() {
       // cube([width,height,depth], center = false);
        translate( [ separation / 2, separation / 2, 0] ) intersection() {
            array_hexagons( width - 4, height - 4, depth + 2, hexagons_width );
            cube([width - 4,height - 4,depth + 2], center = false);
        }
    }
}

/**
 * Crea un array de hexagonos
 */
module array_hexagons( width, height, depth , hexagons_width ) {    
    separation = ( width / hexagons_width );
    hexagons_height = ( hexagons_width * height / width);
    radio = separation / 2.25;
    
    for( x = [ 0 : 1 : hexagons_width])
        for( y = [ 0 : 1 : hexagons_height ])
            translate([ (x * separation), ( y + ( x % 2 )/2 ) * separation ,0])
                cylinder(h = depth, r1 = radio, r2 = radio, center = false , $fn = 6);

}
