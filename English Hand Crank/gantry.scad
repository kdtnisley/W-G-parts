// [0,0,0] is defined as centered under the drive wheel on the mounting plate
//positive y is looking from the drive wheel towards the cloth plate
//positive x is to the back of the machine/to your right

include <BOSL2/std.scad>

//CONSTANTS____________________________________________

//drive wheel info
gap_dw = 5; //space between bottom of dw and mounting plate
r_dw = 25;  //radius of dw
h_dw = gap_dw+r_dw; //height of center of dw from mounting plate
t_dw = 10; //distance from center of belt race edge of wheel

//hand wheel info
gap_hw = 15; //space between bottom of hw and top of dw
r_hw = 75;   //radius of hw
h_hw = gap_dw + 2*r_dw + gap_hw + r_dw; //height of center of hw from mounting plate

//gantry profile info
r_maj = 10;
r_min = 5;
//it's an ellipse (probably)

//clearance info
clearance = 10; //space between gantry and wheels

//drive wheel min adjacency
adj_min = [r_hw + r_maj + clearance, 0, h_dw];

//anchor point (center of screw hole)
anchor = [0,-(t_dw + clearance),0];

//left & right anchor points (center of screw hole)
anchor_lr = [r_hw + r_maj + clearance, 0 , 0]; //might need more x


//ASSEMBLY_____________________________________________
//extrude_from_to(anchor_lr, adj_min, convexity=4, twist=90, slices=40) {
//    ellipse([3, 6], $fn=32);
//}

hw_spoke(r_hw);


//hand_wheel(r_hw);


//MODULES______________________________________________
module hand_wheel(r_hw){
    union(){
    //r_hw needs to be the outside extent of the wheel
    //chunky round wheel with belt race affixed to it
    r_chunk = 15;
    path = ellipse(r=r_hw-r_chunk/2);
    path_extrude2d(path,closed=true) rect([r_chunk,r_chunk], rounding=[5,5,5,0]);
    
    //create belt race_______________________
    belt_width = 6;
    w = 3;
    translate([0,0,-belt_width-r_chunk/2 + w]){
        beltpath = ellipse(r=r_hw-r_chunk/2-(belt_width-w)/2);
        path_extrude2d(beltpath,closed=true) 
        
        difference(){
            rect(belt_width+2*w, rounding=[0,0,w,w]);
            translate([-belt_width/4,0,0])
            circle(d=belt_width+1);
            translate([-belt_width*(3/4),0,0])
            rect(belt_width+1);
        }
    } //end belt race     
}
}

module hw_spoke(r_hw){
union(){
    path = helix(h=0,r1=1,r2=25,turns=1.125);
    rot([0,0,9],cp=([0,25,0]))
    zrot(45)
    path_sweep(ellipse(r=[4,2]),path,convexity=4, twist=0);

    translate([4.5,1,0])
    scale([1,1,.5])
    sphere(r=4);
}

//rot([0,0,-9],cp=([0,25,0]))
//mirror([1,0,0])
//zrot(45)
//path_sweep(ellipse(r=[4,2]),path,convexity=4, twist=0);

    
}

module hub(){
//module to create hub in gantry    
    
}

module drive_wheel(r_dw){
    
    
}

function [x,y] = log_spiral(a){
    //what I would like is a function that takes two points and puts a log spiral through them
    k = 17.03239 degrees; //= tan(alpha) 
    x = a*exp(k phi) * cos(phi);
    y = a*exp(k phi) * sin(phi);
}
//https://openscadsnippetpad.blogspot.com/2017/08/log-spiral-function.html
