FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nagios-plugins-basic nagios-plugins-standard \
    gearman-job-server gearman-tools build-essential libgearman-dev \
    libncurses-dev libssl-dev libglib2.0-dev git autoconf automake libtool pkg-config help2man \
  && rm -rf /var/lib/apt/lists/*

# Clonar y compilar mod_gearman
RUN git clone https://github.com/NagiosEnterprises/nagios-mod-gearman.git /opt/mod-gearman && \
    cd /opt/mod-gearman && \
    ./autogen.sh && ./configure && make all && make install

# Opcional: crear un "alias" más corto
RUN ln -s /usr/local/bin/nagios-mod-gearman-worker /usr/local/bin/nagios-worker

# Copiar configuración del worker
RUN mkdir -p /etc/mod_gearman
COPY worker.conf /etc/mod_gearman/worker.conf

# Por defecto invocamos al binario correcto
CMD ["/usr/local/bin/nagios-mod-gearman-worker", "-c", "/etc/mod_gearman/worker.conf"]
