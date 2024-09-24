onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_ether_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_ether.udo}

run -all

quit -force
