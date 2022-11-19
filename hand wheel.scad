include <BOSL2/std.scad>
include <BOSL2/distributors.scad>
include <ShapesNPaths/crossSections_n_caps.scad>

belt_rad = 3;
res = 50;

belt_channel_rad = 175/2;
rim_width = 17;
rim_depth = 12;



//wheel rim
rotate_extrude(convexity = 10,$fn=res)
translate([belt_channel_rad, 0, 0])
rect([rim_depth,rim_width], rounding=[2,0,2,2]);

//belt channel
translate([0,0,rim_width/2-1.5])
rotate_extrude(convexity = 10,$fn=res)
translate([-belt_channel_rad+1.5, 0, 0])
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