FROM debian:bullseye

RUN apt-get update && apt-get install -y \
      nagios-plugins-basic \
      nagios-plugins-standard \
      gearman-job-server \
      gearman-tools \
      build-essential \
      libgearman-dev \
      libncurses-dev \
      libssl-dev \
      libglib2.0-dev \
      git autoconf automake libtool pkg-config help2man \
    && rm -rf /var/lib/apt/lists/*

# compila e instala mod_gearman
RUN git clone https://github.com/NagiosEnterprises/nagios-mod-gearman.git /opt/mod-gearman \
 && cd /opt/mod-gearman \
 && ./autogen.sh \
 && ./configure \
 && make all \
 && make install

# copia tu worker.conf al path que el binario ya conoce
COPY worker.conf /usr/local/etc/nagios-mod-gearman/worker.conf

# por defecto arranca el worker leyendo /usr/local/etc/nagios-mod-gearman/worker.conf
CMD ["/usr/local/bin/nagios-mod-gearman-worker"]
