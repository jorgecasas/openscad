// Usamos fuente a medida (tiene que ser TTF y estar en mismo directorio que este fichero .scad)
use <Play-Bold.ttf>;
text_font="Play:style=Bold";

// Configuracion de la ficha
lado = 3.9;
grosor = 0.4;
numero = "3";

difference(){
    // Ficha
    cube( [lado, lado, grosor]);

    // Linea cara inferior
    translate([ lado*19/20 ,0, -grosor/2])
        rotate([0, 45, 25])
            cube( [lado *2, lado*2, grosor]);

    // Numero cara superior
    translate([ lado/2 , lado/2, grosor/2])
        linear_extrude(height=grosor)
            resize([1,1,grosor])
                text( numero, font=text_font, halign = "center", valign = "center" );
}
