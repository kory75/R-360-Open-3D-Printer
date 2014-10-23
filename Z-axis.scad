//Z axis 

//Public settings 
	//using m5 90 mm bolts - ( 6 mm + 6mm frame front, back)  - 4mm for nuts 
main_width = frame_gap; 
main_lenght = 11;
main_height = 11;
main_bolt = frame_bolt;

motor_holder_width = 40;
motor_holder_lenght = 13;
motor_holder_thickness = 6;

rod_hole = m10_hole;
rod_holder_thickness = 11;
rod_holder_outer = rod_hole+3;

motor_offset = 5;


module z_axes(show_part,detail){
	//nema holder
	if (show_part=="bottom" || show_part=="bottom_rod"){
		difference(){
			translate([(main_width-motor_holder_width)/2,main_lenght,0]){
					cube([motor_holder_width,motor_holder_lenght,motor_holder_thickness],center=false);
			}
			translate([main_width/2,main_lenght+nema_bolt_offset+m3_hole+motor_offset,motor_holder_thickness/2]){
				linear_extrude(height = motor_holder_thickness+2, center = true, convexity = 10)	{
					Nema_mount();	
				}
			}
		}
	}
	difference(){
		union(){
			//main
			cube([main_width,main_lenght,main_height],center=false);
			//z rod
			if(show_part=="bottom_rod" || show_part=="top"){
				translate([main_width/2,-main_lenght/2+rod_hole/2,0]){
					cylinder(h = rod_holder_thickness, r=rod_holder_outer,  center = false, $fs=detail);
				}
			}	
		}
		//main hole
		rotate([0,90,0]){
			translate([-main_height/2,main_lenght/2,-1]){
				cylinder(h = main_width+2, r=main_bolt,  center = false, $fs=detail);
			}
		}
		//z rod hole
		if(show_part=="bottom_rod" || show_part=="top"){
			translate([main_width/2,-main_lenght/2+rod_hole/2,-1]){
				cylinder(h = rod_holder_thickness+2, r=rod_hole,  center = false, $fs=detail);
			}
		}

		
		
	}

}
