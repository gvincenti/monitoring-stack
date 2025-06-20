FROM debian:bullseye

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf libncurses-dev sudo && \
    rm -rf /var/lib/apt/lists/*

# Clonar y compilar Naemon-core
RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install

# Crear usuario y grupo naemon
RUN useradd -m -s /bin/bash naemon

# Copiar configuración sample-config a /etc/naemon
RUN mkdir -p /etc/naemon && \
    cp /opt/naemon-core/sample-config/naemon.cfg /etc/naemon/ && \
    cp /opt/naemon-core/sample-config/resource.cfg /etc/naemon/ && \
    cp -r /opt/naemon-core/sample-config/* /etc/naemon/ || true && \
    chown -R naemon:naemon /etc/naemon

# Crear carpetas necesarias para Naemon
RUN mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon

# Ejecutar Naemon como usuario 'naemon'
USER naemon

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
