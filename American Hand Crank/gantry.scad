include <BOSL2/std.scad>
include <modeled_points.txt>
include <ShapesNPaths/crossSections_n_caps.scad>
include <ShapesNPaths/finials.scad>
include <BOSL2/screws.scad>

translate([0,0,20])
cube([94,10,10],center=true);

res = 50;
dia = 15*1.5;
height = 180;
width = 54;
r_heel = 20;
ws = 4.3;

difference(){
union(){
//gantry
path_extrude(path) cross(dia,res);

//axle superstructure
translate([-dia*.65,3,height-dia/3-4])
cube([dia*1.3,12,dia/2-1]);

translate([0,10.3,height]) rotate([90,0,0])
cylinder(dia,6.5,6.5,$fn=50,center=true);

//foot
mirror([0,1,0]){
union(){
translate([4*r_heel-dia/2+1.5,0,r_heel])
rotate([0,90,90])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([width+r_heel+dia/2,-dia/2,0])
rotate([0,0,180])
finial(dia,res);
}}

mirror([0,1,0]){
union(){
translate([-4*r_heel+dia/2-1.5,0,r_heel])
rotate([0,90,-90])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([-width-r_heel-dia/2,-dia/2,0])
rotate([0,0,90])
finial(dia,res);
}}


//heel
union(){
translate([width,r_heel,r_heel])
rotate([0,90,180])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([width-dia/2,r_heel*1.3,0])
finial(dia,res);
}

union(){
translate([-width,r_heel,r_heel])
rotate([0,90,180])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([-width+dia/2,r_heel*1.3,0])
mirror([1,0,0])
finial(dia,res);
}
}
//things that get removed
//bearing shaft hole
translate([0,10,height]) rotate([90,0,0])
cylinder(20,4,4,$fn=50,center=true); 

//bearing shaft hole
translate([0,8,height]) rotate([90,0,0])
nut_trap_inline(spec = "M8", h = 6, $slop=.1);

//holes for wood screws
translate([width+r_heel+dia/2,dia/2,0])
cylinder(20,d=ws,$fn=50,center=true); 
//could also use
//screw_hole("#8,.75",head="flat",counterbore=0);

translate([-width-r_heel-dia/2,dia/2,0])
cylinder(20,d=ws,$fn=50,center=true);

translate([width-dia/2,dia*1.5+3.2,0])
cylinder(20,d=ws,$fn=50,center=true); 

translate([-width+dia/2,dia*1.5+3.2,0])
cylinder(20,d=ws,$fn=50,center=true);

//cut off the bottom dia/2
translate([0,r_heel,-dia/2-2])
cube([width*4,r_heel*4,dia],center=true);
}
