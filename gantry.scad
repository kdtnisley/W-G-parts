include <BOSL2/std.scad>
include <modeled_points.txt>
include <ShapesNPaths/crossSections_n_caps.scad>
include <ShapesNPaths/finials.scad>

res = 50;
dia = 15;
height = 180;
width = 54;
r_heel = 20;
ws = 4.3;

sub_path = resample_path(path, n=211);

difference(){
union(){
//gantry
path_extrude(path) cross(dia,res);

//axle superstructure
translate([-dia/2,3,height-dia/3])
cube([dia,13,dia/2]);

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

//holes for wood screws
translate([width+r_heel+dia/2,dia/2,0])
cylinder(20,ws,ws,$fn=50,center=true); 

translate([-width-r_heel-dia/2,dia/2,0])
cylinder(20,ws,ws,$fn=50,center=true);

translate([width-dia/2,dia*1.5+3.2,0])
cylinder(20,ws,ws,$fn=50,center=true); 

translate([-width+dia/2,dia*1.5+3.2,0])
cylinder(20,ws,ws,$fn=50,center=true);

//cut off the bottom dia/2
translate([0,r_heel,-dia/2])
cube([width*4,r_heel*4,dia],center=true);
}
