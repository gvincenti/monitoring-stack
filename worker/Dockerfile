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

# crea el path donde el worker busca su conf POR DEFECTO
RUN mkdir -p /usr/local/etc/mod_gearman

# copiar la conf
COPY worker.conf /usr/local/etc/mod_gearman/worker.conf

# arranca sin flags extra
CMD ["/usr/local/bin/nagios-mod-gearman-worker"]