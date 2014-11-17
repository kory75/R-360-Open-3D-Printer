//Renderer
echo("Loading Renderer");
//include libs
include <../libs/shapes.scad>
include <../libs/motor_mount.scad>
include <../libs/spacer.scad>
//include <../../../MCAD-master/involute_gears.scad>;

//include parts

//include <../Parts/bed.scad>
include <../Parts/Z-axis.scad>
//include <../Parts/X-axis.scad>
include <../Parts/Y-axis.scad>
include <../Parts/frame.scad>

//include Layouts
include <./individual.scad>
include <./production.scad>
//include <./assembler.scad>

if (Layout == individual){
	individual();
}

if (Layout == assembly){
	assembly();
}

if (Layout == production){
	production();
}