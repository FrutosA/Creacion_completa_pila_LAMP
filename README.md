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
1º Instalamos y actualiamos el servidor WEB Apache 2.4

````
sudo apt install apache2 -y

````
 
