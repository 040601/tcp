onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fifo5 -L xil_defaultlib -L xpm -L fifo_generator_v13_2_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fifo5 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fifo5.udo}

run -all

endsim

quit -force
