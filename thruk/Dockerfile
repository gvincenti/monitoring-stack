FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y gnupg2 wget curl apt-transport-https ca-certificates \
 && wget -qO - https://labs.consol.de/repo/stable/RPM-GPG-KEY | gpg --dearmor > /usr/share/keyrings/labs-consol.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/labs-consol.gpg] http://labs.consol.de/repo/stable/debian bullseye main" > /etc/apt/sources.list.d/labs-consol.list \
 && apt-get update \
 && apt-get install -y thruk apache2 libapache2-mod-perl2 \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
