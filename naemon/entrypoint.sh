#!/bin/bash
set -e

# Cambiar permisos por si un volumen sobreescribe los del Dockerfile
chown -R naemon:naemon /var/lib/naemon /var/log/naemon /etc/naemon

# Ejecutar como usuario naemon
exec /usr/local/bin/naemon /etc/naemon/naemon.cfg

