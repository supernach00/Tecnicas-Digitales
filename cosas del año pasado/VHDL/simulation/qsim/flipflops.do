onerror {exit -code 1}
vlib work
vlog -work work flipflops.vo
vlog -work work Waveform8.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.nacho_vlg_vec_tst -voptargs="+acc"
vcd file -direction flipflops.msim.vcd
vcd add -internal nacho_vlg_vec_tst/*
vcd add -internal nacho_vlg_vec_tst/i1/*
run -all
quit -f
