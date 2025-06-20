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
    ./autogen.sh && ./configure && make && make install

# Crear usuario y grupo naemon y preparar carpetas
RUN useradd -m -s /bin/bash naemon && \
    mkdir -p /var/log/naemon /var/lib/naemon/spool/checkresults && \
    chown -R naemon:naemon /var/log/naemon /var/lib/naemon

# 🔁 Descarga alternativa de configuración oficial
RUN mkdir -p /etc/naemon && \
    curl -sSL https://codeload.github.com/naemon/naemon-etc/tar.gz/refs/heads/master | \
    tar xz --strip-components=1 -C /etc/naemon && \
    chown -R naemon:naemon /etc/naemon

VOLUME ["/etc/naemon", "/var/lib/naemon", "/var/log/naemon"]

CMD ["/usr/local/bin/naemon", "/etc/naemon/naemon.cfg"]
