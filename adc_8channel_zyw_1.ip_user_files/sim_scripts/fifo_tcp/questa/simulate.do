onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_tcp_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_tcp.udo}

run -all

quit -force
