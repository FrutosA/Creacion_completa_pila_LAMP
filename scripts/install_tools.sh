#!/bin/bash

#Muestra todos los comando que se van ejecutando:
set -x

#-----------------------------------------------------
#Configuramos la variables :

PHPMYADMIN_APP_PASSWORD=1003
APP_USER=usuario
APP_PASSWORD=contraseña
#-----------------------------------------------------

#Actualizamos el sistema:
sudo update -y

#Actualizamos los paquetes:
#sudo upgrade -y

#Configuramos las respuestas de las preguntas durante la instalación de Phpmyadmin:
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections

#Instalamos PHPMYADMIN:

sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y

#Creamos un usuario que tenga acceso a todas las bases de datos:

mysql -u root <<< "DROP USER IF EXITS 'APP_USER'@'%'"
mysql -u root <<< "CREATE USER' $APP_USER''@''%' IDENTIFIED BY ' $APP_PASSWORD'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON *.* TO '$APP_USER'@'%'"
