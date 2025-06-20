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

# Crea el path por defecto
RUN mkdir -p /usr/local/etc/nagios-mod-gearman

# Copia ahí tu conf
COPY worker.conf /usr/local/etc/nagios-mod-gearman/worker.conf

# Arranca el worker sin switches extra
CMD ["/usr/local/bin/nagios-mod-gearman-worker"]