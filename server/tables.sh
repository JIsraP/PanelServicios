#!/bin/bash

# Variables de configuración
MYSQL_USER="root"
MYSQL_HOST="localhost"
DATABASE_NAME="bdxubes"
SQL_SCRIPT="/Users/israperez/Documents/PanelServicios/server/bdxubes.sql"

# Comando para crear la base de datos
mysql -u"$MYSQL_USER" -p -h"$MYSQL_HOST" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Comando para ejecutar el script SQL
mysql -u"$MYSQL_USER" -p -h"$MYSQL_HOST" "$DATABASE_NAME" < "$SQL_SCRIPT"
