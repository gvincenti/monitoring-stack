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
    python3 python3-pip && \
    pip3 install gearman && \
    rm -rf /var/lib/apt/lists/*

# Clonar y compilar worker
RUN git clone https://github.com/sni/mod-gearman.git /opt/mod-gearman && \
    cd /opt/mod-gearman/mod_gearman_worker && \
    ./autogen.sh && ./configure && make && make install

CMD ["gearman_worker", "-d"]
