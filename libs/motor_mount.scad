//Motors lib 
echo ("Loading Lib - Motor Mount");


module motor_mount(axe,holder_size_precent= 0.25){
	difference(){
		translate([0,motor_holder_lenght(axe,holder_size_precent)/2,0]){
			cube([nema_width[axe],motor_holder_lenght(axe,holder_size_precent),motor_holder_thickness],center=true);
		}
		translate([0,nema_width[axe]/2+motor_edge_gap,0]){
			linear_extrude(height = motor_holder_thickness+2, center = true, convexity = 10)	{
				motor_mount_holes(axe);	
			}
		}
	}
}

//Axes can be [X,Y,Z,E] 
module motor_mount_holes(axe){
	union(){ 
		translate([nema_bolt_offset[axe],nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe],center = true);
				}
		translate([-nema_bolt_offset[axe],nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe],center = true);
				}
		translate([nema_bolt_offset[axe],-nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe],center = true);
				}
		translate([-nema_bolt_offset[axe],-nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe],center = true);
				}
		circle(nema_middle[axe],center=true);
		
	}
}	

function motor_holder_lenght(axe,holder_size_precent = 0.25) = nema_width[axe]*holder_size_precent+motor_edge_gap;

