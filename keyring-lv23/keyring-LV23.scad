// Llavero a partir de logo. Requiere fichero text.scad (ver https://github.com/brodykenrick/text_on_OpenSCAD)
use <text.scad>

// Parametros texto
use <play.ttf>;
text_font="Play:style=Bold";
text_font_size = 14; 

text="LV23";

// Datos parametrizables del llavero, en mm
r = 2;
x = 4;
y = 85;
z = 3;
ring_diameter_inner = keyring_height / 3; 
$fn=60;

difference() {
    union() {
        hull() {
            cylinder( r = r, h = z  );
            translate( [ r*4, 0, 0] ) cylinder( r = r, h = z  );
            translate( [ 0, 20, 0] ) cylinder( r = r, h = z  );
            translate( [ -r*2, 20 , 0] ) cylinder( r = r, h = z  );
        }

        translate( [ r, 18, 0] ) hull() {
            cylinder( r = r, h = z  );
            translate( [ r*4, 0, 0] ) cylinder( r = r, h = z  );
            translate( [ -r*2,26 , 0] ) cylinder( r = r, h = z  );
        }
        translate( [ 8, 6, 0] ) rotate( [0,0,90] ) text_extrude( text , extrusion_height = z*2, center = false, font = text_font, size = text_font_size, spacing = 0.75 );
    }

    translate( [3, 2, -1] ) cylinder( r=r, h=2*z);
}
/**
union(){
    difference(){
        cube( [76,8,3] );
       translate( [ 4,4,-1] )  cylinder(h=10,r=2, $fn=60);
    }

    translate( [ 8,0,0]) text_extrude( text_02 , extrusion_height = 6, center = false, font = text_font, size = text_font_size, spacing = 1 );
}
*/