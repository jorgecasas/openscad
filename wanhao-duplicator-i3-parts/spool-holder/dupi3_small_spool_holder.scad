$fn = 0;
$fs = 0.1; // HQ cylinders
$fa = 4; // HQ spheres/hulls

include <polyScrewThread.scad>

PI=3.141592;

fat_diam = 30;
fat_r = fat_diam/2;
stop_length = 5;
screw_length = 20;

poke_length = 80;
poke_diam = 10;
poke_r = poke_diam/2;
poke_end = 2;
poke_overhang = 2;

screw_thread(fat_diam, 1.7, 30, screw_length, PI/2, 0);

translate([0, 0, screw_length])
    cylinder(stop_length, fat_r, fat_r);

translate([0, 0, screw_length+stop_length]){
    cylinder(poke_length, poke_r, poke_r);
    
    cylinder(stop_length, fat_r, poke_r);
}

translate([0, 0, screw_length+stop_length+poke_length]){
    cylinder(poke_end, poke_r, poke_r+poke_overhang);

    translate([0, 0, poke_end])
        cylinder(poke_end, poke_r+poke_overhang, poke_r);
}
