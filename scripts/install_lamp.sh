#!/bin/bash

#Muestra todos los comando que se van ejecutando:
set -x

#Lo primero que vamos a hacer es actualizar los repositorios

#sudo apt update

#Actualizamos los paquetes:
#sudo upgrade -y

#Instalamos el servidor
sudo apt install apache2 -y

#Comprobamos el estado del Apache

sudo systemctl status apache2

#sudo systemctl stop apache2
#sudo systemctl restart apache2

#Instalamos MySql para gestionar las bases de datos.

sudo apt install mysql-server -y
