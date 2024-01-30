#!/bin/bash

# Variables de configuración
MYSQL_USER="root"
MYSQL_HOST="localhost"
DATABASE_NAME="bdxubes"
SQL_SCRIPT="/Users/israperez/Documents/PanelServicios/server/seeds.sql"


# Comando para ejecutar el script SQL
mysql -u"$MYSQL_USER" -p -h"$MYSQL_HOST" "$DATABASE_NAME" < "$SQL_SCRIPT"
