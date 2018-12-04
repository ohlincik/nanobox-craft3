#!/bin/sh
set -e

# add a craft3-specifix boxfile.yml
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/boxfile.yml > boxfile.yml

# copy the nanobox automation files into the app
mkdir nanobox && cd nanobox
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/nanobox/nginx.conf > nginx.conf
curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/nanobox/set-evars.sh > set-evars.sh

# start the dev environment
nanobox run "bash <(curl -sL https://raw.githubusercontent.com/ohlincik/nanobox-craft3/master/bin/install.sh)"
