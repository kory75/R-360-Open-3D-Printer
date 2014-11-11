//Y Axes

slip_ring_width=56;
slip_ring_height= 29.6;
slip_ring_outer = slip_ring_width + 10;
slip_ring_holder_height = 15;
slip_ring_fix_bolt_distance = 32.5;//TODO add
slip_ring_fix_bolt = m6;//TODO add
slip_ring_fix_height = 10;
slip_ring_fix_a = slip_ring_fix_bolt_distance - slip_ring_fix_bolt * 3;
slip_ring_fix_b = sqrt(pow(slip_ring_fix_bolt_distance,2) - pow(slip_ring_fix_a,2));

echo(slip_ring_fix_a);
echo(slip_ring_fix_b);
//todo Y base should be larger than slipring //all heights need cleared up add gaps
slipring_bearing_gap = 10; //TODO use this

y_bearing_width = 30;
y_bearing_outer = y_bearing_width+4;
y_bearing_height = 8;
y_bearing_rim_width = y_bearing_width - 4;
y_bearing_rim_height = 2;

slipring_outer = slip_ring_width + 4;

bearing_outer = 4;

module y_base(){
	union(){
	//body
	spacer();
	translate([0,0,slip_ring_height+slipring_bearing_gap]){
		spacer();
	}
	translate([0,0,spacer_height]){
		cube([spacer_width,spacer_lenght,slip_ring_height+slipring_bearing_gap-spacer_height+1]);
	}
	difference(){
	//slip ring holder
		translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,slip_ring_height+spacer_height+slipring_bearing_gap-slip_ring_holder_height]){
			difference(){
				cylinder(h = slip_ring_holder_height, r=slip_ring_outer/2,  center = false, $fs=detail);
				cylinder(h = slip_ring_holder_height+2, r=slip_ring_width/2+1,  center = false, $fs=detail);
			}
		}
		translate([0,0,slip_ring_height+slipring_bearing_gap]){
			cube([spacer_width,spacer_lenght,spacer_height]);
		}
	}
	
	//bearing holder
	difference(){
		union(){
			translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,0]){
				cylinder(h = y_bearing_height+y_bearing_rim_height, r=y_bearing_outer/2,  center = false, $fs=detail);
			}
			translate([spacer_width/2-y_bearing_outer/2,spacer_lenght,0]){
				cube([y_bearing_outer,slip_ring_width/2+1,y_bearing_height+y_bearing_rim_height]);
			}
			translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,0]){
				cylinder(h = y_bearing_height, r=y_bearing_outer/2,  center = false, $fs=detail);
			}
			//rim
			translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,0]){
				cylinder(h = y_bearing_rim_height, r=y_bearing_width/2,  center = false, $fs=detail);
			}
		}
		translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,y_bearing_rim_height]){
			cylinder(h = y_bearing_height+2, r=y_bearing_width/2,  center = false, $fs=detail);
		}
		translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,0]){
			cylinder(h = y_bearing_height+2, r=y_bearing_rim_width/2,  center = false, $fs=detail);
		}
	}
	//nema mount
	translate([spacer_width/2-nema_width/2,1,slip_ring_height+slipring_bearing_gap+spacer_height]){
		rotate([180,0,0]){
			nema_mount();
		}
	}
	//slipring fix
	translate([spacer_width/2+slip_ring_fix_a,slip_ring_width/2+1+spacer_lenght-slip_ring_fix_b,slip_ring_height+spacer_height+slipring_bearing_gap-slip_ring_height-slip_ring_fix_height]){
		difference(){
			translate([-slip_ring_fix_bolt * 3,-slip_ring_fix_bolt * 3-1,0]){
				cube([slip_ring_fix_bolt * 6,slip_ring_fix_bolt * 6+1,slip_ring_fix_height]);
			}
			cylinder(h = slip_ring_fix_height, r=slip_ring_fix_bolt,  center = false, $fs=detail);
		}
	}
	}
	#slipring();
}

module slipring(){
	translate([spacer_width/2,slip_ring_width/2+1+spacer_lenght,slipring_bearing_gap*2+y_bearing_rim_height]){
	difference(){
	union(){
		translate([0,0,slip_ring_height]){
			cylinder(h = 5.7, r=15,  center = false, $fs=detail);
		}
		cylinder(h = slip_ring_height, r=slip_ring_width/2,  center = false, $fs=detail);
		translate([0,0,-3]){
			cylinder(h = 3, r=15,  center = false, $fs=detail);
		}
	}
	translate([0,0,-4]){
		cylinder(h = 5.7+slip_ring_height+3+2, r=6,  center = false, $fs=detail);
	}
	}
	
	}
}

