NAMECOMP="Exercise18"
PATH_PROJECT="/home/franco-unt/Documents/14CESE2021/CLP/Codigos"
ghdl -a ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd $PATH_PROJECT/CounterBCD1BWP/Fuentes/CounterBCD1BWP.vhd $PATH_PROJECT/GenHab/Fuentes/GenHab.vhd
ghdl -s ../Fuentes/$NAMECOMP.vhd ..//Fuentes/${NAMECOMP}_tb.vhd
ghdl -e ${NAMECOMP}_tb
ghdl -r ${NAMECOMP}_tb --vcd=${NAMECOMP}_tb.vcd --stop-time=5000ns
gtkwave ${NAMECOMP}_tb.vcd