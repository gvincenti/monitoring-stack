FROM php:7.4-apache

# Instalar extensiones PHP necesarias y utilidades
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev libzip-dev unzip mariadb-client git && \
    docker-php-ext-install mysqli pdo pdo_mysql zip && \
    a2enmod rewrite && \
    rm -rf /var/lib/apt/lists/*

# Descargar NConf
RUN cd /var/www/html && \
    git clone https://github.com/nconf/nconf.git . && \
    chown -R www-data:www-data /var/www/html

# Copiar configuración base para NConf
COPY nconf.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["apache2-foreground"]
