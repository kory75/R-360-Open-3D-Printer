R-360-Open-3D-Printer
=====================

2nd generation Open Source Polar Printer. 

This project is create a parameterised, extensible printer Framework.

You can set your printing area, motors, rods, etc...

The software will calculate the parts for to be 3d printed, lasercut also tells you the rods lengths needed etc...

##Framework

Created structure PLP(VL) Preset Layout Part (Vitamin Library).
Decoupling the files to keep a modular design.

Parts.scad files not contain local settings, all parts are calculated from global abstract parameters.

If you change a bolt, motor, bearing, used than all parts are recalculated.


1. Presets
  * R360-Open.scad
  * coming soon: R360-Open-Mini.scad, R360-Open-Max.scad  

   Only preset files should be run.  

   This file is the one which contain the main parameters for the printer.  
   This settings are publicised, they can be freely edited to fine tune your printer.  

2. Layout
  
  1. Renderer  

  Is a core file.  

  2. Individual

  This layout is for show parts individually, cantered on 0 coordinates.  

  3. Production

  This layout is for creating 3d printing or laser cutting compositions for production.  

  4. Assembly

  This layout is for visualise the printer. Which helps detect problems or helps decisions on hardware used.
  It also helps at building the printer, because it clearly shows how the parts fit together.

3. Parts
  
  This files are the individual parts of the printer.  

  * Part - Status

  * Frame - Alpha
  * Bed - Beta
  * X-axes - Alpha
  * Y-axes - Beta
  * Z-axes - Gold
  * Carriage - Alpha
  * Extruder - Planed

  * Filament Holder - Planed
  * Electronic board holder - Planed

4. Vitamins  
	
	Off the shelf parts for visualisation only.

5. Libs  
	
	Libraries sub parts and other libraries

6. Settings

	This file is contain general settings like bolt, rod or motor sizes.
	This file can be extended, but old values should not be altered.


##Software dependencies

The software is written in openSCAD. 

It requires the latest
MCAD/involute_gears.scad 

##Documentation

Under development!

##BOM

Under development!

##Developers

Kornel Farkas 

Email: admin@replicatorwarehouse.com 

Website: Replicatorwarehouse.com

##Licences

####R-360 Open Printer 

[R-360 Open is licenced under CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0/)