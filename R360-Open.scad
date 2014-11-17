//Publised settings
echo("R-360 Open Preset");
include <./settings.scad>

//Publised Variables
//Please change these variables to set up your printer

//Bolt and rod sizes are Supported:
//m3, m4, m5 , m6, m8, m10, m12, m16
//Suported motors 
//[nema_17,nema_14,nema_23]

//Frame Thickness Acrilic or wood 6mm Aluminum 4-5mm it depends on the size of the printer
//Using m5 90 mm bolts - 6 mm - 6mm frame front, back - 4mm for nuts 
frame_thickness = 6;
frame_nut_thickness = 4;
frame_bolt_lenght = 90;
frame_bolt = m5;
frame_gap = frame_bolt_lenght - (frame_thickness*2) - frame_nut_thickness; //TODO private settings move this to rendered as this should not be changed

//Minimum distance of holes from the outer edge of the frame 
frame_edge_width = 10;

//Printing Dimensions 
//This preset meant to use between 200mm to 500mm  Please check out other presets for larger or smaller printers R-360-Max, R-360-Mini
printing_height = 400; //mm
printing_width = 300; //mm

//Heated bed heater (MK2a, MK3) size and shape
bed_heater_shape = "round"; //TODO (rename bed_heater_shape)
heater_width = 214; 

//Modifier for printing height. How much of the extruder hungs under the x carriage?
extruder_carriage_deference = 15;

//Rods  (supports m3, m4, m5 , m6, m8, m10, m12, m16 sizes)
y_shaft = m12;
z_rod = m10;
z_axe = m5;
x_rod = m8;

//rods and bolts can be too tight on some 3d printers. This setting we can adjust hole sizes. default is 110% (1.1)
hole_adjustment = 1.1;

// Z axes
z_nut_size = 10; 

// X axes
//Distance beetwen x rods (prusa 3 compatibility)
x_rod_distance = 46;
x_rod_vertical_offset = 3;//(TODO) this should be in the X-axis.scad but then it breaks... possible variable duplication

//Suported motors 
//[nema_14,nema_17,nema_23]
//Motors [X,Y,Z,E] 
motors = [nema_17,nema_23,nema_17,nema_17];
motor_holder_thickness = 6;

//slip ring
// diameter
slip_ring_width=56;
//height
slip_ring_height= 29.6;
//gap between slipring and bearing
slip_ring_gap = 10;

//slip ring rim height
slip_ring_holder_height = 15; 

//Y bearing
y_bearing_width = 30; 
y_bearing_height = 8;
//thicknes of rim around Y bering
y_bearing_outer = 4;

//Slip ring not rotating part needs to bolted down
slip_ring_fix_bolt_distance = 32.5;
slip_ring_fix_bolt = m6;
slip_ring_fix_height = 10;

y_bearing_rim_height = 2; //TODO use this at frame too

//Y butom nylock nut
y_nut_height = 8;

//How to render parts [individual,production,assembly]
Layout = individual;

//production layout method [3d_printed,lasercut]
production_method = 3d_printed;

//Display options - Which Parts should be rendered? (individual and production only)
show_frame_front = 1;
show_frame_back = 0;
show_bed_top = 0;
show_bed_bottom = 0;

show_heater_rim = 0;
show_gear_spacer = 0;

show_large_y_gears = 0;
show_small_y_gears = 0;

show_z_axis_top = 0;
show_z_axis_bottom = 0;
show_z_axis_bottom_rod = 0;

show_x_motor = 0;
show_x_idler = 0;

show_y_base = 0;

//Render
include <./Layouts/renderer.scad>


