w = 2;
IR = 16.3/2;
IRot = 83.6/2 - IR;
res = 50;

RP = 49.4/2 - 6.8/2;
theta = 40;

union(){
difference(){

rotate_extrude(convexity = 10, $fa = 1)
translate([0, 0, 0])
cut_view();
    
//center hole
cylinder(h = 40,d=32,center = true,$fa = .5);
    
//slots
translate([0,0,2])
 for(i = [ [  0, 0,   0],
           [  0, 0,  22.5],
           [  0, 0,  45],
           [  0, 0,  67.5],
           [  0, 0,  90],
           [  0, 0, 112.5],
           [  0, 0, 135],
           [  0, 0, 157.5] ])
{
   rotate(i){
   union(){
        cube([100, w, 10], center = true);
        translate([0,0,-5]) rotate([90,0,0]) cylinder(100, d = w, center=true, $fn=10);
   }}}
   
}

//positioning pegs
// for(i = [ [  0, 0,  0],
//           [  0, 0,  0+theta],
//           [  0, 0,  90],
//           [  0, 0, 90+theta],
//           [  0, 0, 180],
//           [  0, 0, 180+theta],
//           [  0, 0, 270],
//           [  0, 0, 270+theta] ])
// {
//    rotate(i)
//    translate([RP,0,-1])
//    union(){
//        cylinder(h=IR*2,r=6.5/2,center=true,$fn=res);
//        translate([0,0,IR]) sphere(r=6.5/2,$fn=res);      
// }}
}

module cut_view(){
    s = 4;
    
    translate([IRot, 0, 0]) rotate([0,0,-90])    
    union(){
    difference(){
        circle(r=IR + w, $fn=res);
    
        circle(r=IR, $fn=res); 
        translate([-IR-w,-IR*2-w*2,0]) square([IR*2+w*2,IR*2+ w*2]);
        rotate([0,0,115]) square([IR*2+w*2,IR*2+ w*2]);
        rotate([0,0,25]) translate([0,IR+w/2,0]) circle(r = w/2, $fn=res);
    }
    
    rotate([0,0,25]) translate([0,IR+w/2,0]) circle(r = w/2, $fn=res);

    translate([IR,-IRot+1,0]) square([w,IRot-1]);

    translate([IR+.25,-IR/2,0]) rotate([0,0,-90]) belt_cross_section();

    translate([IR+w,-IR*2-1,0])
    difference(){
        square([s*2+.75,s*2]);
        translate([s*2,0,0]) circle(r = s*2, $fn=res);
    }
    }
}



module belt_cross_section(){
    belt_rad = 3.5;
    pretty_rad = belt_rad/4;
    
    //raw cross section
    difference(){
    square([belt_rad*1.5,belt_rad*3]);
    translate([0,belt_rad*1.5,0]){
    circle(belt_rad, $fn=50);
    }}
    
    //make it pretty
    translate([0,pretty_rad,0]){
    circle(pretty_rad, $fn=20);
    }
    translate([0,belt_rad*3-pretty_rad,0]){
    circle(pretty_rad, $fn=20);
    }
}