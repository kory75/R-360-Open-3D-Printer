//X axis (Leadscrew)
echo("Part - X-axes Leadscrew");
x_rod_mount_width = 30;
x_rod_mount_lenght = 30;
x_rod_mount_thickness = 10;


module x_axis_leadscrew(show){
	if(show=="motor"){
		//motor mount
		translate([0,-motor_holder_lenght(motors[x_axe],1)/2,-motor_holder_lenght(motors[x_axe],1)/2]) rotate([0,90,0]) {
			motor_mount(motors[x_axe],1);
		}
		//x_rod
		translate([0,0,x_rod_mount_width/2]) rotate([0,90,0]) {
			difference(){
				cube([x_rod_mount_width,x_rod_mount_width,x_rod_mount_thickness], center=true);
				cylinder(h=x_rod_mount_thickness+0.1,r=z_rod+0.2,center=true);
			}
		}
		translate([-40,frame_gap/2-20-3,0]) cube([80,40,10],center=true);

		//z_rod

		//z_nut
		

		//sapce avaliable
		#cube([1,frame_gap,90],center = true);
	}
}




