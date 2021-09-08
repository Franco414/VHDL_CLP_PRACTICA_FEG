NAMECOMP="CounterBCD4D"
PATH_PROJECT="/home/franco-unt/Documents/14CESE2021/CLP/Codigos"
ghdl -a ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd $PATH_PROJECT/CounterBCD1BWP/Fuentes/CounterBCD1BWP.vhd
ghdl -s ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -e ${NAMECOMP}_tb
ghdl -r ${NAMECOMP}_tb --vcd=${NAMECOMP}_tb.vcd --stop-time=500us
gtkwave ${NAMECOMP}_tb.vcd