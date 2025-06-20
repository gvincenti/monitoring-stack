FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y gnupg2 wget curl apache2 libapache2-mod-perl2 apt-transport-https ca-certificates

RUN curl -fSL https://labs.consol.de/repo-signing-key-pub.asc -o /tmp/thruk.asc && \
    gpg --dearmor /tmp/thruk.asc && \
    mv /tmp/thruk.asc.gpg /usr/share/keyrings/thruk-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/thruk-archive-keyring.gpg] https://labs.consol.de/repo/stable/debian bullseye main" > /etc/apt/sources.list.d/thruk.list

RUN apt-get update && apt-get install -y thruk thruk-doc && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/thruk.asc*

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
