include <BOSL2/std.scad>

res = 50;

//path = [
//    each right(50, p=arc(d=100,angle=[90,180])),
//    each left(50, p=arc(d=100,angle=[0,-90])),
//];
//path_extrude2d(path,caps=false) {
//    //fwd(2.5) square([5,6],center=true);
//    cross_section();
//}

//translate([0,0,46+160])
//rotate([90,0,0])
//difference(){
//union(){
////bearing superstructure
//rotate_extrude(convexity = 10,$fn=50)
//translate([11, 0, 0])
//cross_section();
//
//rotate_extrude(convexity = 10,$fn=50)
//translate([5, 0, 0])
//cross_section();
//}
//
//cylinder(20,4,4,$fn=50,center=true); //shaft hole
//}

linear_extrude(15,center=true,convexity=10,0,slices = 20,scale = 1,$fn=res);


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
    cs_width = 10;
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