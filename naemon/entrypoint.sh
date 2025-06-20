#!/bin/bash
set -e

# Ajustar permisos para que Naemon pueda escribir en logs y datos
chown -R naemon:naemon /var/lib/naemon /var/log/naemon /etc/naemon /usr/local/var/spool/checkresults /usr/local/pnp4nagios/var

# Ejecutar Naemon como usuario 'naemon'
exec /usr/local/bin/naemon /etc/naemon/naemon.cfg
