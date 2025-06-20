FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf libncurses-dev sudo && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install

# Crear usuario
RUN useradd -m -s /bin/bash naemon

# Crear directorios necesarios con permisos amplios
RUN mkdir -p /etc/naemon /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /etc/naemon /var/log/naemon /var/lib/naemon && \
    chmod -R 777 /var/lib/naemon /var/log/naemon

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# ⚠️ Usamos root para poder levantar el proceso sin errores de permisos
USER root

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
