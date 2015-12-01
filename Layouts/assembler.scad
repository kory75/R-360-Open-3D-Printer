//Render Parts for production
//Render all 3D printed of lasercut
echo("Loading Layout - Assembler");

function bed_center() = frame_width()/2-right_width-bed_vertical_gaps-printing_width/2;

module assembly(){
	//z top left
	color([0.5,0,0]) translate([-frame_width()/2+z_hole_offset,0,frame_height()/2-legs_height/2-z_hole_top]) rotate([0,0,90]) z_axes("top",1);

	color([0.5,0,0]) translate([frame_width()/2-z_hole_offset,0,frame_height()/2-legs_height/2-z_hole_top]) rotate([0,0,-90]) z_axes("top",-1);

	color([0.5,0,0]) translate([-frame_width()/2+z_hole_offset,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,90]) z_axes("bottom_rod",-1);

	color([0.5,0,0]) translate([frame_width()/2-z_hole_offset,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,-90]) z_axes("bottom_rod",1);


	color([0.5,0,0]) translate([frame_width()/2-z_hole_offset_outer,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,90]) z_axes("bottom",-1);

	color([0.5,0,0]) translate([-frame_width()/2+z_hole_offset_outer,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,-90]) z_axes("bottom",1);
	

	//z-rod left
	color([0.8,0.8,0.8]) translate([frame_width()/2-z_hole_offset-spacer_lenght/2-z_rod,z_axes_offset(),frame_height()/2-legs_height/2-z_hole_top-z_rod_lenght()/2+spacer_lenght/2]) rotate([0,0,0]) cylinder(h = z_rod_lenght(), r=z_rod,  center = true, $fs=detail);

	//z-rod right
	color([0.8,0.8,0.8]) translate([-frame_width()/2+z_hole_offset+spacer_lenght/2+z_rod,z_axes_offset(),frame_height()/2-legs_height/2-z_hole_top-z_rod_lenght()/2+spacer_lenght/2]) rotate([0,0,0]) cylinder(h = z_rod_lenght(), r=z_rod,  center = true, $fs=detail);

    //z_lead_screw right
    color([0.8,0.8,0.8]) translate([-frame_width()/2+z_hole_offset+spacer_lenght/2+z_rod-nema_width[motors[z_axe]]/2,z_axes_offset(),frame_height()/2-legs_height/2-z_hole_top-z_rod_lenght()/2+spacer_lenght/2]) rotate([0,0,0]) 
    linear_extrude(height = z_lead_screw_lenght(), center = true, convexity = 10, twist = -10200, $fn=50) translate([1,0,0]) circle(r = z_rod)
    //cylinder(h = z_lead_screw_lenght(), r=z_rod,  center = true, $fs=detail);
    
    
	if(printer_setup == polar_printer || printer_setup == dual_printer){
	//y base
	color([0.5,0,0]) translate([bed_center()+slip_ring_width/2+spacer_lenght/2,0,-frame_height()/2+legs_height+bottom_height-y_height()]) rotate([0,0,90]) y_base();

	//polar bed
	color([1,1,1,0.5]) translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*6]) linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_top();

	color([0.8,0.8,0.8]) translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*5]) linear_extrude(height = frame_thickness, center = true, convexity = 10) heater_rim();	

	color([0.8,0.8,0.8]) translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*4]) linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_bottom();

	color([0.8,0.8,0.8]) translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*3]) linear_extrude(height = frame_thickness, center = true, convexity = 10) gear_spacer();
	
	color([0.8,0.8,0.8]) translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness+frame_thickness*2]) y_large_gear();

	}

	color([0.5,0,0]) translate([-frame_width()/2+z_hole_offset+spacer_lenght/2+z_rod+x_block_bearing_thickness/2+bearing_block_height[z_bearing]/2,z_axes_offset(),0]) rotate([0,90,180]) x_axis_leadscrew("motor");

	//translate([-100,100,0]) x_axis("idler");


	//FRAME
	color([0.8,0.8,0.8]) translate([0,frame_gap/2+frame_thickness/2,0]) rotate([90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10)  frame();
	color([0.8,0.8,0.8]) translate([0,-frame_gap/2-frame_thickness/2,0]) rotate([90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10) frame_back();
	
	if(printer_setup == cartesian_printer || printer_setup == dual_printer){

	#translate([printing_width/2+bed_vertical_gaps-frame_thickness/2+frame_offset/2,0,-frame_height()/2+bottom_height/2+legs_height/2]) rotate([90,0,90]) linear_extrude(height = frame_thickness, center = true, convexity = 10) y_cross_frame();
	
	#translate([-printing_width/2-bed_vertical_gaps+frame_thickness/2+frame_offset/2,0,-frame_height()/2+bottom_height/2+legs_height/2]) rotate([90,0,90]) linear_extrude(height = frame_thickness, center = true, convexity = 10) y_cross_frame();

	#translate([frame_offset/2,-y_cross_frame_width()/2+frame_thickness*3/2+y_cross_frame_motor_offset(),-frame_height()/2+bottom_height/2+legs_height/2]) rotate([-90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10) y_end_frame();

	#translate([frame_offset/2,y_cross_frame_width()/2-frame_thickness*3/2+y_cross_frame_motor_offset(),-frame_height()/2+bottom_height/2+legs_height/2]) rotate([-90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10) y_end_frame();

	}

}	