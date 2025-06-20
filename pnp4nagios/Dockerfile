FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    apache2 php libapache2-mod-php php-gd php-mysql rrdtool \
    perl librrds-perl build-essential git autoconf libtool \
    librrd-dev libgd-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar PNP4Nagios desde el repo oficial
RUN cd /opt && \
    git clone https://github.com/pnp4nagios/pnp4nagios.git && \
    cd pnp4nagios && \
    ./configure --with-rrdtool=/usr/bin/rrdtool && \
    make all && make install && make install-webconf && make install-config

# Activar módulos requeridos de Apache
RUN a2enmod php && a2enmod cgi && service apache2 restart

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
