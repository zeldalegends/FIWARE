#!/bin/bash

echo -e "\033[1;36mBackup folder: $(pwd)\033[0m"
read -n 1 -p "Do you want to proceed? [Y/n] " key && [[ -z $key ]] && echo
[[ $key =~ [nN] ]] && exit
tar czvf $(basename $(pwd))_$(date +%Y%m%d%H%M%S).tar.gz .
mkdir public-tmp
mv $(basename $(pwd))*.tar.gz public-tmp/
docker run -d --rm -p 2010:80 --name apache-tmp -v ./public-tmp:/usr/local/apache2/htdocs/ httpd:alpine
echo  -e "\033[1;33mDownload file at: http://$(ip addr show $(ip route | awk '/default/ { print $5 }') | grep "inet" | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1):2010\033[0m"
echo Press Enter to stop the Apache server and delete files...
read key
docker stop apache-tmp
#docker rm apache-tmp
sudo rm -r public-tmp
