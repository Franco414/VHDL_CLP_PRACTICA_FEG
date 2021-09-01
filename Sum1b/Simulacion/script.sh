ghdl -a ../Fuentes/Sum1b.vhd ..//Fuentes/Sum1b_tb.vhd
ghdl -s ../Fuentes/Sum1b.vhd ..//Fuentes/Sum1b_tb.vhd
ghdl -e Sum1b_tb
ghdl -r Sum1b_tb --vcd=Sum1b_tb.vcd --stop-time=1000ns
gtkwave Sum1b_tb.vcd