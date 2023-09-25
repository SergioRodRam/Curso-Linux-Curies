#!/bin/bash

clear
echo "Iniciando Programa"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicacion"
echo "4. Division"
echo "Opcion:"
read opcion

case $opcion in
	1)
	echo "Dame el numero 1: "
	read var1

	echo "Dame el numero 2: "
	read var2

	echo "La variable 1 es: $var1"
	echo "La variable 2 es: $var2"

	let suma=var1+var2

	echo "La suma es: $suma"

	;;
	2)
	echo "Dame el numero 1: "
	read var1

	echo "Dame el numero 2: "
	read var2

	echo "La variable 1 es: $var1"
	echo "La variable 2 es: $var2"

	let resta=var1-var2

	echo "La resta es: $resta"
	;;
	*)
	echo "Opcion incorrecta"
	;;
esac

exit 0
