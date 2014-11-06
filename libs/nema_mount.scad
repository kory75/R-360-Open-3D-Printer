motor_holder_width = nema_width;
motor_holder_lenght = nema_bolt_offset - 2.5; //TODO Check if this valid with other motor sizes
motor_holder_thickness = 6; //TODO move this to Printer.scad
motor_holder_gap = 3; //TODO move this to Printer.scad

module nema_mount(){
	difference(){
		cube([motor_holder_width,motor_holder_lenght,motor_holder_thickness],center=false);
		translate([motor_holder_width/2,motor_holder_width/2+motor_holder_gap,motor_holder_thickness/2]){
			linear_extrude(height = motor_holder_thickness+2, center = true, convexity = 10)	{
				nema_mount_holes();	
			}
		}
	}
}


module nema_mount_holes(){
	union(){ 
	translate([nema_bolt_offset,nema_bolt_offset,0]){
				circle(nema_bolt_size);
			}
	translate([-nema_bolt_offset,nema_bolt_offset,0]){
				circle(nema_bolt_size);
			}
	translate([nema_bolt_offset,-nema_bolt_offset,0]){
				circle(nema_bolt_size);
			}
	translate([-nema_bolt_offset,-nema_bolt_offset,0]){
				circle(nema_bolt_size);
			}
	circle(nema_middle);
	}
}