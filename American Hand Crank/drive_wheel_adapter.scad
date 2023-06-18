include <ShapesNPaths/crossSections_n_caps.scad>
include <BOSL2/std.scad>
include <BOSL2/distributors.scad>

w = 2;
IR = 16.5/2;
IRot = 84/2 - IR;
res = 50;

belt_rad = 3.5;

RP = 49.4/2 - 6.8/2;
theta = 40;

union(){
difference(){

rotate_extrude(convexity = 10, $fa = 1)
cut_view();
    
//center hole
cylinder(h = 40,d=40,center = true,$fa = .25);
    
//slots
translate([0,0,2])
 for(i = [ [  0, 0,   0],
           [  0, 0,  22.5],
           [  0, 0,  45],
           [  0, 0,  67.5],
           [  0, 0,  90],
           [  0, 0, 112.5],
           [  0, 0, 135],
           [  0, 0, 157.5] ])
{
   rotate(i){
   union(){
    cube([100, w, 10], center = true);       
    translate([0,0,-5]) rotate([90,0,0]) cylinder(100, d = w, center=true, $fn=10);
   }}}
   
}

//grip cubes
tooth_depth = 4;
tooth_width = 2*tooth_depth;
tooth_side = pow((tooth_depth*tooth_depth),1/2);
tooth_thic = 7;
     
path = circle(14, $fn=10);

rot_copies(n = 10)
translate([0,-25,-13.5]) rotate([-90,0,0])
difference(){
    rotate([0,45,0])
    cube([tooth_side,tooth_thic,tooth_side], center = true);

    translate([0,0,1])
    cube([tooth_width,tooth_thic,tooth_depth], center = true);
}   
}

module cut_view(){
    s = 4;
    
translate([IRot, 0, 0]) rotate([0,0,-90])    
union(){
difference(){
    circle(r=IR + w, $fn=res);

    circle(r=IR, $fn=res); 
    translate([-IR-w,-IR*2-w*2,0]) square([IR*2+w*2,IR*2+ w*2]);
    rotate([0,0,115]) square([IR*2+w*2,IR*2+ w*2]);
    rotate([0,0,25]) translate([0,IR+w/2,0]) circle(r = w/2, $fn=res);
}

rotate([0,0,25]) translate([0,IR+w/2,0]) circle(r = w/2, $fn=res);

translate([IR,-IRot+1,0]) square([w,IRot-1]);

translate([IR+.25,-IR/2,0]) rotate([0,0,-90]) belt_channel(belt_rad,res);

translate([IR+w,-IR*2-1,0])
difference(){
    square([s*2+.75,s*2]);
    translate([s*2,0,0]) circle(r = s*2, $fn=res);
}
}
}