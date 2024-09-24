onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo5_opt

do {wave.do}

view wave
view structure
view signals

do {fifo5.udo}

run -all

quit -force
