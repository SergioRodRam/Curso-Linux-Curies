#!/bin/bash

function opteracion_suma
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let resultado=$1+$2

	echo "La suma es: $resultado"
}
function opteracion_resta
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let resultado=$1-$2

	echo "La resta es: $resultado"
}
function opteracion_multiplicacion
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let resultado=$1*$2

	echo "La multiplicacion es: $resultado"
}
function opteracion_division
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let resultado=$1/$2

	echo "La division es: $resultado"
}

clear
while true 
do
	echo
	echo
	echo "*************** ¯\_(ツ)_/¯	***************"
	echo "Iniciando Programa"
	echo "1. Suma"
	echo "2. Resta"
	echo "3. Multiplicacion"
	echo "4. Division"
	echo "5. Salir"
	echo "*************** ¯\_(ツ)_/¯	***************"
	echo
	echo "Opcion:"
	read opcion

	case $opcion in
		1)
			echo "Dame el numero 1: "
			read var1

			echo "Dame el numero 2: "
			read var2

			opteracion_suma $var1 $var2	#Solo agregamos "$" y se pasan por parametros
		;;
		2)
			echo "Dame el numero 1: "
			read var1

			echo "Dame el numero 2: "
			read var2
	
			opteracion_resta $var1 $var2
		;;
		3)
			echo "Dame el numero 1: "
			read var1

			echo "Dame el numero 2: "
			read var2

			opteracion_multiplicacion $var1 $var2
		;;
		4)
			echo "Dame el numero 1: "
			read var1

			echo "Dame el numero 2: "
			read var2
	
			opteracion_division $var1 $var2
		;;
		5)
			exit 0
		;;
		*)
			echo "Opcion incorrecta"
		;;
	esac
done