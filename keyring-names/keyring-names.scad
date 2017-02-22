// Llavero a partir de logo. Requiere fichero text.scad (ver https://github.com/brodykenrick/text_on_OpenSCAD)
use <text.scad>

// Parametros texto
use <play.ttf>;
text_font="Play:style=Bold";
text_font_size = 16; 

text="BRUNO";
text_02="SERGIO";

// Datos parametrizables del llavero, en mm
keyring_depth = 4;
keyring_width = 85;
keyring_height = 12;
ring_diameter_inner = keyring_height / 3; 


// Creacion del llavero
union() {
    // Base llavero
    difference() {
        translate([ 0 , 0  , 0 ])  {
            hull() {
                translate([ 0 , keyring_depth / 4 , 0  ]) cylinder( h = keyring_depth, d1 = keyring_height , d2 = keyring_height , center = false, $fn = 100 );
                translate([ keyring_width , keyring_depth  / 4, 0 ]) cylinder( h = keyring_depth, d1 = keyring_height , d2 = keyring_height , center = false, $fn = 100 );
            }
        }
        
        // Agujero para llave
        translate([ keyring_width  ,  keyring_depth / 3.1415  , - keyring_depth    ])  {
            scale([keyring_depth * 0.45, keyring_depth* 0.45, 1]) {
                cylinder( h = keyring_height * 2, d1 = ring_diameter_inner , d2 = ring_diameter_inner , center = false, $fn = 100 );
            }
        }
    }
        
    // Texto
    text_extrude( text , extrusion_height = keyring_height / 1.5, center = false, font = text_font, size = text_font_size, spacing = 1 );
}

 
// Creacion del llavero
translate( [ 0, keyring_height * 3 , 0 ] ) {
    union() {
        // Base llavero
        difference() {
            translate([ 0 , 0 , 0  ])  {
                hull() {
                    translate([ 0 , keyring_depth / 4 , 0  ]) cylinder( h = keyring_depth, d1 = keyring_height , d2 = keyring_height , center = false, $fn = 100 );
                    translate([ keyring_width , keyring_depth  / 4, 0 ]) cylinder( h = keyring_depth, d1 = keyring_height , d2 = keyring_height , center = false, $fn = 100 );
                }
            }
            
            // Agujero para llave
            translate([ keyring_width  ,  keyring_depth / 3.1415  , - keyring_depth    ])  {
                scale([keyring_depth * 0.45, keyring_depth* 0.45, 1]) {
                    cylinder( h = keyring_height * 2, d1 = ring_diameter_inner , d2 = ring_diameter_inner , center = false, $fn = 100 );
                }
            }
        }
            
        // Texto
        text_extrude( text_02 , extrusion_height = keyring_height / 1.5, center = false, font = text_font, size = text_font_size, spacing = 1 );
    }
}