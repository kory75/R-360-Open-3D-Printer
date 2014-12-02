//Render Parts for production
//Render all 3D printed of lasercut
echo("Loading Layout - Assembler");

function bed_center() = frame_width()/2-right_width-bed_vertical_gaps-printing_width/2;

module assembly(){
	//z top left
	translate([-frame_width()/2+z_hole_offset,0,frame_height()/2-legs_height/2-z_hole_top]) rotate([0,0,90]) z_axes("top",detail);

	translate([frame_width()/2-z_hole_offset,0,frame_height()/2-legs_height/2-z_hole_top]) rotate([0,0,-90]) z_axes("top",detail);

	translate([-frame_width()/2+z_hole_offset,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,90]) z_axes("bottom_rod",detail);

	translate([frame_width()/2-z_hole_offset,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,-90]) z_axes("bottom_rod",detail);


	translate([frame_width()/2-z_hole_offset_outer,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,90]) z_axes("bottom",detail);

	translate([-frame_width()/2+z_hole_offset_outer,0,-frame_height()/2+legs_height/2+z_hole_bottom]) rotate([0,180,-90]) z_axes("bottom",detail);
	

	//z-rod left
	translate([frame_width()/2-z_hole_offset-spacer_lenght/2-z_rod,0,frame_height()/2-legs_height/2-z_hole_top-z_rod_lenght()/2+spacer_lenght/2]) rotate([0,0,0]) cylinder(h = z_rod_lenght(), r=z_rod,  center = true, $fs=detail);

	//z-rod right
	translate([-frame_width()/2+z_hole_offset+spacer_lenght/2+z_rod,0,frame_height()/2-legs_height/2-z_hole_top-z_rod_lenght()/2+spacer_lenght/2]) rotate([0,0,0]) cylinder(h = z_rod_lenght(), r=z_rod,  center = true, $fs=detail);

	//y base
	translate([bed_center()+slip_ring_width/2+spacer_lenght/2,0,-frame_height()/2+legs_height+bottom_height-y_height()]) rotate([0,0,90]) y_base();

	//bed
	#translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*6]) linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_top();

	translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*5]) linear_extrude(height = frame_thickness, center = true, convexity = 10) heater_rim();	

	translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*4]) linear_extrude(height = frame_thickness, center = true, convexity = 10) disc_bottom();

	translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness/2+frame_thickness*3]) linear_extrude(height = frame_thickness, center = true, convexity = 10) gear_spacer();
	
	translate([bed_center(),0,-frame_height()/2+legs_height/2+bottom_height-frame_thickness+frame_thickness*2]) y_large_gear();

	translate([-frame_width()/2+z_hole_offset+spacer_lenght/2+z_rod+x_block_bearing_thickness/2+bearing_block_height[z_bearing]/2,0,0]) rotate([0,90,180]) x_axis_leadscrew("motor");

	//translate([-100,100,0]) x_axis("idler");
	translate([0,frame_gap/2+frame_thickness/2,0]) rotate([90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10) frame();
	translate([0,-frame_gap/2-frame_thickness/2,0]) rotate([90,0,0]) linear_extrude(height = frame_thickness, center = true, convexity = 10) frame_back();
	
}	