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

#Instalación modulos php

sudo apt install php libapache2-mod-php php-mysql -y

# Copiar el directorio de configuración de Apache

cp ../conf/000-default.conf /etc/apache2/sites-available

#Reiniciamos el servicio Apache:

sudo systemctl restart apache2

# Copiamos el archivo de prueva de PHP

cp ../php/index.php /var/www/html

# Modificamos el propietario y el grupo del directorio /var/www/html

sudo chown -R www-data:www-data /var/www/html
