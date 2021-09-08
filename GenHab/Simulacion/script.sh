NAMECOMP="GenHab"
PATH_PROJECT="/home/franco-unt/Documents/14CESE2021/CLP/Codigos"
ghdl -a ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -s ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -e ${NAMECOMP}_tb
ghdl -r ${NAMECOMP}_tb --vcd=${NAMECOMP}_tb.vcd --stop-time=5500ns
gtkwave ${NAMECOMP}_tb.vcd