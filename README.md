# Diseño e impresión en 3D con openscad y cura

* Software de diseño 3D: [openscad](https://openscad.org)
* Software de configuración de impresión: [cura](https://ultimaker.com/en/products/cura-software)
* Más software que se puede utilizar: [inkscape](https://inkscape.org/)
* Descarga de modelos 3D para modificación / impresión: [Thingiverse](http://www.thingiverse.com/)
* 3D printer WIKI: [3dprinterwiki.info](http://3dprinterwiki.info/wiki/wanhao-duplicator-i3/)

## Configuración pre-impresión con cura

Los parámetros a utilizar en [cura](https://ultimaker.com/en/products/cura-software) para la impresora *Wanhao Duplicator i3*, que es un clon de las *Prusa i3*:

### Material PLA

* Layer height: 0.2mm
* Speed: 70mm/s
* Travel speed: 170mm/s
* Nozzle temp: 215
* Bed temp: 60
* Retraction: 2mm
* Retraction speed: 60mm/s

### Material ABS

* Quality:
  * Layer Height: .2mm
  * Shell Thickness (mm): 0.8 (Sometimes bump to 1.2 depending on print)
* Fill:
  * Bottom/Top Thickness (mm): 0.8
  * Fill Density (%): 20% (this changes based on thingi recomendations)
* Speed and Temperature:
  * Print speed (mm/s): 80
  * Printing Temperature: 245
  * Bed Temperature: 95
* Support:
  * Support Type: Depends on Base of print object
* Filament:
  * Diameter (mm): 1.75
  * Flow (%): 100
* Machine:
  * Nozle size (mm): 0.4
* Retraction
  * Speed(mm/s): 25
  * Distance(mm): 2
* Quality:
  * Initial Layer thickness (mm): 0.3 (This might need to be a smidge higher)
  * Initial Layer Line Width (%): 125%
* Speed:
  * Travel Speed (mm/s): 60
  * Bottom layer speed (mm/s): 30
  * Top/bottom speed (mm/s): 40
  * Outer Shell speed (mm/s): 40
  * Inner shell speed (mm/s): 60
* Cool
  * Minimal layer time (Ssec): 5
  * Enable cooling fan: No (test with Yes... if it blends, switch off the fan)

## Más info de interés

  * Varios proyectos personales utilizando openscad. Más info en http://www.thingiverse.com/jorgecasas/about
