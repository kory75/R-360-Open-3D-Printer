//Renderer

set_motors(x_motor,y_motor,z_motor,e_motor); //TODO

//include part files
include <./libs/spacer.scad>
include <./frame/frame.scad>
include <./Z-axis.scad>
include <./X-axis.scad>
include <./Y-axis.scad>



module render_parts(){
//lasercut parts
if(frame_thickness > 0){
	
	linear_extrude(height = frame_thickness, center = true, convexity = 10)	{
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
	if(show_heater_rim) {
		heater_rim();
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
	if(show_heater_rim) {
		heater_rim();
	}
	if(show_large_y_gears) {
		projection(){ y_large_gear(); }
	}
	if(show_small_y_gears) {
		projection() y_small_gear();
	}
}
//Z-axis
if(show_z_axis_top){
	z_axes("top",detail);
}
if(show_z_axis_bottom){
	z_axes("bottom",detail);
}
if(show_z_axis_bottom_rod){
	z_axes("bottom_rod",detail);
}
//X-axis
if(show_x_motor){
	x_axis("motor");
}
if(show_x_idler){
	x_axis("idler");
}
//Y-axis
if(show_y_base){
	y_base();
}

}