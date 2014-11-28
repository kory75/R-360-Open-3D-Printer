//bed

//default 0 for laser cutting (6mm is recomended to fit with the plastic parts)
y_gear_thickness = frame_thickness > 0 ? frame_thickness : 1;

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
			circle(bed_bolt,center=true);
		}
		//bottom
		translate([0,-printing_width/2+bed_bolt_offset,0]){
			circle(bed_bolt,center=true);
		}
		//left
		translate([-printing_width/2+bed_bolt_offset,0,0]){
			circle(bed_bolt,center=true);
		}
		//right
		translate([printing_width/2-bed_bolt_offset,0,0]){
			circle(bed_bolt,center=true);
		}
}


module disc_bottom(){
	difference(){
		union(){
			square([printing_width,disc_lower_arms],center=true);
			square([disc_lower_arms,printing_width],center=true);
			circle(lower_disc_core,center=true);
		}
		circle(m8,center=true);
		outer_bolt_holes();
	}
}

module disc_top(){
	difference(){
		circle(printing_width/2,center=true);
		//outer_bolt_holes();
	}
}

module heater_rim(){
	difference(){
		circle(printing_width/2,center=true);
		circle(heater_width/2+0.5,center=true);
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
		circle(35,center=true);
		circle(12,center=true);
		inner_bolt_holes();
		y_cable_hole();
	}
}

module inner_bolt_holes(){
	
		//top
		translate([0,inner_bed_bolt_offset,0]){
			circle(bed_bolt,center=true);
		}
		//bottom
		translate([0,-inner_bed_bolt_offset,0]){
			circle(bed_bolt,center=true);
		}
		//left
		translate([-inner_bed_bolt_offset,0,0]){
			circle(bed_bolt,center=true);
		}
		//right
		translate([inner_bed_bolt_offset,0,0]){
			circle(bed_bolt,center=true);
		}
}

module y_cable_hole(){
	translate([20,0,0]){
		square([10,10],center =true);
	}
}