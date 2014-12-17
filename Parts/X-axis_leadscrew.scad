//X axis (Leadscrew)
echo("Part - X-axes Leadscrew");
x_rod_mount_width = 30;
x_rod_mount_lenght = 50;
x_rod_mount_thickness = 10;
x_block_z_rod_thickness = 10;
x_block_bearing_thickness = 10;
z_block_lenght = 80;
z_block_width = 20;

echo("Required Minimum Frame Gap:",ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2)/10 )*10);
echo("Required Minimum Frame Bolt Lenght:",ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2+frame_thickness*2+frame_nut_thickness+2)/10 )*10);
if (ceil( (nema_width[motors[x_axe]]+bearing_block_width[z_bearing]+motor_edge_gap*2)/10 )*10 > frame_gap){
echo ("============================================");
echo ("=== WARNING! Frame bolt lenght is too small!");	
echo ("============================================");			
}

module x_axis_leadscrew(show){
	if(show=="motor"){
		//motor mount
		translate([-nema_width[motors[x_axe]]/2,bearing_block_width[z_bearing]/2,x_rod_mount_thickness/2-motor_holder_thickness/2]) rotate([180,0,180]) motor_mount(motors[x_axe],1);
	}	
	if(show=="idler"){

	}
		//x_rod 
		translate([bearing_lenght[z_bearing]/2+x_block_z_rod_thickness/4,nema_width[motors[x_axe]]/2+bearing_block_width[z_bearing]/2+motor_edge_gap,0]){
			difference(){
				cube([bearing_lenght[z_bearing]+x_block_z_rod_thickness/2,nema_width[motors[x_axe]]/2+bearing_block_width[z_bearing]/2+motor_edge_gap,x_rod_mount_thickness], center=true);
				cylinder(h=x_rod_mount_thickness+0.1,r=z_rod+0.2,center=true);
			}
		}

		//z_bearing (block bearing)
		if(bearing_block_width[z_bearing]>0){
		difference(){
			cube([bearing_lenght[z_bearing]*2+x_block_z_rod_thickness,bearing_block_width[z_bearing],x_block_bearing_thickness],center=true);
			translate([bearing_lenght[z_bearing]/2+x_block_z_rod_thickness/2,0,0]) block_bearing_holes(z_bearing,x_block_bearing_thickness+2);

			translate([-bearing_lenght[z_bearing]/2-x_block_z_rod_thickness/2,0,0]) block_bearing_holes(z_bearing,x_block_bearing_thickness+2);
		}
		//TODO  (flange bearing and simple lm..uu)		
		}

		difference(){
			//z_block
			translate([0,0,z_block_lenght/2]) cube([x_block_z_rod_thickness,z_block_width,z_block_lenght],center=true);

			//z_rod
			translate([0,0,bearing_block_height[z_bearing]/2+x_block_z_rod_thickness/2]) rotate([0,90,0]) cylinder(h=x_block_z_rod_thickness+2,r=z_rod+2,center=true);
			//z_nut
			translate([0,0,bearing_block_height[z_bearing]/2+x_block_z_rod_thickness/2+spacer_lenght+nema_width[z_axe]/2+motor_edge_gap]) rotate([0,90,0]) cylinder(h=x_block_z_rod_thickness+2,r=z_leadscrew+2,center=true);


		}	
	

	//vitamins		
		//#translate([-bearing_lenght[z_bearing]/2-x_block_z_rod_thickness/2,0,x_block_bearing_thickness/2+bearing_block_height[z_bearing]/2]) block_bearing(z_bearing);

		//sapce avaliable
		//#cube([frame_gap,frame_gap,1],center = true);
}




