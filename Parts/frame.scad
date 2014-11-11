//R-360 Teli
//use <MCAD/involute_gears.scad>;
include <../../MCAD-master/involute_gears.scad>;

//default 0 for laser cutting (6mm is recomended to fit with the plastic parts)
y_gear_thickness = frame_thickness > 0 ? frame_thickness : 1;

//Protected
//Change these to fine tune your printer. For Pro user only

frame_minimum_bolt_gap = max(frame_minimum_bolt_gaps,spacer_lenght)/2;

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
left_width = motor_width + frame_minimum_bolt_gap + spacer_lenght  + z_rod + 10; //see bellow (TODO)
right_width = motor_width + frame_minimum_bolt_gap + spacer_lenght  + z_rod + 10 + motor_width ; //first +10 is Z base width, the secound +10 is the X holder rod  motor distance (TODO)

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
z_left_vertical_offset  = motor_width+spacer_lenght+frame_minimum_bolt_gap+z_bolt/2;
z_right_vertical_offset = motor_width+spacer_lenght+frame_minimum_bolt_gap+z_bolt/2;
z_bottom = 47; //TODO calculate from Y Base
z_top = frame_minimum_bolt_gap; //From the top for now



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
		translate([spacer_lenght/2,z_bottom,0]){
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



