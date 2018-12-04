#!/bin/sh
set -e

set_evar () {
  echo $2 > /data/etc/env.d/$1
  echo ✓ $1 set
}

set_evar "ENVIRONMENT" "dev"
set_evar "SECURITY_KEY" "ylub1tJkk9cpCEk0zwLQhmxo1VOZ1BTv"
set_evar "DB_DRIVER" "mysql"
set_evar "DB_SERVER" "${DATA_DB_HOST}"
set_evar "DB_USER" "${DATA_DB_USER}"
set_evar "DB_PASSWORD" "${DATA_DB_PASS}"
set_evar "DB_DATABASE" "gonano"
set_evar "DB_PORT" "3306"
