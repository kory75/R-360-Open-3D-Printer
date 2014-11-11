//X axis 

//Public settings 
z_rod_with_gap = z_rod+3;
	//m5 for 5mm threaded rod, m16 for screw
z_linear_bearing_bolt = m4;
z_linear_bearing_bolt_distance = 14.5;

//x_rod_vertical_offset=3;
x_rod_horizontal_offset=3 ;
	// m4 90mm - 12 mm (2x frame) -4mm bolt - 6mm gap
main_width_max = 90- 12 -4 - 6;
main_lenght = 15;
main_height = x_rod_distance + x_rod + (x_rod_vertical_offset *2);
	
z_rod_block_width = nema17_width;
z_rod_block_lenght = 30;
z_rod_block_thickness = 6;

motor_holder_horizontal_offset = x_rod_vertical_offset*2 + x_rod*2 ;

rod_thread_gap = 32.5; //TODO Nema width/2 + Spacer Width +  Z rod Width/2
thread_hole= m5+1;

//nema
nema_gap = 5;

module x_axis(show){
	
	//main body
	difference(){
		cube([(z_rod_block_width+(main_width_max-z_rod_block_width)/2),main_lenght,main_height], center=false);
	
		//lighter bottom
		translate([0,8,0]){
			rotate([90,0,0]){
				linear_extrude(height = main_lenght+2, center = true, convexity = 10)	{
					polygon(points=[[(main_width_max-z_rod_block_width)/2,-1],[main_width_max-(main_width_max-z_rod_block_width)/2,main_height/2-z_rod_block_thickness/2],[main_width_max,-1]], paths=[[0,1,2]]);
				}
			}
		}
		//lighter top
		translate([0,8,0]){
			rotate([90,0,0]){
				linear_extrude(height = main_lenght+2, center = true, convexity = 10)	{
					polygon(points=[[(main_width_max-z_rod_block_width)/2,main_height+1],[main_width_max-(main_width_max-z_rod_block_width)/2,main_height/2+z_rod_block_thickness/2],[main_width_max,main_height+1]], paths=[[0,1,2]]);
				}
			}
		}
		//x rod holes
		translate([x_rod+x_rod_horizontal_offset,main_lenght+1,x_rod+x_rod_vertical_offset]){
			rotate([90,0,0]){
				cylinder(h = main_lenght+2, r=x_rod,  center = false, $fs=detail);
			}
		}
		translate([x_rod+x_rod_horizontal_offset,main_lenght+1,main_height-x_rod-x_rod_vertical_offset]){
			rotate([90,0,0]){
				cylinder(h = main_lenght+2, r=x_rod,  center = false, $fs=detail);
			}
		}
	}
	//z rod
	translate([main_width_max/2-z_rod_block_width/2,-main_lenght-z_rod_block_lenght/2-rod_thread_gap,main_height/2-z_rod_block_thickness/2]){
		difference(){
			cube([z_rod_block_width,z_rod_block_lenght+rod_thread_gap,z_rod_block_thickness], center=false);
			translate([z_rod_block_width/2,z_rod_block_lenght/2+rod_thread_gap,-1]){
				cylinder(h = z_rod_block_lenght+2, r=z_rod_with_gap,  center = false, $fs=detail);
				translate([z_linear_bearing_bolt_distance,0,0]){
					cylinder(h = z_rod_block_lenght+2, r=z_linear_bearing_bolt,  center = false, $fs=detail);
				}
				translate([-z_linear_bearing_bolt_distance,0,0]){
					cylinder(h = z_rod_block_lenght+2, r=z_linear_bearing_bolt,  center = false, $fs=detail);
				}
				//thread hole
				translate([0,-rod_thread_gap-z_rod_with_gap,0]){
					cylinder(h = z_rod_block_lenght+2, r=thread_hole,  center = false, $fs=detail);
				}
				
			}
		}
	}
	if(show=="motor"){
	//x motor
	difference(){
		translate([motor_holder_horizontal_offset,motor_holder_lenght,motor_holder_width+(main_height-motor_holder_width)/2]){
			rotate([0,90,0]){
				cube([motor_holder_width,motor_holder_lenght,motor_holder_thickness], center=false);		
			}	
		}
		translate([motor_holder_horizontal_offset+(motor_holder_thickness)/2,main_lenght+nema_middle+nema_bolt_size+nema_gap,main_height/2]){
			rotate([0,90,0]){
				linear_extrude(height = motor_holder_thickness+2, center = true, convexity = 10)	{
					Nema_mount();	
				}
			}
		}
	}

	}
	//x idler
	if(show=="idler"){
		//TODO
	}
}




