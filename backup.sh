#!/bin/bash

echo -e "\033[1;36mBackup folder: $(pwd)\033[0m"
read -n 1 -p "Do you want to proceed? [Y/n] " key && [[ -z $key ]] || echo
[[ $key =~ [nN] ]] && exit
FILENAME=$(basename $(pwd))_$(date +%Y%m%d%H%M%S)
# tar cvf $FILENAME.tar.gz .
tar cz . | openssl enc -aes-256-cbc -e -out $FILENAME.tar.gz.enc
mkdir public-tmp_$FILENAME
# mv $FILENAME.tar.gz public-tmp_$FILENAME/
mv $FILENAME.tar.gz.enc public-tmp_$FILENAME/
docker run -d --rm -p 2010:80 --name apache-tmp_$FILENAME -v ./public-tmp_$FILENAME:/usr/local/apache2/htdocs/ httpd:alpine
# IP=$(curl -s http://whatismyip.akamai.com/) # https://ifconfig.me/ # https://icanhazip.com/
IP=$(ip addr show $(ip route | awk '/default/ { print $5 }') | grep 'inet' | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1)
echo -e "\033[1;33mDownload file at: http://$IP:2010\033[0m"
# echo -e "\033[0;33mUncompress: tar xvf $FILENAME.tar.gz\033[0m"
echo -e "\033[0;33mDecript and uncompress: openssl aes-256-cbc -d -in $FILENAME.tar.gz.enc | tar xzv\033[0m"
echo Press Enter to stop the Apache server and delete files...
read key
docker stop apache-tmp_$FILENAME
# docker rm apache-tmp_$FILENAME
sudo rm -r public-tmp_$FILENAME
