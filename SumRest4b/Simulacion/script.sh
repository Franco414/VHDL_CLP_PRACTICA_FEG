NAMECOMP="SumRest4b"
ghdl -a ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd ../Fuentes/Sum1b.vhd
ghdl -s ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -e ${NAMECOMP}_tb
ghdl -r ${NAMECOMP}_tb --vcd=${NAMECOMP}_tb.vcd --stop-time=1000ns
gtkwave ${NAMECOMP}_tb.vcd