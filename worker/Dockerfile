FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    nagios-plugins-basic \
    nagios-plugins-standard \
    gearman-job-server \
    gearman-tools \
    build-essential \
    libgearman-dev \
    git \
    autoconf \
    libtool \
    libncurses-dev \
    ca-certificates \
    automake \
    pkg-config \
    libssl-dev

# Clonar el repositorio oficial actual y compilar
RUN git clone https://github.com/NagiosEnterprises/nagios-mod-gearman.git /opt/mod-gearman && \
    cd /opt/mod-gearman && ./autogen.sh && ./configure && make all && make install \
    ls -l /usr/local/bin
    
CMD ["mod_gearman_worker"]


