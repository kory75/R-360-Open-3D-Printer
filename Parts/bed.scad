//bed

//disc
disc_lower_arms = 30;
lower_disc_core = 60;

//disc_holes
bed_bolt = m3;
bed_shaft = m8;
bed_bolt_offset = 8; // from edge ?!

inner_bed_bolt_offset = 30; //from centre

module outer_bolt_holes(){
		//top
		translate([0,printing_width/2-bed_bolt_offset,0]){
			circle(bed_bolt);
		}
		//bottom
		translate([0,-printing_width/2+bed_bolt_offset,0]){
			circle(bed_bolt);
		}
		//left
		translate([-printing_width/2+bed_bolt_offset,0,0]){
			circle(bed_bolt);
		}
		//right
		translate([printing_width/2-bed_bolt_offset,0,0]){
			circle(bed_bolt);
		}
}


module disc_bottom(){
	translate([(printing_width+2*bed_vertical_gaps)/2+left_width,printing_height+bed_carrige_tickness/2+bottom_height-(printing_width+bed_vertical_gaps)/2,0]){
		union(){
			square([printing_width,disc_lower_arms],center=true);
			square([disc_lower_arms,printing_width],center=true);
			circle(lower_disc_core);
		}
		circle(m8);
		outer_bolt_holes();
	}
}

module disc_top(){
	difference(){
		circle(printing_width/2);
		//outer_bolt_holes();
	}
}

module heater_rim(){
	difference(){
		circle(printing_width/2);
		if(bed_shape=="circle"){
			circle(heater_width/2+0.5);
		}
		if(bed_shape=="square"){
			translate([-heater_width/2,-heater_width/2,0]){
				square([heater_width+0.5,heater_width+0.5],centre = true);
			}
		}
		outer_bolt_holes();
	}
}

module y_large_gear(){
			echo ("rendering gear...");
			difference(){
				gear(number_of_teeth=90,circular_pitch=225, diametral_pitch=false,gear_thickness = y_gear_thickness,rim_thickness = y_gear_thickness,hub_thickness = y_gear_thickness, bore_diameter = 12,circles=0,involute_facets=5);
				translate([0,0,frame_thickness/2]){
					inner_bolt_holes();
					y_cable_hole();
				}
				
			}
		
}

module y_small_gear(){
			echo ("rendering gear...");
			echo ("gear thickness:");
			echo (y_gear_thickness);
			translate([0,100,0]){
				gear(number_of_teeth=15,circular_pitch=225, diametral_pitch=false,gear_thickness = y_gear_thickness,rim_thickness = y_gear_thickness,hub_thickness = y_gear_thickness, bore_diameter = 3,circles=0,involute_facets=5);
			}
		
}


//TODO make parameters variables
module gear_spacer(){
	difference(){
		circle(35);
		circle(12);
		inner_bolt_holes();
		y_cable_hole();
	}
}

module inner_bolt_holes(){
	
		//top
		translate([0,inner_bed_bolt_offset,0]){
			circle(bed_bolt);
		}
		//bottom
		translate([0,-inner_bed_bolt_offset,0]){
			circle(bed_bolt);
		}
		//left
		translate([-inner_bed_bolt_offset,0,0]){
			circle(bed_bolt);
		}
		//right
		translate([inner_bed_bolt_offset,0,0]){
			circle(bed_bolt);
		}
}

module y_cable_hole(){
	translate([20,0,0]){
		square([10,10],center =true);
	}
}