//Render Parts for production
//Render all 3D printed of lasercut
echo("Loading Layout - Assembler");

module assembly(){
	translate([0,0,0]) y_base();
	translate([100,0,0]) z_axes("top",detail);
	translate([200,0,0]) z_axes("top",detail);
	translate([100,20,0]) z_axes("bottom",detail);
	translate([200,20,0]) z_axes("bottom",detail);
	translate([100,60,0]) z_axes("bottom_rod",detail);
	translate([200,60,0]) z_axes("bottom_rod",detail);
	//translate([-100,0,0]) x_axis("motor");
	//translate([-100,100,0]) x_axis("idler");
	
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) frame();
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) frame_back();
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_top();
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_bottom();
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) gear_spacer();
	//linear_extrude(height = frame_thickness, center = true, convexity = 10) heater_rim();
	//y_large_gear();
	//y_small_gear();
}	

/*

linear_extrude(height = frame_thickness, center = true, convexity = 10) frame();
translate([0,0,frame_gap+frame_thickness]) linear_extrude(height = frame_thickness, center = true, convexity = 10) frame_back();
translate([z_left_vertical_offset+spacer_lenght/2,printing_height+bottom_height+top_height+bed_carrige_tickness-z_top-spacer_height/2,frame_gap+frame_thickness/2]) rotate([-90,90,0]) z_axes("top",detail);
translate([z_left_vertical_offset+spacer_lenght/2,z_bottom-z_top+20+spacer_height/2,frame_thickness/2]) rotate([90,-90,0]) z_axes("bottom_rod",detail);
//rod	
#translate([60.5,41,40]) rotate([-90,90,0]) cylinder(h = 470, r=m10,  center = false, $fs=detail);
translate([z_left_vertical_offset+spacer_lenght/2+z_rod_block_width/2-0.5,z_bottom-z_top+20+spacer_height/2+300,frame_thickness/2+main_height-z_rod_block_width/2+frame_gap/2-1]) rotate([90,90,0]) x_axis("idler");

#translate([20,22,z_rod_block_width/2-2]) rotate([0,0,90]) import("./Assembly/libs/nema17.stl");
#translate([20,71,40]) rotate([-90,90,0]) cylinder(h = 430, r=m5,  center = false, $fs=detail);


linear_extrude(height = frame_thickness, center = true, convexity = 10)	{
	if(show_bed_top) {
		disc_top();
	}
	if(show_bed_bottom) {
		disc_bottom();
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
*/