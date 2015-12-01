//X axis (Leadscrew)
echo("Part - X-axes Leadscrew");
x_rod_mount_base_width = 40;
x_rod_mount_base_lenght = 10;
x_rod_mount_base_height = 10;
x_rod_mount_width = 20;
x_rod_mount_lenght = x_rod_mount_base_lenght;
x_rod_mount_height = 50;
x_rod_mount_thickness = 6;
x_block_z_rod_thickness = 10;
x_block_bearing_thickness = 10;
z_block_lenght = 80;
z_block_width = 20;
//gap between motor and bearing
gap_around_motor = 2;

echo("Required Minimum Frame Gap:",ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2)/10 )*10);
echo("Required Minimum Frame Bolt Lenght:",ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2+frame_thickness*2+frame_nut_thickness+2)/10 )*10);
if (ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2)/10 )*10 > frame_gap){
echo ("================================================");
echo ("=== WARNING! Frame bolt lenght is too small! ===");	
echo ("================================================");			
}

x_axis_panel_width = nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+gap_around_motor;
x_axis_panel_lenght = max (bearing_lenght[z_bearing]*2+x_block_z_rod_thickness, nema_width[motors[x_axe]]/2 + x_rod_distance + x_rod + 2 );



module x_axis_leadscrew_panel(show){
	
	difference(){
	//base panel
		cube([x_axis_panel_width, x_axis_panel_lenght, x_rod_mount_thickness],center=true);
	
	if(show=="motor"){
		//motor mount
		#translate([x_axis_panel_width/2-nema_width[motors[x_axe]]/2,x_axis_panel_lenght/2-nema_width[motors[x_axe]]/2,x_rod_mount_thickness/2-motor_holder_thickness/2]) rotate([180,0,180]) 
			{
				linear_extrude(height = x_rod_mount_thickness+2, center = true, convexity = 10)	
				{
					motor_mount_holes(motors[x_axe],1);
				}
			}
	}	
	if(show=="idler"){

	}	
	
		//x_rod 
		translate([x_axis_panel_width/2-nema_width[motors[x_axe]]/2, x_axis_panel_lenght/2-nema_width[motors[x_axe]]/2-x_rod_distance, x_rod_mount_thickness/2-motor_holder_thickness/2]){
			difference(){
				#cylinder(h=x_rod_mount_thickness+0.1,r=z_rod+0.2,center=true);
			}
		}

		//z_bearing (block bearing)
		if(bearing_block_width[z_bearing]>0){
			#translate([-x_axis_panel_width/2+bearing_block_width[z_bearing]/2,bearing_lenght[z_bearing]/2+x_block_z_rod_thickness/2,0]) 
				rotate([0,0,90]) block_bearing_holes(z_bearing,x_block_bearing_thickness+2);

			#translate([-x_axis_panel_width/2+bearing_block_width[z_bearing]/2,-bearing_lenght[z_bearing]/2-x_block_z_rod_thickness/2,0]) 
				rotate([0,0,90]) block_bearing_holes(z_bearing,x_block_bearing_thickness+2);
		}

		//plate_block_bolts	
			
				
	}

	//BLOCK
	translate([0,0,x_rod_mount_thickness/2]){
		x_axis_leadscrew_block();
	}
	
	x_axis_leadscrew_vitamins();
}


module x_axis_leadscrew_block(){
	color([1,1,1]) difference(){
		union(){
			//base
			translate([0,0,x_rod_mount_base_height/2]){
				cube([x_rod_mount_base_width, x_rod_mount_base_lenght, x_rod_mount_base_height],center=true);
			}
			//neck
			translate([0,0,x_rod_mount_base_height+x_rod_mount_height/2]){
				cube([x_rod_mount_width, x_rod_mount_lenght, x_rod_mount_height],center=true);
			}
			//head
			translate([0,0,x_rod_mount_base_height+x_rod_mount_height/2+20]){
				rotate([90,0,0]) cylinder(h=x_block_z_rod_thickness,r=z_leadscrew+2+10,center=true);
			}
		}
	// holes
		//z_rod
		#translate([0,0,bearing_block_height[z_bearing]/2+x_block_z_rod_thickness/2]) rotate([90,0,0]) cylinder(h=x_block_z_rod_thickness+2,r=z_rod+2,center=true);
		//z_nut
		#translate([0,0,bearing_block_height[z_bearing]/2+x_block_z_rod_thickness/2+spacer_lenght+nema_width[z_axe]/2+motor_edge_gap]) rotate([90,0,0]) cylinder(h=x_block_z_rod_thickness+2,r=z_leadscrew+2,center=true);
		//nut_bolt_holes
		
		//plate_block_bolts
		
	}
}

module x_axis_leadscrew_vitamins(){
	
	if(show_vitamins){
		
		//vitamins		
		color([0.2,0.2,0.8]) translate([-bearing_lenght[z_bearing]/2-x_block_z_rod_thickness/2,0,x_block_bearing_thickness/2+bearing_block_height[z_bearing]/2]) rotate([0,0,90]) block_bearing(z_bearing);

		//sapce avaliable
		//#cube([frame_gap,frame_gap,1],center = true);
		
		color([0.2,0.2,0.8]) translate([-2.5,16,27])
			rotate([0,90,0])
				import("Vitamins/nema17.stl", convexity = 5);
	}
	
}
