//Publised settings
include <./settings.scad>

//Publised Variables
//Please change these variables to set up your printer


//Frame
frame_thickness = 6;
frame_nut_thickness = 4;

//using m5 90 mm bolts - 6 mm - 6mm frame front, back - 4mm for nuts 
frame_gap = 90 - (frame_thickness*2) - frame_nut_thickness;
frame_bolt = m5;

//Printing Dimensions
printing_height = 400; //450
printing_width = 300; //140

extruder_hang_out_height = 15; //(TODO) Modifier for printing height

//Rods
y_shaft = m12;
z_rod = m10;
z_axe = m5;
x_rod = m8;

//Mototrs
x_motor = nema_17;
y_motor = nema_17;
z_motor = nema_17;
e_motor = nema_17;

//Change it to set up your printer
//Display options
show_frame_front = 0;
show_frame_back = 0;
show_bed_top = 0;
show_bed_bottom = 0;

show_gear_spacer = 0;

show_large_y_gears = 0;
show_small_y_gears = 0;

show_z_axis_top = 1;
show_z_axis_bottom = 0;
show_z_axis_bottom_rod = 0;


set_motors(x_motor,y_motor,z_motor,e_motor); //TODO


//render_parts();


//(TODO) move to render_parts

include <./frame/frame.scad>
include <./Z-axis.scad>

if(thickness > 0){
	
	linear_extrude(height = thickness, center = true, convexity = 10)	{
	if(show_bed_top) {
		disc_top();
	}
	if(show_bed_bottom) {
		disc_bottom();
	}
	if(show_frame_front) {
		 frame();
	}
	if(show_frame_back) {
		frame_back();
	}
	if(show_gear_spacer){
		gear_spacer();
	}
	}
	if(show_large_y_gears) {
		y_large_gear();
	}
	if(show_small_y_gears) {
		y_small_gear();
	}
}else{
	if(show_bed_top) {
		disc_top();
	}
	if(show_bed_bottom) {
		disc_bottom();
	}
	if(show_frame_front) {
		frame();
	}
	if(show_frame_back) {
		frame_back();
	}
	if(show_gear_spacer){
		gear_spacer();
	}
	if(show_large_y_gears) {
		echo("projecting gear...");
		projection(){ y_large_gear(); }
	}
	if(show_small_y_gears) {
		projection() y_small_gear();
	}
}

if(show_z_axis_top){
	z_axes("top",detail);
}
if(show_z_axis_bottom){
	z_axes("bottom",detail);
}
if(show_z_axis_bottom_rod){
	z_axes("bottom_rod",detail);
}

