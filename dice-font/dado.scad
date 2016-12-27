// Usamos fuente a medida (tiene que ser TTF y estar en mismo directorio que este fichero .scad)
use <Play-Bold.ttf>;
text_font="Play:style=Bold";
lado = 24;

lado_inner = lado * 0.8; // Lado interior (vamos a quitar material interior para que sea dado mas barato)
radio = lado / 2;
text_depth = 2;
text_width = lado / 1.4;

// Definicion de textos de las 6 caras (no tocar resto de coordenadas de rotacion)
array_text = [[0,0,0, "Bruno"], [0,90,0, "Martina"], [0,180,0,"Jorge"], [0,270,0,"Sonia"], [0,90,90,"Todos"], [0,90,270,"Nadie"] ];

    
difference() {
    // Creamos el cubo
    intersection() {
        cube( lado, center=true);
        sphere( d=lado*1.5 );
    }
    
    // Eliminamos interior del cubo para gastar menos material
    intersection() {
        cube( lado_inner, center=true);
        sphere( d=lado_inner*1.5 );
    }

    // Textos de cada cara
    for(i_text=array_text)
        rotate( [i_text[0],  i_text[1], i_text[2]] )
            translate( [radio - text_depth* 2 ,text_depth * 2, radio - text_depth] )
                linear_extrude(height = ( text_depth * 1.1 )) 
                    resize(newsize=[ text_width ,  text_width / 3, text_width  ] )
                        text(i_text[3], font = text_font, halign = "right" , valign = "top" );
} 


