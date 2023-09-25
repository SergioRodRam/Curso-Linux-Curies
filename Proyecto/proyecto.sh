#!/bin/bash

function asignar_estado_gpio
{
    #echo "17" > /sys/class/gpio/export
    #echo "17" > /sys/class/gpio/unexport

    if [[ $2 = "0" ]]; then
        estado="unexport"
    elif [[ $2 = "1" ]]; then
        estado="export"
    else
        echo -e "\e[7;31mOpcion invalida\e[0m"
        exit 0
    fi
    
    echo "$1" > /sys/class/gpio/$estado
    sleep 1
    echo
    echo -e "      gpio \e[1;32m $1 \e[0m esta en modo \e[4;33m$estado\e[0m"
    echo
    sleep 1
}

function terminal_gpio
{
    #echo "out" > /sys/class/gpio/gpio17/direction
    
    if [[ $2 = "out" || $2 = "in" ]]; then
        terminal=$2
    else
        while true; do
            echo
            echo -e "Escriba el tipo de terminal que desea asignar a $1    \e[7;32m(1, 2)\e[0m"
            echo "1. In"
            echo "2. Out"
            read aux

            if [[ $aux = "1" ]]; then
                terminal="in"
                break
            elif [[ $aux = "2" ]]; then
                terminal="out"
                break
            else
                echo -e "\e[7;31mOpcion invalida\e[0m"
            fi
        done
    fi

    echo $terminal > /sys/class/gpio/gpio$1/direction
    echo
    echo -e "      gpio \e[1;32m$1\e[0m como terminal \e[4;33m$terminal\e[0m"
    echo
}

function asignar_val
{
    #echo "0" > /sys/class/gpio/gpio17/value
    
    if [[ $2 = "0" || $2 = "1" ]]; then
        valor=$2
    else
        while true; do
            echo
            echo -e "Escriba el valor que desea asignar a $1    \e[7;32m(0, 1)\e[0m"
            read aux

            if [[ $aux = "1" || $aux = "0" ]]; then
                valor=$aux
                break
            else
                echo -e "\e[7;31mOpcion invalida\e[0m"
            fi
        done
    fi
    
    echo $valor > /sys/class/gpio/gpio$1/value
    echo
    echo -e "      Se asigno el \e[4;33m$valor\e[0m a gpio \e[1;32m$1\e[0m"
    echo
}

progFPGA.sh convcod.bit

clear -x

while true
do
    echo
	echo
	echo -e "\e[0;32m*************** ¯\_(ツ)_/¯ ***************\e[0m"
    echo
	echo -e "\e[0;32m**********  Iniciando Programa  **********\e[0m"
    echo
	echo "  1. Habilitando gpio's"
	echo "  2. Configurar Terminales (entradas/salidas)"
	echo "  3. Asignar valores a las gpio's"
    echo "  4. Deshabilitando gpio's"
	echo "  5. Demostración"
	echo "  6. Salir"
    echo
	echo -e "\e[0;32m*************** ¯\_(ツ)_/¯ ***************\e[0m"
	echo
	echo "  Opcion:"
	read opcion

    case $opcion in
        1) #HABILITANDO GPIO'S
            while true; do
                echo
                echo
                echo -e "\e[0;32m   HABILITANDO GPIO's  \e[0m"
                echo
                echo "  1. GPIO (especifica)"
	            echo "  2. GPIO (todas)"
	            echo "  3. Atras"
                echo "  Opcion:"
	            read opcion

                if [[ $opcion = "1" ]]; then
                    echo
                    echo -e "Escriba la gpio que desea habilitar   \e[7;32m(27, 4, 17)\e[0m"
                    read gpio

                    if [[ $gpio = "4" || $gpio = "17" || $gpio = "27" ]]; then
                        asignar_estado_gpio $gpio "1"
                        break
                    else
                        echo -e "\e[7;31mOpcion invalida\e[0m"
                    fi
                elif [[ $opcion = "2" ]]; then
                    echo -e "\e[0;32m   Todas las GPIO's habilitadas\e[0m"
                    asignar_estado_gpio "27" "1"
                    asignar_estado_gpio "4"  "1"
                    asignar_estado_gpio "17" "1"
                    break
                elif [[ $opcion = "3" ]]; then
                    echo
                    echo -e "\e[0;33m   Regresando ...\e[0m"
                    sleep 1
                    break
                else 
                    echo -e "\e[7;31mOpcion invalida\e[0m"
                fi
            done
        ;;
        2) #CONFIGURAR TERMINALES
            while true
            do
                echo
                echo
                echo -e "\e[0;32m   CONFIGURAR TERMINALES (entradas/salidas)    \e[0m"
                echo -e "\e[7;32m   NOTA: Actualmente solo salidas (out)    \e[0m"
                echo
                echo "  1. Terminal GPIO (especifica)"
	            echo "  2. Terminal GPIO (todas)"
	            echo "  3. Atras"
                echo "  Opcion:"
	            read opcion

                if [[ $opcion = "1" ]]; then
                    echo
                    echo -e "Escriba la gpio que desea habilitar   \e[7;32m(27, 4, 17)\e[0m"
                    read gpio

                    if [[ $gpio = "4" || $gpio = "17" || $gpio = "27" ]]; then
                        terminal_gpio $gpio "out"
                        sleep 1
                        break
                    else
                        echo -e "\e[7;31mOpcion invalida\e[0m"
                    fi
                elif [[ $opcion = "2" ]]; then
                    echo -e "\e[0;32m   Terminales de las GPIO's habilitadas\e[0m"
                    terminal_gpio "27" "out"
                    terminal_gpio "4" "out"
                    terminal_gpio "17" "out"
                    sleep 1
                    break
                elif [[ $opcion = "3" ]]; then
                    echo
                    echo -e "\e[0;33m   Regresando ...\e[0m"
                    sleep 1
                    break
                else 
                    echo -e "\e[7;31mOpcion invalida\e[0m"
                fi
            done
        ;;
        3) #ASIGNAR VALORES
            while true; do
                echo
                echo
                echo -e "\e[0;32m   ASIGNAR VALORES A LAS GPIO's    \e[0m"
                echo
                echo "  1. GPIO (especifica)"
	            echo "  2. GPIO (todas)"
	            echo "  3. Atras"
                echo "  Opcion:"
	            read opcion

                if [[ $opcion = "1" ]]; then
                    echo
                    echo -e "Escriba la gpio que desea habilitar   \e[7;32m(27, 4, 17)\e[0m"
                    read gpio

                    if [[ $gpio = "4" || $gpio = "17" || $gpio = "27" ]]; then
                        asignar_val $gpio
                        sleep 1
                        break
                    else
                        echo -e "\e[7;31mOpcion invalida\e[0m"
                    fi
                elif [[ $opcion = "2" ]]; then
                    echo
                    echo -e "\e[0;32m   Asignar valor a todas las GPIO's\e[0m"
                    asignar_val "27"
                    asignar_val "4"
                    asignar_val "17"
                    sleep 1
                    break
                elif [[ $opcion = "3" ]]; then
                    echo
                    echo -e "\e[0;33m   Regresando ...\e[0m"
                    sleep 1
                    break
                else
                    echo -e "\e[7;31mOpcion invalida\e[0m"
                fi
            done
        ;;
        4) #DESABILITANDO GPIO'S
            while true
            do
                echo
                echo -e "\e[0;32m   DESHABILITANDO GPIO's   \e[0m"
                echo
                echo "  1. GPIO (especifica)"
	            echo "  2. GPIO (todas)"
	            echo "  3. Atras"
                echo "  Opcion:"
	            read opcion

                if [[ $opcion = "1" ]]
                then
                    echo
                    echo -e "Escriba la gpio que desea deshabilitar \e[7;32m(27, 4, 17)\e[0m"
                    read gpio

                    if [[ $gpio = "4" || $gpio = "17" || $gpio = "27" ]]
                    then
                        asignar_estado_gpio $gpio "0"
                        sleep 1
                        break
                    else
                        echo
                        echo -e "\e[7;31mOpcion invalida\e[0m"
                    fi
                elif [[ $opcion = "2" ]]
                then
                    echo -e "\e[0;32m   Todas las GPIO's deshabilitadas\e[0m"
                    asignar_estado_gpio "27" "0"
                    asignar_estado_gpio "4"  "0"
                    asignar_estado_gpio "17" "0"
                    sleep 1
                    break
                elif [[ $opcion = "3" ]]; then
                    echo
                    echo -e "\e[0;33m   Regresando ...\e[0m"
                    sleep 1
                    break
                else
                    echo -e "\e[7;31mOpcion invalida\e[0m"
                fi
            done
        ;;
        5) #DEMOSTRACIÓN (0-7)
            
            echo -e "\e[0;32m   ************************************\e[0m"
			echo -e "\e[0;32m   *****  INICIANDO DEMOSTRACIÓN  *****\e[0m"
            echo -e "\e[0;32m   ************************************\e[0m"
            echo
            echo -e "\e[0;32m   ************************************\e[0m"
            echo -e "\e[0;32m   Todas las GPIO's habilitadas\e[0m"
            echo -e "\e[0;32m   ************************************\e[0m"
            asignar_estado_gpio "27" "1"
            asignar_estado_gpio "4"  "1"
            asignar_estado_gpio "17" "1"

            echo -e "\e[0;32m   ************************************\e[0m"
            echo -e "\e[0;32m   Terminales de las GPIO's habilitadas\e[0m"
            echo -e "\e[0;32m   ************************************\e[0m"
            terminal_gpio "27" "out"
            terminal_gpio "4"  "out"
            terminal_gpio "17" "out"
            sleep 2

            echo -e "\e[0;32m   ************************************\e[0m"
            echo -e "\e[0;32m   Asignar valor a las GPIO's\e[0m"
            echo -e "\e[0;32m   ************************************\e[0m"
            sleep 2

            for i in {0..1}; do
                asignar_val "27" $i
                for j in {0..1}; do
                    asignar_val "4" $j
                    for k in {0..1}; do
                        asignar_val "17" $k
                        sleep 1
                        echo
                        echo -e "\e[0;32m   ************************************\e[0m"
                        echo -e "\e[0;32m   **\e[0m \e[0;33mEl valor de entradas es:\e[0m \e[4;33m$i $j $k\e[0m \e[0;32m**\e[0m"
                        echo -e "\e[0;32m   ************************************\e[0m"
                        echo
                        sleep 4
                    done
                done
            done

            asignar_val "27" "0"
            asignar_val "4"  "0"
            asignar_val "17" "0"

            echo -e "\e[0;32m   ************************************\e[0m"
            echo -e "\e[0;32m   Todas las GPIO's deshabilitadas\e[0m"
            echo -e "\e[0;32m   ************************************\e[0m"
            asignar_estado_gpio "4"  "0"
            asignar_estado_gpio "17" "0"
            asignar_estado_gpio "27" "0"
		;;
        6)
			exit 0
		;;
		*)
            clear -x
            echo -e "\e[7;31mOpcion invalida\e[0m"
		;;
    esac
done

#echo "Habilitando gpio's"
#echo "17" > /sys/class/gpio/export
#sleep 1
#echo "4" > /sys/class/gpio/export
#sleep 1
#echo "27" > /sys/class/gpio/export
#sleep 1

#echo "Asignando entradas/salidas"
#echo "out" > /sys/class/gpio/gpio17/direction
#echo "out" > /sys/class/gpio/gpio4/direction
#echo "out" > /sys/class/gpio/gpio27/direction

#echo "Asignando valores a gpio's"
#echo "0" > /sys/class/gpio/gpio17/value
#echo "0" > /sys/class/gpio/gpio4/value
#echo "0" > /sys/class/gpio/gpio27/value
#sleep 5

#echo "Configurando unexport's"
#echo "17" > /sys/class/gpio/unexport
#echo "4" > /sys/class/gpio/unexport
#echo "27" > /sys/class/gpio/unexport
#exit 0
