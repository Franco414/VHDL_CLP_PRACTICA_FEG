ghdl -a ../Fuentes/FFD.vhd ..//Fuentes/FFD_tb.vhd
ghdl -s ../Fuentes/FFD.vhd ..//Fuentes/FFD_tb.vhd
ghdl -e FFD_tb
ghdl -r FFD_tb --vcd=FFD_tb.vcd --stop-time=1000ns
gtkwave FFD_tb.vcd