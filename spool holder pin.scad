wall = 1.5;
ID = 5;
OD = ID + wall + wall;
res = 100;

pin_OD = 4; //mm
pin_len = 55 + 15 + 10; //spool height + holder + fudge

union(){
rotate([90,0,0])
cylinder(pin_OD*2, wall, wall, $fn=res, center=true);

translate([0,pin_OD+ID,0])
scale([2,1.5,.5])
sphere(pin_OD, $fn=res);

translate([0,-pin_OD,0])
sphere(wall, $fn=res);
}