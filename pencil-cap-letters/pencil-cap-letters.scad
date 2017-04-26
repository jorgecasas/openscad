// Llavero a partir de logo. Requiere fichero text.scad (ver https://github.com/brodykenrick/text_on_OpenSCAD)
use <text.scad>

// Parametros texto
use <play.ttf>;
text_font="Play:style=Bold";
text_font_size = 16; 
// Correccion de font-size para subir o bajar texto y poder centrarlo con respecto al agujero (depende de fuente utilizada y text_font_size indicada)
text_font_size_correction=3.0;

// Espaciado entre letras (segun fuente... deben estar tocandose todas ellas o se desmontara en cachos
text_font_spacing = 0.71;

text="Beltran"; // font-spacing 0.71, font size 16, font size correction 3
//text="BRUNO"; // font-spacing 0.71, font size 16, font size correction 1 

// Pencil cap length
pencil_length = 300.0;
// how big the hole for the pencil should be. BIC: 8.1 
pencil_diameter=8.1;
// how many sides the pencil has (use 20 or more for a circle)
pencil_sides=6;  

// Diametro hexagono = 2 * altura_lado_a_lado * raiz_cubica(3)
pencil_hexagon_diameter = pencil_diameter * 1.1547;

text_height = pencil_diameter * 1.5;

module pencil( pencil_length, pencil_diameter, pencil_sides ) {
	difference() {
		// pencil body
        rotate(a=[0,90,0]) cylinder(h = pencil_length, r=pencil_diameter/2, $fn=pencil_sides);
        
		// let's sharpen the pencil
		difference() {
			translate([ -1 ,-25,-pencil_diameter/2]) cube(40,40,40);
			rotate(a=[0,90,0]) cylinder(h = 40,  r1=0.5, r2=(pencil_diameter/2)+2, $fn=50);
		}
	}
	
}

// Pencil hole in text
difference() {
    translate( [ 0,  -text_font_size/2 + text_font_size_correction, -text_height/2] ) text_extrude( text , extrusion_height = text_height, center = false, font = text_font, size = text_font_size, spacing = text_font_spacing );
    translate([ 2,0,0]) pencil( pencil_length, pencil_hexagon_diameter, pencil_sides);
    
}

 