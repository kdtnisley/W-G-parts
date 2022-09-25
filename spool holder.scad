wall = 1.5;
ID = 45;
OD = ID + wall + wall;
res = 50;
depth = 4;

union(){
difference(){
    sphere(OD/2, $fn = res);
    
    sphere(ID/2, $fn = res);
    translate([-OD/2,-OD/2,-OD])
    cube([OD,OD,OD]);
    translate([-OD/2,-OD/2,depth])
    cube([OD,OD,OD]);
    }
    
rotate_extrude(convexity = 10, , $fn = res)
translate([ID/2 + wall/2, 0, 0])
circle(wall/2, $fn = res);    
    
translate([0,0,depth-wall/2])
cylinder(wall, ID/2, ID/2, center=true);
}


//pin
pin_OD = 5; //mm
pin_len = 55 + 15 + 10; //spool height + holder + fudge

union(){
translate([0,0,-pin_len + depth])
sphere(pin_OD/2, $fn=res);
difference(){
translate([0,0,-pin_len/2 + depth])
cylinder(pin_len, pin_OD/2, pin_OD/2, $fn=res, center=true);

translate([0,0,-pin_len + depth*1.5])
rotate([90,0,0])
cylinder(OD, wall, wall, $fn=res, center=true);
    
translate([0,0,-pin_len + depth*3])
rotate([90,0,0])
cylinder(OD, wall, wall, $fn=res, center=true);    
}}