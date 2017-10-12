// Usamos fuente a medida (tiene que ser TTF y estar en mismo directorio que este fichero .scad)
use <Play-Bold.ttf>;
text_font="Play:style=Bold";

ancho = 3.9;
alto = 3.9;
profundo = 0.2;
numero = "3";

difference(){
    // Ficha
    cube( [ancho, alto, profundo]);

    // Linea trasera
    translate([ ancho*19/20 ,0, -profundo/2])
        rotate([0, 45, 25])
            cube( [ancho *2, alto*2, profundo]);

    // Numero
    translate([ ancho/2 , alto/2, profundo/2])
        linear_extrude(height=profundo)
            resize([1,1,profundo])
                text( numero, font=text_font, halign = "center", valign = "center" );
}
