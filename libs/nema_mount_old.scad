//Motors lib
m3=1.5;
m4=2;

echo ("Loading Motors Lib....");
//Deatils of the Motors [Nema 14, Nema 17, Nema 23]
//half of the distance of the bolts from each other
nema_bolt_offset = [13,15.5,23.57];
//The bolt used to secure the motor
nema_bolt_size = [m3+01,m3+0.1,m4+0.1];
//Circural eleavation around the shaft on the top of the motor
nema_middle = [12,17,19.5];
//width of the motor 
nema_width = [35.5,42,56.4];
//lenght of the motor. This value may need to get adjusted as it depends of many factors like brand and strenght
nema_lenght = [28,45,56];
//shaft of the motor 
nema_shaft = [5,5,6.35];

//Ofseting the motor holes away of the edge of the motors to give a small gap.
motor_edge_gap=-2;
motor_holder_thickness = 6; //TODO move this to Printer.scad


module nema_mount(axe){
	difference(){
		cube([nema_width[axe],nema_bolt_offset[axe]+motor_edge_gap,motor_holder_thickness],center=false);
		translate([nema_width[axe]/2,nema_width[axe]/2-motor_edge_gap,motor_holder_thickness/2]){
			linear_extrude(height = motor_holder_thickness+2, center = true, convexity = 10)	{
				nema_mount_holes(axe);	
			}
		}
	}
}

//Axes can be [X,Y,Z,E] 
module nema_mount_holes(axe){
	union(){ 
		translate([nema_bolt_offset[axe],nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe]);
				}
		translate([-nema_bolt_offset[axe],nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe]);
				}
		translate([nema_bolt_offset[axe],-nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe]);
				}
		translate([-nema_bolt_offset[axe],-nema_bolt_offset[axe],0]){
					circle(nema_bolt_size[axe]);
				}
		circle(nema_middle[axe]);
		
	}
}

nema_mount(1);	

