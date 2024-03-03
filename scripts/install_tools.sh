#!/bin/bash

#Muestra todos los comando que se van ejecutando:
set -x

#-----------------------------------------------------
#Configuramos la variables :

source .env
#-----------------------------------------------------

#Actualizamos el sistema:
sudo update -y

#Actualizamos los paquetes:

sudo upgrade -y

#Configuramos las respuestas de las preguntas durante la instalación de Phpmyadmin:
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_APP_PASSWORD" | debconf-set-selections

#Instalamos PHPMYADMIN:

sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y

#Creamos un usuario que tenga acceso a todas las bases de datos:

mysql -u root <<< "DROP USER IF EXISTS '$APP_USER'@'%'"
mysql -u root <<< "CREATE USER' $APP_USER'@'%' IDENTIFIED BY '$APP_PASSWORD'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON *.* TO '$APP_USER'@'%'"


#Instalamos phpmyAdmin
apt install phpmyadmin php-mbstring php-zip php-json php-curl -y

#Instalacion de Adminer(aplicacion gestions de base de datos online, github en este caso)

wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php

#Creamos directorio para Adminer
mkdir -p /var/www/html/adminer

#Movemos y renombramos el archivo

mv adminer-4.8.1-mysql.php /var/www/html/adminer/index.php

#-----------------------------------------------------------------------------
#Instalamos GoAccess
#-----------------------------------------------------------------------------

#Agrega una línea al archivo /etc/apt/sources.list.d/goaccess.list.Asi indico al sistema dónde encontrar los paquetes de software de GoAccess.

echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list

#Añadimos clave publiaca en la maquina

wget -O - https:/f/deb.goaccess.io/gnugpg.key | sudo apt-key add -

# Actualizamos los repositorios

apt update

#Instalamos GoAccess
apt install goaccess -y

#Creamos el directorio stats

mkdir -p /var/www/html/stats

#Modificamos permisos
chown www-data:www-data /var/www/html -R 

#Ejecutamos Goacces en segundo plano

goaccess /var/log/apache2/access.log -o /var/www/html/stats/index.html --log-format=COMBINED --real-time-html --daemonize

#Control de acceso a un directorio con .htaccess
#-----------------------------------------------------------


#Creamos un directorio para guardar el archivo de claves
mkdir -p /etc/apache2/claves

#Creamos un usuario y contraseña en un archivo .htacces

sudo htpasswd -bc /etc/apache2/claves/.htpasswd $STATS_USER $STATS_PASSWORD


#Reiniciamos el servicio de Apache

systemctl restart apache2


#Control de acceso a un directorio mediante .htaccess
 
#------------------------------------------
#Copiamos el archivo htacces en /var/www/html/stats

cp ../htaccess/.htaccess /var/www/html/stats/.htaccess

#Copiamos el archivo de la configuración de Apache
cp ../conf/000-default.conf /etc/apache2/sites-available/000-default.conf

#Reiniciamos el servicio de Apache


sudo systemctl restart apache2.service
