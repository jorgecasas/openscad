use <emoticons.otf>;
text_font="Emoticons:style=Bold";

difference(){

    intersection(){
        cube( 30, center=true );
        sphere( d=44, center=true, $fn=100 );
    }
 
    intersection(){
        cube( 20, center=true );
        sphere( d=32, center=true, $fn=100 );
    }
    
    rotate([ 0,0,0]) translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "h", font = text_font, halign = "center" , valign = "center" );

    rotate([ 0,90,0])  translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "r", font = text_font, halign = "center" , valign = "center" );

    rotate([ 0,180,0]) translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "s", font = text_font, halign = "center" , valign = "center" );

    rotate([ 0,270,0]) translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "l", font = text_font, halign = "center" , valign = "center" );

    rotate([ 0,90,90]) translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "U", font = text_font, halign = "center" , valign = "center" );

    rotate([ 0,90,270]) translate([0,0,13]) linear_extrude(height =3) resize(newsize=[22,22,22]) text( "x", font = text_font, halign = "center" , valign = "center" );

}