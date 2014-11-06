//R-360 Teli
//use <MCAD/involute_gears.scad>;
include <../../MCAD-master/involute_gears.scad>;

//default 0 for laser cutting (6mm is recomended to fit with the plastic parts)
y_gear_thickness = frame_thickness > 0 ? frame_thickness : 1;

//Protected
//Change these to fine tune your printer. For Pro user only

//nema motor size (from publised variables)
motor_width = nema_width;
motor_lenght = nema_lenght;

//distance from y shaft TODO this should be calculated depending on the motor and shaft, slipring sizes
slip_ring_width = 56;
slip_ring_lenght = 38;
	//this should be equale of y-base width (spacer width?)
slip_ring_motor_gap = 11;

//frame TODO calculate these from rod and motor size values
bottom_height = (max(slip_ring_width,motor_lenght) + 20); //20 is the Y holder around the motor & slip ring 
top_height = 20;
left_width = motor_width + 10 + z_rod + 10; //see bellow (TODO)
right_width = motor_width + 10 + z_rod + 10 + motor_width; //first +10 is Z base width, the secound +10 is the X holder rod  motor distance (TODO)

//legs (local)
legs_height = 10;
legs_width = 20;
leg_offset = left_width/2 - legs_width /2;

//bed (local)
bed_vertical_gaps = 15;
bed_carrige_tickness = 30;

//private
//You should not change these values

//y holes
y_bolt = frame_bolt*hole_adjustment;


y_bolt_center_offset = slip_ring_width/2 + slip_ring_motor_gap / 2;
y_bolt_bottom = bottom_height - (max(slip_ring_width,motor_lenght) + (20 /2) ); // +10 for the top, +10 for the bottom gap around motor & slip ring hole is in the middle of them (TODO)
y_bolt_top =  bottom_height - 10; //(TODO)

//z holes
z_bolt = frame_bolt*hole_adjustment;
	//distance from edge
z_left_vertical_offset  = motor_width+(11/2)+2; //??horizontal?? 11 is the width of the z base midlle part (TODO)
z_right_vertical_offset = motor_width+(11/2)+2; //??horizontal?? 11 is the width of the z base midlle part (TODO)
z_bottom = 47;
z_top = 20;

//disc
disc_lower_arms = 30;
lower_disc_core = 60;

//disc_holes
bed_bolt = m3;
bed_shaft = m8;
bed_bolt_offset = 8; // from edge ?!

inner_bed_bolt_offset = 30; //from centre

////lcd 


//Ramps 1.4


module z_holes(){
	echo("z rod lenght:",printing_height+bottom_height+top_height+bed_carrige_tickness-z_top-z_bottom+spacer_height,"mm");
	echo("z lead screw lenght:",printing_height+10+20,"mm?"); //TODO add nut height and coupling half height
	echo("x rod lenght",printing_width+nema_width+10+2*10,"mm?"); //TODO bearing width, 2x X midsection width
	union(){
		//left bottom
		translate([z_left_vertical_offset,z_bottom,0]){
			circle(z_bolt);
		}
		//right bottom
		translate([printing_width+left_width+right_width+2*bed_vertical_gaps-z_left_vertical_offset,z_bottom,0]){
			circle(z_bolt);
		}
		//left top
		translate([z_left_vertical_offset,printing_height+bottom_height+top_height+bed_carrige_tickness-z_top,0]){
			circle(z_bolt);
		}
		//right top
		translate([printing_width+left_width+right_width+2*bed_vertical_gaps-z_left_vertical_offset,printing_height+bottom_height+top_height+bed_carrige_tickness-z_top,0]){
			circle(z_bolt);
		}
	}
}

module y_holes(){
	union(){
		translate([(printing_width+left_width+right_width+2*bed_vertical_gaps+y_bolt_center_offset)/2,y_bolt_bottom,0]){
			circle(m3);
		}
		translate([(printing_width+left_width+right_width+2*bed_vertical_gaps+y_bolt_center_offset)/2,y_bolt_top,0]){
			circle(m3);
		}
	}
}

module ramps_1_4_holes(){

}

module lcd_holes(){
	//no lcd planed
}

//frame
module frame(){
	echo ("frame width:",printing_width+left_width+right_width+2*bed_vertical_gaps,"mm");
	echo ("frame height:",printing_height+bottom_height+top_height+bed_carrige_tickness+legs_height,"mm");
	difference(){
		union(){
			difference(){
				square([printing_width+left_width+right_width+2*bed_vertical_gaps,printing_height+bottom_height+top_height+bed_carrige_tickness],center=false);

				difference(){
					square([printing_width+left_width+right_width+2*bed_vertical_gaps,printing_height+bottom_height+top_height+bed_carrige_tickness],center=false);
					translate([(printing_width+left_width+right_width+2*bed_vertical_gaps)/2,(printing_height+bottom_height+top_height+bed_carrige_tickness)/2,0]){
						circle(sqrt( pow(printing_width+left_width+right_width+2*bed_vertical_gaps,2) + pow(printing_height+bottom_height+top_height+bed_carrige_tickness,2) )/2-10  )	;
					}
				}
			}
			translate([leg_offset,-legs_height,0]){
				square([legs_width,legs_height],center=false);
			}
			translate([printing_width+left_width+right_width+2*bed_vertical_gaps-legs_width-leg_offset,-legs_height,0]){
				square([legs_width,legs_height],center=false);
			}
		}

		translate([left_width,bottom_height,0]){
				square([printing_width+2*bed_vertical_gaps,printing_height+bed_carrige_tickness],center=false);
		}
		z_holes();
		y_holes();
	}	
	
}

module frame_back(){
	frame();
}

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
