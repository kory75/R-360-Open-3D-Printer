//R-360 Teli
//Publised settings
//include <../printer.scad>;

//use <MCAD/involute_gears.scad>;
include <../../MCAD-master/involute_gears.scad>;

//include <../libs/parametric_involute_gear_v5.0.scad>;

//default 0 for laser cutting (6mm is recomended to fit with the plastic parts)
thickness = frame_thickness;

y_gear_thickness = thickness > 0 ? thickness : 1;

//Protected
//Change these to fine tune your printer. For Pro user only

//nema motor size (from publised variables)
motor_width = nema_width;
motor_lenght = nema_lenght;

//distance from y shaft TODO this should be calculated depending on the motor and shaft, slipring sizes
slip_ring_width = 56;
slip_ring_lenght = 38;
	//this should be equale of y-base width
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

// TODO rounding (not in use)
outside_rounding = 5;
inside_rounding = 5;

//private
//You should not change these values

//y holes
y_bolt = frame_bolt;


y_bolt_center_offset = slip_ring_width/2 + slip_ring_motor_gap / 2;
y_bolt_bottom = bottom_height - (max(slip_ring_width,motor_lenght) + (20 /2) ); // +10 for the top, +10 for the bottom gap around motor & slip ring hole is in the middle of them (TODO)
y_bolt_top =  bottom_height - 10; //(TODO)

//z holes
z_bolt = frame_bolt;
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
bed_bolt_offset = 8;

////lcd 


//Ramps 1.4


module z_holes(){
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

}

//frame
module frame(){
	echo ("frame width:",printing_width+left_width+right_width+2*bed_vertical_gaps,"mm");
	echo ("frame height:",printing_height+bottom_height+top_height+bed_carrige_tickness+legs_height,"mm");
	difference(){
		union(){
			square([printing_width+left_width+right_width+2*bed_vertical_gaps,printing_height+bottom_height+top_height+bed_carrige_tickness],center=false);
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

module disc_top_holes(){
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
	difference(){
		union(){
			square([printing_width,disc_lower_arms],center=true);
			square([disc_lower_arms,printing_width],center=true);
			circle(lower_disc_core);
		}
		circle(m8);
		disc_top_holes();
	}
	}
}

module disc_top(){
	
	translate([(printing_width+2*bed_vertical_gaps)/2+left_width,bed_carrige_tickness/2+bottom_height+printing_width/2+bed_vertical_gaps/2,0]){
	difference(){
		circle(printing_width/2);
		disc_top_holes();
	}
	}
}

module y_large_gear(){
		translate([(printing_width+2*bed_vertical_gaps)/2+left_width,bed_carrige_tickness/2+bottom_height+printing_width/2+bed_vertical_gaps/2,-3]){
			echo ("rendering gear...");
			difference(){
				gear(number_of_teeth=90,circular_pitch=270, diametral_pitch=false,gear_thickness = y_gear_thickness,rim_thickness = y_gear_thickness,hub_thickness = y_gear_thickness, bore_diameter = 12,circles=0,involute_facets=5);
				translate([0,0,thickness/2]){
					gear_bolt_holes();
				}
			}
		}
}

module y_small_gear(){
		translate([(printing_width+2*bed_vertical_gaps)/2+left_width,bed_carrige_tickness/2+bottom_height+printing_width/2+bed_vertical_gaps/2,-3]){
			echo ("rendering gear...");
			echo ("gear thickness:");
			echo (y_gear_thickness);
			translate([0,100,0]){
				gear(number_of_teeth=15,circular_pitch=270, diametral_pitch=false,gear_thickness = y_gear_thickness,rim_thickness = y_gear_thickness,hub_thickness = y_gear_thickness, bore_diameter = 3,circles=0,involute_facets=5);
			}
		}
}

module gear_spacer(){
	translate([(printing_width+2*bed_vertical_gaps)/2+left_width,bed_carrige_tickness/2+bottom_height+printing_width/2+bed_vertical_gaps/2,-3]){
		circle(20);
	}
}

module gear_bolt_holes(){
	
		linear_extrude(height = y_gear_thickness, center = true, convexity = 10)	{
			translate([30,0,0]){
				circle(m3);
			}
			translate([-30,0,0]){
				circle(m3);
			}
		}
}

module y_cable_hole(){
	
}




