# PWA_LARAVEL

## Proyecto Blog World

### Descripción:
Este sitio web ha sido desarrollado como parte de un trabajo práctico para la asignatura de Programación Web Avanzada en la Universidad Nacional del Comahue. En esta plataforma, los usuarios podran visualizar una recopilación de Posts que destacan los destinos naturales más impresionantes para visitar en Argentina, desde hermosos paisajes de montañas y valles hasta la serenidad de ríos y lagos, Blog World ofrece una ventana hacia los lugares más hermosos del país. 
La plataforma está diseñada para ofrecer diferentes niveles de interacción según el rol del usuario. Los usuarios con el rol "view" pueden explorar y disfrutar de las publicaciones del blog, accediendo a información detallada sobre los destinos naturales presentados. Por otro lado, los usuarios con el rol "autor" tienen la capacidad de crear, editar, eliminar y visualizar publicaciones, contribuyendo activamente al contenido del blog.

### Página de Inicio:
![image](https://github.com/CalderonExe22/blog_proyect/assets/117313739/38905230-cbbc-4827-8075-bcecf9d9068a)
![image](https://github.com/CalderonExe22/blog_proyect/assets/117313739/53ae689e-1b63-4a30-aedd-d0c4394696f0)
![image](https://github.com/CalderonExe22/blog_proyect/assets/117313739/a5b81224-c666-4f2a-b3be-00aedc08fa6e)

## Desarrolladores:
* Exequiel Calderon FAI-4432
* Jonathan Alveal FAI-3581

## Guia de Instalación:
### Requisitos Previos:
Asegúrate de tener instalado PHP, Composer, Node.js y Git. Puedes ejecutar los siguientes comandos en tu terminal:

* Para verificar la versión de PHP:
``` bash
php --version
```
* Para verificar la versión de Composer:
``` bash
composer --version
```
* Para verificar la versión de Node.js:
``` bash
node --version
```
* Para verificar la versión de Git:
``` bash
git --version
```
Si no tienes instalado alguno de estos requisitos, puedes descargarlos e instalarlos desde los siguientes enlaces:
* [Descargar PHP](https://www.php.net/downloads)
* [Descargar Composer](https://getcomposer.org/download/)
* [Descargar Node.js](https://nodejs.org/en/download)
* [Descargar Git](https://git-scm.com/downloads)

### Instalación del Proyecto

1. Clona este repositorio. Abre tu terminal en la carpeta deseada y ejecuta el siguiente comando:
``` bash
git clone https://github.com/CalderonExe22/blog_proyect
```
2. Accede al directorio del proyecto ejecutando el siguiente comando:
``` bash
cd blog_proyect
```
3. Instala las dependencias Composer del proyecto ejecutando el siguiente comando:
``` bash
composer install
```
4. Instala las dependencias Node del proyecto ejecutando el siguiente comando:
``` bash
npm install
```
5. Copia el archivo ".env.example" a un nuevo archivo llamado ".env" ejecutando el siguiente comando:
``` bash
cp .env.example .env
```
6. Genera una clave de aplicación para Laravel ejecutando el siguiente comando:
``` bash
php artisan key:generate
```
7. Abre el archivo ".env" en tu editor de texto favorito y configura los detalles de tu base de datos. Aquí tienes un ejemplo:
``` bash
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=remplazar_nombre_de_tu_base_de_datos
DB_USERNAME=remplazar_con_tu_usuario
DB_PASSWORD=remplazar_con_tu_contraseña
```
8. Migra las tablas de la base de datos ejecutando el siguiente comando:
``` bash
php artisan migrate
``` 
9. Puede poblar la base de datos con el Usuario "mario@gmail.com" con contraseña "mario123". Y algunos post cargados, importando el sql que se encuentra en el siguiente directorio:
``` bash
blog_proyect/database/sql/blog_proyect.sql
``` 
10. Crear la carpeta de almacenamiento de imagenes de prueba, ejecutando el siguiente comando:
``` bash
php artisan storage:link
```
12. Compila los assets del front-end (JavaScript y CSS) ejecutando el siguiente comando:
``` bash
npm run dev
```
13. Finalmente iniciar el servidor de desarrollo local de Laravel ejecutando el siguiente comando:
``` bash
php artisan serve
```
