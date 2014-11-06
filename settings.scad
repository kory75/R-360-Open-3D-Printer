//Settings and 

//Public variables
//You can change these values if you know what you are doing

detail = 200;
$fn = detail;

//motor types
nema_14 = 1;
nema_17 = 2;
nema_23 = 3;

//bolts and rods
m3 = 1.5;
m4 = 2;
m5 = 2.5;
m6 = 3;
m8 = 4;
m10 = 5;
m12 = 6;
m16 = 8;

//bolts and rod holes
/*
m3_hole = 1.6;
m4_hole = 2.1;
m5_hole = 2.65;
m8_hole = 4.1;
m10_hole = 5.2;
m12_hole = 6.2;
m16_hole = 8.15;
*/

//nema14

//nema17
nema17_bolt_offset = 15.5;
nema17_bolt_size = m3+0.1;
nema17_middle = 17; 
nema17_width = 42;
nema17_lenght = 45;
nema17_shaft = 5;
//nema23
nema24_bolt_offset = 23.57;
nema24_bolt_size = m4;
nema24_middle = 19.5; 
nema24_width = 56.4;
nema24_lenght = 56;
nema24_shaft = 6.35;

	
//TODO move to set motors

nema_bolt_offset = nema17_bolt_offset;
nema_bolt_size = nema17_bolt_size;
nema_middle = nema17_middle; 
nema_width = nema17_width;
nema_lenght = nema17_lenght;
nema_shaft = nema17_shaft;

//idea only
nema_17_data = [nema17_bolt_offset,nema17_bolt_offset,nema17_bolt_size,nema17_middle,nema17_width,nema17_lenght,nema17_shaft];


module Nema_mount(){
	
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

//TODO
module set_motors(X_type,Y_type,Z_type,E_type){
	 
	for(motor_type = [  X_type,Y_type,Z_type,E_type ])
	{
		//echo (motor_type);
   		if(motor_type == nema_17){ 
				
			//echo ();
			//TODO move to set motors
			//nema_bolt_offset = nema17_bolt_offset;
			//nema_bolt_size = nema17_bolt_size;
			//nema_middle = nema17_middle; 
			//nema_width = nema17_width;
			//nema_lenght = nema17_lenght;
			//nema_shaft = nema17_shaft;	

		}
		if(motor_type == nema_17){
		
		}
	}
}

echo ("settings_loaded");
 