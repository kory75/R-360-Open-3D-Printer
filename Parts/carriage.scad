//x carriage
//Publised settings
include <./settings.scad>;

//Public settings 

x_rod_distance = 46;
x_rod = m8;
x_bushing_outer  = 11.2;
x_bushing_lenght  = 12.2;
x_bushing_border = 3;

x_bushing_gap = 10;

extruder_block_height = 10;
extruder_block_bolt = m3;
extruder_block_bolt_distance = 34;
extruder_block_vertical_offset = 20;

main_width_lower = x_bushing_lenght*2 + x_bushing_border*4 + x_bushing_gap; 
main_lenght_lower = x_bushing_outer + x_bushing_border*2;
main_height_lower = x_bushing_outer + x_bushing_border*2+extruder_block_height;

main_width_top = x_bushing_lenght + x_bushing_border*2;
main_lenght_top = main_lenght_lower; 
main_height_top = x_rod_distance + x_bushing_outer*2 + x_bushing_border *2 ;


main_bolt = m5;


module carriage(){
	difference(){
	union(){
		// lower
		cube([main_width_lower,main_lenght_lower,main_height_lower], center=false);
		// top
		translate([main_width_lower/2-main_width_top/2,0,0]){
			cube([main_width_top,main_lenght_top,main_height_top], center=false);
		}
	}	
	//lower hole
	translate([-1,main_lenght_top/2,x_bushing_outer/2+x_bushing_border]){
		rotate([0,90,0]){		
			cylinder(h = main_width_lower+2, r=x_bushing_outer/2,  center = false, $fs=detail);
		}
	}
	
	//top hole
	translate([main_width_lower/2-main_width_top/2-1,main_lenght_top/2,main_height_top-(x_bushing_outer/2+x_bushing_border)]){
		rotate([0,90,0]){		
			cylinder(h = main_width_top+2, r=x_bushing_outer/2,  center = false, $fs=detail);
		}
	}
	//extruder bolt holes
	translate([main_width_lower/2-extruder_block_bolt_distance/2,-1,extruder_block_vertical_offset]){
		rotate([-90,90,0]){
			cylinder(h = main_lenght_lower+2, r=extruder_block_bolt,  center = false, $fs=detail);
		}
	}
	translate([main_width_lower/2+extruder_block_bolt_distance/2,-1,extruder_block_vertical_offset]){
		rotate([-90,90,0]){
			cylinder(h = main_lenght_lower+2, r=extruder_block_bolt,  center = false, $fs=detail);
		}
	}
	}
}

carriage();