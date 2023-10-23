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
r_hw = 50;   //radius of hw
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
anchor_lr = [adj_min, 0 , 0]; //might need more x


//ASSEMBLY_____________________________________________
path = arc(r=r_hw + r_maj + clearance, angle=90);
new_path = hstack(path,column(path,1));
echo(new_path);
stroke(new_path, dots=true, dots_color="blue");


//MODULES______________________________________________
module hand_wheel(r_hw){
    
    
}


module hw_spoke(r_hw){
    
    
}

module hub(){
//module to create hub in gantry    
    
}

module drive_wheel(r_dw){
    
    
}
