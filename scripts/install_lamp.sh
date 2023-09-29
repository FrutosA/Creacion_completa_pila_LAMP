#!/bin/bash

#Muestra todos los comando que se van ejecutando:
set -x

#Lo primero que vamos a hacer es actualizar los repositorios

#sudo apt update

#Actualizamos los paquetes:
#sudo upgrade -y

#Instalamos el servidor
sudo apt install apache2 -y
