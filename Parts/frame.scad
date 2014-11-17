//Frame
//test vars ! TODO should come form other parts (y-base, x-ends, carriage)
x_axe_height = 90;
carriage_height = 85;
z_rod_x_main_offset = 8;
x_main_width = 10;
x_idler_width = 20;
//slip_ring_height = 35;
//slip_ring_width = 20;


echo ("Loading Part - Frame");
//Private Variables
top_height = frame_edge_width + spacer_height + max(x_axe_height,carriage_height);
left_width = frame_edge_width + spacer_lenght + nema_width[z_axe] + spacer_lenght + z_rod_x_main_offset + x_main_width + x_idler_width;
right_width = frame_edge_width + spacer_lenght + nema_width[z_axe] + spacer_lenght + z_rod_x_main_offset + x_main_width +  nema_width[x_axe];
bottom_height = max(slip_ring_height + slip_ring_gap + y_bearing_height + y_bearing_rim_height + y_nut_height + frame_edge_width,nema_lenght[y_axe] + motor_holder_thickness + frame_edge_width);

//legs size and position
legs_height = 10;
legs_width = 30;
leg_offset = left_width/2 - legs_width /2;

//bed (local)
bed_vertical_gaps = 15; // TODO Carriege width (two halfs)
//slipring gear gap, gear, spacer, arms, heter rim, print bed
bed_carrige_tickness = 6*6; //6mm parts 

//y holes
//y_bolt = frame_bolt*hole_adjustment; //TODO we should use value directly to save memory
y_bolt_center_offset = slip_ring_width/2 + spacer_lenght + nema_lenght[y_axe] /2;
y_bolt_bottom = bottom_height - (max(slip_ring_width,nema_lenght[y_axe]) + (20 /2) ); // +10 for the top, +10 for the bottom gap around motor & slip ring hole is in the middle of them (TODO)
y_bolt_top =  bottom_height - 10; //(TODO)

//z holes
	//distance from edge
z_left_vertical_offset  = nema_width[z_axe]+spacer_lenght+frame_bolt*hole_adjustment/2;
z_right_vertical_offset = nema_width[z_axe]+spacer_lenght+frame_bolt*hole_adjustment/2;
z_bottom = 47; //TODO calculate from Y Base
z_top = frame_edge_width + spacer_height/2;



module z_holes(){
	echo("z rod lenght:",printing_height+bottom_height+top_height+bed_carrige_tickness-z_top-z_bottom+spacer_height,"mm");
	echo("z lead screw lenght:",printing_height+10+20,"mm?"); //TODO add nut height and coupling half height
	echo("x rod lenght",printing_width+nema_width[x_axe]+10+2*10,"mm?"); //TODO bearing width, 2x X midsection width
	union(){
		//left bottom
		translate([z_left_vertical_offset,z_bottom,0]){
			circle(frame_bolt*hole_adjustment);
		}
		translate([spacer_lenght/2,z_bottom,0]){
			circle(frame_bolt*hole_adjustment);
		}
		//right bottom
		translate([printing_width+left_width+right_width+2*bed_vertical_gaps-z_left_vertical_offset,z_bottom,0]){
			circle(frame_bolt*hole_adjustment);
		}
		//left top
		translate([z_left_vertical_offset,printing_height+bottom_height+top_height+bed_carrige_tickness-z_top,0]){
			circle(frame_bolt*hole_adjustment);
		}
		//right top
		translate([printing_width+left_width+right_width+2*bed_vertical_gaps-z_left_vertical_offset,printing_height+bottom_height+top_height+bed_carrige_tickness-z_top,0]){
			circle(frame_bolt*hole_adjustment);
		}
	}
}

module y_holes(){
	union(){
		translate([(printing_width+left_width+right_width+2*bed_vertical_gaps+y_bolt_center_offset)/2,y_bolt_bottom,0]){
			circle(frame_bolt*hole_adjustment);
		}
		translate([(printing_width+left_width+right_width+2*bed_vertical_gaps+y_bolt_center_offset)/2,y_bolt_top,0]){
			circle(frame_bolt*hole_adjustment);
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
	difference(){
		frame();
		fillament_holders();
	}
}

module fillament_holders(){

}	

