#!/bin/sh
set -e

# add a craft3-specifix boxfile.yml
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/boxfile.yml > boxfile.yml

# copy the nanobox automation files into the app
mkdir nanobox && cd nanobox
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/nanobox/.env.example > .env.example
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/nanobox/db.php > db.php
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/nanobox/nginx.conf > nginx.conf

# start the dev environment
nanobox run "bash <(curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/bin/install.sh)"
