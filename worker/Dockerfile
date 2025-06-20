FROM debian:bullseye

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y \
    nagios-plugins-basic \
    nagios-plugins-standard \
    gearman-job-server \
    gearman-tools \
    build-essential \
    libgearman-dev \
    libncurses-dev \
    libssl-dev \
    libglib2.0-dev \
    git \
    autoconf \
    automake \
    libtool \
    pkg-config \
    help2man && \
    rm -rf /var/lib/apt/lists/*

# Clonar y compilar mod_gearman, luego listar binarios instalados
RUN git clone https://github.com/NagiosEnterprises/nagios-mod-gearman.git /opt/mod-gearman && \
    cd /opt/mod-gearman && \
    ./autogen.sh && ./configure && make all && make install && \
    ls -l /usr/local/bin/

# Copiar configuración del worker
COPY worker.conf /etc/mod_gearman/worker.conf

CMD ["/usr/local/bin/nagios-worker", "-c", "/etc/mod_gearman/worker.conf"]
