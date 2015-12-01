//Z axis 
echo("Loading Part - Z-axe");
//private settings 
//Rod holder should be the same height than the spacer.
rod_holder_thickness = spacer_height;

function z_axes_offset() = max(spacer_width/2-nema_width[motors[z_axe]]/2,bearing_block_width[z_axe]/2)-motor_edge_gap;

module z_axes(show_part,side=1){
	//nema holder
	union(){
		if (show_part=="bottom" || show_part=="bottom_rod"){
			translate([z_axes_offset()*side,spacer_lenght/2,-spacer_lenght/2+motor_holder_thickness/2]){			
				motor_mount(motors[z_axe]);	
			}
		}
		difference(){
			union(){
				spacer();
				//z rod
				if(show_part=="bottom_rod" || show_part=="top"){
					difference(){
						translate([z_axes_offset()*side,-spacer_lenght/2-rod_holder_thickness/2,0]){
							cylinder(h = rod_holder_thickness, r=rod_holder_outer,  center = true, $fs=detail);
						}
						spacer_hole();
					}
				}	
			}
			//z rod hole
			if(show_part=="bottom_rod" || show_part=="top"){
				translate([z_axes_offset()*side,-spacer_lenght/2-rod_holder_thickness/2,-0.5]){
					cylinder(h = rod_holder_thickness+2, r=z_rod,  center = true, $fs=detail);
				}
			}
		}
	}
}
