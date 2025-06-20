FROM debian:bullseye

# Instalación de dependencias y utilidades
RUN apt-get update && apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf libncurses-dev sudo \
    nagios-plugins-basic nagios-plugins-standard \
    mailutils && \
    rm -rf /var/lib/apt/lists/*

# Compilar Naemon desde fuente
RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install

# Crear usuario naemon
RUN useradd -m -s /bin/bash naemon

# Crear y dar permisos a los directorios necesarios
RUN mkdir -p /etc/naemon /var/log/naemon /var/lib/naemon/spool/checkresults /usr/local/var/spool/checkresults /usr/local/pnp4nagios/var && \
    chown -R naemon:naemon /etc/naemon /var/log/naemon /var/lib/naemon /usr/local/var/spool/checkresults /usr/local/pnp4nagios && \
    chmod -R 775 /var/log/naemon /var/lib/naemon /usr/local/var/spool/checkresults /usr/local/pnp4nagios

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER naemon

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
