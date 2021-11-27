transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/MyProjects/AsteroidGame {C:/MyProjects/AsteroidGame/HorizentalVerticalControl.v}
vlog -vlog01compat -work work +incdir+C:/MyProjects/AsteroidGame {C:/MyProjects/AsteroidGame/VGAControl.v}
vlog -vlog01compat -work work +incdir+C:/MyProjects/AsteroidGame {C:/MyProjects/AsteroidGame/ClockDivider.v}
vlog -vlog01compat -work work +incdir+C:/MyProjects/AsteroidGame {C:/MyProjects/AsteroidGame/DrawPlanet.v}
vlog -vlog01compat -work work +incdir+C:/MyProjects/AsteroidGame {C:/MyProjects/AsteroidGame/DrawDefense.v}

