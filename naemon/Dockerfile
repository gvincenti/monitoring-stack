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
    ./autogen.sh && ./configure && make && make install && \
    echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local-lib.conf && ldconfig
    
RUN useradd -m -s /bin/bash naemon

# Copiar configuración sample-config si existe
RUN mkdir -p /etc/naemon && \
    cp /opt/naemon-core/sample-config/naemon.cfg /etc/naemon/ && \
    cp /opt/naemon-core/sample-config/resource.cfg /etc/naemon/ || true && \
    chown -R naemon:naemon /etc/naemon

RUN mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon

USER naemon

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
