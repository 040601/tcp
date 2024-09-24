onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_fakeinput_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_fakeinput.udo}

run -all

quit -force
