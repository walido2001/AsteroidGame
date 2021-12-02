transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/HorizentalVerticalControl.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/VGAControl.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/ClockDivider.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/DrawPlanet.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/DrawDefense.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/ClockDividerSixty.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/movingSquare.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/destroyAnimation.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/DesClockDivider.v}
vlog -vlog01compat -work work +incdir+C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch {C:/Users/walid/Desktop/AsteroidGame-Faruq-s-Branch/AsteroidGame-Faruq-s-Branch/segmentDisplay.v}

