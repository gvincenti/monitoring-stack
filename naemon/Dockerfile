FROM debian:bullseye

ENV NAEMON_VERSION=1.3.1

RUN apt-get update && \
    apt-get install -y \
    wget curl gnupg2 ca-certificates build-essential \
    libglib2.0-dev libmcrypt-dev libssl-dev \
    apache2-utils apache2 php php-cli php-mysql \
    git autoconf automake libtool pkg-config help2man \
    rrdtool librrds-perl gperf cmake && \
    rm -rf /var/lib/apt/lists/*

# Instalar Naemon
RUN cd /opt && \
    git clone https://github.com/naemon/naemon-core.git && \
    cd naemon-core && \
    ./autogen.sh && ./configure && make && make install

# Instalar LMD (Livestatus)
RUN cd /opt && \
    git clone https://github.com/tribe29/checkmk.git && \
    cd checkmk/livestatus && \
    ./autogen.sh && ./configure && make && make install

# Crear usuario y grupo naemon
RUN useradd -m -s /bin/bash naemon && \
    mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon

VOLUME ["/etc/naemon", "/var/lib/naemon", "/var/log/naemon"]

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
