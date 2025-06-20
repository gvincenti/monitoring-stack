FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y gnupg2 wget curl apache2 libapache2-mod-perl2 && \
    wget -O - https://labs.consol.de/repo-signing-key-pub.asc | apt-key add - && \
    echo "deb https://labs.consol.de/repo/stable/debian bullseye main" > /etc/apt/sources.list.d/thruk.list && \
    apt-get update && \
    apt-get install -y thruk thruk-doc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
