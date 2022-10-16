include <BOSL2/std.scad>
include <modeled_points.txt>
include <ShapesNPaths/crossSections_n_caps.scad>
include <ShapesNPaths/finials.scad>

res = 50;
dia = 15;
height = 180;
width = 54;
r_heel = 20;

//gantry
path_extrude(path) cross(dia,res);

//bearing superstructure
translate([0,10,height+1]) rotate([90,135,0])
union(){
rotate_extrude(angle = 90,convexity = 10,$fn=50)
translate([dia/2, 0, 0])
cross(dia,res);
translate([dia/2, 0, 0]) rotate([90,0,0])
linear_extrude(dia/2-2)
cross(dia,res);
translate([-dia/2+2,dia/2, 0]) rotate([90,0,90])
linear_extrude(dia/2-2)
cross(dia,res);
}

//foot
mirror([0,1,0]){
union(){
translate([width,r_heel,r_heel])
rotate([0,90,180])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([width-dia/2,r_heel*1.3,0])
finial(dia,res);
}}

mirror([0,1,0]){
union(){
translate([-width,r_heel,r_heel])
rotate([0,90,180])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross(dia,res);

translate([-width+dia/2,r_heel*1.3,0])
mirror([1,0,0])
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

//things that get removed placeholder
//bearing shaft hole
translate([0,10,height]) rotate([90,0,0])
cylinder(20,4,4,$fn=50,center=true); 

//foot
//translate([width,0,0])
//rotate([0,0,-90])
//union(){
//translate([0,dia,dia])
//rotate([0,90,180])
//rotate_extrude(angle = 90,convexity = 10,$fn=res)
//translate([dia, 0, 0])
//cross(dia,res);
//
//translate([-dia/2,dia*1.5,0])
//finial(dia,res);
//}
//
//translate([-width,0,0])
//rotate([0,0,90])
//union(){
//translate([0,dia,dia])
//rotate([0,90,180])
//rotate_extrude(angle = 90,convexity = 10,$fn=res)
//translate([dia, 0, 0])
//cross(dia,res);
//
//translate([dia/2,dia*1.5,0])
//mirror([1,0,0])
//finial(dia,res);
//}



//rounded_cross_cap(dia,res);
