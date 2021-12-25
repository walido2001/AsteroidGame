# AsteroidGame
 Classic asteroid game with slight modifications in game mechanics. Created using a DE-10 Lite FPGA Board and verilog. 

# Modules
VGAControl.v - The main module for running the game

ClockDivider.v - The main **clock divider** module for the project

ClockDividerSixty.v - A 60Hz **clock divider** module

DesClockDivider.v - **Clock divider** used for the destruction of asteroides in the game

DrawDefense.v - Module for drawing the defense part of the game

DrawPlanet.v - Module for drawing the planet part of the game

HorizentalVerticalControl.v - Module to itereate through every pixel on our screen

destroyAnimation.v - Module for drawing the in-game destruction animation

displayL.v - For displaying the loser screen in the game

healthSetter.v - Module for setting the health score

scoreSet.v - Module for setting the player's score

movingSquare.v - Module for displaying the moving asteriods through the VGA

segmentDisplay.v - Module for displaying to the 7 segment displays on the DE-10 Lite FPGA Board

# Useful Resources
 How to draw 2D shapes and creating animations on the display (Warning: Uses SystemVerilog): https://projectf.io/about/
 How to use the display with the de-10 lite board: https://www.ece.ucdavis.edu/~bbaas/180/tutorials/vga/
 
