#!/bin/bash

echo "Iniciando Programa"

echo "Dame el numero 1: "
read var1

echo "Dame el numero 2: "
read var2

echo "La variable 1 es: $var1"
echo "La variable 2 es: $var2"

let suma=var1+var2

echo "La suma es: $suma"

exit 0
