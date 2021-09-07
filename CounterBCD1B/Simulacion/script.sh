NAMECOMP="CounterBCD1B"
PATH_PROJECT="/home/franco-unt/Documents/14CESE2021/CLP/Codigos"
ghdl -a ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd $PATH_PROJECT/Mux4B2TO1/Fuentes/Mux4B2TO1.vhd $PATH_PROJECT/R4BPIPO/Fuentes/R4BPIPO.vhd $PATH_PROJECT/cmp4B/Fuentes/cmp4B.vhd $PATH_PROJECT/inc4B/Fuentes/inc4B.vhd $PATH_PROJECT/FFD/Fuentes/FFD.vhd 
ghdl -s ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -e ${NAMECOMP}_tb
ghdl -r ${NAMECOMP}_tb --vcd=${NAMECOMP}_tb.vcd --stop-time=2000ns
gtkwave ${NAMECOMP}_tb.vcd