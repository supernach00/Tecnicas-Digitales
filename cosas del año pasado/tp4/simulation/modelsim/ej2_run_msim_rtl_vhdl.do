transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/nacho/OneDrive/Escritorio/tecnicas digitais/tp4/ffjk.vhd}
vcom -93 -work work {C:/Users/nacho/OneDrive/Escritorio/tecnicas digitais/tp4/ej2.vhd}

