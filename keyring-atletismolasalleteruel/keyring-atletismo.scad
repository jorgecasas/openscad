// Llavero a partir de logo. Requiere fichero text.scad (ver https://github.com/brodykenrick/text_on_OpenSCAD)
use <text.scad>

// Parametros texto
use <play.ttf>;
text_font="Play:style=Bold";
text_ring_enabled = true;
text_enabled = false;
text_ring_01="Atletismo La Salle";
text_ring_02="Caja Rural de Teruel";
text_ring_width = 16;
text_ring_color = "white";

// Datos parametrizables del llavero
keyring_depth = 4;
keyring_width = 40;
keyring_height = 30;
keyring_color = "SeaGreen";
ring_enabled = true;
ring_diameter_outter = 5;
ring_diameter_inner = ring_diameter_outter / 2;
ring_color = text_ring_enabled ? text_ring_color : keyring_color;


// Creacion del llavero
union() {
    // Anilla para enganchar llavero
    if ( ring_enabled ) {
        ring_displacement = text_ring_enabled ? ( keyring_width - text_ring_width / 4.3 - ring_diameter_outter ) :  ( keyring_height - ring_diameter_outter );
        
        color(ring_color) 
            translate( [0, ring_displacement,  0  ] )  {
                difference(){
                    cylinder( h = keyring_depth / 1.33, d1 = ring_diameter_outter , d2 = ring_diameter_outter , center = false, $fn = 100 );
                    translate( [0, 0,  -1  ] ) {
                        cylinder( h = keyring_depth * 4 , d1 = ring_diameter_inner , d2 = ring_diameter_inner , center = false, $fn = 100 );
                    }
            }
        }
    }
    
    // Logo
    color(keyring_color) 
        resize(newsize=[ keyring_width, keyring_height, keyring_depth  ])  
            translate([0,keyring_height / 2, 0 ])
                logo();
    
    // Circunferencia exterior para texto
    if ( text_ring_enabled ) {
        color(text_ring_color) 
            translate( [0, round( keyring_height / 2 ) - ring_diameter_outter, 0 ] )  {
                difference(){
                    // Circunferencia exterior
                    cylinder( h = keyring_depth / 1.33  , d1 = keyring_width , d2 = keyring_width , center = false, $fn = 100 );
                    cylinder( h = keyring_depth * 5 , d1 = keyring_width  , d2 = keyring_width - text_ring_width , center = true, $fn = 100 );
                     
                     // Textos sobre circunferencia exterior
                    if ( text_enabled ) {
                        translate( [0, 1 - text_ring_width / 6 ,  (keyring_depth + 1) / 2 ] ) text_on_circle(t=text_ring_01,r=round( ( keyring_width  ) / 2  ) - 1 ,font=text_font, size = text_ring_width / 8);
                        
                        translate( [0, -( 1 - text_ring_width / 6 ) ,(keyring_depth + 1) / 2   ] )  text_on_circle(t=text_ring_02,r=-round( ( keyring_width  ) / 2  ) + 1,font=text_font, size = text_ring_width / 8);
                     }
                }
            }
    }
}

// Modulo para crear el logo desde fichero logo-iternova.stl
module logo(){
    import("logo-atletismo.stl");
}
 