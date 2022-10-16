include <BOSL2/std.scad>
include <modeled_points.txt>
include <SnP/crossSections_n_caps.scad>

res = 50;
dia = 15;
height = 180;


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

//bearing shaft hole
translate([0,10,height]) rotate([90,0,0])
cylinder(20,4,4,$fn=50,center=true); 



//rounded_cross_cap(dia,res);
