include <BOSL2/std.scad>
include <ShapesNPaths/crossSections_n_caps.scad>
include <BOSL2/screws.scad>

res = 50;

difference(){
union(){
chain_hull(){
sphere(5,$fn=res);
translate([25,0,0])
rotate([0,90,0])
cylinder(50,r=1,center = true,$fn=res);
translate([50,0,0])
sphere(15,$fn=res);
}

rotate([0,90,0])
rotate_extrude(angle = 360,convexity = 10,$fn=res)
translate([4.5, 0, 0])
circle(1,$fn=res);

translate([50,0,0])
rotate([0,90,0])
rotate_extrude(angle = 360,convexity = 10,$fn=res)
translate([14, 0, 0])
circle(2,$fn=res);
}

translate([30,0,0])
rotate([0,90,0])
screw_hole("#8,1.375",head="pan",counterbore=36,$fn=res);
}