Instalación plugin Inkscape para exportar PNG, paths... a openscad
========================================================================================================================

Podemos utilizar Inkscape para convertir PNG a formato openscad. Para ello, si no se dispone de inkscape, lo instalamos: <pre>sudo apt-get install inkscape</pre>

También tenemos que instalarnos la extensión [Inkscape to OpenScad converter (v6.0)](http://www.thingiverse.com/thing:25036). Nos descargamos el ZIP y descomprimimos todo el contenido de la extensión dentro del directorio ''~/.config/inkscape/extensions'' (en este caso, el fichero ''paths2openscad-6.zip'' que contiene dos ficheros ''paths2openscad.inx y paths2openscad.py'', guardándolos directamente en dicho directorio sin crear otros subdirectorios adicionales).

Reiniciamos inkscape, y podremos abrir PNG, o SVG, etcétera. En el caso de PNG, hay que crear ''paths'' con el borde de la imagen deseada (por ejemplo, podemos utilizar la opción de crear ''paths'' o trayectos automáticamente según bordes o colores de la imagen, etcétera). Asímismo, se pueden crear imágenes en blanco y negro en GIMP o Photoshop con texturas, de forma que podamos crear ''paths'' luego en Inkscape para crear nuestros diseños 3D texturizados en openscad.

Una vez tengamos creados los ''paths'' de la imagen, accedemos al menú ''Extensiones >> Generar desde trayecto (paths) >> Exportar a formato openscad''. Nos creará un fichero STL que podremos situar en el mismo directorio que nuestro fichero ''.scad'', importándolo mediante:

<pre>
import("fichero.stl");
</pre>

