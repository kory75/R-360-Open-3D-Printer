//Lib
//Spacer
echo("Loading Lib - Spacer");
spacer_width = frame_gap;
spacer_lenght = frame_bolt*4+1;
spacer_height = frame_bolt*4+1;
spacer_bolt = frame_bolt*hole_adjustment;

module spacer(){
	difference(){
		cube([spacer_width,spacer_lenght,spacer_height],center=true);
		spacer_hole();
	}
}

module spacer_hole(){
	rotate([0,90,0]){
		translate([0,0,-0.5]){
			cylinder(h = spacer_width+2, r=spacer_bolt,  center = true, $fs=detail);
		}
	}
}