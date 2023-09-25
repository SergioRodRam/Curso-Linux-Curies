#!/bin/bash

#Proyecto el cual activa los switches virtuales de la FPGA,
#mostrando los numeros del 0 al 7 en el display esperando 5 segundos entre cada uno

#Funciones
function habilitar_terminales
{
	echo "$1" > /sys/class/gpio/export
	sleep 1
}

function configurando_terminales
{
	echo "out" > /sys/class/gpio/gpio$1/direction
}

function enviar_valor
{
	echo "$1" > /sys/class/gpio/gpio$2/value
}

function deshabilitar_terminales
{
	echo "$1" > /sys/class/gpio/unexport
}

function reiniciar
{
	echo "0" > /sys/class/gpio/gpio17/value
	echo "0" > /sys/class/gpio/gpio4/value
	echo "0" > /sys/class/gpio/gpio27/value
}

#Codigo principal
terminales=(17 4 27)

echo "Habilitando terminales en export..."
for terminal in ${terminales[@]}; do
	habilitar_terminales $terminal
done

echo "Configurando terminales como salidas..."
for terminal in ${terminales[@]}; do
	configurando_terminales $terminal
done

echo "Mandando valor de entrada al convertidor..."
for (( i=0 ; $i<8 ; i=$i+1 )); do
	if [ $((i%2)) -eq 0 ]; then
		enviar_valor 0 ${terminales[0]}
	else
		enviar_valor 1 ${terminales[0]}
	fi

	if [[ ("$i" -eq 0) || ("$i" -eq 1) || ("$i" -eq 4) || ("$i" -eq 5) ]]; then
		enviar_valor 0 ${terminales[1]}
	else
		enviar_valor 1 ${terminales[1]}
	fi

	if [ "$i" -lt 4 ]; then
		enviar_valor 0 ${terminales[2]}
	else
		enviar_valor 1 ${terminales[2]}
	fi
	sleep 5
done

echo "Reiniciando el convertidor a 0..."
reiniciar

echo "Deshabilitando terminales en unexport..."
for terminal in ${terminales[@]}; do
	deshabilitar_terminales $terminal
done

exit 0
