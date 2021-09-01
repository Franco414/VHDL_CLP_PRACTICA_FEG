COMPONENTE=$1
#Ruta de la carpeta Template.
PATH_TEMPLATE="/home/franco-unt/Documents/14CESE2021/CLP/Codigos/Template/Fuentes"
#Ruta de la carpeta con los codigos.
PATH_PROJECT="/home/franco-unt/Documents/14CESE2021/CLP/Codigos"

mkdir -m 775 -p ${COMPONENTE}/{Fuentes,Simulacion,Sintesis}
cd ./$COMPONENTE/Fuentes
touch $COMPONENTE.vhd
chmod 664 $COMPONENTE.vhd
touch ${COMPONENTE}_tb.vhd
chmod 664 ${COMPONENTE}_tb.vhd
cd ../Simulacion
touch script.sh
chmod 775 script.sh

cp $PATH_TEMPLATE/comp.vhd $PATH_PROJECT/$COMPONENTE/Fuentes/$COMPONENTE.vhd
cp $PATH_TEMPLATE/comp_tb.vhd $PATH_PROJECT/$COMPONENTE/Fuentes/${COMPONENTE}_tb.vhd
cp $PATH_TEMPLATE/script.sh $PATH_PROJECT/$COMPONENTE/Simulacion/script.sh