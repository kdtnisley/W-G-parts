








cross_section();



module cross_section(){
    cs_width = 10;
    
    difference(){
    square(cs_width,cs_width,center = true);
    rotate([0,0,0]){
    translate([cs_width/2,cs_width/2,0]){
    circle(3.5,$fn=50,center = true);
    }
    translate([-cs_width/2,cs_width/2,0]){
    circle(3.5,$fn=50,center = true);
    }
    translate([cs_width/2,-cs_width/2,0]){
    circle(3.5,$fn=50,center = true);
    }
    translate([-cs_width/2,-cs_width/2,0]){
    circle(3.5,$fn=50,center = true);
    }}}
}