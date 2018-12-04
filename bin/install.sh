#!/bin/sh
set -e

# formatting colors
grn="\x1b[32m"
end="\x1b[0m"

# install Craft
printf "\n${grn}+ Installing Craft (This may take a few minutes)...${end}\n"

# generate new Craft app in the /tmp directory
cd /tmp
composer create-project craftcms/craft craft

# copy the generated files into the /app directory
shopt -s dotglob
cp -a craft/* /app

# - cleanup
rm -rf /tmp/craft

# remove the .env file because it's not needed
cd /app
cp -f nanobox/.env.example .env

# generate the security key
chmod +x craft
./craft setup/security-key

# replace the db config with pre-set env variables
cp -f nanobox/db.php config/db.php

# running app info
text="
--------------------------------------------------------------------\n
${grn}+ Starting Craft
+ Once started, setup Craft at $APP_IP/admin${end}\n
--------------------------------------------------------------------\n
"
printf "$text"

# start Craft
php-server
