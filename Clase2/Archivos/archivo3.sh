#!/bin/sh

touch "datos.txt"

echo "Sergio Rodriguez Ramirez" >  "datos.txt"
echo $(date) >> "datos.txt"

printf "%s\n" "$(find . -name "*.txt")" >> "datos.txt"
printf "%s\n" "$(find . -name "*.c")" >> "datos.txt"
printf "%s\n" "$(find . -name "*.png")" >> "datos.txt"
printf "%s\n" "$(find . -name "*.pdf")" >> "datos.txt"

exit
