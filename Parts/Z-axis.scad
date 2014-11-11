//Z axis 

//Public settings 
rod_holder_thickness = spacer_height; //(TODO calculate)
rod_holder_outer = z_rod+4;

motor_offset = 5;

module z_axes(show_part,detail){
	//nema holder
	echo("nema_width",motor_holder_width,nema_width,spacer_width,spacer_width/2-nema_width/2);
	if (show_part=="bottom" || show_part=="bottom_rod"){
		translate([spacer_width/2 - nema_width/2,spacer_lenght,0]){	
			nema_mount();	
		}
	}
	difference(){
		union(){
			spacer();
			//z rod
			if(show_part=="bottom_rod" || show_part=="top"){
				translate([spacer_width/2,-spacer_lenght/2,0]){
					cylinder(h = rod_holder_thickness, r=rod_holder_outer,  center = false, $fs=detail);
				}
			}	
		}
		//z rod hole
		if(show_part=="bottom_rod" || show_part=="top"){
			translate([spacer_width/2,-spacer_lenght/2,-1]){
				cylinder(h = rod_holder_thickness+2, r=z_rod,  center = false, $fs=detail);
			}
		}

		
		
	}

}
