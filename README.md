# Creacion_completa_pila_LAMP

## Creación de una maquina en un laboratorio de AWS

1º Lo primero que tenemos que hacer es Lanzar la instancia.

![](imagenes/captura_1.png)

2º Seleccionamos el S.O., que en este caso es Ubuntu:

![](imagenes/captura_2.png)

3º Elegimos el tipo de instancia:

![](imagenes/captura_3.png)

4º Seleccionamos el par de claves que nosotros ya hemos descargado antes de iniciar el laboratorio. Nosotros la renombramos y seleccionamos Vockey.pem

![](imagenes/captura_4.png)

5º  Al grupo de seguridad le añadimos todos los servicios y la lanzamos:

![](imagenes/captura_5.png)


## Instalación de la pila LAMP

Antes de empezar, hay que recordar que queremos ver la ejecución de todos los comandos (set -x) y actualizamos los repositorios y paquetes.

1º Instalamos y actualiamos el servidor WEB Apache 2.4

````
sudo apt install apache2 -y

````
 2º Comprobamos el estado del Apache

````
sudo systemctl status apache2

````

3º Instalamos MySql para gestionar las bases de datos.

````
sudo apt install mysql-server -y

````

4º Instalación modulos php

````
sudo apt install php libapache2-mod-php php-mysql -y

````

5º Copiar el directorio de configuración de Apache

````
cp ../conf/000-default.conf /etc/apache2/sites-available

````

6º Reiniciamos el servicio Apache.

````
sudo systemctl restart apache2

````

7º Copiamos el archivo de prueva de PHP

````
cp ../php/index.php /var/www/html

````

8º Modificamos el propietario y el grupo del directorio /var/www/html

````
sudo chown -R www-data:www-data /var/www/html

````