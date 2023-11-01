// [0,0,0] is defined as centered under the drive wheel on the mounting plate
//positive y is looking from the drive wheel towards the cloth plate
//positive x is to the back of the machine/to your right

include <BOSL2/std.scad>

//CONSTANTS____________________________________________
//bearing info
id_b = 8;  //id
od_b = 24; //od
h_b = 10;  //thickness

//drive wheel info
gap_dw = 5; //space between bottom of dw and mounting plate
r_dw = 25;  //radius of dw
h_dw = gap_dw+r_dw; //height of center of dw from mounting plate
t_dw = 10; //distance from center of belt race edge of wheel

//hand wheel info
gap_hw = 15; //space between bottom of hw and top of dw
r_hw = 175/2;   //radius of hw
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
zrot_copies(n=3,r=r_hw/2+3)
zrot(-90)
hw_spoke(r_hw);

hand_wheel(r_hw);
rotate([0,180,0])
hub(id_b,od_b,h_b);

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
el = [5,3];
    
//wide base
path=ellipse(d=[r_hw-7,r_hw*2/3-7]);
difference(){
    path_sweep(ellipse(r=el),path, convexity=4);
    translate([-r_hw,0,-5])
    cube([r_hw*2,r_hw,10]);   
}

//quarter rounds
path2 = arc(n=20,r=r_hw/4-7,angle=110);
translate([r_hw/2-r_hw/4+3.5,0,0])
path_sweep(ellipse(r=el),path2, convexity=4, twist=0);

mirror([1,0,0])
translate([r_hw/2-r_hw/4+3.5,0,0])
path_sweep(ellipse(r=el),path2,convexity=4, twist=0);

//curly tip
translate([-20.5,4,0])
union(){
path3 = helix(h=0,r1=0,r2=10,l=0, turns=.4);
zrot(-54)
path_sweep(ellipse(r=el),path3,convexity=4, twist=0);

translate([0,0,0])
scale([1,1,.5])
sphere(d=10);
}

mirror([1,0,0])
translate([-20.5,4,0])
union(){
path3 = helix(h=0,r1=0,r2=10,l=0, turns=.4);
zrot(-54)
path_sweep(ellipse(r=el),path3,convexity=4, twist=0);

translate([0,0,0])
scale([1,1,.5])
sphere(d=10);
}
}

module hub(id,od,t){
//module to create hub in gantry    
    w = 3; //clearances

    difference(){
        cyl(l=t+w,d=od+10,rounding=2.5);
        translate([0,0,w])
        cylinder(h=t,d=od,center=true);   //represent bearing
        cylinder(h=t*2,d=id+1,center=true); //clear axle
    }
}
