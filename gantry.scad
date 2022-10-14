include <BOSL2/std.scad>
include <modeled_points.txt>

r_top = 55;
vert = 24*5;
r_foot = 50;
r_heel = 15;
rs = 2.3; //screw size
f = 7.5;



difference(){
union(){
gantry();
translate([0,r_top*2,0])
mirror([0, 1, 0])
gantry();

//bearing superstructure
translate([0,r_top,vert/2 + r_top])
rotate([90,0,90])
rotate_extrude(convexity = 10,$fn=50)
translate([f, 0, 0])
cross_section();

translate([-f,r_top,vert/2 + r_top])
rotate([90,0,90])
cylinder(30-3,10.3,10.3,$fn=50);
    

}

translate([5,r_top,vert/2 + r_top])
rotate([90,0,90])
cylinder(50,4,4,$fn=50,center=true); //shaft hole

translate([-f,r_top,vert/2 + r_top])
rotate([90,0,90])
cylinder(6.3,7.6,7.6,$fn=6); //nut socket

//foot holes
translate([r_foot,f,-vert/2-f-5])
rotate([0,0,90])
cylinder(10,rs,rs,$fn=50,center=true);

translate([f,-r_heel-f,-vert/2-f-5])
rotate([0,0,90])
cylinder(10,rs,rs,$fn=50,center=true);

translate([r_foot,r_top*2-f,-vert/2-f-5])
rotate([0,0,90])
cylinder(10,rs,rs,$fn=50,center=true);

translate([f,r_top*2+r_heel+f,-vert/2-f-5])
rotate([0,0,90])
cylinder(10,rs,rs,$fn=50,center=true);

//baseplate
translate([-r_heel*2-20,-r_heel*2-20,-vert/2-25])
cube([200,200,10]);

translate([-f,50,0])
cube([10,200,300],center=true);
translate([33,50,0])
cube([70,200,300],center=true);
}


module gantry(){
res = 100;

r_top = 55;
r_foot = 50;
r_heel = 15;
vert = 24*5;

union(){
linear_extrude(vert,center=true,convexity=10,twist=0,slices=20,scale=1,$fn=res)
cross_section();

//top
translate([0,r_top-10,vert/2 + r_top-f-.4])
rotate([0,-90,0])
rotate([0,0,-22])
finial();

translate([0,r_top,vert/2])
rotate([90,0,0])
rotate([0,-90,0])
rotate_extrude(angle = 70, convexity = 10,$fn=res)
translate([r_top, 0, 0])
cross_section();

//foot
translate([r_foot,0,-vert/2+35])
rotate([90,180,0])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_foot, 0, 0])
cross_section();

translate([r_foot,f,-vert/2-r_heel])
rotate([0,0,-90])
finial();

//heel
translate([0,-r_heel,-vert/2])
rotate([0,-90,0])
rotate([0,0,90])
rotate_extrude(angle = 90,convexity = 10,$fn=res)
translate([r_heel, 0, 0])
cross_section();

translate([f,-r_heel-f,-vert/2-r_heel])
mirror([1,0,0])
rotate([0,0,90])
finial();
}}

module finial(){
    res = 50;
    r = 7.5;
    union(){
    rotate_extrude(angle = 270,convexity = 10,$fn=50)
translate([r, 0, 0])
cross_section();

translate([r,-r/2,0])
rotate([90,0,0])
linear_extrude(r,center=true,convexity=10,twist=0,slices=20,scale=1,$fn=res)
cross_section();

translate([r/2,-r,0])
rotate([90,0,90])
linear_extrude(r,center=true,convexity=10,twist=0,slices=20,scale=1,$fn=res)
cross_section();

}}




module cross_section_cap(){
    cs_width = 10;
    cs_r = cs_width/4 + 1; 
    cs_res = 25;
    
    rotate([90,0,0]){
    difference(){           
        sphere(cs_width/2,$fn=cs_res*2,center = t);
        
    translate([0,0,-cs_width/2])
    cube([cs_width*2,cs_width*2,cs_width], center = true);
    translate([cs_width/2,cs_width/2,0]){
    cylinder(cs_width*2, r = cs_r, $fn=cs_res,center = true);
    }
    translate([-cs_width/2,cs_width/2,0]){
    cylinder(cs_width*2, r = cs_r,$fn=cs_res,center = true);
    }
    translate([cs_width/2,-cs_width/2,0]){
    cylinder(cs_width*2, r = cs_r,$fn=cs_res,center = true);
    }
    translate([-cs_width/2,-cs_width/2,0]){
    cylinder(cs_width*2, r = cs_r,$fn=cs_res,center = true);       
    }}}
}

module cross_section(){
    cs_width = 15;
    cs_r = cs_width/4 + 1; 
    cs_res = 25;
    t = true;
    
    difference(){
    square(cs_width,cs_width);
    rotate([0,0,0]){
    translate([cs_width/2,cs_width/2,0]){
    circle(cs_r,$fn=cs_res);
    }
    translate([-cs_width/2,cs_width/2,0]){
    circle(cs_r,$fn=cs_res);
    }
    translate([cs_width/2,-cs_width/2,0]){
    circle(cs_r,$fn=cs_res);
    }
    translate([-cs_width/2,-cs_width/2,0]){
    circle(cs_r,$fn=cs_res);
    }}}
}