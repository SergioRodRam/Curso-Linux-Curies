#!/bin/bash

#Programa que realiza operaciones aritmeticas permitiendo la eleccion de operacion atraves de un menu que se repite
#en un ciclo while y utilizando funciones para cada operacion  (Basado en el programa visto en clase prog4.sh)

function leer_variables
{
	echo "Dame el numero 1: "
	read var1
	echo "Dame el numero 2: "
	read var2
}

function oper_suma
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let suma=$1+$2
	echo "La suma es: $suma"
}

function oper_resta
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let resta=$1-$2
	echo "La resta es: $resta"
}

function oper_multiplicacion
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let multiplicacion=$1*$2
	echo "La multiplicacion es: $multiplicacion"
}

function oper_division
{
	echo "La variable 1 es: $1"
	echo "La variable 2 es: $2"

	let division=$1/$2
	echo "La division es: $division"
}

function press_continue
{
	echo "Presiona ENTER para continuar..."
	read keyContinue
}


let opcion=0

while [ "$opcion" -lt 5 ]
	do
	clear
	echo "Iniciando programa"
	echo "1. Suma"
	echo "2. Resta"
	echo "3. Multiplicacion"
	echo "4. Division"
	echo "5. Salir"
	echo "Opcion: "
	read opcion


	case $opcion in
		1)
			leer_variables
			oper_suma $var1 $var2
			press_continue
		;;

		2)
			leer_variables
			oper_resta $var1 $var2
			press_continue
		;;

		3)
			leer_variables
			oper_multiplicacion $var1 $var2
			press_continue
		;;

		4)
			leer_variables
			oper_division $var1 $var2
			press_continue
		;;

		5)
			echo "Saliendo del programa..."
			exit 0
		;;

		*)
			echo "La opcion es incorrecta"
		;;
	esac
done


