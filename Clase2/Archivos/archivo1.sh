#!/bin/sh

#$1 es el archivo donde se guardara
#$2 es la ruta donde se colocara el archivo

touch "$1"
echo "Sergio Rodriguez Ramirez" >  "$1"
echo $(date) >> "$1"
echo "$1" >> "$1"
echo "$2" >> "$1"

mv "$1" "$2"

exit
