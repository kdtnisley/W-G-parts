include <BOSL2/std.scad>
include <ShapesNPaths/crossSections_n_caps.scad>
include <BOSL2/screws.scad>

h_interior = 5;
wall = 3;
rtop = 3;
rbottom = 5.5;
res = 50;

difference(){
chain_hull(){
translate([rbottom*2,0,0])
cylinder(h_interior+wall,r=rtop,$fn=res);
cylinder(h_interior, r=rbottom,$fn=res);
}

translate([rbottom,0,0])
union(){
translate([h_interior,0,0])
rotate([90,0,0])
cylinder(rbottom*2,r=h_interior,center = true,$fn=res);

translate([rbottom*1.5,0,h_interior/2])
cube([rbottom,rbottom*2,h_interior],center = true);
}


translate([0,0,-4])
screw_hole("#8,.75",head="flat",counterbore=4,$fn=res);
}

//rotate_extrude(angle = 360,convexity = 10,$fn=res)
//translate([rbottom, 0, 0])
//cross(10,res);


