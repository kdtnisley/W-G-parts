include <BOSL2/std.scad>
include <BOSL2/distributors.scad>
include <ShapesNPaths/crossSections_n_caps.scad>

belt_rad = 3.5;
res = 100;

belt_channel_rad = 175/2;
rim_width = 17;
rim_depth = 12;

difference(){
union(){
//wheel rim
rotate_extrude(convexity = 10,$fn=res)
translate([belt_channel_rad, 0, 0])
rect([rim_depth,rim_width], rounding=[2,0,2,2]);

//belt channel
translate([0,0,rim_width/2-1.5])
rotate_extrude(convexity = 10,$fn=res)
translate([-belt_channel_rad+0.75, 0, 0])
belt_channel(belt_rad, res);


//bearing superstructure
rotate_extrude(convexity = 10,$fn=res)
translate([11, 0, 0])
cross(10,res);

rotate_extrude(convexity = 10,$fn=res)
translate([5, 0, 0])
cross(10,res);

//spokes
spoke(belt_channel_rad,res);
}

//subtractable regions//
//bearing
translate([0,0,4])
cylinder(h = 8, d = 22, center = true, $fn=res);

//axel shaft/bolt hole
cylinder(h = 20, d = 9, center = true, $fn=res);

//hole for hand crank bolt
translate([0,-belt_channel_rad + 25.5,-2])
rotate([0,0,90])
cylinder(h = 8, r = 2, center = true, $fn = res);

//washer hole/clearance
translate([0,0,-4.5])
cylinder(h = 2, d = 18, center = true, $fn=res);
}


//Modules//

module spoke(length,res)
{
//spokes
union(){
rotate([90,0,0])
linear_extrude(length-23, $fn=res)
cross(10,res);
    
rotate([0,0,120])
rotate([90,0,0])
linear_extrude(length-23, $fn=res)
cross(10,res);
    
rotate([0,0,-120])
rotate([90,0,0])
linear_extrude(length-23, $fn=res)
cross(10,res);
    
//decorative bits
translate([20,-length+31,0])
rotate_extrude(angle = -180, convexity = 10,$fn=res)
translate([20, 0, 0])
cross(10,res);
   
mirror([1,0,0]){    
translate([20,-length+31,0])
rotate_extrude(angle = -180, convexity = 10,$fn=res)
translate([20, 0, 0])
cross(10,res);  
}    
    
rotate([0,0,120]){
    translate([20,-length+31,0])
    rotate_extrude(angle = -180, convexity = 10,$fn=res)
    translate([20, 0, 0])
    cross(10,res);
       
    mirror([1,0,0]){    
    translate([20,-length+31,0])
    rotate_extrude(angle = -180, convexity = 10,$fn=res)
    translate([20, 0, 0])
    cross(10,res);      
    }
}    

rotate([0,0,-120]){    
    translate([20,-length+31,0])
    rotate_extrude(angle = -180, convexity = 10,$fn=res)
    translate([20, 0, 0])
    cross(10,res);
       
    mirror([1,0,0]){    
    translate([20,-length+31,0])
    rotate_extrude(angle = -180, convexity = 10,$fn=res)
    translate([20, 0, 0])
    cross(10,res);      
    }    
}

//end caps
translate([40,-length+31,0])
rotate([-90,0,0])
rounded_cross_cap(10,res);

translate([-40,-length+31,0])
rotate([-90,0,0])
rounded_cross_cap(10,res);
    
rotate([0,0,120]){
    translate([40,-length+31,0])
    rotate([-90,0,0])
    rounded_cross_cap(10,res);}
 
 rotate([0,0,120]){
    translate([-40,-length+31,0])
    rotate([-90,0,0])
    rounded_cross_cap(10,res);}   
    
rotate([0,0,-120]){
    translate([40,-length+31,0])
    rotate([-90,0,0])
    rounded_cross_cap(10,res);} 
    
rotate([0,0,-120]){
    translate([-40,-length+31,0])
    rotate([-90,0,0])
    rounded_cross_cap(10,res);} 
}  
}