#!/bin/sh

#$2 es el archivo donde se guardara
#$1 es la ruta donde se colocara el archivo

archivo="$2.c"

touch "$archivo"

echo "#include <stdio.h>" >  "$archivo"
echo "" >>  "$archivo"
echo "int main(){" >>  "$archivo"
echo '    printf( "Sergio Rodriguez Ramirez\\n");' >>  "$archivo"
echo '    printf( "'$2'\\n");' >>  "$archivo"
echo "" >>  "$archivo"
echo "    return 0;" >>  "$archivo"
echo "}" >>  "$archivo"

chmod +x "$archivo"

mv "$archivo" "$1"

gcc "$1$archivo" -o "$1$2"

exit
