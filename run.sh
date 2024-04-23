#!/bin/bash

# Domains must contain only letters and numbers (e.g., "try-it.noip.org" is not valid).
# To register without email use: "--register-unsafely-without-email" (NOT RECOMMENDED).
# https://eff-certbot.readthedocs.io/en/stable/using.html#certbot-command-line-options.

##########################
domain=enershare.zapto.org
email=test@email.com
##########################

#sudo chown -R $(id -u):$(id -g) .
#sudo chown -R 1000:1000 node-red
#docker compose pull
docker compose down --remove-orphans --volumes

# docker run --rm -v $(pwd)/node-red/data:/data node:18 bash -c "cd /data ; npm install --unsafe-perm --no-update-notifier --no-fund --only=production"
docker run --rm -p 80:80 --name certbot-run-once -v ./certbot/conf/:/etc/letsencrypt/ -v ./certbot/www/:/var/www/certbot/ certbot/certbot certonly \
  --standalone --preferred-challenges=http -d $domain -m $email --no-eff-email --agree-tos --rsa-key-size 4096 --keep-until-expiring -n -v
# docker run -d --rm -p 80:80 --name httpd-run-once -v ./certbot/www/:/usr/local/apache2/htdocs/ httpd:alpine
# docker run --rm --name certbot-run-once -v ./certbot/conf/:/etc/letsencrypt/ -v ./certbot/www/:/var/www/certbot/ certbot/certbot certonly \
#   --webroot -w /var/www/certbot/ -d $domain -m $email --no-eff-email --agree-tos --rsa-key-size 4096 --keep-until-expiring --non-interactive --verbose
# docker stop httpd-run-once

docker compose up --build --detach

#docker exec node-red bash -c "cd /data; npm install --unsafe-perm --no-update-notifier --no-fund --only=production"
#docker restart node-red

docker ps --all --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}\t{{.ID}}" | sort
read -s -n 1 -p "Press any key to continue (ESC to terminate)..." key && [[ $key != '' ]] && [[ $key == $'\e' ]] && echo && exit
echo && docker ps --all --format "table {{.Networks}}\t{{.Names}}\t{{.RunningFor}}\t{{.Image}}\t{{.Command}}\t{{.Mounts}}" | sort
read -s -n 1 -p "Press any key to continue (ESC to terminate)..." key && [[ $key != '' ]] && [[ $key == $'\e' ]] && echo && exit
echo && docker compose logs --tail 10 --follow
