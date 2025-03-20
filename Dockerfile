# Usar una imagen de PHP con Apache
FROM php:8.1-apache

# Habilitar módulos necesarios
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar los archivos del proyecto al contenedor
COPY . /var/www/html/

# Establecer permisos adecuados
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponer el puerto del servidor
EXPOSE 80

# Comando por defecto para ejecutar Apache
CMD ["apache2-foreground"]
