# AsteroidGame
 Classic asteroid game with slight modifications in game mechanics. Created using a DE-10 Lite FPGA Board, VGA, a 640 by 480 monitor and Verilog.
 
 Played using 5 switches on the DE-10 Lite board, where turning on a switch destroys an asteriod that collides with the corresponding defense system, trying to prevent the planet's health from reaching 0.

# Modules
**VGAControl.v** - The main module for running the game

**ClockDivider.v** - The main **clock divider** module for the project

**ClockDividerSixty.v** - A 60Hz **clock divider** module

**DesClockDivider.v** - **Clock divider** used for the destruction of asteroides in the game

**DrawDefense.v** - Module for drawing the defense systems of the game

**DrawPlanet.v** - Module for drawing the planet part of the game

**HorizentalVerticalControl.v** - Module to itereate through every pixel

**destroyAnimation.v** - Module for drawing the in-game destruction animation

**displayL.v** - For displaying the loser screen in the game

**healthSetter.v** - Module for setting the health score

**scoreSet.v** - Module for setting the player's score

**movingSquare.v** - Module for displaying the moving asteriods through the VGA

**segmentDisplay.v** - Module for displaying to the 7 segment displays on the DE-10 Lite FPGA Board

# Resources
 How to draw 2D shapes and creating animations on the display (Warning: Uses SystemVerilog): https://projectf.io/posts/fpga-graphics/
 
 How to use the display with the de-10 lite board: https://www.ece.ucdavis.edu/~bbaas/180/tutorials/vga/
 
 Drawing Lines with SystemVerilog Prof. Stephen A. Edwards Columbia University Spring 2015: http://www.cs.columbia.edu/~sedwards/classes/2015/4840/lines.pdf
 
 Image Generator for DE10-Lite FPGA Evaluation Board: https://www.youtube.com/watch?v=qw2aAbzBLH4
 
 VGA image driver (make a face) on an Intel FPGA: https://www.youtube.com/watch?v=mR-eo7a4n5Q&list=LL&index=1&t=2s
 
 How to Create VGA Controller in Verilog on FPGA?: https://www.youtube.com/watch?v=4enWoVHCykI&list=LL&index=2&t=5s
 
 VGA driver for FPGA in VHDL: https://www.youtube.com/watch?v=eJMYVLPX0no&t=861s
 
 Nandland Go Board Project 9 - Introduction to VGA: https://www.youtube.com/watch?v=7wjTJivsNMM&t=1123s
