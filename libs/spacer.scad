//Lib
//Spacer
spacer_width = frame_gap;
spacer_lenght = frame_bolt*4+1;
spacer_height = frame_bolt*4+1;
spacer_bolt = frame_bolt*hole_adjustment;

module spacer(){
	difference(){
		cube([spacer_width,spacer_lenght,spacer_height],center=false);
		rotate([0,90,0]){
			translate([-spacer_lenght/2,spacer_height/2,-1]){
				cylinder(h = spacer_width+2, r=spacer_bolt,  center = false, $fs=detail);
			}
		}
	}
}
