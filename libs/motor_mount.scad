//Motors lib 
echo ("Loading Lib - Motor Mount");
//Deatils of the Motors [Nema 14, Nema 17, Nema 23]
//half of the distance of the bolts from each other
nema_bolt_offset = [13,15.5,23.57];
//The bolt used to secure the motor
nema_bolt_size = [m3*hole_adjustment,m3*hole_adjustment,m4*hole_adjustment];
//Circural eleavation around the shaft on the top of the motor
nema_middle = [12,17,19.5];
//width of the motor 
nema_width = [35.5,42,56.4];
//lenght of the motor. This value may need to get adjusted as it depends of many factors like brand and strenght
nema_lenght = [28,45,56];
//shaft of the motor 
nema_shaft = [5,5,6.35];

//Offseting the motor to give a small gap for easy mounting
motor_edge_gap=2; 

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

