//Renderer
echo("Loading Renderer");
//include libs
include <../libs/shapes.scad>
include <../libs/motor_mount.scad>
include <../libs/bearing.scad>
include <../libs/spacer.scad>
include <../../MCAD-master/involute_gears.scad>;

//include parts

//include <../Parts/bed.scad>
include <../Parts/Z-axis.scad>
include <../Parts/X-axis_leadscrew.scad>
//No belt driven system planed for version 1.0
//include <../Parts/X-axis_belt.scad>
include <../Parts/Y-axis.scad>
include <../Parts/frame.scad>
include <../Parts/bed.scad>

//include Layouts
include <./individual.scad>
include <./production.scad>
include <./assembler.scad>

if (Layout == individual){
	individual();
}

if (Layout == assembly){
	assembly();
}

if (Layout == production){
	production();
}

