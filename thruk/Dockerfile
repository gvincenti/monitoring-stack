FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y thruk thruk-doc apache2 libapache2-mod-perl2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]