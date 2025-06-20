FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf libncurses-dev && \
    rm -rf /var/lib/apt/lists/*

# Clonar y compilar Naemon (livestatus incluido)
RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install && ldconfig

RUN mkdir -p /etc/naemon && \
    cp /opt/naemon-core/sample-config/naemon.cfg /etc/naemon/ && \
    cp /opt/naemon-core/sample-config/resource.cfg /etc/naemon/ && \
    cp -r /opt/naemon-core/sample-config/objects /etc/naemon/
    
# Crear usuario y grupo naemon y preparar carpetas
RUN useradd -m -s /bin/bash naemon && \
    mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon

VOLUME ["/etc/naemon", "/var/lib/naemon", "/var/log/naemon"]

USER naemon

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]