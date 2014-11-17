//Y Axes

//Private variables
//Slip ring top holder  
slip_ring_outer = slip_ring_width + 10; //TODO move this to presets and change to not calculated value


//slip ring lower fix point
slip_ring_fix_a = slip_ring_fix_bolt_distance - slip_ring_fix_bolt * 3;
slip_ring_fix_b = sqrt(pow(slip_ring_fix_bolt_distance,2) - pow(slip_ring_fix_a,2));

//lower bearing
y_bearing_outer = y_bearing_width+4;
y_bearing_rim_width = y_bearing_width - 4;

module y_base(){
	union(){
	//body
	spacer();
	translate([0,0,slip_ring_height+slip_ring_gap]){
		spacer();
	}
	translate([0,0,(slip_ring_height+slip_ring_gap)/2]){
		cube([spacer_width,spacer_lenght,slip_ring_height+slip_ring_gap-spacer_height+1], center =true);
	}
	difference(){
	//slip ring holder
		translate([0,slip_ring_width/2+spacer_lenght/2,slip_ring_height+slip_ring_gap-slip_ring_holder_height/2+spacer_lenght/2]){
			difference(){
				cylinder(h = slip_ring_holder_height, r=slip_ring_outer/2,  center = true, $fs=detail);
				cylinder(h = slip_ring_holder_height+2, r=slip_ring_width/2+1,  center = true, $fs=detail);
			}
		}
		translate([0,0,slip_ring_height+slip_ring_gap]){
			cube([spacer_width,spacer_lenght,spacer_height],center = true);
		}
	}
	
	//bearing holder
	translate([0,slip_ring_width/2+1+spacer_lenght/2,-spacer_height/2+(y_bearing_height+y_bearing_rim_height)/2]){
	difference(){
		union(){
			
				cylinder(h = y_bearing_height+y_bearing_rim_height, r=y_bearing_outer/2,  center = true, $fs=detail);
			
			translate([0,-(slip_ring_width/2+1)/2,0]){
				cube([y_bearing_outer,slip_ring_width/2+1,y_bearing_height+y_bearing_rim_height], center = true);
			}
			
				cylinder(h = y_bearing_height, r=y_bearing_outer/2,  center = true, $fs=detail);
			
			//rim
			
				cylinder(h = y_bearing_rim_height, r=y_bearing_width/2,  center = true, $fs=detail);
			
		}
		translate([0,0,y_bearing_rim_height-1]){
			cylinder(h = y_bearing_height+2, r=y_bearing_width/2,  center = true, $fs=detail);
		}
		translate([0,0,-1]){
			cylinder(h = y_bearing_height+2, r=y_bearing_rim_width/2,  center = true, $fs=detail);
		}
	}
	}
	//nema mount
	echo(motor_holder_lenght(motors[y_axe])/2);
	translate([0,-motor_holder_lenght(motors[y_axe])/2-spacer_lenght/2+0.1,slip_ring_height+slip_ring_gap+spacer_height/2-motor_holder_thickness/2]){
		rotate([180,0,0]){
			motor_mount(motors[y_axe]);
		}
	}
	//slipring fix
	translate([slip_ring_fix_a,slip_ring_width/2+1+spacer_lenght/2-slip_ring_fix_b,slip_ring_height+slip_ring_gap-slip_ring_fix_height/2-slip_ring_height]){
		difference(){
			translate([-slip_ring_fix_bolt * 3,-slip_ring_fix_bolt * 3-1,0]){
				cube([slip_ring_fix_bolt * 6,slip_ring_fix_bolt * 6+1,slip_ring_fix_height]);
			}
			cylinder(h = slip_ring_fix_height, r=slip_ring_fix_bolt,  center = false, $fs=detail);
		}
	}
	}
	//#slipring();
}

module slipring(){
	translate([0,slip_ring_width/2+1+spacer_lenght/2,spacer_height*2+slip_ring_gap]){
	difference(){
	union(){
		translate([0,0,slip_ring_height/2+5.7/2]){
			cylinder(h = 5.7, r=15,  center = true, $fs=detail);
		}
		cylinder(h = slip_ring_height, r=slip_ring_width/2,  center = true, $fs=detail);
		translate([0,0,-3]){
			cylinder(h = 3, r=15,  center = true, $fs=detail);
		}
		translate([0,0,-30]){
			cylinder(h = y_bearing_height, r= y_bearing_width/2,  center = true, $fs=detail);
		}
	}
	translate([0,0,-4]){
		cylinder(h = slip_ring_height+slip_ring_gap+spacer_height*2, r=6,  center = true, $fs=detail);
	}
	}
	
	}
}