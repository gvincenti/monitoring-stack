# Dockerfile ejemplo para naemon

FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf libncurses-dev sudo && \
    rm -rf /var/lib/apt/lists/*

# Clonar y compilar naemon-core
RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install

# Crear usuario naemon
RUN useradd -m -s /bin/bash naemon

# Copiar configuraciones locales
COPY etc/naemon.cfg /etc/naemon/naemon.cfg
COPY resource.cfg /etc/naemon/resource.cfg

# Crear carpetas para logs y spool
RUN mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon /etc/naemon

USER naemon

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
