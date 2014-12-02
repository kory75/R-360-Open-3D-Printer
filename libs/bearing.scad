//Bearing
echo("loading Lib - Bearings");

module block_bearing(bearing_type){
	difference(){
		cube([bearing_lenght[bearing_type],bearing_block_width[bearing_type],bearing_block_height[bearing_type]],center=true);
		rotate([0,90,0]) cylinder(h = bearing_lenght[bearing_type]+2, r= bearing_hole[bearing_type], center=true);
		block_bearing_holes(bearing_type,bearing_block_height[bearing_type]+2);
	}
}

module block_bearing_holes(bearing_type,bolt_height){
	translate([bearing_block_bolt_lenght_offset[bearing_type]/2,bearing_block_bolt_width_offset[bearing_type]/2,0]) cylinder(h = bolt_height, r= bearing_block_bolt_size[bearing_type], center=true);
		translate([-bearing_block_bolt_lenght_offset[bearing_type]/2,bearing_block_bolt_width_offset[bearing_type]/2,0]) cylinder(h = bolt_height, r= bearing_block_bolt_size[bearing_type], center=true);
		translate([-bearing_block_bolt_lenght_offset[bearing_type]/2,-bearing_block_bolt_width_offset[bearing_type]/2,0]) cylinder(h = bolt_height, r= bearing_block_bolt_size[bearing_type], center=true);
		translate([bearing_block_bolt_lenght_offset[bearing_type]/2,-bearing_block_bolt_width_offset[bearing_type]/2,0]) cylinder(h = bolt_height, r= bearing_block_bolt_size[bearing_type], center=true);
}

module bearing(bearing_type){
	difference(){
		cylinder(h = bearing_lenght[bearing_type], r= bearing_width[bearing_type]/2, center=true);
		cylinder(h = bearing_lenght[bearing_type]+2, r= bearing_hole[bearing_type], center=true);
	}
}

//bearing(bearring_608);

//block_bearing(bearring_SC10UU);

//block_bearing_holes(bearring_SC10UU,12);