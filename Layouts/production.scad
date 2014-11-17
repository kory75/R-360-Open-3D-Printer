//Render Parts for production
//Render all 3D printed of lasercut
echo("Loading Layout - Production");

module production(){

	if(production_method == 3d_printed){
		translate([0,0,0]) y_base();
		translate([100,0,0]) z_axes("top",detail);
		translate([200,0,0]) z_axes("top",detail);
		translate([100,20,0]) z_axes("bottom",detail);
		translate([200,20,0]) z_axes("bottom",detail);
		translate([100,60,0]) z_axes("bottom_rod",detail);
		translate([200,60,0]) z_axes("bottom_rod",detail);
		//translate([-100,0,0]) x_axis("motor");
		//translate([-100,100,0]) x_axis("idler");
	}

	if(production_method == lasercut){
		frame();
		frame_back();
		disc_top();
		disc_bottom();
		gear_spacer();
		heater_rim();
		projection() y_large_gear();
		projection() y_small_gear();
	}
}	

