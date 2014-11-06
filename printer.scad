//Publised settings
echo("R-360 Open - Part Renderer");
include <./settings.scad>
include <./libs/shapes.scad>
include <./libs/nema_mount.scad>

//Publised Variables
//Please change these variables to set up your printer

//Supports:
//Rods  (m3, m4, m5 , m6, m8, m10, m12, m16 sizes)
//Bolts (m3, m4, m5 , m6, m8, m10, m12, m16 sizes)
//Mototrs (nema_17 supported) , (nema_14 soon) , (nema_23 soon)

//Frame
frame_thickness = 6;
frame_nut_thickness = 4;

//using m5 90 mm bolts - 6 mm - 6mm frame front, back - 4mm for nuts 
frame_bolt_lenght = 90;
frame_gap = frame_bolt_lenght - (frame_thickness*2) - frame_nut_thickness;
frame_bolt = m5;

//Printing Dimensions
printing_height = 400; //450
printing_width = 300; //140

bed_shape = "square";
heater_width = 214; 

extruder_hang_out_height = 15; //(TODO) Modifier for printing height

//Rods  (supports m3, m4, m5 , m6, m8, m10, m12, m16 sizes)
y_shaft = m12;
z_rod = m10;
z_axe = m5;
x_rod = m8;

//rods and bolts can be too tight. this setting we can adjust hole size. default is 110% (1.1)
hole_adjustment = 1.1;

// Z axes
z_nut_size = 10; 

// X axes
//Distance beetwen x rods (prusa 3 compatibility)
x_rod_distance = 46;

x_rod_vertical_offset = 3;//(TODO) this should be in the X-axis.scad but then it breaks...

//Mototrs (nema_17 supported)  , (nema_23 not yet), (nema_14 not yet)
x_motor = nema_17;
y_motor = nema_17;
z_motor = nema_17;
e_motor = nema_17;

//Here you an select what parts to render
//Display options
show_frame_front = 0;
show_frame_back = 0;
show_bed_top = 0;
show_bed_bottom = 0;

show_heater_rim = 0;
show_gear_spacer = 0;

show_large_y_gears = 1;
show_small_y_gears = 0;

show_z_axis_top = 0;
show_z_axis_bottom = 0;
show_z_axis_bottom_rod = 0;

show_x_motor = 0;
show_x_idler = 0;

show_y_base = 0;

//Render
include <./renderer.scad>
//include <./assembler.scad>

render_parts();


