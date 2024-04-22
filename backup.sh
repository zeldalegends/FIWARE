#!/bin/bash

echo -e "\033[1;36mBackup folder: $(pwd)\033[0m"
read -n 1 -s -p "Do you want to proceed? [Y/n] " key && [[ $key =~ [nN] ]] && exit
echo

name=$(basename $(pwd))_$(date +%Y%m%d%H%M%S)
tar czvf $name.tar.gz .
mkdir tmp-$name
mv $name.tar.gz tmp-$name/
docker run -d --rm -p 2010:80 --name httpd-$name -v $(pwd)/tmp-$name:/usr/local/apache2/htdocs/ httpd:alpine

echo  -e "\033[1;33mDownload file at: http://$(ip addr show $(ip route | awk '/default/ { print $5 }') | grep "inet" | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1):2010\033[0m"
read -n 1 -s -p "Press Enter to stop the Apache server and delete files..." key
echo

docker stop httpd-$name
# docker rm httpd-$name -v
sudo rm -r tmp-$name
