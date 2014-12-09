//Settings and 
echo ("Loading Settings");
//Protected variables
//
//You can add your own uniqe settings to the end of the file (imerial bolts, motor bearring sizes, etc..)
//

detail = 200;
$fn = detail;

//motor types
nema_14 = 0;
nema_17 = 1;
nema_23 = 2;

//rods and bolts can be too tight on some 3d printers. This setting we can adjust hole sizes. default is 110% (1.1)
hole_adjustment = 1.1;

//bolts and rods
m3 = 1.5;
m4 = 2;
m5 = 2.5;
m6 = 3;
m8 = 4;
m10 = 5;
m12 = 6;
m16 = 8;
m20 = 10;

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

//Details of bearings [608,61801_2RS,LM6UU,LM8UU,LM10UU,LM12UU,SC8UU,SC10UU,SC12UU]
bearring_608 = 0; 
bearring_61801_2RS = 1;
bearring_LM6UU = 2;
bearring_LM8UU = 3;
bearring_LM10UU = 4;
bearring_LM12UU = 5;
bearring_SC8UU = 6;
bearring_SC10UU = 7;
bearring_SC12UU = 8;
//bearring_LUHR12_SKF = 9;

//bearing outside diameter
bearing_width = [22,21,12,15,19,21,0,0,0];
//bearing height (tickhness)
bearing_lenght = [7,5,19,24,29,30,30,35,36];
//bearing inside diameter
bearing_hole = [m8,m12,m6,m8,m10,m12,m8,m10,m12];
//
//Flanged bearings currently not used
//bearing_flang = [0,0,0,0,0,0];
//bearing_flang_bolt_size = [0,0,0,0,0,0];
//bearing_flang_bolt_offset = [0,0,0,0,0,0];

//Block bearings SC..UU
//bearing block sizes
//90degree of the rod (side to side) 
bearing_block_width = [0,0,0,0,0,0,34,40,42];
// (front to back direction of the rod)
//----bearing_block_lenght is bearing_lenght
//90degree of the rod (up to down bolt hole direction)
bearing_block_height = [0,0,0,0,0,0,22,26,28];
//bearing_block_side_height = [0,0,0,0,0,0,18,21,24];
//Bolt size
bearing_block_bolt_size = [0,0,0,0,0,0,m4,m5,m5];
bearing_block_bolt_lenght = [0,0,0,0,0,0,8,12,12];
//position of bolts
bearing_block_bolt_width_offset = [0,0,0,0,0,0,24,28,30.5];
bearing_block_bolt_lenght_offset = [0,0,0,0,0,0,18,21,26];

//Following settings are needed for rendering the parts, pro users only!

//Printer types 

//Rotating disk based printer
polar_printer = 0;

//Cartesian coordinates based printer
cartesian_printer = 1;

//Exchangable y axes supports both polar or cartesian coordinates
dual_printer = 2;

//delta coordinates based printer
delta_printer = 3;

//Mixed printer delta for X Z and polar Y
polar_delta = 4;

//layout types
individual = 0;
production = 1;
assembly = 2;
 
//axes
x_axe = 0;
y_axe = 1;
z_axe = 2;
e_axe = 3;

//Production methods
3d_printed = 0;
lasercut = 1;

//End of pro section! ;)

//+++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++               ++++++++++++++++++
//++++++++++++ User Settings ++++++++++++++++++
//++++++++++++               ++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++
//
//You can add your own uniqe settings (imerial bolts, motor bearring sizes)
//


