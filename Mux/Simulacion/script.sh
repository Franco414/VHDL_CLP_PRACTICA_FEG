ghdl -a ../Fuentes/Mux.vhd ..//Fuentes/Mux_tb.vhd
ghdl -s ../Fuentes/Mux.vhd ..//Fuentes/Mux_tb.vhd
ghdl -e Mux_tb
ghdl -r Mux_tb --vcd=Mux_tb.vcd --stop-time=1000ns
gtkwave Mux_tb.vcd