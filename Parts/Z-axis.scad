//Z axis 
echo("Loading Part - Z-axe");
//private settings 
//Rod holder should be the same height than the spacer.
rod_holder_thickness = spacer_height;

module z_axes(show_part,detail){
	//nema holder
	union(){
		if (show_part=="bottom" || show_part=="bottom_rod"){
			translate([0,spacer_lenght/2,-spacer_lenght/2+motor_holder_thickness/2]){			
				motor_mount(motors[z_axe]);	
			}
		}
		difference(){
			union(){
				spacer();
				//z rod
				if(show_part=="bottom_rod" || show_part=="top"){
					difference(){
						translate([0,-spacer_lenght/2-rod_holder_thickness/2,0]){
							cylinder(h = rod_holder_thickness, r=rod_holder_outer,  center = true, $fs=detail);
						}
						spacer_hole();
					}
				}	
			}
			//z rod hole
			if(show_part=="bottom_rod" || show_part=="top"){
				translate([0,-spacer_lenght/2-rod_holder_thickness/2,-1]){
					cylinder(h = rod_holder_thickness+2, r=z_rod,  center = true, $fs=detail);
				}
			}
		}
	}
}