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
left_width = frame_edge_width + spacer_lenght + nema_width[motors[z_axe]] + spacer_lenght + z_rod_x_main_offset + x_main_width + x_idler_width;
right_width = frame_edge_width + spacer_lenght + nema_width[motors[z_axe]] + spacer_lenght + z_rod_x_main_offset + x_main_width +  nema_width[motors[x_axe]];
bottom_height = max(slip_ring_height + slip_ring_gap + y_bearing_height + y_bearing_rim_height + y_nut_height + frame_edge_width,nema_lenght[motors[y_axe]] + motor_holder_thickness + frame_edge_width);

frame_offset = left_width - right_width;

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
y_bolt_center_offset = slip_ring_width/2 + spacer_lenght + nema_lenght[motors[y_axe]] /2;
y_bolt_bottom = bottom_height - (max(slip_ring_width,nema_lenght[motors[y_axe]]) + (20 /2) ); // +10 for the top, +10 for the bottom gap around motor & slip ring hole is in the middle of them (TODO)
y_bolt_top =  bottom_height - 10; //(TODO)

//z holes
//distance from edge

z_hole_offset  = frame_edge_width + spacer_lenght+nema_width[motors[z_axe]]+spacer_lenght/2+frame_bolt*hole_adjustment;
z_hole_offset_outer = frame_edge_width + spacer_lenght/2;
z_hole_bottom = bottom_height+bed_carrige_tickness-spacer_height/2; //TODO add calculate max( (extruder_hangout) , z_bearing_height + z_bearing_mount_height /2 , z_nut_height + z_coupler_height )
z_hole_top = frame_edge_width + spacer_height/2;

//functions
//frame width
function frame_width() = printing_width+left_width+right_width+2*bed_vertical_gaps;
//frame_height	
function frame_height() = printing_height+bottom_height+top_height+bed_carrige_tickness+legs_height; //TODO add extruder hangout
//z rod lenght
function z_rod_lenght() = (frame_height()/2-legs_height/2-z_hole_top) - (-frame_height()/2+legs_height/2+z_hole_bottom)+ spacer_lenght;
//z lead screw lenght
function z_lead_screw_lenght() = printing_height+10+20; //TODO add nut height and coupling half height minus motor shaft lenght
//x rod lenght
function x_rod_lenght() = printing_width+nema_width[motors[x_axe]]+10+2*10; //TODO bearing width, 2x X midsection width


echo ("frame width:",frame_width(),"mm");
echo ("frame height:",frame_height(),"mm");
echo("z rod lenght:",z_rod_lenght(),"mm");
echo("z lead screw lenght:",z_lead_screw_lenght(),"mm?"); 
echo("x rod lenght",x_rod_lenght(),"mm?"); 

module z_holes(){
	union(){
		//left bottom
		translate([-frame_width()/2+z_hole_offset,-frame_height()/2+legs_height/2+z_hole_bottom,0]){
			circle(frame_bolt*hole_adjustment,center=true);
		}
		translate([-frame_width()/2+z_hole_offset_outer,-frame_height()/2+legs_height/2+z_hole_bottom,0]){
			circle(frame_bolt*hole_adjustment,center=true);
		}
		//right bottom
		translate([frame_width()/2-z_hole_offset,-frame_height()/2+legs_height/2+z_hole_bottom,0]){
			circle(frame_bolt*hole_adjustment,center=true);
		}
		translate([frame_width()/2-z_hole_offset_outer,-frame_height()/2+legs_height/2+z_hole_bottom,0]){
			circle(frame_bolt*hole_adjustment,center=true);
		}
		//left top
		translate([-frame_width()/2+z_hole_offset,frame_height()/2-legs_height/2-z_hole_top,0]){
			circle(frame_bolt*hole_adjustment,center=true);
		}
		//right top
		translate([frame_width()/2-z_hole_offset,frame_height()/2-legs_height/2-z_hole_top,0]){
			circle(frame_bolt*hole_adjustment,center=true);
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

//frame
module frame(){
	difference(){
		union(){
			difference(){
				// frame
				square([frame_width(),frame_height()-legs_height],center=true);
				//rounding
				difference(){
					square([frame_width(),frame_height()-legs_height],center=true);
					circle(sqrt( pow(printing_width+left_width+right_width+2*bed_vertical_gaps,2) + pow(printing_height+bottom_height+top_height+bed_carrige_tickness,2) )/2-10, center=true )	;
				}
			}
			//leg left
			translate([-frame_width()/2+leg_offset,-frame_height()/2,0]){
				square([legs_width,legs_height],center=true);
			}
			//leg right
			translate([frame_width()/2-leg_offset,-frame_height()/2,0]){
				square([legs_width,legs_height],center=true);
			}
		}
		//frame cut out
		translate([-frame_width()/2+(printing_width+2*bed_vertical_gaps)/2+left_width,-frame_height()/2+legs_height/2+(printing_height+bed_carrige_tickness+extruder_carriage_difference)/2+bottom_height,0]){
				square([printing_width+2*bed_vertical_gaps,printing_height+bed_carrige_tickness+extruder_carriage_difference],center=true);
		}
		z_holes();
		y_holes();
		translate([printing_width/2+bed_vertical_gaps-frame_thickness/2+frame_offset/2,-frame_height()/2+bottom_height/4],0){
			square([frame_thickness,bottom_height/2],center=true);
		}
		translate([-printing_width/2-bed_vertical_gaps+frame_thickness/2+frame_offset/2,-frame_height()/2+bottom_height/4],0){
			square([frame_thickness,bottom_height/2],center=true);
		}
	}	
	
}

module frame_back(){
	difference(){
		frame();
		fillament_holders();
		extruder_holder();
		electronics_holder();
	}
}

//TODO add coupling/2 + Leadscrew Nut lenght + Y nut holder width
//frame tichness 2x cross end 2x edge 1x motor holder
function y_cross_frame_width() = printing_lenght+frame_thickness*5+nema_lenght[motors[y_axe]];

function y_cross_frame_motor_offset() = frame_thickness+nema_lenght[motors[y_axe]];

module y_cross_frame(){
	difference(){
		translate([y_cross_frame_motor_offset(),0,0]){
			square([y_cross_frame_width(),bottom_height],center=true);
		}

		//frame gap right end
		translate([-y_cross_frame_width()/2+frame_thickness*3/2+y_cross_frame_motor_offset(),bottom_height/4,0]){
			square([frame_thickness,bottom_height/2],center=true);
		}

		//frame gap left end
		translate([y_cross_frame_width()/2-frame_thickness*3/2+y_cross_frame_motor_offset(),bottom_height/4,0]){
			square([frame_thickness,bottom_height/2],center=true);
		}

		//frame gap right
		translate([-frame_gap/2-frame_thickness/2,bottom_height/4,0]){
			square([frame_thickness,bottom_height/2],center=true);
		}
		//frame gap left
		translate([frame_gap/2+frame_thickness/2,bottom_height/4,0]){
			square([frame_thickness,bottom_height/2],center=true);
		}

		//cabel hole
		translate([0,bottom_height/2,0]){
			circle(bottom_height/2,center=true);
		}

		//TODO Separate Motor Holder
		//frame gap motor holder
		translate([y_cross_frame_width()/2-frame_thickness*5/2,bottom_height/4,0]){
			square([frame_thickness,bottom_height/2],center=true);
		}
	}
	//leg left
	translate([y_cross_frame_width()/2-legs_width+y_cross_frame_motor_offset(),-bottom_height/2-legs_height/2,0]){
		square([legs_width,legs_height],center=true);
	}
	translate([-y_cross_frame_width()/2+legs_width+y_cross_frame_motor_offset(),-bottom_height/2-legs_height/2,0]){
		square([legs_width,legs_height],center=true);
	}
}

module y_end_frame(type){
	if(type == "motor"){

	}
}

module fillament_holders(){

}

module extruder_holder(){

}

module electronics_holder(){

}	
