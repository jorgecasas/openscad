hexagonal_grid( 25, 75, 2 , 4);

/**
 * Crea un grid hexagonal para guardar cables ordenados 
 * 
 * @param radio Radio de cada hexagono
 * @param depth Profundidad de hexagonos 
 * @param n_cols Numero de hexagonos por fila (eje X)
 * @param n_rows Numero de filas (eje Y)
 */
module hexagonal_grid( radio, depth, n_cols, n_rows ) {
    union() {
        for( i_row = [ 0 : 1 : n_rows - 1])
            translate( [( radio / 2 ) * ( ( i_row % 2 )), ( radio / 3.5 ) * i_row, 0] ) 
                line_hexagons( radio * n_cols , depth, n_cols );
    }
}

/**
 * Crea un array de hexagonos
 *
 * @param width Ancho de la linea de hexagonos
 * @param depth Profundidad de hexagonos 
 * @param n_cols Numero de hexagonos en el array
 */
module line_hexagons( width, depth , n_cols ) {    
    separation = ( width / n_cols );
    radio = ( separation / 3 ) + 0.1;
    depth2 = depth + 2;
    radio2 = radio - 0.2 ;
                
    
    for( x = [ 0 : 1 : n_cols - 1])
        translate([ (x * separation), 0 ,0])
            difference() {
                cylinder(h = depth, r1 = radio , r2 = radio, center = true , $fn = 6);
                cylinder(h = depth2, r1 = radio2 , r2 = radio2, center = true , $fn = 6);
            }

}
